import codeql.Locations
import internal.AST
import codeql.solidity.ast.Block


class AstNode instanceof TAstNode{
  AstNode getChild(int n){exists(AstNode t | t.getParentIndex() = n and t.getParent() = this | result = t)}

  AstNode getAChild(){result = this.getChild(_)}

  AstNode getParent(){toTreeSitter(result) = toTreeSitter(this).getParent()}

  int getParentIndex(){result = toTreeSitter(this).getParentIndex()}
  
  string toString(){result = "AstNode"}
  
  string getAPrimaryQlClass(){result = toTreeSitter(this).getAPrimaryQlClass()}
  
  Location getLocation(){result = toTreeSitter(this).getLocation()}

  /** Gets the primary file where this element occurs. */
  File getFile() { result = this.getLocation().getFile() }



  /**
  * Gets the parent scope of this `AstNode`, if any.
  * A scope is a `Type` (`Class` / `Enum`), a `Namespace`, a `BlockStmt`, a `Function`,
  * or certain kinds of `Statement`.
  */
  AstNode getParentScope() {
    //  // result instanceof class
    //  exists(Declaration m |
    //    m = this and
    //    result = m.getDeclaringType() and
    //    not this instanceof EnumConstant
    //  )
    //  or
    // //  exists(TemplateClass tc | this = tc.getATemplateArgument() and result = tc)
    //  exists(Solidity::InterfaceDeclaration tc | this = tc.getATemplateArgument() and result = tc)
    //  or
     // result instanceof namespace
    //  exists(Namespace n | result = n and n.getADeclaration() = this)
    //  or
    //  exists(FriendDecl d, Namespace n | this = d and n.getADeclaration() = d and result = n)
    //  or
    //  exists(Solidity::ContractBody n | this = n and result = n.getParentNamespace())
    //  exists(Namespace n | this = n and result = n.getParentNamespace())
    //  or
    //  // result instanceof stmt
    //  exists(Solidity::VariableDeclaration v |
    //    this = v and
    //    exists(DeclStmt ds | ds.getADeclaration() = v and result = ds.getParent())
    //  )
    //  or
     exists(Parameter p | this = p and result = p.getFunction())
     or
    //  exists(GlobalVariable g, Namespace n | this = g and n.getADeclaration() = g and result = n)
    //  or
    //  exists(EnumConstant e | this = e and result = e.getDeclaringEnum())
    //  or
     // result instanceof block|function
    //  exists(Solidity::BlockStatement b | this = b and blockscope(unresolveElement(b), unresolveElement(result)))
    exists(BlockStmt b | this = b and result = b)
    //  or
    //  exists(TemplateFunction tf | this = tf.getATemplateArgument() and result = tf)
    //  or
    //  // result instanceof stmt
    //  exists(ControlStructure s | this = s and result = s.getParent())
    or
    result = this.getParent().getParentScope()
  }


  //  /**
  //  * Holds if this `Element` is part of a template `template` (not if it is
  //  * part of an instantiation of `template`). This means it is represented in
  //  * the database purely as syntax and without guarantees on the presence or
  //  * correctness of type-based operations such as implicit conversions.
  //  *
  //  * If an element is nested within several templates, this predicate holds with
  //  * a value of `template` for each containing template.
  //  */
  // predicate isFromUninstantiatedTemplate(AstNode template) {
  //   exists(AstNode e | isFromUninstantiatedTemplateRec(e, template) |
  //     this = e or
  //     this.(DeclarationEntry).getDeclaration() = e
  //   )
  // }
}