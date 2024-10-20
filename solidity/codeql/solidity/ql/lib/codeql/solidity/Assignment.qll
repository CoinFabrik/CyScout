// import semmle.code.cpp.exprs.Expr
// import semmle.code.cpp.exprs.ArithmeticOperation
// import semmle.code.cpp.exprs.BitwiseOperation
import codeql.solidity.ast.internal.TreeSitter
import codeql.solidity.ast.AST

class TAssignment = TAssignmentExpression or TAugmentedAssignmentExpression or TStructFieldAssignment
  or TYulAssignment;

/**
 * A non-overloaded binary assignment operation, including `=`, `+=`, `&=`,
 * etc. A C++ overloaded assignment operation looks syntactically identical but is instead
 * a `FunctionCall`. This class does _not_ include variable initializers. To get a variable
 * initializer, use `Initializer` instead.
 *
 * This is a QL base class for all (non-overloaded) assignments.
 */
// class Assignment extends Solidity::AstNode {
class Assignment extends Expression, TAssignment {

  // cached
  // Assignment(){this instanceof Solidity::AssignmentExpression or this instanceof Solidity::AugmentedAssignmentExpression}
  
  /** Gets the lvalue of this assignment. */
  abstract Expression getLValue();

  /** Gets the rvalue of this assignment. */
  abstract Expression getRValue();

  string getOperator() { result = "" }

  // override int getPrecedence() { result = 2 }

  // override predicate mayBeGloballyImpure() {
  //   this.getRValue().mayBeGloballyImpure()
  //   or
  //   not exists(VariableAccess va, StackVariable v |
  //     va = this.getLValue() and
  //     v = va.getTarget() and
  //     not va.getConversion+() instanceof ReferenceDereferenceExpr
  //   )
  // }
}

/**
 * A non-overloaded assignment operation with the operator `=`.
 * ```
 * a = b;
 * ```
 * Note that `int a = b;` is _not_ an `AssignExpr`. It is a `Variable`,
 * and `b` can be obtained using `Variable.getInitializer()`.
 */
class AssignExpr extends Assignment, TAssignmentExpression {
  private Solidity::AssignmentExpression node;

  AssignExpr(){node = toTreeSitter(this)}

  override string getOperator() { result = "=" }

  override string getAPrimaryQlClass() { result = "AssignExpr" }

  /** Gets a textual representation of this assignment. */
  override string toString() { result = "... = ..." }

  override Expression getLValue(){toTreeSitter(result) = node.getLeft()}

  override Expression getRValue(){toTreeSitter(result) = node.getRight()}
}

// /**
//  * A compiler generated assignment operation that may occur in a compiler generated
//  * copy/move constructor or assignment operator, and which functions like `memcpy`
//  * where the size argument is based on the type of the rvalue of the assignment.
//  */
// class BlockAssignExpr extends Assignment, @blockassignexpr {
//   override string getOperator() { result = "=" }

//   override string getAPrimaryQlClass() { result = "BlockAssignExpr" }

//   /** Gets a textual representation of this assignment. */
//   override string toString() { result = "... = ..." }
// }

// /**
//  * A non-overloaded binary assignment operation other than `=`.
//  *
//  * This class does _not_ include variable initializers. To get a variable
//  * initializer, use `Initializer` instead.
//  */
// class AssignOperation extends Assignment, Solidity::AugmentedAssignmentExpression {
//   override string toString() { result = "... " + this.getOperator() + " ..." }
// }

// /**
//  * A non-overloaded arithmetic assignment operation on a non-pointer _lvalue_:
//  * `+=`, `-=`, `*=`, `/=` and `%=`.
//  */
// class AssignArithmeticOperation extends AssignOperation, @assign_arith_expr { }

// /**
//  * A non-overloaded `+=` assignment expression on a non-pointer _lvalue_.
//  * ```
//  * a += b;
//  * ```
//  */
// class AssignAddExpr extends AssignOperation {

//   override string getOperator() { result = "+=" }
// }

// /**
//  * A non-overloaded `-=` assignment expression on a non-pointer _lvalue_.
//  * ```
//  * a -= b;
//  * ```
//  */
// class AssignSubExpr extends AssignArithmeticOperation, @assignsubexpr {
//   override string getAPrimaryQlClass() { result = "AssignSubExpr" }

//   override string getOperator() { result = "-=" }
// }

// /**
//  * A non-overloaded `*=` assignment expression.
//  * ```
//  * a *= b;
//  * ```
//  */
// class AssignMulExpr extends AssignArithmeticOperation, @assignmulexpr {
//   override string getAPrimaryQlClass() { result = "AssignMulExpr" }

//   override string getOperator() { result = "*=" }
// }

// /**
//  * A non-overloaded `/=` assignment expression.
//  * ```
//  * a /= b;
//  * ```
//  */
// class AssignDivExpr extends AssignArithmeticOperation, @assigndivexpr {
//   override string getAPrimaryQlClass() { result = "AssignDivExpr" }

//   override string getOperator() { result = "/=" }
// }

// /**
//  * A non-overloaded `%=` assignment expression.
//  * ```
//  * a %= b;
//  * ```
//  */
// class AssignRemExpr extends AssignArithmeticOperation, @assignremexpr {
//   override string getAPrimaryQlClass() { result = "AssignRemExpr" }

//   override string getOperator() { result = "%=" }
// }

// /**
//  * A non-overloaded bitwise assignment operation:
//  * `&=`, `|=`, `^=`, `<<=`, and `>>=`.
//  */
// class AssignBitwiseOperation extends AssignOperation, @assign_bitwise_expr { }

// /**
//  * A non-overloaded AND (`&=`) assignment expression.
//  * ```
//  * a &= b;
//  * ```
//  */
// class AssignAndExpr extends AssignBitwiseOperation, @assignandexpr {
//   override string getAPrimaryQlClass() { result = "AssignAndExpr" }

//   override string getOperator() { result = "&=" }
// }

// /**
//  * A non-overloaded OR (`|=`) assignment expression.
//  * ```
//  * a |= b;
//  * ```
//  */
// class AssignOrExpr extends AssignBitwiseOperation, @assignorexpr {
//   override string getAPrimaryQlClass() { result = "AssignOrExpr" }

//   override string getOperator() { result = "|=" }
// }

// /**
//  * A non-overloaded XOR (`^=`) assignment expression.
//  * ```
//  * a ^= b;
//  * ```
//  */
// class AssignXorExpr extends AssignBitwiseOperation, @assignxorexpr {
//   override string getAPrimaryQlClass() { result = "AssignXorExpr" }

//   override string getOperator() { result = "^=" }
// }

// /**
//  * A non-overloaded `<<=` assignment expression.
//  * ```
//  * a <<= b;
//  * ```
//  */
// class AssignLShiftExpr extends AssignBitwiseOperation, @assignlshiftexpr {
//   override string getAPrimaryQlClass() { result = "AssignLShiftExpr" }

//   override string getOperator() { result = "<<=" }
// }

// /**
//  * A non-overloaded `>>=` assignment expression.
//  * ```
//  * a >>= b;
//  * ```
//  */
// class AssignRShiftExpr extends AssignBitwiseOperation, @assignrshiftexpr {
//   override string getAPrimaryQlClass() { result = "AssignRShiftExpr" }

//   override string getOperator() { result = ">>=" }
// }

// /**
//  * A C++ variable declaration inside the conditional expression of a `while`, `if` or
//  * `for` compound statement.  Declaring a variable this way narrows its lifetime and
//  * scope to be strictly the compound statement itself.  For example:
//  * ```
//  * extern int x, y;
//  * if (bool c = x < y) { do_something_with(c); }
//  * // c is no longer in scope
//  * while (int d = x - y) { do_something_else_with(d); }
//  * // d is no longer is scope
//  * ```
//  */
// class ConditionDeclExpr extends Expr, @condition_decl {
//   override string getAPrimaryQlClass() { result = "ConditionDeclExpr" }

//   /**
//    * Gets the compiler-generated variable access that conceptually occurs after
//    * the initialization of the declared variable, if any.
//    */
//   VariableAccess getVariableAccess() { result = this.getExpr() }

//   /**
//    * Gets the expression that is evaluated after the initialization of the declared
//    * variable.
//    */
//   Expr getExpr() { result = this.getChild(0) }

//   /**
//    * Gets the expression that initializes the declared variable. This predicate
//    * always has a result.
//    */
//   Expr getInitializingExpr() { result = this.getVariable().getInitializer().getExpr() }

//   /** Gets the variable that is declared. */
//   Variable getVariable() { condition_decl_bind(underlyingElement(this), unresolveElement(result)) }

//   override string toString() { result = "(condition decl)" }
// }
