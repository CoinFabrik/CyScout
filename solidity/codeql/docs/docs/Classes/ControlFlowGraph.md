# Control Flow Graph

In this module there is

- [Class ControlFlowNode](#class-controlflownode)
- [Abstract class AdditionalControlFlowEdge](#abstract-class-additionalcontrolflowedge)
- [Predicate successors_extended](#predicate-successors_extended)

## Class ControlFlowNode

### Methods

  - [getASuccessor()](#getasuccessor)
  - [getAPredecessor()](#getapredecessor)
  - [getControlFlowScope()](#getcontrolflowscope)
  - [getEnclosingStmt()](#getenclosingstmt)
  - [isCondition()](#iscondition)
  - [getATrueSuccessor()](#getatruesuccessor)
  - [getAFalseSuccessor()](#getafalsesuccessor)
  - [getBasicBlock()](#getbasicblock)

### getASuccessor()

```
ControlFlowNode getASuccessor() { successors_adapted(this, result) }
```

Gets a direct successor of this control-flow node, if any.

### getAPredecessor()

```
ControlFlowNode getAPredecessor() { this = result.getASuccessor() }
```
Gets a direct predecessor of this control-flow node, if any.

### getControlFlowScope()

```
Solidity::FunctionDefinition getControlFlowScope() {
    none() // overridden in subclasses
  }
```

Gets the function containing this control-flow node.

### getEnclosingStmt()

```
  Stmt getEnclosingStmt() {
    none() // overridden in subclasses
  }
```
Gets the smallest statement containing this control-flow node.

### isCondition()

```
predicate isCondition() {
    exists(this.getATrueSuccessor()) or
    exists(this.getAFalseSuccessor())
  }
```

Holds if this node is the top-level expression of a conditional statement, meaning that `this.getATrueSuccessor()` or `this.getAFalseSuccessor()` will have a result.

### getATrueSuccessor()

```
ControlFlowNode getATrueSuccessor() {
    qlCfgTrueSuccessor(this, result) and
    result = this.getASuccessor()
  }
```
Gets a node such that the control-flow edge `(this, result)` may be taken when this expression is true.

### getAFalseSuccessor()

```
ControlFlowNode getAFalseSuccessor() {
    qlCfgFalseSuccessor(this, result) and
    result = this.getASuccessor()
  }
```

Gets a node such that the control-flow edge `(this, result)` may be when this expression is false.

### getBasicBlock()

```
BasicBlock getBasicBlock() { result.getANode() = this }
```

Gets the `BasicBlock` containing this control-flow node.

## Abstract class AdditionalControlFlowEdge
    - getAnEdgeTarget()

## Predicate successors_extended

```
predicate successors_extended(ControlFlowNodeBase source, ControlFlowNodeBase target) {
  qlCfgSuccessor(source, target)
  or
  source.(AdditionalControlFlowEdge).getAnEdgeTarget() = target
}
```
Holds if there is a control-flow edge from `source` to `target` in either the extractor-generated control-flow graph or in a subclass of
`AdditionalControlFlowEdge`. Use this relation instead of `qlCFGSuccessor`.

