import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
import codeql.solidity.controlflow.BasicBlocks
import codeql.solidity.controlflow.ControlFlowGraph

predicate hasDivisionAsAChild(Solidity::AstNode node) {
  node.(Solidity::BinaryExpression).getOperator() = "/"
  or
  hasDivisionAsAChild(node.getAFieldOrChild())
}

from Solidity::BinaryExpression expr
where expr.getOperator() = "*" and hasDivisionAsAChild(expr.getLeft())
select expr.toString(), expr.getLocation(), expr.getOperator()
// codeql query run ./ql/lib/detector8.ql -d ../solidity-test/test-db-divide/before/multiply/
// ~/trabajo/codeql/solidity-test$
// codeql database create --overwrite --search-path ../solidity/extractor-pack/ -l solidity test-db-unprotected-permissions-change -s ./unprotected-permissions-change/
