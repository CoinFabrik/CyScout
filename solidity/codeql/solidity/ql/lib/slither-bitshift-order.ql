import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
import codeql.solidity.controlflow.BasicBlocks
import codeql.solidity.controlflow.ControlFlowGraph
// import Solidity
// import codeql.solidity.printAst

from Solidity::YulFunctionCall n
where (n.getFunction().toString() = "shr" or n.getFunction().toString() = "shl")
 and n.getChild(1) instanceof Solidity::YulDecimalNumber
select n.toString(), n.getLocation()






// codeql query run /mnt/c/Users/x/Desktop/CodeQL/codeql-repo/solidity/ql/lib/nn.ql -d solidity-test/test-db-transfer-from-examples/