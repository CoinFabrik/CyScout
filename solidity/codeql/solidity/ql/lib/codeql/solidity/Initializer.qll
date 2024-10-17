/**
 * Provides the `Initializer` class, representing Solidity declaration initializers.
 */

// import semmle.code.cpp.controlflow.ControlFlowGraph
import codeql.solidity.controlflow.ControlFlowGraph
import codeql.solidity.Function
import codeql.solidity.Declaration
import codeql.solidity.Variable

/**
 * A C/C++ declaration initializer. For example the initializers `1`, `2` and
 * `3` in the following code:
 * ```
 * int myVariable = 1;
 *
 * enum myEnum {
 *   MYENUMCONST = 2
 * };
 *
 * void myFunction(int param = 3) {
 *   ...
 * }
 * ```
 * But _not_ `4` in the following code:
 * ```
 * int myUninitializedVariable;
 * myUninitializedVariable = 4;
 * ```
 * Instead, this is an `Assignment`.
 */
class Initializer extends ControlFlowNode, Expression {

  //ARGI: armo esto
  Initializer(){exists(DeclStmt s | this = s.getValue())}
  // override Location getLocation() { initialisers(underlyingElement(this), _, _, result) }

  override string getAPrimaryQlClass() { result = "Initializer" }

  // /** Holds if this initializer is explicit in the source. */
  // override predicate fromSource() { not this.getLocation() instanceof UnknownLocation }

  override string toString() {
    if exists(this.getDeclaration())
    then result = "initializer for " + max(this.getDeclaration().getName())
    else result = "initializer"
  }

  /** Gets the variable or enum constant being initialized. */
  Declaration getDeclaration() {
    exists(Variable v | this = v.getInitializer() and result = v)
  }

  /** Gets the initializing expression. */
  // Expression getExpr() { initialisers(underlyingElement(this), _, unresolveElement(result), _) }
  Expression getExpr() { result = this }

  /** Gets the function containing this control-flow node. */
  override Function getControlFlowScope() { result = this.getExpr().getEnclosingFunction() }

  override Stmt getEnclosingStmt() { result = this.getExpr().getEnclosingStmt() }

  // /** Holds if the initializer used the C++ braced initializer notation. */
  // predicate isBraced() { braced_initialisers(underlyingElement(this)) }
}
