import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
import codeql.solidity.controlflow.BasicBlocks
import codeql.solidity.controlflow.ControlFlowGraph

// import Solidity
// import codeql.solidity.printAst
from Solidity::BinaryExpression bexpr
where bexpr.getOperator().matches("^")
select bexpr.toString(), bexpr.getLocation()
// codeql query run /mnt/c/Users/x/Desktop/CodeQL/codeql-repo/solidity/ql/lib/nn.ql -d solidity-test/test-db-transfer-from-examples/
// ~/trabajo/codeql/solidity-test$
// codeql database create --overwrite --search-path ../solidity/extractor-pack/ -l solidity test-db-unprotected-permissions-change -s ./unprotected-permissions-change/
