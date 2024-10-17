import codeql.solidity.ast.internal.TreeSitter
import Solidity

from AstNode n
where n.getAFieldOrChild().toString() = "balance"
select n.getLocation(), n.getAFieldOrChild().toString()