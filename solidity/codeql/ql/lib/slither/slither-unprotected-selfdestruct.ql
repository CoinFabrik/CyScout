import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.Enclosing
import codeql.solidity.controlflow.BasicBlocks
import codeql.solidity.controlflow.ControlFlowGraph

predicate isMsgSender(Solidity::AstNode node) {
  node.(Solidity::MemberExpression).getProperty().toString() = "sender" and
  node.(Solidity::MemberExpression).getObject().toString() = "msg"
}

predicate isInRequire(Solidity::AstNode node) {
  exists(Solidity::CallExpression call |
    call = node and
    (
      call.getFunction().getChild().toString() = "require"
      or
      call.getFunction().getChild().toString() = "assert"
    )
  )
  or
  exists(Solidity::AstNode parent | node.getParent() = parent and isInRequire(parent))
}

predicate hasPermissionsCheck(Solidity::AstNode node) {
  isMsgSender(node) and isInRequire(node)
  or
  hasPermissionsCheck(node.getAFieldOrChild())
}

predicate hasSelfDestruct(Solidity::AstNode node) {
  node.(Solidity::CallExpression).getFunction().getChild().toString() = "selfdestruct"
  or
  hasSelfDestruct(node.getAFieldOrChild())
}

predicate funcIsNotChecked(Solidity::FunctionDefinition func) {
  forall(Solidity::ModifierDefinition mod | hasPermissionsCheck(mod) |
    mod.getName().getValue() !=
      func.getAFieldOrChild()
          .(Solidity::ModifierInvocation)
          .getAFieldOrChild()
          .(Solidity::Identifier)
          .getValue()
  )
  or
  not exists(Solidity::ModifierInvocation inv | inv = func.getAFieldOrChild())
}

from Solidity::FunctionDefinition func
where hasSelfDestruct(func) and funcIsNotChecked(func)
select func.getName().getValue()
//func.getAFieldOrChild().(Solidity::ModifierInvocation).getAFieldOrChild()
// codeql query run ./ql/lib/detector9.ql -d ../solidity-test/test-db-selfdestruct/
// ~/trabajo/codeql/solidity-test$
// codeql database create --overwrite --search-path ../solidity/extractor-pack/ -l solidity test-db-selfdestruct -s ./selfdestruct/
