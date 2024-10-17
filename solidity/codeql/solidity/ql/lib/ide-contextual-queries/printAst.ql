/**
 * @name Print AST
 * @description Produces a representation of a file's Abstract Syntax Tree.
 *              This query is used by the VS Code extension.
 * @id rb/print-ast
 * @kind graph
 * @tags ide-contextual-queries/print-ast
 */

 private import codeql.IDEContextual
 private import codeql.solidity.ast.internal.TreeSitter
 private import codeql.solidity.printAst
 
 /**
  * The source file to generate an AST from.
  */
 external string selectedSourceFile();
 
 /**
  * A configuration that only prints nodes in the selected source file.
  */
 class Cfg extends PrintAstConfiguration {
   override predicate shouldPrintNode(PrintAstNode n) {
     super.shouldPrintNode(n) and
     n.getLocation().getFile() = getFileBySourceArchiveName(selectedSourceFile())
   }
 }