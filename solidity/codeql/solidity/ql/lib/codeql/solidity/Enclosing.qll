/**
 * Provides predicates for finding the smallest element that encloses an expression or statement.
 */

import codeql.solidity.ast.AST
private import ast.internal.TreeSitter
import codeql.solidity.Function
import codeql.solidity.ast.Stmt

/**
 * Gets the enclosing element of statement `s`.
 */
cached
AstNode stmtEnclosingElement(Stmt s) {
  result.(Function).getBlock().getAStmt() = s or
  result = stmtEnclosingElement(s.getParent()) or
  result = exprEnclosingElement(s.getParent())
}

/**
 * Gets the enclosing element of expression `e`.
 */
// The `pragma[nomagic]` is a workaround to prevent this cached stage (and all
// subsequent stages) from being evaluated twice. See QL-888. It has the effect
// of making the `Conversion` class predicate get the same optimization in all
// queries.
pragma[nomagic]
cached
AstNode exprEnclosingElement(Expression e) {
  result = exprEnclosingElement(e.getParent())
  or
  result = stmtEnclosingElement(e.getParent())
  or
  result.(BlockStmt) = e.getParent()
  // or
  // result = exprEnclosingElement(e.(Conversion).getExpr())
  // or
  // exists(Initializer i |
  //   i.getExpr() = e and
  //   if exists(i.getEnclosingStmt())
  //   then result = stmtEnclosingElement(i.getEnclosingStmt())
  //   else
  //     if i.getDeclaration() instanceof Parameter
  //     then result = i.getDeclaration().(Parameter).getFunction()
  //     else result = i.getDeclaration()
  // )
  // or
  // exists(Solidity::Expression anc |
  //   // expr_ancestor(unresolveElement(e), unresolveElement(anc)) and 
  //   result = exprEnclosingElement(anc)
  // )
  // or
  // exists(Solidity::Statement anc |
  //   // expr_ancestor(unresolveElement(e), unresolveElement(anc)) and 
  //   result = stmtEnclosingElement(anc)
  // )
  // or
  // exists(DeclarationEntry de |
  //   expr_ancestor(unresolveElement(e), unresolveElement(de)) and
  //   if exists(DeclStmt ds | de = ds.getADeclarationEntry())
  //   then
  //     exists(DeclStmt ds |
  //       de = ds.getADeclarationEntry() and
  //       result = stmtEnclosingElement(ds)
  //     )
  //   else result = de.getDeclaration()
  // )
  // or
  // result.(Stmt).getAnImplicitDestructorCall() = e
}
