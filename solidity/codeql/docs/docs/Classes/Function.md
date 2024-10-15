# Function

## Methods

- [hasSpecifier(string name)](#hasspecifierstring-name)
- [getASpecifier()](#getaspecifier)
- [isVirtual()](#isvirtual)
- [getNumberOfParameters()](#getnumberofparameters)
- [getEffectiveNumberOfParameters()](#geteffectivenumberofparameters)
- [getACallToThisFunction()](#getacalltothisfunction)
- [getControlFlowScope()](#getcontrolflowscope)
- [getEnclosingStmt()](#getenclosingstmt)

### hasSpecifier(string name)

```
predicate hasSpecifier(string name) { this.getASpecifier().hasName(name) }
```

Holds if this declaration has a specifier with the given name.

### getASpecifier()

```
Specifier getASpecifier() {
    exists(Specifier s | this.getAFieldOrChild() instanceof Specifier and result = s)
}
```

Gets a specifier of this function.

### isVirtual()

```
predicate isVirtual() { this.hasSpecifier("virtual") }
```

Holds if this function is virtual.

Unlike `isDeclaredVirtual()`, `isVirtual()` holds even if the function is not explicitly declared with the `virtual` specifier.

### getAParameter()

```
Solidity::Parameter getAParameter() { result = any(this.getChild(_)) }
```

Gets a parameter of this function. There is no result for the implicit `this` parameter, and there is no `...` varargs pseudo-parameter.


### getNumberOfParameters()

```
int getNumberOfParameters() { result = count(this.getAParameter()) }
```

Gets the number of parameters of this function, _not_ including any implicit `this` parameter or any `...` varargs pseudo-parameter.

### getEffectiveNumberOfParameters()

```
int getEffectiveNumberOfParameters() {
    // This method is overridden in `MemberFunction`, where the result is
    // adjusted to account for the implicit `this` parameter.
    result = this.getNumberOfParameters()
}
```

Gets the number of parameters of this function, _including_ any implicit `this` parameter but _not_ including any `...` varargs pseudo-parameter.

### getACallToThisFunction()

```
FunctionCall getACallToThisFunction() { result.getTarget() = this }

```

Gets a call to this function.


### getControlFlowScope()

```
override Function getControlFlowScope() { result = this }
```

Implements `ControlFlowNode.getControlFlowScope`. The `Function` is used to represent the exit node of the control flow graph, so it is its own scope.


### getEnclosingStmt()

```
override Stmt getEnclosingStmt() { none() }
```

Implements `ControlFlowNode.getEnclosingStmt`. The `Function` is used to represent the exit node of the control flow graph, so it has no enclosing statement.
