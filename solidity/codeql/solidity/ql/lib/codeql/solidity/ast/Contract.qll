import AST
import Functions

class ContractDeclarationImpl extends TContractDeclaration {
  private Solidity::ContractDeclaration contract;

  ContractDeclarationImpl() { this = TContractDeclaration(contract) }

  L::Location getLocation() { result = contract.getLocation() }

  InheritanceSpecifierImpl getInherithedContracts() {
    toTreeSitter(result) = contract.getAFieldOrChild()
  }

  string getName() { result = contract.getName().getValue() }

  ContractBodyImpl getBody() { toTreeSitter(result) = contract.getBody() }

  FunctionDefinitionImpl getOwnMethods() {
    result = this.getBody().getAFieldOrChild().(FunctionDefinitionImpl)
  }

  FunctionDefinitionImpl getInherithedMethods() {
    exists(ContractDeclarationImpl parentContract |
      this.getInherithedContracts().toString() = parentContract.getName() and
      result = parentContract.getMethods()
    )
    or
    none()
  }

  FunctionDefinitionImpl getMethods() {
    result = this.getOwnMethods()
    or
    exists(FunctionDefinitionImpl f |
      f = this.getInherithedMethods() and
      not exists(FunctionDefinitionImpl g |
        g = this.getOwnMethods() and f.toString() = g.toString()
      ) and
      result = f
    )
  }

  string toString() { result = contract.getName().getValue() }
}

class ContractBodyImpl extends TContractBody {
  private Solidity::ContractBody body;

  ContractBodyImpl() { this = TContractBody(body) }

  AstNodeImpl getAFieldOrChild() { toTreeSitter(result) = body.getAFieldOrChild() }

  AstNodeImpl getChilds() { toTreeSitter(result) = body.getChild(_) }

  L::Location getLocation() { result = body.getLocation() }

  string toString() { result = body.toString() }
}

class InheritanceSpecifierImpl extends TInheritanceSpecifier {
  private Solidity::InheritanceSpecifier specifier;

  InheritanceSpecifierImpl() { this = TInheritanceSpecifier(specifier) }

  L::Location getLocation() { result = specifier.getLocation() }

  string toString() {
    result = specifier.getAncestor().getAFieldOrChild().(Solidity::Identifier).getValue().toString()
  }

  ExpressionImpl getArgs() {
    toTreeSitter(result) =
      specifier
          .getAncestorArguments(_)
          .(Solidity::CallArgument)
          .getChild(_)
          .(Solidity::Expression)
          .getChild()
  }
}
