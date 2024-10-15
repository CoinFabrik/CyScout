# BasicBlock

Provides a library for reasoning about control flow at the granularity of basic blocks. This is usually much more efficient than reasoning directly at the level of `ControlFlowNode`s.


`BasicBlock`s are refinements of `PrimitiveBasicBlock`s, taking
impossible CFG edges into account (using the `successors_adapted`
relation). The refinement manifests itself in two changes:

- The successor relation on `BasicBlock`s uses `successors_adapted`
(instead of `successors_extended` used by `PrimitiveBasicBlock`s). Consequently, some edges between `BasicBlock`s may be removed. Example:

```
x = 1;      // s1
if (true) { // s2
  x = 2;    // s3
} else {
  x = 3;    // s4
}
```

The `BasicBlock` successor edge from the basic block containing `s1` and `s2` to the basic block containing `s4` is removed.

- `PrimitiveBasicBlock`s may be split up into two or more
`BasicBlock`s: Internal nodes of `PrimitiveBasicBlock`s whose
predecessor edges have been removed (unreachable code) will be entry points of new `BasicBlock`s. Consequently, each entry point of a `PrimitiveBasicBlock` will also be an entry point of a `BasicBlock`, but the converse does not necessarily hold. Example:

```
x = 1;   // s5
abort(); // s6
x = 2;   // s7
```

`s5`-`s7` belong to the same `PrimitiveBasicBlock`, but the CFG edge from `s6` to `s7` is impossible, so `s7` will be the entry point of its own (unreachable) `BasicBlock`.

Note that, although possible, two or more `PrimitiveBasicBlock`s are never merged to one `BasicBlock`: Consider the first example above; it would be possible to define a single `BasicBlock` consisting of `s1`-`s3`, however, the result would be counter-intuitive.

## Module, Classes and Predicate

- [Cached](#cached)
- [BasicBlock](#basicblock-1)
- [EntryBasicBlock](#entrybasicblock)
- [ExitBasicBlock](#exitbasicblock)
- [unreachable(ControlFlowNode n)](#unreachablecontrolflownode-n)

## Cached

### Predicates

- [basic_block_entry_node(ControlFlowNode node)](#basic_block_entry_nodecontrolflownode-node)
- [non_primitive_basic_block_entry_node(ControlFlowNode node)](#non_primitive_basic_block_entry_nodecontrolflownode-node)
- [equalsPrimitiveBasicBlock(BasicBlock bb)](#equalsprimitivebasicblockbasicblock-bb)
- [basic_block_member(ControlFlowNode node, BasicBlock bb, int pos)](#basic_block_membercontrolflownode-node-basicblock-bb-int-pos)
- [non_primitive_basic_block_member(ControlFlowNode node, BasicBlock bb, int pos)](#non_primitive_basic_block_entry_nodecontrolflownode-node)
- [bb_length(BasicBlock bb)](#bb_lengthbasicblock-bb)
- [bb_successor_cached(BasicBlock pred, BasicBlock succ)](#bb_successor_cachedbasicblock-pred-basicblock-succ)

### basic_block_entry_node(ControlFlowNode node)

Any node that is the entry point of a primitive basic block is
also the entry point of a basic block. In addition, all nodes
with a primitive successor, where the predecessor has been pruned
(that is, `getAPredecessor()` does not exist while a predecessor
using the primitive `successors_extended` relation does exist), is also considered a basic block entry node.

```
predicate basic_block_entry_node(ControlFlowNode node) {
    primitive_basic_block_entry_node(node) or
    non_primitive_basic_block_entry_node(node)
  }
```
### non_primitive_basic_block_entry_node(ControlFlowNode node

```
private predicate non_primitive_basic_block_entry_node(ControlFlowNode node) {
    not primitive_basic_block_entry_node(node) and
    not exists(node.getAPredecessor()) and
    successors_extended(node, _)
}
```

### equalsPrimitiveBasicBlock(BasicBlock bb)
Holds if basic block `bb` equals a primitive basic block.

There are two situations in which this isnot* the case:

- Either the entry node of `bb` does not correspond to an
  entry node of a primitive basic block, or

- The primitive basic block with the same entry node contains
  a (non-entry) node which is the entry node of a non-primitive
  basic block (that is, the primitive basic block has been split
  up).

This predicate is used for performance optimization only:
Whenever a `BasicBlock` equals a `PrimitiveBasicBlock`, we can
reuse predicates already computed for `PrimitiveBasicBlocks`.

```  
private predicate equalsPrimitiveBasicBlock(BasicBlock bb) {
    primitive_basic_block_entry_node(bb) and
    not exists(int i |
      i > 0 and
      non_primitive_basic_block_entry_node(bb.(PrimitiveBasicBlock).getNode(i))
    )
  }
``` 

### basic_block_member(ControlFlowNode node, BasicBlock bb, int pos) 

Holds if `node` is the `pos`th control-flow node in basic block `bb`.

```
cached predicate basic_block_member(ControlFlowNode node, BasicBlock bb, int pos) {
    equalsPrimitiveBasicBlock(bb) and primitive_basic_block_member(node, bb, pos) // reuse already computed relation
    or
    non_primitive_basic_block_member(node, bb, pos)
}
```

### predicate non_primitive_basic_block_member(ControlFlowNode node, BasicBlock bb, int pos) 

```
private predicate non_primitive_basic_block_member(ControlFlowNode node, BasicBlock bb, int pos) {
    not equalsPrimitiveBasicBlock(bb) and node = bb and pos = 0
    or
    not node instanceof BasicBlock and
    exists(ControlFlowNode pred | successors_extended(pred, node) |
      non_primitive_basic_block_member(pred, bb, pos - 1)
    )
}
```

###  bb_length(BasicBlock bb)

Gets the number of control-flow nodes in the basic block `bb`./

```
cached int bb_length(BasicBlock bb) {
    if equalsPrimitiveBasicBlock(bb)
    then result = bb.(PrimitiveBasicBlock).length() // reuse already computed relation
    else result = strictcount(ControlFlowNode node | basic_block_member(node, bb, _))
}
```

### bb_successor_cached(BasicBlock pred, BasicBlock succ)

Successor relation for basic blocks. 

```
cached predicate bb_successor_cached(BasicBlock pred, BasicBlock succ) {
    exists(ControlFlowNode last |
      basic_block_member(last, pred, bb_length(pred) - 1) and
      last.getASuccessor() = succ
    )
}
```

## BasicBlock

A basic block in the Solidity control-flow graph.

A basic block is a simple sequence of control-flow nodes,
connected to each other and nothing else:

```
   A - B - C - D  ABCD is a basic block
```

Any incoming or outgoing edges break the block into two:

```
   A - B > C - D  AB is a basic block and CD is a basic block (C has two incoming edges)


   A - B < C - D  AB is a basic block and CD is a basic block (B has two outgoing edges)
```

### Methods and predicates

- [BasicBlock](#basicblock-2)
- [contains](#containscontrolflownode-node)
- [getNode](#getnodeint-pos)
- [getANode](#getanode)
- [getASuccessor](#getasuccessor)
- [getAPredecessor](#getapredecessor)
- [getATrueSuccessor](#getatruesuccessor)
- [getAFalseSuccessor](#getafalsesuccessor)
- [getEnd](#getend)
- [getStart](#getstart)
- [length](#length)
- [hasLocationInfo](#haslocationinfostring-filepath-int-startline-int-startcolumn-int-endline-int-endcolumn)
- [hasLocationInfoInternal](#haslocationinfointernalstring-file-int-line-int-col-string-endf-int-endl-int-endc)
- [getEnclosingFunction](#getenclosingfunction)
- [inLoop](#inloop)
- [isReachable](#isreachable)
- [isUnreachable](#isunreachable)
- [unreachable](#unreachablecontrolflownode-n)

### BasicBlock()

```
BasicBlock() { basic_block_entry_node(this) }
```

### contains(ControlFlowNode node)

Holds if this basic block contains `node`. 

```
predicate contains(ControlFlowNode node) { basic_block_member(node, this, _) }
```

### getNode(int pos)
Gets the `ControlFlowNode` at position `pos` in this basic block. 

```
ControlFlowNode getNode(int pos) { basic_block_member(result, this, pos) }
```

### getANode()

Gets a `ControlFlowNode` in this basic block. 

```
ControlFlowNode getANode() { basic_block_member(result, this, _) }
```

### getASuccessor()

Gets a `BasicBlock` that is a direct successor of this basic block.

```
BasicBlock getASuccessor() { bb_successor(this, result) }
```
###  getAPredecessor()

Gets a `BasicBlock` that is a direct predecessor of this basic block. 

```
BasicBlock getAPredecessor() { bb_successor(result, this) }
```

### getATrueSuccessor()

Gets a `BasicBlock` such that the control-flow edge `(this, result)` may be taken when the outgoing edge of this basic block is an expression that is true.

```
BasicBlock getATrueSuccessor() { result.getStart() = this.getEnd().getATrueSuccessor() }
```

### getAFalseSuccessor()

Gets a `BasicBlock` such that the control-flow edge `(this, result)` may be taken when the outgoing edge of this basic block is an expression that is false.

```
BasicBlock getAFalseSuccessor() { result.getStart() = this.getEnd().getAFalseSuccessor() }
```

### getEnd() 

Gets the final `ControlFlowNode` of this basic block.

```  
ControlFlowNode getEnd() { basic_block_member(result, this, bb_length(this) - 1) }
```

### getStart()

Gets the first `ControlFlowNode` of this basic block.

```
ControlFlowNode getStart() { result = this }
```

### length()

Gets the number of `ControlFlowNode`s in this basic block. 
  
```  
int length() { result = bb_length(this) }
```

###  hasLocationInfo(string filepath, int startline, int startcolumn, int endline, int endcolumn)

Holds if this element is at the specified location.
The location spans column `startcolumn` of line `startline` to column `endcolumn` of line `endline` in file `filepath`. For more information, see
[Locations](https://codeql.github.com/docs/writing-codeql-queries/providing-locations-in-codeql-queries/).

Yields no result if this basic block spans multiple source files.

```
predicate hasLocationInfo(
    string filepath, int startline, int startcolumn, int endline, int endcolumn
  ) {
    this.hasLocationInfoInternal(filepath, startline, startcolumn, filepath, endline, endcolumn)
  }
```

### hasLocationInfoInternal(string file, int line, int col, string endf, int endl, int endc)

```
  pragma[noinline]
  private predicate hasLocationInfoInternal(
    string file, int line, int col, string endf, int endl, int endc
  ) {
    this.getStart().getLocation().hasLocationInfo(file, line, col, _, _) and
    this.getEnd().getLocation().hasLocationInfo(endf, _, _, endl, endc)
  }
```

### getEnclosingFunction()

Gets the function containing this basic block. 

```
Solidity::FunctionDefinition getEnclosingFunction() {      result = this.getStart().getControlFlowScope() }
```

### inLoop()

Holds if this basic block is in a loop of the control-flow graph. This includes loops created by `goto` statements. This predicate may not hold
even if this basic block is syntactically inside a `while` loop if the necessary back edges are unreachable.

```
predicate inLoop() { this.getASuccessor+() = this }
```

### isReachable()

Holds if control flow may reach this basic block from a function entry point or any handler of a reachable `try` statement.

```
predicate isReachable() {
   
    exists(Solidity::FunctionDefinition f | f.getBody() = this)
    or
    exists(BasicBlock pred | pred.getASuccessor() = this and pred.isReachable())
}
```

### isUnreachable()

Means `not isReachable()`. 

```
predicate isUnreachable() { not this.isReachable() }
```

## EntryBasicBlock

An entry point of a function.

### EntryBasicBlock()

```
EntryBasicBlock() { exists(Solidity::FunctionDefinition f | this = f.getBody()) }
```

## ExitBasicBlock

A basic block whose last node is the exit point of a function.

### ExitBasicBlock(

```
ExitBasicBlock() {
    this.getEnd() instanceof Solidity::FunctionBody 
    // or
    // aborting(this.getEnd())
}
```

## unreachable(ControlFlowNode n)

Correct relation for reachability of ControlFlowNodes. 

```
predicate unreachable(ControlFlowNode n) {
  exists(BasicBlock bb | bb.contains(n) and bb.isUnreachable())
}
```