import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.ast.AST as AST
import Solidity

class BuiltInSymbol extends Solidity::Token {
  BuiltInSymbol() {
    this.getValue() = "assert" or
    this.getValue() = "require" or
    this.getValue() = "revert" or
    this.getValue() = "block" or
    this.getValue() = "blockhash" or
    this.getValue() = "gasleft" or
    this.getValue() = "msg" or
    this.getValue() = "now" or
    this.getValue() = "tx" or
    this.getValue() = "this" or
    this.getValue() = "addmod" or
    this.getValue() = "mulmod" or
    this.getValue() = "keccak256" or
    this.getValue() = "sha256" or
    this.getValue() = "sha3" or
    this.getValue() = "ripemd160" or
    this.getValue() = "ecrecover" or
    this.getValue() = "selfdestruct" or
    this.getValue() = "suicide" or
    this.getValue() = "abi" or
    this.getValue() = "fallback" or
    this.getValue() = "receive"
  }
}

class ReservedKeywords extends Solidity::Token {
  ReservedKeywords() {
    this.getValue() = "abstract" or
    this.getValue() = "after" or
    this.getValue() = "alias" or
    this.getValue() = "apply" or
    this.getValue() = "auto" or
    this.getValue() = "case" or
    this.getValue() = "catch" or
    this.getValue() = "copyof" or
    this.getValue() = "default" or
    this.getValue() = "define" or
    this.getValue() = "final" or
    this.getValue() = "immutable" or
    this.getValue() = "implements" or
    this.getValue() = "in" or
    this.getValue() = "inline" or
    this.getValue() = "let" or
    this.getValue() = "macro" or
    this.getValue() = "match" or
    this.getValue() = "mutable" or
    this.getValue() = "null" or
    this.getValue() = "of" or
    this.getValue() = "override" or
    this.getValue() = "partial" or
    this.getValue() = "promise" or
    this.getValue() = "reference" or
    this.getValue() = "relocatable" or
    this.getValue() = "sealed" or
    this.getValue() = "sizeof" or
    this.getValue() = "static" or
    this.getValue() = "supports" or
    this.getValue() = "switch" or
    this.getValue() = "try" or
    this.getValue() = "type" or
    this.getValue() = "typedef" or
    this.getValue() = "typeof" or
    this.getValue() = "unchecked"
  }
}

from Solidity::AstNode n, Token name
where
  (
    name = n.(StateVariableDeclaration).getName()
    or
    name = n.(VariableDeclaration).getName()
    or
    exists(n.(FunctionDefinition).getBody()) and
    (
      name = n.(FunctionDefinition).getName() or
      name = n.(FunctionDefinition).getAFieldOrChild().(Parameter).getName()
    )
  ) and
  (
    name instanceof ReservedKeywords or
    name instanceof BuiltInSymbol
  )
select name
