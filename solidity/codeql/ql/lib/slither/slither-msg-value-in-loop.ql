import codeql.solidity.ast.internal.TreeSitter

predicate isMsgValue(Solidity::MemberExpression expr) {
        expr.getProperty().getValue().toString() = "value" 
        and expr.getAFieldOrChild().toString() = "msg"
}

predicate isInsideForLoop(Solidity::MemberExpression expr) {
        expr.getParent().getParent().getParent().getParent().getParent().getParent().getParent().getParent().toString() = "ForStatement"
}

predicate isInsideAConditional(Solidity::MemberExpression expr) {
        expr.getParent().getParent().getParent().getParent().toString() = "IfStatement"
}

predicate isInsideAssertOrRequiere(Solidity::MemberExpression expr) {
        expr.getParent().getParent().getParent().getParent().getParent().(Solidity::CallExpression).getFunction().getChild().toString() = "require"
        or expr.getParent().getParent().getParent().getParent().getParent().(Solidity::CallExpression).getFunction().getChild().toString() = "assert"
}

from Solidity::MemberExpression expr
where isMsgValue(expr) and not ( isInsideAConditional(expr) or isInsideAssertOrRequiere(expr) ) and isInsideForLoop(expr)
select expr.getLocation()