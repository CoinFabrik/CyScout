import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
import codeql.solidity.controlflow.BasicBlocks
import codeql.solidity.controlflow.ControlFlowGraph
// import Solidity
// import codeql.solidity.printAst

from BasicBlock b
where b.isUnreachable()
select b.getStart(), b.getEnd(), b.getLocation()






// codeql query run /mnt/c/Users/x/Desktop/CodeQL/codeql-repo/solidity/ql/lib/nn.ql -d solidity-test/test-db-transfer-from-examples/
