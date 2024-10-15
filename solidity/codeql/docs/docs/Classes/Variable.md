# Variable

## Classes

- [Variable](#variable-1)
- [LocalVariable](#localvariable)
- [GlobalVariable](#globalvariable)
- [InstanceVariable](#instancevariable)
- [ClassVariable](#classvariable)
- [SelfVariable](#selfvariable)
- [VariableAccess](#variableaccess)
- [VariableWriteAccess](#variablewriteaccess)
- [VariableReadAccess](#variablereadaccess)
- [LocalVariableAccess](#localvariableaccess)
- [LocalVariableWriteAccess](#localvariablewriteaccess)
- [LocalVariableReadAccess](#localvariablereadaccess)
- [GlobalVariableAccess](#globalvariableaccess)
- [GlobalVariableWriteAccess](#globalvariablewriteaccess)
- [GlobalVariableReadAccess](#globalvariablewriteaccess)
- [InstanceVariableAccess](#instancevariableaccess)
- [InstanceVariableWriteAccess](#instancevariablewriteaccess)
- [InstanceVariableReadAccess](#instancevariablereadaccess)
- [ClassVariableAccess](#classvariableaccess)
- [ClassVariableWriteAccess](#classvariablewriteaccess)
- [ClassVariableReadAccess](#classvariablereadaccess)
- [SelfVariableAccess](#selfvariableaccess)
- [SelfVariableReadAccess](#selfvariablereadaccess)


## Variable

A variable declared in a scope.

- [getName()](#getname)
- [hasName()](#hasname)
- [toString()](#tostring)
- [getLocation()](#getlocation)
- [getDeclaringScope()](#getdeclaringscope)
- [getAnAccess()](#getanaccess)

### getName()

```
final string getName() { result = super.getNameImpl() }
```

Gets the name of this variable.

### hasName()

```
final predicate hasName(string name) { this.getName() = name }
```

Holds if the name of this variable is a `name`.

### toString()

```
final string toString() { result = this.getName() }
```

Gets a textual representation of this variable.

### getLocation()

```
final Location getLocation() { result = super.getLocationImpl() }
```

Gets the location of this variable.

### getDeclaringScope()

```
final Scope getDeclaringScope() {
    toGenerated(result) = this.(VariableReal).getDeclaringScopeImpl()
  }
```

Gets the scope this variable is declared in.

### getAnAccess()

```
VariableAccess getAnAccess() { result.getVariable() = this }
```

Gets an access to this variable.

## LocalVariable

A local variable. Extends `Variable`.

### Methods
- [getAnAccess](#getanaccess-1)
- [getDefiningAccess()](#getdefiningaccess)
- [isCaptured](#iscaptured)

### getAnAccess()

```
override LocalVariableAccess getAnAccess() { result.getVariable() = this }
```

### getDefiningAccess()

```
VariableAccess getDefiningAccess() {
    result = this.(LocalVariableReal).getDefiningAccessImpl() or
    synthChild(any(NamedParameter p | this = p.getVariable()), 0, result)
  }
```

Gets the access where this local variable is first introduced.

### isCaptured()

```
final predicate isCaptured() { this.getAnAccess().isCapturedAccess() }
```

Holds if this variable is captured. For example in

```rb
def m x
  x.times do |y|
    puts x
  end
  puts x
end
```

`x` is a captured variable, whereas `y` is not.


## GlobalVariable

A global variable. Extends `Variable`.

- [getAnAccess()](#getanaccess-2)

### getAnAccess()

```
final override GlobalVariableAccess getAnAccess() { result.getVariable() = this }
```

## InstanceVariable

An instance variable.

- [isClassInstanceVariable()](#isclassinstancevariable)
- [getAnAccess()](#getanaccess-3)

### isClassInstanceVariable()

```
final predicate isClassInstanceVariable() { super.isClassInstanceVariable() }
```

Holds if this variable is a class instance variable.

### getAnAccess()

```
final override InstanceVariableAccess getAnAccess() { result.getVariable() = this }
```
## ClassVariable

- getAnAccess()

### getAnAccess()

```
final override ClassVariableAccess getAnAccess() { result.getVariable() = this }
```

## SelfVariable

A `self` variable. Extends LocalVariable.

No methods yet.

## VariableAccess

- [getVariable()](#getvariable)
- [isExplicitWrite(AstNode assignment)](#isexplicitwriteastnode-assignment)
- [isImplicitWrite()](#isimplicitwrite)

### getVariable()

```
final Variable getVariable() { result = super.getVariableImpl() }
```

Gets the variable this identifier refers to.

### isExplicitWrite(AstNode assignment)

```
predicate isExplicitWrite(AstNode assignment) {
    explicitWriteAccess(toGenerated(this), toGenerated(assignment))
    or
    this = assignment.(AssignExpr).getLeftOperand()
  }
```

Holds if this access is a write access belonging to the explicit assignment `assignment`. For example, in

```rb
a, b = foo
```

Both `a` and `b` are write accesses belonging to the same assignment.

### isImplicitWrite()

```
predicate isImplicitWrite() {
    implicitWriteAccess(toGenerated(this))
    or
    this = any(SimpleParameterSynthImpl p).getDefiningAccess()
    or
    this = any(HashPattern p).getValue(_)
    or
    synthChild(any(NamedParameter p), 0, this)
}
```

Holds if this access is a write access belonging to an implicit assignment.
For example, in

```rb
def m elements
  for e in elements do
    puts e
  end
end
```

The access to `elements` in the parameter list is an implicit assignment,
as is the first access to `e`.

## VariableWriteAccess

An access to a variable where the value is updated.

```
VariableWriteAccess() {
    this.isExplicitWrite(_) or
    this.isImplicitWrite()
  }
```

## VariableReadAccess

An access to a variable where the value is read.

```
VariableReadAccess() { not this instanceof VariableWriteAccess }
```

## LocalVariableAccess

An access to a local variable. 

- [getAPrimaryQlClass()](#getaprimaryqlclasses)
- [isCapturedAccess()](#iscapturedaccess)

### getAPrimaryQlClasses()

```
override string getAPrimaryQlClass() { result = "LocalVariableAccess" }
```

### isCapturedAccess()

```
final predicate isCapturedAccess() { isCapturedAccess(this) }
```

Holds if this access is a captured variable access. For example in

```rb
def m x
  x.times do |y|
    puts x
  end
  puts x
end
```

The access to `x` in the first `puts x` is a captured access, while the access to `x` in the second `puts x` is not.


## LocalVariableWriteAccess 

Not implemented yet.

## LocalVariableReadAccess

Not implemented yet.

## GlobalVariableAccess

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "GlobalVariableAccess" }
```

## GlobalVariableWriteAccess

Not implemented yet.

## GlobalVariableReadAccess

Not implemented yet.

## InstanceVariableAccess

An access to an instance variable. Extends `VariableAccess`.

- [getAPrimaryQlClass()](#getaprimaryqlclass-1)
- [getReceiver()](#getreceiver)
- [getAChild(string pred)](#getachildstring-pred)

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "InstanceVariableAccess" }
```

### getReceiver()

```
final SelfVariableAccess getReceiver() { synthChild(this, 0, result) }
```

Gets the synthetic receiver (`self`) of this instance variable access.

### getAChild(string pred)

```
final override AstNode getAChild(string pred) {
    result = VariableAccess.super.getAChild(pred)
    or
    pred = "getReceiver" and result = this.getReceiver()
}
```

## InstanceVariableWriteAccess

Not implemented yet.

## InstanceVariableReadAccess

Not implemented yet.

## ClassVariableAccess

An access to a class variable.

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "ClassVariableAccess" }
```

Gets the name of the class.


## ClassVariableWriteAccess

Not implemented yet.

## ClassVariableReadAccess

Not implemented yet.


## SelfVariableAccess

An access to the `self` variable. For example:
- `self == other`
- `self.method_name`
- `def self.method_name ... end`

This also includes implicit references to the current object in method
calls.  For example, the method call `foo(123)` has an implicit `self`
receiver, and is equivalent to the explicit `self.foo(123)`.


### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "SelfVariableAccess" }
```

Gets name of the class.

## SelfVariableReadAccess

Not implemented yet.