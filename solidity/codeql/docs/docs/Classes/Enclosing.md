# Enclosing

Provides predicates for finding the smallest element that encloses an expression or statement.

## Functions

- [stmtEnclosingElement(Solidity::Statement s)](#stmtenclosingelementsoliditystatement-s)
- [exprEnclosingElement(Solidity::Expression e)](#exprenclosingelementsolidityexpression-e)

## stmtEnclosingElement(Solidity::Statement s)

```
AstNode stmtEnclosingElement(Solidity::Statement s) {
  result.(Solidity::FunctionDefinition).getBody().getChild(_) = s or
  result = stmtEnclosingElement(s.getParent()) or
  result = exprEnclosingElement(s.getParent())
}
```

Gets the enclosing element of statement `s`.

## exprEnclosingElement(Solidity::Expression e)

```
AstNode exprEnclosingElement(Solidity::Expression e) {
  result = exprEnclosingElement(e.getParent())
  or
  result = stmtEnclosingElement(e.getParent())
  or
  result.(Solidity::FunctionBody) = e.getParent()
}
```

Gets the enclosing element of expression `e`.