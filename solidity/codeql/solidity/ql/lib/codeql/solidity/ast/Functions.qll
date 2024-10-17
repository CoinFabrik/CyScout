import AST

class FunctionDefinitionImpl extends AstNodeImpl, TFunctionDefinition {
  private Solidity::FunctionDefinition func;

  FunctionDefinitionImpl() { this = TFunctionDefinition(func) }

  override AstNodeImpl getAChild(string child) {
    child = "getBody" and toTreeSitter(result) = func.getBody()
    or
    child = "getName" and toTreeSitter(result) = func.getName()
    or
    child = "getReturnType" and toTreeSitter(result) = func.getReturnType()
  }

  override string getAPrimaryQlClass() { result = func.getAPrimaryQlClass() }

  boolean overrides() {
    if exists(Solidity::OverrideSpecifier s | s = func.getAFieldOrChild())
    then result = true
    else result = false
  }

  AstNodeImpl getBody() { toTreeSitter(result) = func.getBody() }

  AstNodeImpl getName() { toTreeSitter(result) = func.getName() }

  AstNodeImpl getReturnType() { toTreeSitter(result) = func.getReturnType() }

  override L::Location getLocation() { result = func.getLocation() }

  override string toString() { result = func.getName().getValue() }
}
