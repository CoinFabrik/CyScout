# Block Statement 

Implements a class to model a solidity block statement

## Methods

- `getAStmt()`
- `getStmt(int n)`
- `getLastStmt()`
- `getLastStmtIn()`
- `getNumStmt()`
- `isEmpty()`
- `getIndexOfStmt(Stmt s)`
- `toString()`


### getAStmt()

```
Stmt getAStmt() { result = this.getAFieldOrChild() }
```

Gets a body statement of this block.

```
{ int a; int b = 1; a = b; }
```
`getAStmt()` would have 3 results, for the declarations of `a` and `b` and for the expression statement `a = b`.

### getStmt(int n)

```
Stmt getStmt(int n) { result = this.getChild(n) }
```
Gets the `n`th body statement of this block, indexed from 0.. For example, for the block

```
{ int a; int b = 1; a = b; }
```

`getStmt(2)` result is the expression statement `a = b`.

### getLastStmt()

```
Stmt getLastStmt() { result = this.getStmt(this.getNumStmt() - 1) }
```

Gets the last body statement of this block. For example, for the block

```
{ int a; int b = 1; a = b; }
```

`getLastStmt()` returns the expression statement `a = b`.


### getLastStmtIn()

```
Stmt getLastStmtIn() {
    if this.getLastStmt().getChild() instanceof BlockStmt
    then result = this.getLastStmt().getChild().(BlockStmt).getLastStmtIn()
    else result = this.getLastStmt()
}
```

Gets the last body statement of the block. If the last statement
is itself a block, returns the last statement of that block, and so on. For example, for the block
```
{ int a; int b = 1; { a = b; } }
```
`getLastStmtIn()` results in the expression statement `a = b`.

### getNumStmt()

```
int getNumStmt() { result = count(this.getAStmt()) }
```

Gets the number of body statements in this block. For example, for the block

```
{ int a; int b = 1; a = b; }
```
`getNumStmt()` gives 3.

### isEmpty()

```
predicate isEmpty() { this.getNumStmt() = 0 }
```

Holds if the block has no statements. For the block

```
{// a comment}
```

It returns True.

### getIndexOfStmt(Stmt s)

```
int getIndexOfStmt(Stmt s) { this.getStmt(result) = s }
```

Gets the index of the given statement within this block, indexed from 0. For example, for the block

```
{ int a; int b = 1; a = b; }
```

if `s` is the expression statement `a = b` then `getIndexOfStmt(s)`
has result 2.



