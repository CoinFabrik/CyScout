/**
 * CodeQL library for Solidity
 * Automatically generated from the tree-sitter grammar; do not edit
 */

import codeql.Locations as L

module Solidity {
  /** The base class for all AST nodes */
  class AstNode extends @solidity_ast_node {
    /** Gets a string representation of this element. */
    string toString() { result = this.getAPrimaryQlClass() }

    /** Gets the location of this element. */
    final L::Location getLocation() { solidity_ast_node_location(this, result) }

    /** Gets the parent of this element. */
    final AstNode getParent() { solidity_ast_node_parent(this, result, _) }

    /** Gets the index of this node among the children of its parent. */
    final int getParentIndex() { solidity_ast_node_parent(this, _, result) }

    /** Gets a field or child node of this node. */
    AstNode getAFieldOrChild() { none() }

    /** Gets the name of the primary QL class for this element. */
    string getAPrimaryQlClass() { result = "???" }

    /** Gets a comma-separated list of the names of the primary CodeQL classes to which this element belongs. */
    string getPrimaryQlClasses() { result = concat(this.getAPrimaryQlClass(), ",") }
  }

  /** A token. */
  class Token extends @solidity_token, AstNode {
    /** Gets the value of this token. */
    final string getValue() { solidity_tokeninfo(this, _, result) }

    /** Gets a string representation of this element. */
    final override string toString() { result = this.getValue() }

    /** Gets the name of the primary QL class for this element. */
    override string getAPrimaryQlClass() { result = "Token" }
  }

  /** A reserved word. */
  class ReservedWord extends @solidity_reserved_word, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ReservedWord" }
  }

  /** A class representing `any_pragma_token` nodes. */
  class AnyPragmaToken extends @solidity_any_pragma_token, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AnyPragmaToken" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_any_pragma_token_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_any_pragma_token_child(this, _, result) }
  }

  /** A class representing `any_source_type` tokens. */
  class AnySourceType extends @solidity_token_any_source_type, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AnySourceType" }
  }

  /** A class representing `array_access` nodes. */
  class ArrayAccess extends @solidity_array_access, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ArrayAccess" }

    /** Gets the node corresponding to the field `base`. */
    final Expression getBase() { solidity_array_access_def(this, result) }

    /** Gets the node corresponding to the field `index`. */
    final Expression getIndex() { solidity_array_access_index(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_array_access_def(this, result) or solidity_array_access_index(this, result)
    }
  }

  /** A class representing `assembly_flags` nodes. */
  class AssemblyFlags extends @solidity_assembly_flags, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AssemblyFlags" }

    /** Gets the `i`th child of this node. */
    final String getChild(int i) { solidity_assembly_flags_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_assembly_flags_child(this, _, result) }
  }

  /** A class representing `assembly_statement` nodes. */
  class AssemblyStatement extends @solidity_assembly_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AssemblyStatement" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_assembly_statement_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_assembly_statement_child(this, _, result) }
  }

  /** A class representing `assignment_expression` nodes. */
  class AssignmentExpression extends @solidity_assignment_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AssignmentExpression" }

    /** Gets the node corresponding to the field `left`. */
    final Expression getLeft() { solidity_assignment_expression_def(this, result, _) }

    /** Gets the node corresponding to the field `right`. */
    final Expression getRight() { solidity_assignment_expression_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_assignment_expression_def(this, result, _) or
      solidity_assignment_expression_def(this, _, result)
    }
  }

  /** A class representing `augmented_assignment_expression` nodes. */
  class AugmentedAssignmentExpression extends @solidity_augmented_assignment_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AugmentedAssignmentExpression" }

    /** Gets the node corresponding to the field `left`. */
    final Expression getLeft() { solidity_augmented_assignment_expression_def(this, result, _) }

    /** Gets the node corresponding to the field `right`. */
    final Expression getRight() { solidity_augmented_assignment_expression_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_augmented_assignment_expression_def(this, result, _) or
      solidity_augmented_assignment_expression_def(this, _, result)
    }
  }

  /** A class representing `binary_expression` nodes. */
  class BinaryExpression extends @solidity_binary_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BinaryExpression" }

    /** Gets the node corresponding to the field `left`. */
    final Expression getLeft() { solidity_binary_expression_def(this, result, _, _) }

    /** Gets the node corresponding to the field `operator`. */
    final string getOperator() {
      exists(int value | solidity_binary_expression_def(this, _, value, _) |
        result = "!=" and value = 0
        or
        result = "!==" and value = 1
        or
        result = "%" and value = 2
        or
        result = "&" and value = 3
        or
        result = "&&" and value = 4
        or
        result = "*" and value = 5
        or
        result = "**" and value = 6
        or
        result = "+" and value = 7
        or
        result = "-" and value = 8
        or
        result = "/" and value = 9
        or
        result = "<" and value = 10
        or
        result = "<<" and value = 11
        or
        result = "<=" and value = 12
        or
        result = "==" and value = 13
        or
        result = ">" and value = 14
        or
        result = ">=" and value = 15
        or
        result = ">>" and value = 16
        or
        result = ">>>" and value = 17
        or
        result = "^" and value = 18
        or
        result = "|" and value = 19
        or
        result = "||" and value = 20
      )
    }

    /** Gets the node corresponding to the field `right`. */
    final Expression getRight() { solidity_binary_expression_def(this, _, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_binary_expression_def(this, result, _, _) or
      solidity_binary_expression_def(this, _, _, result)
    }
  }

  /** A class representing `block_statement` nodes. */
  class BlockStatement extends @solidity_block_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BlockStatement" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_block_statement_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_block_statement_child(this, _, result) }
  }

  /** A class representing `boolean_literal` nodes. */
  class BooleanLiteral extends @solidity_boolean_literal, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BooleanLiteral" }

    /** Gets the child of this node. */
    final AstNode getChild() { solidity_boolean_literal_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_boolean_literal_def(this, result) }
  }

  /** A class representing `break_statement` tokens. */
  class BreakStatement extends @solidity_token_break_statement, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BreakStatement" }
  }

  /** A class representing `call_argument` nodes. */
  class CallArgument extends @solidity_call_argument, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "CallArgument" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_call_argument_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_call_argument_child(this, _, result) }
  }

  /** A class representing `call_expression` nodes. */
  class CallExpression extends @solidity_call_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "CallExpression" }

    /** Gets the node corresponding to the field `function`. */
    final Expression getFunction() { solidity_call_expression_def(this, result) }

    /** Gets the `i`th child of this node. */
    final CallArgument getChild(int i) { solidity_call_expression_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_call_expression_def(this, result) or solidity_call_expression_child(this, _, result)
    }
  }

  /** A class representing `call_struct_argument` nodes. */
  class CallStructArgument extends @solidity_call_struct_argument, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "CallStructArgument" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_call_struct_argument_def(this, result, _) }

    /** Gets the node corresponding to the field `value`. */
    final Expression getValue() { solidity_call_struct_argument_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_call_struct_argument_def(this, result, _) or
      solidity_call_struct_argument_def(this, _, result)
    }
  }

  /** A class representing `catch_clause` nodes. */
  class CatchClause extends @solidity_catch_clause, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "CatchClause" }

    /** Gets the node corresponding to the field `body`. */
    final BlockStatement getBody() { solidity_catch_clause_def(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_catch_clause_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_catch_clause_def(this, result) or solidity_catch_clause_child(this, _, result)
    }
  }

  /** A class representing `comment` tokens. */
  class Comment extends @solidity_token_comment, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Comment" }
  }

  /** A class representing `constant_variable_declaration` nodes. */
  class ConstantVariableDeclaration extends @solidity_constant_variable_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ConstantVariableDeclaration" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_constant_variable_declaration_def(this, result, _, _) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_constant_variable_declaration_def(this, _, result, _) }

    /** Gets the node corresponding to the field `value`. */
    final Expression getValue() { solidity_constant_variable_declaration_def(this, _, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_constant_variable_declaration_def(this, result, _, _) or
      solidity_constant_variable_declaration_def(this, _, result, _) or
      solidity_constant_variable_declaration_def(this, _, _, result)
    }
  }

  /** A class representing `constructor_definition` nodes. */
  class ConstructorDefinition extends @solidity_constructor_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ConstructorDefinition" }

    /** Gets the node corresponding to the field `body`. */
    final FunctionBody getBody() { solidity_constructor_definition_def(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_constructor_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_constructor_definition_def(this, result) or
      solidity_constructor_definition_child(this, _, result)
    }
  }

  /** A class representing `continue_statement` tokens. */
  class ContinueStatement extends @solidity_token_continue_statement, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ContinueStatement" }
  }

  /** A class representing `contract_body` nodes. */
  class ContractBody extends @solidity_contract_body, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ContractBody" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_contract_body_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_contract_body_child(this, _, result) }
  }

  /** A class representing `contract_declaration` nodes. */
  class ContractDeclaration extends @solidity_contract_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ContractDeclaration" }

    /** Gets the node corresponding to the field `body`. */
    final ContractBody getBody() { solidity_contract_declaration_def(this, result, _) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_contract_declaration_def(this, _, result) }

    /** Gets the `i`th child of this node. */
    final InheritanceSpecifier getChild(int i) {
      solidity_contract_declaration_child(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_contract_declaration_def(this, result, _) or
      solidity_contract_declaration_def(this, _, result) or
      solidity_contract_declaration_child(this, _, result)
    }
  }

  /** A class representing `do_while_statement` nodes. */
  class DoWhileStatement extends @solidity_do_while_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "DoWhileStatement" }

    /** Gets the node corresponding to the field `body`. */
    final Statement getBody() { solidity_do_while_statement_def(this, result, _) }

    /** Gets the node corresponding to the field `condition`. */
    final Expression getCondition() { solidity_do_while_statement_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_do_while_statement_def(this, result, _) or
      solidity_do_while_statement_def(this, _, result)
    }
  }

  /** A class representing `emit_statement` nodes. */
  class EmitStatement extends @solidity_emit_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "EmitStatement" }

    /** Gets the node corresponding to the field `name`. */
    final Expression getName() { solidity_emit_statement_def(this, result) }

    /** Gets the `i`th child of this node. */
    final CallArgument getChild(int i) { solidity_emit_statement_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_emit_statement_def(this, result) or solidity_emit_statement_child(this, _, result)
    }
  }

  /** A class representing `enum_body` nodes. */
  class EnumBody extends @solidity_enum_body, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "EnumBody" }

    /** Gets the `i`th child of this node. */
    final EnumValue getChild(int i) { solidity_enum_body_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_enum_body_child(this, _, result) }
  }

  /** A class representing `enum_declaration` nodes. */
  class EnumDeclaration extends @solidity_enum_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "EnumDeclaration" }

    /** Gets the node corresponding to the field `body`. */
    final EnumBody getBody() { solidity_enum_declaration_def(this, result, _) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_enum_declaration_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_enum_declaration_def(this, result, _) or
      solidity_enum_declaration_def(this, _, result)
    }
  }

  /** A class representing `enum_value` tokens. */
  class EnumValue extends @solidity_token_enum_value, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "EnumValue" }
  }

  /** A class representing `error_declaration` nodes. */
  class ErrorDeclaration extends @solidity_error_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ErrorDeclaration" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_error_declaration_def(this, result) }

    /** Gets the `i`th child of this node. */
    final ErrorParameter getChild(int i) { solidity_error_declaration_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_error_declaration_def(this, result) or
      solidity_error_declaration_child(this, _, result)
    }
  }

  /** A class representing `error_parameter` nodes. */
  class ErrorParameter extends @solidity_error_parameter, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ErrorParameter" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_error_parameter_name(this, result) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_error_parameter_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_error_parameter_name(this, result) or solidity_error_parameter_def(this, result)
    }
  }

  /** A class representing `event_definition` nodes. */
  class EventDefinition extends @solidity_event_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "EventDefinition" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_event_definition_def(this, result) }

    /** Gets the `i`th child of this node. */
    final EventParameter getChild(int i) { solidity_event_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_event_definition_def(this, result) or
      solidity_event_definition_child(this, _, result)
    }
  }

  /** A class representing `event_parameter` nodes. */
  class EventParameter extends @solidity_event_parameter, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "EventParameter" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_event_parameter_name(this, result) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_event_parameter_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_event_parameter_name(this, result) or solidity_event_parameter_def(this, result)
    }
  }

  /** A class representing `expression` nodes. */
  class Expression extends @solidity_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Expression" }

    /** Gets the child of this node. */
    final AstNode getChild() { solidity_expression_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_expression_def(this, result) }
  }

  /** A class representing `expression_statement` nodes. */
  class ExpressionStatement extends @solidity_expression_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ExpressionStatement" }

    /** Gets the child of this node. */
    final Expression getChild() { solidity_expression_statement_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_expression_statement_def(this, result) }
  }

  /** A class representing `fallback_receive_definition` nodes. */
  class FallbackReceiveDefinition extends @solidity_fallback_receive_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FallbackReceiveDefinition" }

    /** Gets the node corresponding to the field `body`. */
    final FunctionBody getBody() { solidity_fallback_receive_definition_body(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_fallback_receive_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_fallback_receive_definition_body(this, result) or
      solidity_fallback_receive_definition_child(this, _, result)
    }
  }

  /** A class representing `false` tokens. */
  class False extends @solidity_token_false, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "False" }
  }

  /** A class representing `for_statement` nodes. */
  class ForStatement extends @solidity_for_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ForStatement" }

    /** Gets the node corresponding to the field `body`. */
    final Statement getBody() { solidity_for_statement_def(this, result, _, _) }

    /** Gets the node corresponding to the field `condition`. */
    final ExpressionStatement getCondition() { solidity_for_statement_def(this, _, result, _) }

    /** Gets the node corresponding to the field `initial`. */
    final AstNode getInitial() { solidity_for_statement_def(this, _, _, result) }

    /** Gets the node corresponding to the field `update`. */
    final Expression getUpdate() { solidity_for_statement_update(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_for_statement_def(this, result, _, _) or
      solidity_for_statement_def(this, _, result, _) or
      solidity_for_statement_def(this, _, _, result) or
      solidity_for_statement_update(this, result)
    }
  }

  /** A class representing `function_body` nodes. */
  class FunctionBody extends @solidity_function_body, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionBody" }

    /** Gets the `i`th child of this node. */
    final Statement getChild(int i) { solidity_function_body_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_function_body_child(this, _, result) }
  }

  /** A class representing `function_definition` nodes. */
  class FunctionDefinition extends @solidity_function_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionDefinition" }

    /** Gets the node corresponding to the field `body`. */
    final FunctionBody getBody() { solidity_function_definition_body(this, result) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_function_definition_def(this, result) }

    /** Gets the node corresponding to the field `return_type`. */
    final ReturnTypeDefinition getReturnType() {
      solidity_function_definition_return_type(this, result)
    }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_function_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_function_definition_body(this, result) or
      solidity_function_definition_def(this, result) or
      solidity_function_definition_return_type(this, result) or
      solidity_function_definition_child(this, _, result)
    }
  }

  /** A class representing `hex_string_literal` tokens. */
  class HexStringLiteral extends @solidity_token_hex_string_literal, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "HexStringLiteral" }
  }

  /** A class representing `identifier` tokens. */
  class Identifier extends @solidity_token_identifier, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Identifier" }
  }

  /** A class representing `if_statement` nodes. */
  class IfStatement extends @solidity_if_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "IfStatement" }

    /** Gets the node corresponding to the field `body`. */
    final Statement getBody(int i) { solidity_if_statement_body(this, i, result) }

    /** Gets the node corresponding to the field `condition`. */
    final Expression getCondition() { solidity_if_statement_def(this, result) }

    /** Gets the node corresponding to the field `else`. */
    final ReservedWord getElse() { solidity_if_statement_else(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_if_statement_body(this, _, result) or
      solidity_if_statement_def(this, result) or
      solidity_if_statement_else(this, result)
    }
  }

  /** A class representing `immutable` tokens. */
  class Immutable extends @solidity_token_immutable, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Immutable" }
  }

  /** A class representing `import_directive` nodes. */
  class ImportDirective extends @solidity_import_directive, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ImportDirective" }

    /** Gets the node corresponding to the field `alias`. */
    final Identifier getAlias(int i) { solidity_import_directive_alias(this, i, result) }

    /** Gets the node corresponding to the field `import_name`. */
    final Identifier getImportName(int i) { solidity_import_directive_import_name(this, i, result) }

    /** Gets the node corresponding to the field `source`. */
    final String getSource() { solidity_import_directive_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_import_directive_alias(this, _, result) or
      solidity_import_directive_import_name(this, _, result) or
      solidity_import_directive_def(this, result)
    }
  }

  /** A class representing `inheritance_specifier` nodes. */
  class InheritanceSpecifier extends @solidity_inheritance_specifier, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "InheritanceSpecifier" }

    /** Gets the node corresponding to the field `ancestor`. */
    final UserDefinedType getAncestor() { solidity_inheritance_specifier_def(this, result) }

    /** Gets the node corresponding to the field `ancestor_arguments`. */
    final AstNode getAncestorArguments(int i) {
      solidity_inheritance_specifier_ancestor_arguments(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_inheritance_specifier_def(this, result) or
      solidity_inheritance_specifier_ancestor_arguments(this, _, result)
    }
  }

  /** A class representing `inline_array_expression` nodes. */
  class InlineArrayExpression extends @solidity_inline_array_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "InlineArrayExpression" }

    /** Gets the `i`th child of this node. */
    final Expression getChild(int i) { solidity_inline_array_expression_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_inline_array_expression_child(this, _, result)
    }
  }

  /** A class representing `interface_declaration` nodes. */
  class InterfaceDeclaration extends @solidity_interface_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "InterfaceDeclaration" }

    /** Gets the node corresponding to the field `body`. */
    final ContractBody getBody() { solidity_interface_declaration_def(this, result, _) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_interface_declaration_def(this, _, result) }

    /** Gets the `i`th child of this node. */
    final InheritanceSpecifier getChild(int i) {
      solidity_interface_declaration_child(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_interface_declaration_def(this, result, _) or
      solidity_interface_declaration_def(this, _, result) or
      solidity_interface_declaration_child(this, _, result)
    }
  }

  /** A class representing `library_declaration` nodes. */
  class LibraryDeclaration extends @solidity_library_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "LibraryDeclaration" }

    /** Gets the node corresponding to the field `body`. */
    final ContractBody getBody() { solidity_library_declaration_def(this, result, _) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_library_declaration_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_library_declaration_def(this, result, _) or
      solidity_library_declaration_def(this, _, result)
    }
  }

  /** A class representing `member_expression` nodes. */
  class MemberExpression extends @solidity_member_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "MemberExpression" }

    /** Gets the node corresponding to the field `object`. */
    final AstNode getObject() { solidity_member_expression_def(this, result, _) }

    /** Gets the node corresponding to the field `property`. */
    final Identifier getProperty() { solidity_member_expression_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_member_expression_def(this, result, _) or
      solidity_member_expression_def(this, _, result)
    }
  }

  /** A class representing `meta_type_expression` nodes. */
  class MetaTypeExpression extends @solidity_meta_type_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "MetaTypeExpression" }

    /** Gets the child of this node. */
    final TypeName getChild() { solidity_meta_type_expression_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_meta_type_expression_def(this, result) }
  }

  /** A class representing `modifier_definition` nodes. */
  class ModifierDefinition extends @solidity_modifier_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ModifierDefinition" }

    /** Gets the node corresponding to the field `body`. */
    final FunctionBody getBody() { solidity_modifier_definition_body(this, result) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_modifier_definition_def(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_modifier_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_modifier_definition_body(this, result) or
      solidity_modifier_definition_def(this, result) or
      solidity_modifier_definition_child(this, _, result)
    }
  }

  /** A class representing `modifier_invocation` nodes. */
  class ModifierInvocation extends @solidity_modifier_invocation, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ModifierInvocation" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_modifier_invocation_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_modifier_invocation_child(this, _, result)
    }
  }

  /** A class representing `new_expression` nodes. */
  class NewExpression extends @solidity_new_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "NewExpression" }

    /** Gets the node corresponding to the field `name`. */
    final TypeName getName() { solidity_new_expression_def(this, result) }

    /** Gets the `i`th child of this node. */
    final CallArgument getChild(int i) { solidity_new_expression_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_new_expression_def(this, result) or solidity_new_expression_child(this, _, result)
    }
  }

  /** A class representing `number_literal` nodes. */
  class NumberLiteral extends @solidity_number_literal, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "NumberLiteral" }

    /** Gets the child of this node. */
    final NumberUnit getChild() { solidity_number_literal_child(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_number_literal_child(this, result) }
  }

  /** A class representing `number_unit` tokens. */
  class NumberUnit extends @solidity_token_number_unit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "NumberUnit" }
  }

  /** A class representing `override_specifier` nodes. */
  class OverrideSpecifier extends @solidity_override_specifier, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "OverrideSpecifier" }

    /** Gets the `i`th child of this node. */
    final UserDefinedType getChild(int i) { solidity_override_specifier_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_override_specifier_child(this, _, result) }
  }

  /** A class representing `parameter` nodes. */
  class Parameter extends @solidity_parameter, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Parameter" }

    /** Gets the node corresponding to the field `location`. */
    final AstNode getLocation() { solidity_parameter_location(this, result) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_parameter_name(this, result) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_parameter_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_parameter_location(this, result) or
      solidity_parameter_name(this, result) or
      solidity_parameter_def(this, result)
    }
  }

  /** A class representing `parenthesized_expression` nodes. */
  class ParenthesizedExpression extends @solidity_parenthesized_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ParenthesizedExpression" }

    /** Gets the child of this node. */
    final Expression getChild() { solidity_parenthesized_expression_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_parenthesized_expression_def(this, result)
    }
  }

  /** A class representing `payable_conversion_expression` nodes. */
  class PayableConversionExpression extends @solidity_payable_conversion_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "PayableConversionExpression" }

    /** Gets the `i`th child of this node. */
    final CallArgument getChild(int i) {
      solidity_payable_conversion_expression_child(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_payable_conversion_expression_child(this, _, result)
    }
  }

  /** A class representing `pragma_directive` nodes. */
  class PragmaDirective extends @solidity_pragma_directive, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "PragmaDirective" }

    /** Gets the child of this node. */
    final AstNode getChild() { solidity_pragma_directive_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_pragma_directive_def(this, result) }
  }

  /** A class representing `pragma_value` tokens. */
  class PragmaValue extends @solidity_token_pragma_value, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "PragmaValue" }
  }

  /** A class representing `primitive_type` tokens. */
  class PrimitiveType extends @solidity_token_primitive_type, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "PrimitiveType" }
  }

  /** A class representing `return_parameter` nodes. */
  class ReturnParameter extends @solidity_return_parameter, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ReturnParameter" }

    /** Gets the node corresponding to the field `location`. */
    final AstNode getLocation() { solidity_return_parameter_location(this, result) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_return_parameter_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_return_parameter_location(this, result) or
      solidity_return_parameter_def(this, result)
    }
  }

  /** A class representing `return_statement` nodes. */
  class ReturnStatement extends @solidity_return_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ReturnStatement" }

    /** Gets the child of this node. */
    final Expression getChild() { solidity_return_statement_child(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_return_statement_child(this, result) }
  }

  /** A class representing `return_type_definition` nodes. */
  class ReturnTypeDefinition extends @solidity_return_type_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ReturnTypeDefinition" }

    /** Gets the `i`th child of this node. */
    final Parameter getChild(int i) { solidity_return_type_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_return_type_definition_child(this, _, result)
    }
  }

  /** A class representing `revert_arguments` nodes. */
  class RevertArguments extends @solidity_revert_arguments, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "RevertArguments" }

    /** Gets the `i`th child of this node. */
    final CallArgument getChild(int i) { solidity_revert_arguments_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_revert_arguments_child(this, _, result) }
  }

  /** A class representing `revert_statement` nodes. */
  class RevertStatement extends @solidity_revert_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "RevertStatement" }

    /** Gets the node corresponding to the field `error`. */
    final Expression getError() { solidity_revert_statement_error(this, result) }

    /** Gets the child of this node. */
    final RevertArguments getChild() { solidity_revert_statement_child(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_revert_statement_error(this, result) or solidity_revert_statement_child(this, result)
    }
  }

  /** A class representing `slice_access` nodes. */
  class SliceAccess extends @solidity_slice_access, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "SliceAccess" }

    /** Gets the node corresponding to the field `base`. */
    final Expression getBase() { solidity_slice_access_def(this, result) }

    /** Gets the node corresponding to the field `from`. */
    final Expression getFrom() { solidity_slice_access_from(this, result) }

    /** Gets the node corresponding to the field `to`. */
    final Expression getTo() { solidity_slice_access_to(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_slice_access_def(this, result) or
      solidity_slice_access_from(this, result) or
      solidity_slice_access_to(this, result)
    }
  }

  /** A class representing `solidity_pragma_token` nodes. */
  class SolidityPragmaToken extends @solidity_solidity_pragma_token, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "SolidityPragmaToken" }

    /** Gets the node corresponding to the field `version_constraint`. */
    final AstNode getVersionConstraint(int i) {
      solidity_solidity_pragma_token_version_constraint(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_solidity_pragma_token_version_constraint(this, _, result)
    }
  }

  /** A class representing `solidity_version` tokens. */
  class SolidityVersion extends @solidity_token_solidity_version, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "SolidityVersion" }
  }

  /** A class representing `solidity_version_comparison_operator` tokens. */
  class SolidityVersionComparisonOperator extends @solidity_token_solidity_version_comparison_operator,
    Token
  {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "SolidityVersionComparisonOperator" }
  }

  /** A class representing `source_file` nodes. */
  class SourceFile extends @solidity_source_file, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "SourceFile" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_source_file_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_source_file_child(this, _, result) }
  }

  /** A class representing `state_mutability` tokens. */
  class StateMutability extends @solidity_token_state_mutability, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StateMutability" }
  }

  /** A class representing `state_variable_declaration` nodes. */
  class StateVariableDeclaration extends @solidity_state_variable_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StateVariableDeclaration" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_state_variable_declaration_def(this, result, _) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_state_variable_declaration_def(this, _, result) }

    /** Gets the node corresponding to the field `value`. */
    final Expression getValue() { solidity_state_variable_declaration_value(this, result) }

    /** Gets the node corresponding to the field `visibility`. */
    final Visibility getVisibility(int i) {
      solidity_state_variable_declaration_visibility(this, i, result)
    }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_state_variable_declaration_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_state_variable_declaration_def(this, result, _) or
      solidity_state_variable_declaration_def(this, _, result) or
      solidity_state_variable_declaration_value(this, result) or
      solidity_state_variable_declaration_visibility(this, _, result) or
      solidity_state_variable_declaration_child(this, _, result)
    }
  }

  /** A class representing `statement` nodes. */
  class Statement extends @solidity_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Statement" }

    /** Gets the child of this node. */
    final AstNode getChild() { solidity_statement_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_statement_def(this, result) }
  }

  /** A class representing `string` tokens. */
  class String extends @solidity_token_string, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "String" }
  }

  /** A class representing `string_literal` nodes. */
  class StringLiteral extends @solidity_string_literal, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StringLiteral" }

    /** Gets the `i`th child of this node. */
    final String getChild(int i) { solidity_string_literal_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_string_literal_child(this, _, result) }
  }

  /** A class representing `struct_body` nodes. */
  class StructBody extends @solidity_struct_body, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StructBody" }

    /** Gets the `i`th child of this node. */
    final StructMember getChild(int i) { solidity_struct_body_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_struct_body_child(this, _, result) }
  }

  /** A class representing `struct_declaration` nodes. */
  class StructDeclaration extends @solidity_struct_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StructDeclaration" }

    /** Gets the node corresponding to the field `body`. */
    final StructBody getBody() { solidity_struct_declaration_def(this, result, _) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_struct_declaration_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_struct_declaration_def(this, result, _) or
      solidity_struct_declaration_def(this, _, result)
    }
  }

  /** A class representing `struct_expression` nodes. */
  class StructExpression extends @solidity_struct_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StructExpression" }

    /** Gets the node corresponding to the field `type`. */
    final Expression getType() { solidity_struct_expression_def(this, result) }

    /** Gets the `i`th child of this node. */
    final StructFieldAssignment getChild(int i) {
      solidity_struct_expression_child(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_struct_expression_def(this, result) or
      solidity_struct_expression_child(this, _, result)
    }
  }

  /** A class representing `struct_field_assignment` nodes. */
  class StructFieldAssignment extends @solidity_struct_field_assignment, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StructFieldAssignment" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_struct_field_assignment_def(this, result, _) }

    /** Gets the node corresponding to the field `value`. */
    final Expression getValue() { solidity_struct_field_assignment_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_struct_field_assignment_def(this, result, _) or
      solidity_struct_field_assignment_def(this, _, result)
    }
  }

  /** A class representing `struct_member` nodes. */
  class StructMember extends @solidity_struct_member, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StructMember" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_struct_member_def(this, result, _) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_struct_member_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_struct_member_def(this, result, _) or solidity_struct_member_def(this, _, result)
    }
  }

  /** A class representing `ternary_expression` nodes. */
  class TernaryExpression extends @solidity_ternary_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TernaryExpression" }

    /** Gets the `i`th child of this node. */
    final Expression getChild(int i) { solidity_ternary_expression_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_ternary_expression_child(this, _, result) }
  }

  /** A class representing `true` tokens. */
  class True extends @solidity_token_true, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "True" }
  }

  /** A class representing `try_statement` nodes. */
  class TryStatement extends @solidity_try_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TryStatement" }

    /** Gets the node corresponding to the field `attempt`. */
    final Expression getAttempt() { solidity_try_statement_def(this, result, _) }

    /** Gets the node corresponding to the field `body`. */
    final BlockStatement getBody() { solidity_try_statement_def(this, _, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_try_statement_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_try_statement_def(this, result, _) or
      solidity_try_statement_def(this, _, result) or
      solidity_try_statement_child(this, _, result)
    }
  }

  /** A class representing `tuple_expression` nodes. */
  class TupleExpression extends @solidity_tuple_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TupleExpression" }

    /** Gets the `i`th child of this node. */
    final Expression getChild(int i) { solidity_tuple_expression_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_tuple_expression_child(this, _, result) }
  }

  /** A class representing `type_alias` nodes. */
  class TypeAlias extends @solidity_type_alias, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TypeAlias" }

    /** Gets the `i`th child of this node. */
    final Identifier getChild(int i) { solidity_type_alias_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_type_alias_child(this, _, result) }
  }

  /** A class representing `type_cast_expression` nodes. */
  class TypeCastExpression extends @solidity_type_cast_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TypeCastExpression" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_type_cast_expression_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_type_cast_expression_child(this, _, result)
    }
  }

  /** A class representing `type_name` nodes. */
  class TypeName extends @solidity_type_name, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TypeName" }

    /** Gets the node corresponding to the field `key_identifier`. */
    final Identifier getKeyIdentifier() { solidity_type_name_key_identifier(this, result) }

    /** Gets the node corresponding to the field `key_type`. */
    final AstNode getKeyType() { solidity_type_name_key_type(this, result) }

    /** Gets the node corresponding to the field `parameters`. */
    final AstNode getParameters(int i) { solidity_type_name_parameters(this, i, result) }

    /** Gets the node corresponding to the field `value_identifier`. */
    final Identifier getValueIdentifier() { solidity_type_name_value_identifier(this, result) }

    /** Gets the node corresponding to the field `value_type`. */
    final TypeName getValueType() { solidity_type_name_value_type(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_type_name_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_type_name_key_identifier(this, result) or
      solidity_type_name_key_type(this, result) or
      solidity_type_name_parameters(this, _, result) or
      solidity_type_name_value_identifier(this, result) or
      solidity_type_name_value_type(this, result) or
      solidity_type_name_child(this, _, result)
    }
  }

  /** A class representing `unary_expression` nodes. */
  class UnaryExpression extends @solidity_unary_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UnaryExpression" }

    /** Gets the node corresponding to the field `argument`. */
    final Expression getArgument() { solidity_unary_expression_def(this, result, _) }

    /** Gets the node corresponding to the field `operator`. */
    final string getOperator() {
      exists(int value | solidity_unary_expression_def(this, _, value) |
        result = "!" and value = 0
        or
        result = "+" and value = 1
        or
        result = "-" and value = 2
        or
        result = "delete" and value = 3
        or
        result = "~" and value = 4
      )
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_unary_expression_def(this, result, _) }
  }

  /** A class representing `unchecked` tokens. */
  class Unchecked extends @solidity_token_unchecked, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Unchecked" }
  }

  /** A class representing `unicode_string_literal` tokens. */
  class UnicodeStringLiteral extends @solidity_token_unicode_string_literal, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UnicodeStringLiteral" }
  }

  /** A class representing `update_expression` nodes. */
  class UpdateExpression extends @solidity_update_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UpdateExpression" }

    /** Gets the node corresponding to the field `argument`. */
    final Expression getArgument() { solidity_update_expression_def(this, result, _) }

    /** Gets the node corresponding to the field `operator`. */
    final string getOperator() {
      exists(int value | solidity_update_expression_def(this, _, value) |
        result = "++" and value = 0
        or
        result = "--" and value = 1
      )
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_update_expression_def(this, result, _) }
  }

  /** A class representing `user_defined_type` nodes. */
  class UserDefinedType extends @solidity_user_defined_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UserDefinedType" }

    /** Gets the `i`th child of this node. */
    final Identifier getChild(int i) { solidity_user_defined_type_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_user_defined_type_child(this, _, result) }
  }

  /** A class representing `user_defined_type_definition` nodes. */
  class UserDefinedTypeDefinition extends @solidity_user_defined_type_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UserDefinedTypeDefinition" }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_user_defined_type_definition_def(this, result, _) }

    /** Gets the child of this node. */
    final PrimitiveType getChild() { solidity_user_defined_type_definition_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_user_defined_type_definition_def(this, result, _) or
      solidity_user_defined_type_definition_def(this, _, result)
    }
  }

  /** A class representing `using_directive` nodes. */
  class UsingDirective extends @solidity_using_directive, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UsingDirective" }

    /** Gets the node corresponding to the field `source`. */
    final AstNode getSource() { solidity_using_directive_def(this, result, _) }

    /** Gets the child of this node. */
    final TypeAlias getChild() { solidity_using_directive_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_using_directive_def(this, result, _) or solidity_using_directive_def(this, _, result)
    }
  }

  /** A class representing `variable_declaration` nodes. */
  class VariableDeclaration extends @solidity_variable_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "VariableDeclaration" }

    /** Gets the node corresponding to the field `location`. */
    final AstNode getLocation() { solidity_variable_declaration_location(this, result) }

    /** Gets the node corresponding to the field `name`. */
    final Identifier getName() { solidity_variable_declaration_def(this, result, _) }

    /** Gets the node corresponding to the field `type`. */
    final TypeName getType() { solidity_variable_declaration_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_variable_declaration_location(this, result) or
      solidity_variable_declaration_def(this, result, _) or
      solidity_variable_declaration_def(this, _, result)
    }
  }

  /** A class representing `variable_declaration_statement` nodes. */
  class VariableDeclarationStatement extends @solidity_variable_declaration_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "VariableDeclarationStatement" }

    /** Gets the node corresponding to the field `value`. */
    final Expression getValue() { solidity_variable_declaration_statement_value(this, result) }

    /** Gets the child of this node. */
    final AstNode getChild() { solidity_variable_declaration_statement_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_variable_declaration_statement_value(this, result) or
      solidity_variable_declaration_statement_def(this, result)
    }
  }

  /** A class representing `variable_declaration_tuple` nodes. */
  class VariableDeclarationTuple extends @solidity_variable_declaration_tuple, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "VariableDeclarationTuple" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_variable_declaration_tuple_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_variable_declaration_tuple_child(this, _, result)
    }
  }

  /** A class representing `virtual` tokens. */
  class Virtual extends @solidity_token_virtual, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Virtual" }
  }

  /** A class representing `visibility` tokens. */
  class Visibility extends @solidity_token_visibility, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Visibility" }
  }

  /** A class representing `while_statement` nodes. */
  class WhileStatement extends @solidity_while_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "WhileStatement" }

    /** Gets the node corresponding to the field `body`. */
    final Statement getBody() { solidity_while_statement_def(this, result, _) }

    /** Gets the node corresponding to the field `condition`. */
    final Expression getCondition() { solidity_while_statement_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_while_statement_def(this, result, _) or solidity_while_statement_def(this, _, result)
    }
  }

  /** A class representing `yul_assignment` nodes. */
  class YulAssignment extends @solidity_yul_assignment, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulAssignment" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_yul_assignment_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_assignment_child(this, _, result) }
  }

  /** A class representing `yul_block` nodes. */
  class YulBlock extends @solidity_yul_block, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulBlock" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_yul_block_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_block_child(this, _, result) }
  }

  /** A class representing `yul_boolean` tokens. */
  class YulBoolean extends @solidity_token_yul_boolean, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulBoolean" }
  }

  /** A class representing `yul_break` tokens. */
  class YulBreak extends @solidity_token_yul_break, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulBreak" }
  }

  /** A class representing `yul_continue` tokens. */
  class YulContinue extends @solidity_token_yul_continue, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulContinue" }
  }

  /** A class representing `yul_decimal_number` tokens. */
  class YulDecimalNumber extends @solidity_token_yul_decimal_number, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulDecimalNumber" }
  }

  /** A class representing `yul_evm_builtin` tokens. */
  class YulEvmBuiltin extends @solidity_token_yul_evm_builtin, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulEvmBuiltin" }
  }

  /** A class representing `yul_for_statement` nodes. */
  class YulForStatement extends @solidity_yul_for_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulForStatement" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_yul_for_statement_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_for_statement_child(this, _, result) }
  }

  /** A class representing `yul_function_call` nodes. */
  class YulFunctionCall extends @solidity_yul_function_call, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulFunctionCall" }

    /** Gets the node corresponding to the field `function`. */
    final AstNode getFunction() { solidity_yul_function_call_def(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_yul_function_call_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_yul_function_call_def(this, result) or
      solidity_yul_function_call_child(this, _, result)
    }
  }

  /** A class representing `yul_function_definition` nodes. */
  class YulFunctionDefinition extends @solidity_yul_function_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulFunctionDefinition" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_yul_function_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_yul_function_definition_child(this, _, result)
    }
  }

  /** A class representing `yul_hex_number` tokens. */
  class YulHexNumber extends @solidity_token_yul_hex_number, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulHexNumber" }
  }

  /** A class representing `yul_identifier` nodes. */
  class YulIdentifier extends @solidity_yul_identifier, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulIdentifier" }

    /** Gets the child of this node. */
    final Identifier getChild() { solidity_yul_identifier_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_identifier_def(this, result) }
  }

  /** A class representing `yul_if_statement` nodes. */
  class YulIfStatement extends @solidity_yul_if_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulIfStatement" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_yul_if_statement_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_if_statement_child(this, _, result) }
  }

  /** A class representing `yul_label` nodes. */
  class YulLabel extends @solidity_yul_label, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulLabel" }

    /** Gets the child of this node. */
    final Identifier getChild() { solidity_yul_label_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_label_def(this, result) }
  }

  /** A class representing `yul_leave` tokens. */
  class YulLeave extends @solidity_token_yul_leave, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulLeave" }
  }

  /** A class representing `yul_path` nodes. */
  class YulPath extends @solidity_yul_path, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulPath" }

    /** Gets the `i`th child of this node. */
    final YulIdentifier getChild(int i) { solidity_yul_path_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_path_child(this, _, result) }
  }

  /** A class representing `yul_string_literal` nodes. */
  class YulStringLiteral extends @solidity_yul_string_literal, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulStringLiteral" }

    /** Gets the child of this node. */
    final String getChild() { solidity_yul_string_literal_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { solidity_yul_string_literal_def(this, result) }
  }

  /** A class representing `yul_switch_statement` nodes. */
  class YulSwitchStatement extends @solidity_yul_switch_statement, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulSwitchStatement" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { solidity_yul_switch_statement_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_yul_switch_statement_child(this, _, result)
    }
  }

  /** A class representing `yul_variable_declaration` nodes. */
  class YulVariableDeclaration extends @solidity_yul_variable_declaration, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "YulVariableDeclaration" }

    /** Gets the node corresponding to the field `left`. */
    final AstNode getLeft(int i) { solidity_yul_variable_declaration_left(this, i, result) }

    /** Gets the node corresponding to the field `right`. */
    final AstNode getRight() { solidity_yul_variable_declaration_right(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      solidity_yul_variable_declaration_left(this, _, result) or
      solidity_yul_variable_declaration_right(this, result)
    }
  }
}
