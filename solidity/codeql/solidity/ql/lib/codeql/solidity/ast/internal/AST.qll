import codeql.Locations
import TreeSitter

cached
newtype TAstNode = 
TAnyPragmaToken(Solidity::AnyPragmaToken t) or
TArrayAccess(Solidity::ArrayAccess a) or
TAssemblyFlags(Solidity::AssemblyFlags a) or
TAssemblyStatement(Solidity::AssemblyStatement s) or
TAssignmentExpression(Solidity::AssignmentExpression e) or
TAugmentedAssignmentExpression(Solidity::AugmentedAssignmentExpression e) or
TBinaryExpression(Solidity::BinaryExpression e) or
TBlockStatement(Solidity::BlockStatement s) or
TBooleanLiteral(Solidity::BooleanLiteral b) or
TCallArgument(Solidity::CallArgument c) or
TCallExpression(Solidity::CallExpression e) or
TCallStructArgument(Solidity::CallStructArgument c) or
TCatchClause(Solidity::CatchClause c) or
TConstantVariableDeclaration(Solidity::ConstantVariableDeclaration v) or
TConstructorDefinition(Solidity::ConstructorDefinition d) or
TContractBody(Solidity::ContractBody c) or
TContractDeclaration(Solidity::ContractDeclaration d) or
TDoWhileStatement(Solidity::DoWhileStatement s) or
TEmitStatement(Solidity::EmitStatement s) or
TEnumBody(Solidity::EnumBody e) or
TEnumDeclaration(Solidity::EnumDeclaration e) or
TErrorDeclaration(Solidity::ErrorDeclaration e) or
TErrorParameter(Solidity::ErrorParameter e) or
TEventDefinition(Solidity::EventDefinition e) or
TEventParameter(Solidity::EventParameter e) or
TExpression(Solidity::Expression e) or
TExpressionStatement(Solidity::ExpressionStatement s) or
TFallbackReceiveDefinition(Solidity::FallbackReceiveDefinition d) or
TForStatement(Solidity::ForStatement s) or
TFunctionBody(Solidity::FunctionBody b) or
TFunctionDefinition(Solidity::FunctionDefinition d) or
TIfStatement(Solidity::IfStatement s) or
TImportDirective(Solidity::ImportDirective d) or
TInheritanceSpecifier(Solidity::InheritanceSpecifier d) or
TInlineArrayExpression(Solidity::InlineArrayExpression e) or
TInterfaceDeclaration(Solidity::InterfaceDeclaration d) or
TLibraryDeclaration(Solidity::LibraryDeclaration d) or
TMemberExpression(Solidity::MemberExpression e) or
TModifierDefinition(Solidity::ModifierDefinition d) or
TModifierInvocation(Solidity::ModifierInvocation d) or
TNewExpression(Solidity::NewExpression e) or
TNumberLiteral(Solidity::NumberLiteral n) or
TOverrideSpecifier(Solidity::OverrideSpecifier d) or
TParameter(Solidity::Parameter p) or
TParenthesizedExpression(Solidity::ParenthesizedExpression e) or
TPayableConversionExpression(Solidity::PayableConversionExpression e) or
TPragmaDirective(Solidity::PragmaDirective d) or
TReturnParameter(Solidity::ReturnParameter p) or 
TReturnStatement(Solidity::ReturnStatement s) or
TReturnTypeDefinition(Solidity::ReturnTypeDefinition d) or
TRevertArguments(Solidity::RevertArguments a) or
TRevertStatement(Solidity::RevertStatement s) or
TSliceAccess(Solidity::SliceAccess a) or
TPragmaToken(Solidity::SolidityPragmaToken t) or
TSourceFile(Solidity::SourceFile f) or
TStateVariableDeclaration(Solidity::StateVariableDeclaration d) or
TStatement(Solidity::Statement s) or
TStringLiteral(Solidity::StringLiteral l) or
TStructBody(Solidity::StructBody b) or
TStructDeclaration(Solidity::StructDeclaration d) or
TStructExpression(Solidity::StructExpression e) or
TStructFieldAssignment(Solidity::StructFieldAssignment f) or
TStructMember(Solidity::StructMember m) or
TTernaryExpression(Solidity::TernaryExpression e) or
TToken(Solidity::Token t) or
TTryStatement(Solidity::TryStatement s) or
TTupleExpression(Solidity::TupleExpression e) or
TTypeAlias(Solidity::TypeAlias t) or
TTypeCastExpression(Solidity::TypeCastExpression e) or
TTypeName(Solidity::TypeName t) or
TUnaryExpression(Solidity::UnaryExpression e) or
TUpdateExpression(Solidity::UpdateExpression e) or
TUserDefinedType(Solidity::UserDefinedType t) or
TUserDefinedTypeDefinition(Solidity::UserDefinedTypeDefinition d) or
TUsingDirective(Solidity::UsingDirective d) or
TVariableDeclaration(Solidity::VariableDeclaration d) or
TVariableDeclarationStatement(Solidity::VariableDeclarationStatement d) or
TVariableDeclarationTuple(Solidity::VariableDeclarationTuple d) or
TWhileStatement(Solidity::WhileStatement s) or
TYulAssignment(Solidity::YulAssignment y) or
TYulBlock(Solidity::YulBlock y) or
TYulForStatement(Solidity::YulForStatement y) or
TYulFunctionCall(Solidity::YulFunctionCall y) or
TYulFunctionDefinition(Solidity::YulFunctionDefinition y) or
TYulIdentifier(Solidity::YulIdentifier y) or
TYulIfStatement(Solidity::YulIfStatement y) or
TYulLabel(Solidity::YulLabel y) or
TYulPath(Solidity::YulPath y) or
TYulStringLiteral(Solidity::YulStringLiteral y) or
TYulSwitchStatement(Solidity::YulSwitchStatement y) or
TYulVariableDeclaration(Solidity::YulVariableDeclaration y) or
TMetaTypeExpression(Solidity::MetaTypeExpression e)
or //Estos los agrego aca, a pesar de que no salen en la db como astnodes, pero CREO que deberian
THexStringLiteral(Solidity::HexStringLiteral l) or
TTokenIdentifier(Solidity::Identifier i) or
TPrimitiveType(Solidity::PrimitiveType t) or
TUnicodeStringLiteral(Solidity::UnicodeStringLiteral l) or
TBreakStatement(Solidity::BreakStatement b) or
TContinueStatement(Solidity::ContinueStatement c)


Solidity::AstNode toTreeSitter(TAstNode node){
  TAnyPragmaToken(result) = node or
  TArrayAccess(result) = node or
  TAssemblyFlags(result) = node or
  TAssemblyStatement(result) = node or
  TAssignmentExpression(result) = node or
  TAugmentedAssignmentExpression(result) = node or
  TBinaryExpression(result) = node or
  TBlockStatement(result) = node or
  TBooleanLiteral(result) = node or
  TCallArgument(result) = node or
  TCallExpression(result) = node or
  TCallStructArgument(result) = node or
  TCatchClause(result) = node or
  TConstantVariableDeclaration(result) = node or
  TConstructorDefinition(result) = node or
  TContractBody(result) = node or
  TContractDeclaration(result) = node or
  TDoWhileStatement(result) = node or
  TEmitStatement(result) = node or
  TEnumBody(result) = node or
  TEnumDeclaration(result) = node or
  TErrorDeclaration(result) = node or
  TErrorParameter(result) = node or
  TEventDefinition(result) = node or
  TEventParameter(result) = node or
  TExpression(result) = node or
  TExpressionStatement(result) = node or
  TFallbackReceiveDefinition(result) = node or
  TForStatement(result) = node or
  TFunctionBody(result) = node or
  TFunctionDefinition(result) = node or
  TIfStatement(result) = node or
  TImportDirective(result) = node or
  TInheritanceSpecifier(result) = node or
  TInlineArrayExpression(result) = node or
  TInterfaceDeclaration(result) = node or
  TLibraryDeclaration(result) = node or
  TMemberExpression(result) = node or
  TModifierDefinition(result) = node or
  TModifierInvocation(result) = node or
  TNewExpression(result) = node or
  TNumberLiteral(result) = node or
  TOverrideSpecifier(result) = node or
  TParameter(result) = node or
  TParenthesizedExpression(result) = node or
  TPayableConversionExpression(result) = node or
  TPragmaDirective(result) = node or
  TReturnParameter(result) = node or 
  TReturnStatement(result) = node or
  TReturnTypeDefinition(result) = node or
  TRevertArguments(result) = node or
  TRevertStatement(result) = node or
  TSliceAccess(result) = node or
  TPragmaToken(result) = node or
  TSourceFile(result) = node or
  TStateVariableDeclaration(result) = node or
  TStatement(result) = node or
  TStringLiteral(result) = node or
  TStructBody(result) = node or
  TStructDeclaration(result) = node or
  TStructExpression(result) = node or
  TStructFieldAssignment(result) = node or
  TStructMember(result) = node or
  TTernaryExpression(result) = node or
  TToken(result) = node or
  TTryStatement(result) = node or
  TTupleExpression(result) = node or
  TTypeAlias(result) = node or
  TTypeCastExpression(result) = node or
  TTypeName(result) = node or
  TUnaryExpression(result) = node or
  TUpdateExpression(result) = node or
  TUserDefinedType(result) = node or
  TUserDefinedTypeDefinition(result) = node or
  TUsingDirective(result) = node or
  TVariableDeclaration(result) = node or
  TVariableDeclarationStatement(result) = node or
  TVariableDeclarationTuple(result) = node or
  TWhileStatement(result) = node or
  TYulAssignment(result) = node or
  TYulBlock(result) = node or
  TYulForStatement(result) = node or
  TYulFunctionCall(result) = node or
  TYulFunctionDefinition(result) = node or
  TYulIdentifier(result) = node or
  TYulIfStatement(result) = node or
  TYulLabel(result) = node or
  TYulPath(result) = node or
  TYulStringLiteral(result) = node or
  TYulSwitchStatement(result) = node or
  TYulVariableDeclaration(result) = node or
  TMetaTypeExpression(result) = node
  or
  THexStringLiteral(result) = node or
  TTokenIdentifier(result) = node or
  TPrimitiveType(result) = node or
  TUnicodeStringLiteral(result) = node or
  TBreakStatement(result) = node or
  TContinueStatement(result) = node
}


cached
class TExpr = TArrayAccess or TAssignmentExpression or TAugmentedAssignmentExpression or
  TBinaryExpression or TBooleanLiteral or TCallExpression or TInlineArrayExpression or
  TMemberExpression or TMetaTypeExpression or TNewExpression or TNumberLiteral or 
  TParenthesizedExpression or TPayableConversionExpression or TSliceAccess or 
  TStringLiteral or TStructExpression or TTernaryExpression or TTupleExpression or
  TTypeCastExpression or TUnaryExpression or TUpdateExpression or TUserDefinedType or 
  TExpression
  or
  THexStringLiteral or TTokenIdentifier or TPrimitiveType or TUnicodeStringLiteral
  or
  TCallArgument
  or
  TStructFieldAssignment or TYulAssignment;


cached
class TStmt = TAssemblyStatement or TBlockStatement or TDoWhileStatement or 
  TEmitStatement or TExpressionStatement or TForStatement or TIfStatement or
  TReturnStatement or TRevertStatement or TBreakStatement or TContinueStatement or 
  TTryStatement or TVariableDeclarationStatement or TWhileStatement or TStatement
  or TFunctionBody;


  // abstract class AstNodeImpl extends TAstNode {
  //   abstract AstNodeImpl getAChild();

  //   abstract string toString();
  
  //   abstract string getAPrimaryQlClass();
  
  //   abstract Location getLocation();
  // }


// class Expression extends AstNode, TExpr{
//   override AstNode getChild(int n){none()}
  
//     override string toString(){none()}
  
//     override string getAPrimaryQlClass(){none()}
  
//     override Location getLocation(){none()}
//   }


// class Statement extends AstNode, TStmt
// {
//   override AstNode getChild(int n){none()}
  
//     override string toString(){none()}
  
//     override string getAPrimaryQlClass(){none()}
  
//     override Location getLocation(){result = toTreeSitter(this).getLocation()}
// }




// /**
//  * A C/C++ statement.
//  */
// class Stmt extends StmtParent, @stmt {
//   /** Gets the `n`th child of this statement. */
//   Element getChild(int n) {
//     stmtparents(unresolveElement(result), n, underlyingElement(this)) or
//     exprparents(unresolveElement(result), n, underlyingElement(this))
//   }

//   /** Holds if `e` is the `n`th child of this statement. */
//   predicate hasChild(Element e, int n) { this.getChild(n) = e }

//   /** Gets the enclosing function of this statement, if any. */
//   Function getEnclosingFunction() { result = stmtEnclosingElement(this) }

//   /**
//    * Gets the nearest enclosing block of this statement in the source, if any.
//    */
//   BlockStmt getEnclosingBlock() {
//     if
//       this.getParentStmt() instanceof BlockStmt and
//       not this.getParentStmt().(BlockStmt).getLocation() instanceof UnknownLocation
//     then result = this.getParentStmt()
//     else result = this.getParentStmt().getEnclosingBlock()
//   }

//   /** Gets a child of this statement. */
//   Element getAChild() { result = this.getChild(_) }

//   /** Gets the parent of this statement, if any. */
//   StmtParent getParent() { stmtparents(underlyingElement(this), _, unresolveElement(result)) }

//   /** Gets the parent statement of this statement, if any. */
//   Stmt getParentStmt() { stmtparents(underlyingElement(this), _, unresolveElement(result)) }

//   /** Gets a child statement of this statement. */
//   Stmt getChildStmt() { result.getParentStmt() = this }

//   /**
//    * Gets the statement following this statement in the same block, if any.
//    *
//    * Note that this is not widely useful, because this doesn't have a result for
//    * the last statement of a block.  Consider using the `ControlFlowNode` class
//    * to trace the flow of control instead.
//    */
//   Stmt getFollowingStmt() {
//     exists(BlockStmt b, int i |
//       this = b.getStmt(i) and
//       result = b.getStmt(i + 1)
//     )
//   }

//   /**
//    * Gets the `n`th compiler-generated destructor call that is performed after this statement, in
//    * order of destruction.
//    *
//    * For instance, in the following code, `getImplicitDestructorCall(0)` for the block will be the
//    * destructor call for `c2`:
//    * ```cpp
//    * {
//    *      MyClass c1;
//    *      MyClass c2;
//    * }
//    * ```
//    */
//   DestructorCall getImplicitDestructorCall(int n) {
//     synthetic_destructor_call(this, max(int i | synthetic_destructor_call(this, i, _)) - n, result)
//   }

//   /**
//    * Gets a compiler-generated destructor call that is performed after this statement.
//    */
//   DestructorCall getAnImplicitDestructorCall() { synthetic_destructor_call(this, _, result) }

//   override Location getLocation() { stmts(underlyingElement(this), _, result) }

//   override string toString() { none() }

//   override Function getControlFlowScope() { result = this.getEnclosingFunction() }

//   override Stmt getEnclosingStmt() { result = this }

//   /**
//    * Holds if this statement is side-effect free (a conservative
//    * approximation; that is, it may be side-effect free even if this
//    * predicate doesn't hold).
//    *
//    * This predicate cannot be overridden; override `mayBeImpure()`
//    * instead.
//    *
//    * Note that this predicate only considers whether the statement has
//    * any side-effects, such as writing to a file. Even if it holds, the
//    * statement may be impure in the sense that its behavior is affected
//    * by external factors, such as the contents of global variables.
//    */
//   final predicate isPure() { not this.mayBeImpure() }

//   /**
//    * Holds if it is possible that this statement is impure. If we are not
//    * sure, then it holds.
//    */
//   predicate mayBeImpure() { any() }

//   /**
//    * Holds if it is possible that this statement is globally impure.
//    *
//    * Similar to `mayBeImpure()`, except that `mayBeGloballyImpure()`
//    * does not consider modifications to temporary local variables to be
//    * impure. That is, if you call a function in which
//    * `mayBeGloballyImpure()` doesn't hold for any statement, then the
//    * function as a whole will have no side-effects, even if it mutates
//    * its own fresh stack variables.
//    */
//   predicate mayBeGloballyImpure() { any() }

//   /**
//    * Gets an attribute of this statement, for example
//    * `[[clang::fallthrough]]`.
//    */
//   Attribute getAnAttribute() { stmtattributes(underlyingElement(this), unresolveElement(result)) }

//   /**
//    * Gets a macro invocation that generates this entire statement.
//    *
//    * For example, given
//    * ```
//    * #define SOMEFUN a()
//    * #define FOO do { SOMEFUN; b(); } while (0)
//    * void f(void) {
//    *     FOO;
//    * }
//    * ```
//    * this predicate would have results of `SOMEFUN` and `FOO` for the
//    * function call `a()`, and just `FOO` for the function call `b()`,
//    * the block within the 'do' statement, and the entire 'do' statement.
//    *
//    * Note that, unlike `isInMacroExpansion()` it is not necessary for
//    * the macro to generate the terminating semi-colon.
//    */
//   MacroInvocation getGeneratingMacro() { result.getAnExpandedElement() = this }

//   /** Holds if this statement was generated by the compiler. */
//   predicate isCompilerGenerated() { compgenerated(underlyingElement(this)) }
// }













// abstract class Expr extends TExpr, TAstNode{
//   abstract string toString();
// }



// class AstNode extends TAstNode {
//   private Solidity::AstNode node;

//   AstNode(){
//     node = toTreesitter(this)
//   }

//   abstract string toString();

//   // abstract string getAPrimaryQlClass();

//   // abstract Location getLocation();
// }

// abstract class TExprImpl extends AstNodeImpl, TExpr {
//   override abstract TExprImpl getAChild(string name);

//   override abstract string toString();

//   // abstract string getAPrimaryQlClass();

//   // override abstract Location getLocation();
// }

// // AstNode toTreeSitter(TExpression node) {
// //   TBinaryExpression(result) = node
// //   or
// //   TBinaryPrototype(result) = node
// // }

// // class Expression extends TExpr {
// //   string toString(){result=""}
// // }


// // class BinExp extends Expression {
// //   Solidity::BinaryExpression e;

// //   BinExp(){this.fromTreesitter() = e}
// //   override string toString(){result=""}
// // }


// class Expression extends AstNodeImpl instanceof TExpr{
//   override Expression getAChild(string name){
//     result = this.(AstNodeImpl).getAChild(name)
//   }

//   override string toString(){result = ""}

//   // override Location getLocation(){this.(AstNodeImpl).to}
// }



// class BinaryExpression extends Expression instanceof TBinaryExpression{
//   private Solidity::BinaryExpression e;

//   BinaryExpression(){this = TBinaryExpression(e)}
// }







// class AstNode extends Solidity::AstNode{
//   override string toString() { result = this.getAPrimaryQlClass() }

//   /** Gets the primary file where this element occurs. */
//   File getFile() { result = this.getLocation().getFile() }

//   /**
//     * Holds if this element may be from source. This predicate holds for all
//     * elements, except for those in the dummy file, whose name is the empty string.
//     * The dummy file contains declarations that are built directly into the compiler.
//   */
//   predicate fromSource() { this.getFile().fromSource() }


//   /**
//     * Gets the parent scope of this `AstNode`, if any.
//     * A scope is a `Type` (`Class` / `Enum`), a `Namespace`, a `BlockStmt`, a `Function`,
//     * or certain kinds of `Statement`.
//     */
//    AstNode getParentScope() {
//     //  // result instanceof class
//     //  exists(Declaration m |
//     //    m = this and
//     //    result = m.getDeclaringType() and
//     //    not this instanceof EnumConstant
//     //  )
//     //  or
//     // //  exists(TemplateClass tc | this = tc.getATemplateArgument() and result = tc)
//     //  exists(Solidity::InterfaceDeclaration tc | this = tc.getATemplateArgument() and result = tc)
//     //  or
//      // result instanceof namespace
//     //  exists(Namespace n | result = n and n.getADeclaration() = this)
//     //  or
//     //  exists(FriendDecl d, Namespace n | this = d and n.getADeclaration() = d and result = n)
//     //  or
//     //  exists(Solidity::ContractBody n | this = n and result = n.getParentNamespace())
//     //  exists(Namespace n | this = n and result = n.getParentNamespace())
//     //  or
//     //  // result instanceof stmt
//     //  exists(Solidity::VariableDeclaration v |
//     //    this = v and
//     //    exists(DeclStmt ds | ds.getADeclaration() = v and result = ds.getParent())
//     //  )
//     //  or
//     //  exists(Solidity::Parameter p | this = p and result = p.getFunction())
//     //  or
//     //  exists(GlobalVariable g, Namespace n | this = g and n.getADeclaration() = g and result = n)
//     //  or
//     //  exists(EnumConstant e | this = e and result = e.getDeclaringEnum())
//     //  or
//      // result instanceof block|function
//     //  exists(Solidity::BlockStatement b | this = b and blockscope(unresolveElement(b), unresolveElement(result)))
//      exists(Solidity::BlockStatement b | this = b and result = b)
//     //  or
//     //  exists(TemplateFunction tf | this = tf.getATemplateArgument() and result = tf)
//     //  or
//     //  // result instanceof stmt
//     //  exists(ControlStructure s | this = s and result = s.getParent())
//      or
//      result = this.getParent().(AstNode).getParentScope()
//    }
// }