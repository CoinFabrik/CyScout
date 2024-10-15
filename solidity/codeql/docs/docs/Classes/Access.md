# Access

## Classes 

- [Access](#access)
- [VariableAccess](#variableaccess)
- [FieldAccess](#fieldaccess)
- [PointerFieldAccess](#pointerfieldaccess)
- [DotFieldAccess](#dotfieldaccess)
- [ReferenceFieldAccess](#referencefieldaccess)
- [ValueFieldAccess](#valuefieldaccess)
- [TypeName](#typename)


## Predicates

- [referenceConversion(Conversion c)](#referenceconversionconversion-c)
- [exprHasReferenceConversion(Expr e)](#exprhasreferenceconversionexpr-e)

## Access

### Methods 

 - [Access()](#access-)
 - [getTarget()](#gettarget)
 - [mayBeImpure()](#maybeimpure)
 - [mayBeGloballyImpure()](#maybegloballyimpure)
 - [toString()](#tostring)

### Access ()

```
Access() { this instanceof Solidity::AssignmentExpression or 
    this instanceof Solidity::AugmentedAssignmentExpression or
    this instanceof Solidity::EnumValue or
    this instanceof Solidity::EnumDeclaration or
    this instanceof Solidity::VariableDeclaration
}
```
### getTarget()

```
Declaration getTarget() { none() } // overridden in subclasses
```
Gets the accessed function, variable, or enum constant.

### mayBeImpure()

```
predicate mayBeImpure() { none() }
```

### mayBeGloballyImpure()

```
predicate mayBeGloballyImpure() { none() }
```

### toString()

```
override string toString() { none() }
```

## VariableAccess

### Methods and predicates
- [getAPrimaryQlClass()](#getaprimaryqlclass)
- [getTarget()](#gettarget-1)
- [isUsedAsLValue()](#isusedaslvalue)
- [isModified()](#ismodified)
- [isRValue()](#isrvalue)
- [getQualifier()](#getqualifier)
- [toString()](#tostring-1)
- [mayBeImpure()](#maybeimpure-1)
- [mayBeGloballyImpure()](#maybegloballyimpure-1)
- [isAddressOfAccess()](#isaddressofaccess)
- [isAddressOfAccessNonConst()](#isaddressofaccessnonconst)

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "VariableAccess" }
```

### getTarget()

```
override Variable getTarget() { varbind(underlyingElement(this), unresolveElement(result)) }
```

Gets the accessed variable.


### isUsedAsLValue()

```
predicate isUsedAsLValue() {
    exists(Assignment a | a.getLValue() = this) or
    exists(CrementOperation c | c.getOperand() = this) 
}
```

Holds if this variable access is providing an LValue in a meaningful way.
For example, this includes accesses on the left-hand side of an assignment.
It does not include accesses on the right-hand side of an assignment, even if they could appear on the left-hand side of some assignment.


### isModified()

```
  predicate isModified() {
    exists(Solidity::AssignmentExpression a | a.getLeft().getChild() = )
    or
    exists(CrementOperation c | c.getOperand() = this)
}
```

Holds if this variable access is in a position where it is (directly) modified,
for instance by an assignment or increment/decrement operator.

### isRValue()

```
predicate isRValue() {
    not exists(AssignExpr ae | ae.getLValue() = this) and
    not exists(AddressOfExpr addof | addof.getOperand() = this) and
    not this.getConversion() instanceof ReferenceToExpr and
    not this.getConversion() instanceof ArrayToPointerConversion
}
```

Holds if this variable access is an rvalue. 

### getQualifier()

```
Expr getQualifier() { this.getChild(-1) = result }
```

Gets the expression generating the variable being accessed.

As a few examples:
For `ptr->x`, this gives `ptr`.
For `(*ptr).x`, this gives `(*ptr)`.
For `smart_ptr->x`, this gives the call to `operator->`.

This applies mostly to FieldAccesses, but also to static member variables accessed
"through" a pointer. Note that it does NOT apply to static member variables accessed
through a type name, as in that case the type name is a qualifier on the variable
rather than a qualifier on the access.

### toString()

```
override string toString() {
    if exists(this.getTarget())
    then result = this.getTarget().getName()
    else result = "variable access"
}
```

Gets a textual representation of this variable access. 

### mayBeImpure()

```
  override predicate mayBeImpure() {
    this.getQualifier().mayBeImpure() or
    this.getTarget().getType().isVolatile()
}
```

### mayBeGloballyImpure()

```
override predicate mayBeGloballyImpure() {
    this.getQualifier().mayBeGloballyImpure() or
    this.getTarget().getType().isVolatile()
}
```

### isAddressOfAccess()

```
predicate isAddressOfAccess() { variableAddressEscapesTree(this, _) }
```

Holds if this access is used to get the address of the underlying variable
in such a way that the address might escape. This can be either explicit,
for example `&x`, or implicit, for example `T& y = x`.

### isAddressOfAccessNonConst()

```
predicate isAddressOfAccessNonConst() { variableAddressEscapesTreeNonConst(this, _) }
```

Holds if this access is used to get the address of the underlying variable in such a way that the address might escape as a pointer or reference to non-const data. This can be either explicit, for example `&x`, or implicit, for example `T& y = x`.


## FieldAccess

### Methods

- [getAPrimaryQlClass()](#getaprimaryqlclass-1)
- [FieldAccess()](#fieldaccess-1)
- [getTarget()](#gettarget-2)

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "FieldAccess" }
```

### FieldAccess()

```
FieldAccess() { exists(Field f | varbind(underlyingElement(this), unresolveElement(f))) }
```

### getTarget()

Gets the accessed field.

```
override Field getTarget() { result = super.getTarget() }
```

## PointerFieldAccess

A field access whose qualifier is a pointer to a class, struct or union.
These typically take the form `obj->field`. Another case is a field access
with an implicit `this->` qualifier, which is often a `PointerFieldAccess`
(but see also `ImplicitThisFieldAccess`).

For example the accesses to `x` and `y` in `myMethod` in the following code
are each a `PointerFieldAccess`:

```
class MyClass {
public:
  void myMethod(MyClass *other) {
      other->x = y;
  }
 *
  int x, y;
};
```

### Methods 
- [getAPrimaryQlClass()](#getaprimaryqlclass-2)
- [PointerFieldAccess()](#pointerfieldaccess-1)

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "PointerFieldAccess" }
```

### PointerFieldAccess()

```
PointerFieldAccess() {
    exists(PointerType t |
      t = this.getQualifier().getFullyConverted().getUnspecifiedType() and
      t.getBaseType() instanceof Class
    )
}
```

## DotFieldAccess

A field access of the form `obj.field`. The type of `obj` is either a
class/struct/union or a reference to one. `DotFieldAccess` has two
sub-classes, `ValueFieldAccess` and `ReferenceFieldAccess`, to
distinguish whether or not the type of `obj` is a reference type.

### Methods 

- [getAPrimaryQlClass()](#getaprimaryqlclass-3)
- [DotFieldAccess()](#dotfieldaccess-1)

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "DotFieldAccess" }
```

### DotFieldAccess()

```
DotFieldAccess() { this.getQualifier().getFullyConverted().getUnspecifiedType() instanceof Class }
```

## ReferenceFieldAccess

A field access of the form `obj.field`, where the type of `obj` is a
reference to a class/struct/union. For example the accesses to `y` in
`myMethod` in the following code:

```
class MyClass {
public:
  void myMethod(MyClass a, MyClass &b) {
    a.x = b.y;
  }
 *
  int x, y;
};
```

### Methods

- [getAPrimaryQlClass()](#getaprimaryqlclass-4)
- [ReferenceFieldAccess()](#referencefieldaccess-1)

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "ReferenceFieldAccess" }
```

### ReferenceFieldAccess()

```
ReferenceFieldAccess() { exprHasReferenceConversion(this.getQualifier()) }
```

## ValueFieldAccess

 A field access of the form `obj.field`, where the type of `obj` is a
class/struct/union (and not a reference). For example the accesses to `x`
in `myMethod` in the following code:

```
class MyClass {
public:
  void myMethod(MyClass a, MyClass &b) {
    a.x = b.y;
  }

  int x, y;
};
```



### Methods

- [getAPrimaryQlClass()](#getaprimaryqlclass-5)
- [ValueFieldAccess()](#valuefieldaccess-1)

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "ValueFieldAccess" }
```

### ValueFieldAccess()

```
ValueFieldAccess() { not exprHasReferenceConversion(this.getQualifier()) }
```

## TypeName

Not implemented yet.


## referenceConversion(Conversion c)

```
private predicate referenceConversion(Conversion c) {
  c.getType() = c.getExpr().getType().(ReferenceType).getBaseType()
}
```

Holds if `c` is a conversion from type `T&` to `T` (or from `T&&` to `T`).

 
## exprHasReferenceConversion(Expr e)

```
private predicate exprHasReferenceConversion(Expr e) { referenceConversion(e.getConversion+()) }

```

Holds if `e` is a reference expression (that is, it has a type of the form `T&`), which is converted to a value. For example:

```
int myfcn(MyStruct &x) {
  return x.field;
}
```
In this example, the type of `x` is `MyStruct&`, but it gets implicitly converted to `MyStruct` in the expression `x.field`.


