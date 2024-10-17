/**
 * Provides queries to pretty-print a Ruby abstract syntax tree as a graph.
 *
 * By default, this will print the AST for all nodes in the database. To change
 * this behavior, extend `PrintASTConfiguration` and override `shouldPrintNode`
 * to hold for only the AST nodes you wish to view.
 */

// private import AST
// private import codeql.ruby.Regexp as RE
// private import codeql.ruby.ast.internal.Synthesis
//private import ast.internal.AST
private import ast.internal.TreeSitter
private import codeql.Locations

/**
 * The query can extend this class to control which nodes are printed.
 */
class PrintAstConfiguration extends string {
  PrintAstConfiguration() { this = "PrintAstConfiguration" }

  /**
   * Holds if the given node should be printed.
   */
  predicate shouldPrintNode(PrintAstNode n) { any() }

  predicate shouldPrintAstEdge(Solidity::AstNode parent, Solidity::AstNode child) {
    1 = 1
    // child = parent.getAChild(edgeName) and
    // not child = parent.getDesugared()
  }
}

newtype TPrintNode =
  TPrintTreeSitterAstNode(Solidity::AstNode n) {
    not n instanceof Solidity::Comment and
    not n instanceof Solidity::ReservedWord
  } or
  TAstNode(Solidity::AstNode n)

private predicate shouldPrintNode(PrintAstNode n) {
  any(PrintAstConfiguration config).shouldPrintNode(n)
}

/**
 * A node in the output tree.
 */
class PrintAstNode extends TPrintNode {
  /** Gets a textual representation of this node in the PrintAst output tree. */
  string toString() { none() }

  /**
   * Gets the child node with name `edgeName`. Typically this is the name of the
   * predicate used to access the child.
   */
  PrintAstNode getChild(string edgeName) { none() }

  /** Get the Location of this AST node */
  Location getLocation() { none() }

  /** Gets a child of this node. */
  final PrintAstNode getAChild() { result = this.getChild(_) }

  /** Gets the parent of this node, if any. */
  final PrintAstNode getParent() { result.getAChild() = this }

  /** Gets a value used to order this node amongst its siblings. */
  int getOrder() {
    this =
      rank[result](PrintAstNode p, Location l, File f |
        l = p.getLocation() and
        f = l.getFile()
      |
        p
        order by
          f.getBaseName(), f.getAbsolutePath(), l.getStartLine(), l.getStartColumn(),
          l.getEndLine(), l.getEndColumn()
      )
  }

  /**
   * Gets the value of the property of this node, where the name of the property
   * is `key`.
   */
  final string getProperty(string key) {
    key = "semmle.label" and
    result = this.toString()
    or
    key = "semmle.order" and result = this.getOrder().toString()
  }
}

class PrintTreeSitterAstNode extends PrintAstNode, TPrintTreeSitterAstNode {
  Solidity::AstNode astNode;

  PrintTreeSitterAstNode() { this = TPrintTreeSitterAstNode(astNode) }

  override string toString() {
    result = "[" + concat(astNode.getAPrimaryQlClass(), ", ") + "] " + astNode.toString()
  }

  override Location getLocation() { result = astNode.getLocation() }

  override PrintAstNode getChild(string name) {
    exists(int i |
      name = i.toString() and
      result =
        TPrintTreeSitterAstNode(rank[i](Solidity::AstNode child, Location l |
            child.getParent() = astNode and
            child.getLocation() = l
          |
            child
            order by
              l.getStartLine(), l.getStartColumn(), l.getEndColumn(), l.getEndLine(),
              child.toString()
          ))
    )
  }
}

// class PrintRegularAstNode extends PrintAstNode, TPrintRegularAstNode {
//   AstNode astNode;
//   PrintRegularAstNode() { this = TPrintRegularAstNode(astNode) }
//   override string toString() {
//     result = "[" + concat(astNode.getAPrimaryQlClass(), ", ") + "] " + astNode.toString()
//   }
//   // override PrintAstNode getChild(string edgeName) {
//   //   exists(AstNode child | shouldPrintAstEdge(astNode, edgeName, child) |
//   //     result = TPrintRegularAstNode(child)
//   //   )
//   // }
//   // private predicate parentIsSynthesized() {
//   //   exists(AstNode parent |
//   //     shouldPrintAstEdge(parent, _, astNode) and
//   //     parent.isSynthesized()
//   //   )
//   // }
//   // private int getSynthAstNodeIndex() {
//   //   this.parentIsSynthesized() and
//   //   exists(AstNode parent |
//   //     shouldPrintAstEdge(parent, _, astNode) and
//   //     parent.isSynthesized() and
//   //     synthChild(parent, result, astNode)
//   //   )
//   //   or
//   //   not this.parentIsSynthesized() and
//   //   result = 0
//   // }
//   override int getOrder() {
//     this =
//       rank[result](PrintRegularAstNode p, Location l, File f |
//         l = p.getLocation() and
//         f = l.getFile()
//       |
//         p
//         order by
//           f.getBaseName(), f.getAbsolutePath(), l.getStartLine(), //p.getSynthAstNodeIndex(),
//           l.getStartColumn(), l.getEndLine(), l.getEndColumn()
//       )
//   }
//   /** Gets the location of this node. */
//   Location getLocation() { result = astNode.getLocation() }
//   override predicate hasLocationInfo(
//     string filepath, int startline, int startcolumn, int endline, int endcolumn
//   ) {
//     astNode.getLocation().hasLocationInfo(filepath, startline, startcolumn, endline, endcolumn)
//   }
// }
/**
 * Holds if `node` belongs to the output tree, and its property `key` has the
 * given `value`.
 */
query predicate nodes(PrintAstNode node, string key, string value) { value = node.getProperty(key) }

/**
 * Holds if `target` is a child of `source` in the AST, and property `key` of
 * the edge has the given `value`.
 */
query predicate edges(PrintAstNode source, PrintAstNode target, string key, string value) {
  target = source.getChild(_) and
  (
    key = "semmle.label" and
    value = strictconcat(string name | source.getChild(name) = target | name, "/")
    or
    key = "semmle.order" and
    value = target.getProperty("semmle.order")
  )
}

/**
 * Holds if property `key` of the graph has the given `value`.
 */
query predicate graphProperties(string key, string value) {
  key = "semmle.graphKind" and value = "tree"
}