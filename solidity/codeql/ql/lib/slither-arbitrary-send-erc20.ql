import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
// import Solidity
// import codeql.solidity.printAst

from Solidity::MemberExpression n

where n.getProperty().getValue() = "transferFrom" and
    (
        not n.getParent().getParent().(Solidity::CallExpression).getChild(0).
            getAFieldOrChild().(Solidity::Expression).getChild() instanceof Solidity::MemberExpression
        or not n.getParent().getParent().(Solidity::CallExpression).getChild(0).
            getAFieldOrChild().(Solidity::Expression).getChild().
            (Solidity::MemberExpression).getProperty().getValue() = "sender"
    )
select n.getParent().getParent().(Solidity::CallExpression).getChild(0).
    getAFieldOrChild().(Solidity::Expression).getChild(), n.getLocation()






// codeql query run /mnt/c/Users/x/Desktop/CodeQL/codeql-repo/solidity/ql/lib/nn.ql -d solidity-test/test-db-transfer-from-examples/