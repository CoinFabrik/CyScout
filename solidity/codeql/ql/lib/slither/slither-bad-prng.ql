import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
import codeql.solidity.controlflow.BasicBlocks
import codeql.solidity.controlflow.ControlFlowGraph

predicate isBadPrngSource(Solidity::MemberExpression expr) {
  expr.getProperty().toString() = "timestamp" and
  expr.getAFieldOrChild().toString() = "block"
  or
  expr.getProperty().toString() = "number" and
  expr.getAFieldOrChild().toString() = "block"
}

Solidity::MemberExpression navigateUntilMembExp(Solidity::AstNode node) {
  result = node.(Solidity::MemberExpression)
  or
  result = navigateUntilMembExp(node.getAFieldOrChild())
}

predicate isModuloOp(Solidity::BinaryExpression expr) {
  isBadPrngSource(navigateUntilMembExp(expr.getLeft()))
  and 
  expr.getOperator().toString() = "%"
}

from Solidity::BinaryExpression expr
where isModuloOp(expr)
select expr.toString(), expr.getLocation()
// codeql query run ./ql/lib/detector7.ql -d ../solidity-test/test-db-bad-prng/
// ~/trabajo/codeql/solidity-test$
// codeql database create --overwrite --search-path ../solidity/extractor-pack/ -l solidity test-db-unprotected-permissions-change -s ./unprotected-permissions-change/
