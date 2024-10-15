# Specifier

Provides classes for modeling specifiers and attributes.

## Classes

- [Specifier](#specifier-1)
- [FunctionSpecifier](#functionspecifier)
- [StorageClassSpecifier](#storageclassspecifier)
- [AccessSpecifier](#accessspecifier)

## Specifier

A Solidity specifier: `internal`, `public`, `private`, `external`, `pure`, `view`, `immutable`, `virtual`.

### Methods 

- [Specifier()](#specifier-2)
- [getAPrimaryQlClass()](#getaprimaryqlclass)
- [getName()](#getname)
- [hasName(string name)](#hasnamestring-name)

### Specifier()

```
Specifier(){this instanceof Solidity::StateMutability or this instanceof Solidity::Visibility
                or this instanceof Solidity::Virtual
}
```

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "Specifier" }
```

### getName() 

```  
string getName() { result = this.(Solidity::Token).getValue().toString() }
```

Gets the name of this specifier.

### hasName(string name)

```
predicate hasName(string name) { name = this.getName() }
```

Holds if the name of this specifier is `name`.


## FunctionSpecifier

A Solidity function specifier: `inline`, `virtual`, or `explicit`.
- [FunctionSpecifier()](#functionspecifier-1)
- [getAPrimaryQlClass()](#getaprimaryqlclass-1)

### FunctionSpecifier() 

```
FunctionSpecifier() { this.hasName(["inline", "virtual", "explicit"]) }
```

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "FunctionSpecifier" }
```

## StorageClassSpecifier

A Solidity storage class specifier: `auto`, `register`, `static`, `extern`, or `mutable`.

- [StorageClassSpecifier()](#storageclassspecifier-1)
- [getAPrimaryQlClass()](#getaprimaryqlclass-2)

### StorageClassSpecifier() 
```
StorageClassSpecifier() { this.hasName(["auto", "register", "static", "extern", "mutable"]) }
```

### getAPrimaryQlClass()
```
override string getAPrimaryQlClass() { result = "StorageClassSpecifier" }
```

## AccessSpecifier

A Solidity access specifier: `public`, `private`, `internal`, `external`.

- [AccessSpecifier()](#accessspecifier-1)
- [accessInDirectDerived(AccessSpecifier baseAccess)](#accessindirectderivedaccessspecifier-baseaccess)
- [getAPrimaryQlClass()](#getaprimaryqlclass-3)

### AccessSpecifier()

```
AccessSpecifier() { this.hasName(["public", "private", "internal", "external"]) }
```


### accessInDirectDerived(AccessSpecifier baseAccess)

```
AccessSpecifier accessInDirectDerived(AccessSpecifier baseAccess) {
    this.getName() != "private" and
    (
      // Alphabetically, "private" < "protected" < "public". This disjunction
      // encodes that `result` is the minimum access of `this` and
      // `baseAccess`.
      baseAccess.getName() < this.getName() and result = baseAccess
      or
      baseAccess.getName() >= this.getName() and result = this
    )
  }
```

Gets the visibility of a field with access specifier `this` if it is
directly inherited with access specifier `baseAccess`. For example:

```
class A { protected int f; };
class B : private A {};
```

In this example, `this` is `protected`, `baseAccess` is `private`, and
`result` is `private` because the visibility of field `f` in class `B`
is `private`.

This method encodes the rules of N4140 11.2/1, tabulated here:

```
`this`           | `baseAccess`           | `result`
(access in base) | (base class specifier) | (access in derived)
----------------------------------------------------------
private          | private                | N/A
private          | protected              | N/A
private          | public                 | N/A
protected        | private                | private
protected        | protected              | protected
protected        | public                 | protected
public           | private                | private
public           | protected              | protected
public           | public                 | public
```

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "AccessSpecifier" }
```