import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
import codeql.solidity.controlflow.BasicBlocks
import codeql.solidity.controlflow.ControlFlowGraph

string getParentLevels(Solidity::AstNode node, int levels) {
  levels = 0 and result = node.toString()
  or
  levels > 0 and
  exists(Solidity::AstNode inter |
    node.getParent() = inter and
    result = getParentLevels(inter, levels - 1).toString() + "->" + node.toString()
  )
}

string getChildLevels(Solidity::AstNode node, int levels) {
  levels = 0 and result = node.toString()
  or
  levels > 0 and
  exists(Solidity::AstNode inter |
    node.getAFieldOrChild() = inter and
    result = node.toString() + "->" + getChildLevels(inter, levels - 1).toString()
  )
}

predicate isInIfStatement(Solidity::AstNode node) {
  node.getAPrimaryQlClass() = "IfStatement"
  or
  exists(Solidity::AstNode parent | node.getParent() = parent and isInIfStatement(parent))
}

predicate isInRequire(Solidity::AstNode node) {
  exists(Solidity::CallExpression call |
    node instanceof Solidity::CallExpression and
    call = node and
    call.getFunction().getChild().toString() = "require"
    or
    call.getFunction().getChild().toString() = "assert"
  )
  or
  exists(Solidity::AstNode parent | node.getParent() = parent and isInRequire(parent))
}

/*
 * Solidity::AstNode getParentUntil(Solidity::AstNode node, string type) {
 *  type = result.getAPrimaryQlClass().toString() and result = node
 *  or
 *  exists(Solidity::AstNode parent |
 *    node.getParent() = parent and
 *    not node.getAPrimaryQlClass().matches(type) and
 *    result = getParentUntil(node, type)
 *  )
 * }
 *
 * from Solidity::AstNode node
 * where node.toString().matches("send")
 * select getParentLevels(node, 8), node.getLocation()
 */

/*
 * from Solidity::FunctionBody body
 * select body.getAFieldOrChild() as test, test.getLocation(), getChildLevels(test, 6)
 */

from Solidity::AstNode node
where
  node.toString() = "send" and
  not (
    isInRequire(node)
    or
    isInIfStatement(node)
  )
select node, node.getLocation()
// codeql query run ./ql/lib/detector6.ql -d ../solidity-test/test-db-unchecked-transfer/
// ~/trabajo/codeql/solidity-test$
// codeql database create --overwrite --search-path ../solidity/extractor-pack/ -l solidity test-db-unprotected-permissions-change -s ./unprotected-permissions-change/
