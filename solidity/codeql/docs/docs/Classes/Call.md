# Call

## Classes

- [Call](#call)
- [MethodCall](#methodcall)
- [UnknownMethodCall](#unknownmethodcall)
- [SetterMethodCall](#settermethodcall)
- [ElementReference](#elementreference)
- [YieldCall](#yieldcall)
- [SuperCall](#supercall)
- [BlockArgument](#blockargument)
- [ForwardedArguments](#forwardedarguments)


##  Call 

Extends Expr instanceof CallImpl

- [getAPrimaryQlClass()](#getaprimaryqlclass)
- [getArgument(int n)](#getargumentint-n)
- [getAnArgument()](#getanargument)
- [getKeywordArgument(string keyword)](#getkeywordargumentstring-keyword)
- [getNumberOfArguments()](#getnumberofarguments)
- [getATarget()](#getatarget)
- [getAChild(string pred)](#getachildstring-pred)

### getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "Call" }
```
Returns the kind of the class.

### getArgument(int n)

```
final Expr getArgument(int n) { result = super.getArgumentImpl(n) }
```

Gets the `n`th argument of this method call. For instance,

```
foo(0, bar: 1)
yield 0, bar: 1
```
For `getArgument(0)` the result is the `IntegerLiteral` 0. While for `getArgument(1)` the result is a `Pair`.


### getAnArgument()

```
final Expr getAnArgument() { result = this.getArgument(_) }
```

Gets an argument of this method call.

### getKeywordArgument(string keyword)

```
final Expr getKeywordArgument(string keyword) {
    exists(Pair p |
      p = this.getAnArgument() and
      p.getKey().getConstantValue().isSymbol(keyword) and
      result = p.getValue()
    )
  }
```

Gets the value of the keyword argument whose key is `keyword`, if any. 

For example, the result for `getKeywordArgument("qux")` in the following example is the `IntegerLiteral` 123.
```rb
foo :bar "baz", qux: 123
```

### getNumberOfArguments()

```
final int getNumberOfArguments() { result = super.getNumberOfArgumentsImpl() }
```

Gets the number of arguments of this method call.

### getATarget()

```
final Callable getATarget() {
    exists(DataFlowCall c |
      this = c.asCall().getExpr() and
      TCfgScope(result) = viableCallableLambda(c, _)
    )
    or
    result = getTarget(TNormalCall(this.getAControlFlowNode()))
  }
```

Gets a potential target of this call, if any.

### getAChild(string pred)

```
override AstNode getAChild(string pred) {
    result = Expr.super.getAChild(pred)
    or
    pred = "getArgument" and result = this.getArgument(_)
}

```

Gets a child of the predicate passed by argument.


## MethodCall

A method call.

- [getAPrimaryQlClass()](#getaprimaryqlclass-1)
- [getReceiver()](#getreceiver)
- [getMethodName()](#getmethodname)
- [getBlock()](#getblock)
- [getBlockArgument()](#getblockargument)
- [hasBlock()](#hasblock)
- [isSafeNavigation()](#issafenavigation)
- [toString()](#tostring)
- [getAChild(string pred)](#getachildstring-pred-1)

###  getAPrimaryQlClass()

```
override string getAPrimaryQlClass() { result = "MethodCall" }
```

Returns the kind of the class.

###  getReceiver()

```
final Expr getReceiver() { result = super.getReceiverImpl() }
```

Gets the receiver of this call, if any. For example:
 
```rb
foo.bar
Baz::qux
corge()
```

The result for the call to `bar` is the `Expr` for `foo`; the result for the call to `qux` is the `Expr` for `Baz`; for the call to `corge` there is no result.

###  getMethodName()

```
final string getMethodName() { result = super.getMethodNameImpl() }
```

Gets the name of the method being called. For example, in:

```rb
foo.bar x, y
```

The result is `"bar"`. Super calls call a method with the same name as the current method, so the result for a super call is the name of the current method.

E.g:
```rb
def foo
 super # the result for this super call is "foo"
end
```

###  getBlock()

```
final Block getBlock() { result = super.getBlockImpl() }
```

Gets the block of this method call, if any.

```rb
foo.each { |x| puts x }
```

###  getBlockArgument()

```
final BlockArgument getBlockArgument() { result = this.getAnArgument() }
```

Gets the block argument of this method call, if any.

```rb
foo(&block)
```
###  hasBlock()

```
final predicate hasBlock() { exists(this.getBlock()) or exists(this.getBlockArgument()) }
```

Holds if this method call has a block or block argument.

###  isSafeNavigation()

```
final predicate isSafeNavigation() { super.isSafeNavigationImpl() }
```

Holds if the safe navigation operator (`&.`) is used in this call.

```rb
foo&.empty?
```

###  toString()

```
override string toString() { result = "call to " + this.getMethodName() }
```
###  getAChild(string pred)

```
override AstNode getAChild(string pred) {
    result = Call.super.getAChild(pred)
    or
    pred = "getReceiver" and result = this.getReceiver()
    or
    pred = "getBlock" and result = this.getBlock()
  }
```


##  UnknownMethodCall

Extends MethodCall

A `Method` call that has no known target. These will typically be calls to methods inherited from a superclass.

Diclaimer: When API Graphs is able to resolve calls to methods like `Kernel.send` this class is no longer necessary and should be removed.

- [UnknownMethodCall](#unknownmethodcall-1)

### UnknownMethodCall

```
UnknownMethodCall() { not exists(this.(Call).getATarget()) }
```


##  SetterMethodCall

A call to a setter method. This class extends `MethodCall` and `TMethodCallSynth`.

- [SetterMethodCall](#settermethodcall)
- [getAPrimaryQlClass](#getaprimaryqlclass-2)
- [getTargetName()](#gettargetname)

### SetterMethodCall()

```
SetterMethodCall() { this = TMethodCallSynth(_, _, _, true, _) }
```

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "SetterMethodCall" }
```

### getTargetName()

```
final string getTargetName() {
    exists(string methodName |
      methodName = this.getMethodName() and
      result = methodName.prefix(methodName.length() - 1)
    )
  }
```

Gets the name of the method being called without the trailing `=`. For example, in the following two statements the target name is `value`:

```rb
foo.value=(1)
foo.value = 1
```


##  ElementReference

An element reference; a call to the `[]` method.
```rb
a[0]
```

Extends `MethodCall`

- [getAPrimaryQlClass()](#getaprimaryqlclass-3)
- [toString()](#tostring-1)

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "ElementReference" }
```

Returns the kind of the class.

### toString()

```
final override string toString() { result = "...[...]" }
```

##  YieldCall

A call to yield. Extends `Call` class.

```rb
yield x, y
```

- [getAPrimaryQlClass()](#getaprimaryqlclass-4)
- [toString()](#tostring-2)

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "YieldCall" }
```
### toString()

```
final override string toString() { result = "yield ..." }
```

##  SuperCall

A call to `super`.

```rb
class Foo < Bar
    def baz
        super
    end
end
```

- [getAPrimaryQlClass()](#getaprimaryqlclass-5)
- [toString()](#tostring-3)

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "SuperCall" }
```

### toString()

```
override string toString() { result = "super call to " + this.getMethodName() }
```

##  BlockArgument

A block argument in a method call. It extends `Expr`

- [BlockArgument()](#blockargument-1)
- [getAPrimaryQlClass()](#getaprimaryqlclass-6)
- [getValue()](#getvalue)
- [toString()](#tostring-4)
- [getAChild()](#getachildstring-pred-2)

### BlockArgument()

```
BlockArgument() { this = TBlockArgument(g) }
```

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "BlockArgument" }
```

### getValue() 

```
final Expr getValue() {
    toGenerated(result) = g.getChild() or
    synthChild(this, 0, result)
  }
```

Gets the underlying expression representing the block. In the following example, the result is the `Expr` for `bar`:
```rb
foo(&bar)
```
### toString()

```
final override string toString() { result = "&..." }
```

### getAChild(string pred)

```
final override AstNode getAChild(string pred) {
    result = super.getAChild(pred)
    or
    pred = "getValue" and result = this.getValue()
  }
```

##  ForwardedArguments

A `...` expression that contains forwarded arguments. This class extends `Expr`.

```rb
foo(...)
```

- [ForwardedArguments()](#forwardedarguments-1)
- [getAPrimaryQlClass()](#getaprimaryqlclass-7)
- [toString()](#tostring-5)

### ForwardedArguments()

```
ForwardedArguments() { this = TForwardArgument(g) }
```

### getAPrimaryQlClass()

```
final override string getAPrimaryQlClass() { result = "ForwardedArguments" }
```

### toString() 

```
final override string toString() { result = "..." }
```
A `...` expression that contains forwarded arguments.

