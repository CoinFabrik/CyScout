# SubBasicBlock

Provides the `SubBasicBlock` class, used for partitioning basic blocks in smaller pieces.

## Classes

- [SubBasicBlockCutNode](#subbasicblockcutnode)
- [SubBasicBlock](#subbasicblock)

## SubBasicBlockCutNode

An abstract class that directs where in the control-flow graph a new `SubBasicBlock` must start. If a `ControlFlowNode` is an instance of this class, that node is guaranteed to be the first node in a `SubBasicBlock`.

If multiple libraries use the `SubBasicBlock` library, basic blocks may be split in more places than either library expects, but nothing should break as a direct result of that.

### Methods

- [SubBasicBlockCutNode()](#subbasicblock-1)

### SubBasicBlockCutNode()

```
SubBasicBlockCutNode() {
    exists(this.getBasicBlock())
  }
```

Some control-flow nodes are not in any basic block. This includes
`Conversion`s, expressions that are evaluated at compile time, default arguments, and `Function`s without implementation.


## SubBasicBlock 

A block that can be smaller than or equal to a `BasicBlock`. Use this class when `ControlFlowNode` is too fine-grained and `BasicBlock` too
coarse-grained. Their successor graph is like that of basic blocks, except that the blocks are split up with an extra edge right before any instance of the abstract class `SubBasicBlockCutNode`. Users of this library must therefore extend `SubBasicBlockCutNode` to direct where basic blocks will be
split up.

### Methods

- [SubBasicBlock()](#subbasicblock-2)
- [getBasicBlock()](#getbasicblock)
- [firstInBB()](#firstinbb)
- [lastInBB()](#lastinbb)
- [getRankInBasicBlock(BasicBlock bb)](#getrankinbasicblockbasicblock-bb)
- [getIndexInBasicBlock(BasicBlock bb)](#getindexinbasicblockbasicblock-bb)
- [getASuccessor()](#getasuccessor)
- [getNode(int index)](#getnodeint-index)
- [outerToInnerIndex(BasicBlock bb, int indexInBB)](#outertoinnerindexbasicblock-bb-int-indexinbb)
- [getANode()](#getanode)
- [contains(ControlFlowNode node)](#containscontrolflownode-node)
- [getAPredecessor()](#getapredecessor)
- [getATrueSuccessor()](#getatruesuccessor)
- [getAFalseSuccessor()](#getafalsesuccessor)
- [getNumberOfNodes()](#getnumberofnodes)
- [getEnd()](#getend)
- [getStart()](#getstart)
- [getEnclosingFunction()](#getenclosingfunction)

### SubBasicBlock()

```
SubBasicBlock() {
    this instanceof BasicBlock
    or
    this instanceof SubBasicBlockCutNode
}
```

### getBasicBlock() 

```
BasicBlock getBasicBlock() { result = this.(ControlFlowNode).getBasicBlock()}
```

Gets the basic block in which this `SubBasicBlock` is contained.

### firstInBB()

```
predicate firstInBB() { this.getRankInBasicBlock(_) = 1 }
```

Holds if this `SubBasicBlock` comes first in its basic block. This is the only condition under which a `SubBasicBlock` may have multiple
predecessors.

### lastInBB()

```
predicate lastInBB() {
    exists(BasicBlock bb | this.getRankInBasicBlock(bb) = countSubBasicBlocksInBasicBlock(bb))
}
```

Holds if this `SubBasicBlock` comes last in its basic block. This is the only condition under which a `SubBasicBlock` may have multiple successors.

### getRankInBasicBlock(BasicBlock bb)

```
int getRankInBasicBlock(BasicBlock bb) {
    exists(int thisIndexInBB |
      thisIndexInBB = this.getIndexInBasicBlock(bb) and
      thisIndexInBB = rank[result](int i | i = any(SubBasicBlock n).getIndexInBasicBlock(bb))
    )
}
```

Gets the (1-based) rank of this `SubBasicBlock` among the other `SubBasicBlock`s in its containing basic block `bb`, where `bb` is equal to `getBasicBlock()`.

### getIndexInBasicBlock(BasicBlock bb)

```
private int getIndexInBasicBlock(BasicBlock bb) { this = bb.getNode(result) }
```

### getASuccessor() 

```
SubBasicBlock getASuccessor() {
    this.lastInBB() and
    result = this.getBasicBlock().getASuccessor()
    or
    exists(BasicBlock bb | result.getRankInBasicBlock(bb) = this.getRankInBasicBlock(bb) + 1)
}
```

Gets a successor in the control-flow graph of `SubBasicBlock`s.

### getNode(int index)

```
ControlFlowNode getNode(int index) {
    exists(BasicBlock bb |
      exists(int outerIndex |
        result = bb.getNode(outerIndex) and
        index = this.outerToInnerIndex(bb, outerIndex)
      )
    )
}
```

Gets the `index`th control-flow node in this `SubBasicBlock`. Indexes start from 0, and the node at index 0 always exists and compares equal to `this`.

###  outerToInnerIndex(BasicBlock bb, int indexInBB)

```
private int outerToInnerIndex(BasicBlock bb, int indexInBB) {
    indexInBB = result + this.getIndexInBasicBlock(bb) and
    result = [0 .. this.getNumberOfNodes() - 1]
}
```

Gets the index of the node in this `SubBasicBlock` that has `indexInBB` in `bb`, where `bb` is equal to `getBasicBlock()`.

This predicate is factored out of `getNode` to ensure a good join order.
It's sensitive to bad magic, so it has `pragma[nomagic]` on it. For example, it can get very slow if `getNode` is pragma[nomagic], which could mean it might get very slow if `getNode` is used in the wrong context.

### getANode()

```
ControlFlowNode getANode() { result = this.getNode(_) }
```

Gets a control-flow node in this `SubBasicBlock`.

### contains(ControlFlowNode node) 

```
predicate contains(ControlFlowNode node) { node = this.getANode() }
```

Holds if `this` contains `node`.

### getAPredecessor()

```
SubBasicBlock getAPredecessor() { result.getASuccessor() = this }
```

Gets a predecessor in the control-flow graph of `SubBasicBlock`s.

### getATrueSuccessor()

```
SubBasicBlock getATrueSuccessor() {
    this.lastInBB() and
    result = this.getBasicBlock().getATrueSuccessor()
}
```

Gets a node such that the control-flow edge `(this, result)` may be taken when the final node of this `SubBasicBlock` is a conditional expression and evaluates to true.

### getAFalseSuccessor()

```
SubBasicBlock getAFalseSuccessor() {
    this.lastInBB() and
    result = this.getBasicBlock().getAFalseSuccessor()
}
```

Gets a node such that the control-flow edge `(this, result)` may be taken when the final node of this `SubBasicBlock` is a conditional expression and evaluates to false.

### getNumberOfNodes()

```
int getNumberOfNodes() {
    exists(BasicBlock bb |
      if this.lastInBB()
      then result = bb.length() - this.getIndexInBasicBlock(bb)
      else result = this.getASuccessor().getIndexInBasicBlock(bb) - this.getIndexInBasicBlock(bb)
    )
}
```

Gets the number of control-flow nodes in this `SubBasicBlock`. There is always at least one.

### getEnd()

```
ControlFlowNode getEnd() { result = this.getNode(this.getNumberOfNodes() - 1) }
```

Gets the last control-flow node in this `SubBasicBlock`.

### getStart()

```
ControlFlowNode getStart() { result = this }
```

Gets the first control-flow node in this `SubBasicBlock`. 

### getEnclosingFunction()

```
Function getEnclosingFunction() { result = this.getStart().getControlFlowScope() }
```

Gets the function that contains this `SubBasicBlock`.


## Function

- [countSubBasicBlocksInBasicBlock(BasicBlock bb)](#countsubbasicblocksinbasicblockbasicblock-bb)


### countSubBasicBlocksInBasicBlock(BasicBlock bb)

```
private int countSubBasicBlocksInBasicBlock(BasicBlock bb) {
  result = strictcount(SubBasicBlock sbb | sbb.getBasicBlock() = bb)
}
```

Gets the number of `SubBasicBlock`s in the given basic block. 
