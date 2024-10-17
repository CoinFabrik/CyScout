import AST

class NumberLiteralImpl extends ExpressionImpl, TNumberLiteral {
  private Solidity::NumberLiteral node;

  NumberLiteralImpl() { this = TNumberLiteral(node) }

  override AstNodeImpl getAChild(string child) {
    child = "Value" and toTreeSitter(result) = node.getChild()
  }

  override string getAPrimaryQlClass() { result = node.getAPrimaryQlClass() }

  override L::Location getLocation() { result = node.getLocation() }

  override string toString() {
    result = node.toString() + "(" + node.getChild().getValue().toString() + ")"
  }
}

class MemberExpressionImpl extends ExpressionImpl, TMemberExpression {
  private Solidity::MemberExpression member;

  MemberExpressionImpl() { this = TMemberExpression(member) }

  override AstNodeImpl getAChild(string child) {
    child = "getObject" and
    toTreeSitter(result) = member.getObject()
    or
    child = "getProperty" and
    toTreeSitter(result) = member.getProperty()
  }

  AstNodeImpl getObject() { toTreeSitter(result) = member.getObject() }

  AstNodeImpl getProperty() { toTreeSitter(result) = member.getProperty() }

  override string getAPrimaryQlClass() { result = member.getAPrimaryQlClass() }

  override L::Location getLocation() { result = member.getLocation() }

  override string toString() { result = member.toString() }
}
