/**
 * Provides classes for modeling specifiers and attributes.
 */

import codeql.solidity.ast.internal.TreeSitter
import codeql.Locations
// private import semmle.code.cpp.internal.ResolveClass

//NOTA ARGI: excluyo modifiers de aca, que heredan de otra superclase
//Dejo afuera override porque esta bizarrisimamente solo y no hereda
//de token :(
//ver como implementar pure y view tambien

/**
 * A Solidity specifier: `internal`, `public`, `private`, `external`,
 *  `pure`, `view`, `immutable`, `virtual`
 */
class Specifier extends Solidity::Token {

  cached
  Specifier(){this instanceof Solidity::StateMutability or this instanceof Solidity::Visibility
                or this instanceof Solidity::Virtual
              }

  override string getAPrimaryQlClass() { result = "Specifier" }

  /** Gets the name of this specifier. */
  string getName() { result = this.(Solidity::Token).getValue().toString() }

  /** Holds if the name of this specifier is `name`. */
  predicate hasName(string name) { name = this.getName() }
}

/**
 * A C/C++ function specifier: `inline`, `virtual`, or `explicit`.
 */
class FunctionSpecifier extends Specifier {
  FunctionSpecifier() { this.hasName(["inline", "virtual", "explicit"]) }

  override string getAPrimaryQlClass() { result = "FunctionSpecifier" }
}

/**
 * A C/C++ storage class specifier: `auto`, `register`, `static`, `extern`,
 * or `mutable`.
 */
class StorageClassSpecifier extends Specifier {
  StorageClassSpecifier() { this.hasName(["auto", "register", "static", "extern", "mutable"]) }

  override string getAPrimaryQlClass() { result = "StorageClassSpecifier" }
}

/**
 * A Solidity access specifier: `public`, `private`, `internal`, `external`.
 */
class AccessSpecifier extends Specifier {
  AccessSpecifier() { this.hasName(["public", "private", "internal", "external"]) }

  /**
   * Gets the visibility of a field with access specifier `this` if it is
   * directly inherited with access specifier `baseAccess`. For example:
   *
   * ```
   * class A { protected int f; };
   * class B : private A {};
   * ```
   *
   * In this example, `this` is `protected`, `baseAccess` is `private`, and
   * `result` is `private` because the visibility of field `f` in class `B`
   * is `private`.
   *
   * This method encodes the rules of N4140 11.2/1, tabulated here:
   *
   * ```
   * `this`           | `baseAccess`           | `result`
   * (access in base) | (base class specifier) | (access in derived)
   * ----------------------------------------------------------
   * private          | private                | N/A
   * private          | protected              | N/A
   * private          | public                 | N/A
   * protected        | private                | private
   * protected        | protected              | protected
   * protected        | public                 | protected
   * public           | private                | private
   * public           | protected              | protected
   * public           | public                 | public
   * ```
   */
  AccessSpecifier accessInDirectDerived(AccessSpecifier baseAccess) {
    this.getName() != "private" and
    (
      // Alphabetically, "private" < "protected" < "public". This disjunction
      // encodes that `result` is the minimum access of `this` and
      // `baseAccess`.
      baseAccess.getName() < this.getName() and result = baseAccess
      or
      baseAccess.getName() >= this.getName() and result = this
    )
  }

  override string getAPrimaryQlClass() { result = "AccessSpecifier" }
}

// /**
//  * An attribute introduced by GNU's `__attribute__((name))` syntax,
//  * Microsoft's `__declspec(name)` syntax, Microsoft's `[name]` syntax, the
//  * C++11 standard `[[name]]` syntax, or the C++11 `alignas` syntax.
//  */
// class Attribute extends Element, @attribute {
//   /**
//    * Gets the name of this attribute.
//    *
//    * As examples, this is "noreturn" for `__attribute__((__noreturn__))`,
//    * "fallthrough" for `[[clang::fallthrough]]`, and "dllimport" for
//    * `__declspec(dllimport)`.
//    *
//    * Note that the name does not include the namespace. For example, the
//    * name of `[[clang::fallthrough]]` is "fallthrough".
//    */
//   string getName() { attributes(underlyingElement(this), _, result, _, _) }

//   override Location getLocation() { attributes(underlyingElement(this), _, _, _, result) }

//   /** Holds if the name of this attribute is `name`. */
//   predicate hasName(string name) { name = this.getName() }

//   override string toString() { result = this.getName() }

//   /** Gets the `i`th argument of the attribute. */
//   AttributeArgument getArgument(int i) { result.getAttribute() = this and result.getIndex() = i }

//   /** Gets an argument of the attribute. */
//   AttributeArgument getAnArgument() { result = this.getArgument(_) }
// }

// /**
//  * A C++11 `alignas` construct. For example the attribute in the following
//  * code:
//  * ```
//  * struct alignas(16) MyStruct {
//  *   int x;
//  * };
//  * ```
//  * Though it doesn't use the attribute syntax, `alignas(...)` is presented
//  * as an `Attribute` for consistency with the `[[align(...)]]` attribute.
//  */
// class AlignAs extends Attribute, @alignas {
//   override string toString() { result = "alignas(...)" }
// }

// /**
//  * An argument to an `Attribute`. For example the argument "dllimport" on the
//  * attribute in the following code:
//  * ```
//  * __declspec(dllimport) void myFunction();
//  * ```
//  */
// class AttributeArgument extends Element, @attribute_arg {
//   /**
//    * Gets the name of this argument, if it is a named argument. Named
//    * arguments are a Microsoft feature, so only a `MicrosoftAttribute` can
//    * have a named argument.
//    */
//   string getName() { attribute_arg_name(underlyingElement(this), result) }

//   /**
//    * Gets the text for the value of this argument, if its value is
//    * a constant or a token.
//    */
//   string getValueText() {
//     if underlyingElement(this) instanceof @attribute_arg_constant_expr
//     then result = this.getValueConstant().getValue()
//     else attribute_arg_value(underlyingElement(this), result)
//   }

//   /**
//    * Gets the value of this argument, if its value is integral.
//    */
//   int getValueInt() { result = this.getValueText().toInt() }

//   /**
//    * Gets the value of this argument, if its value is a type.
//    */
//   Type getValueType() { attribute_arg_type(underlyingElement(this), unresolveElement(result)) }

//   /**
//    * Gets the value of this argument, if its value is a constant.
//    */
//   Expr getValueConstant() {
//     attribute_arg_constant(underlyingElement(this), unresolveElement(result))
//   }

//   /**
//    * Gets the value of this argument, if its value is an expression.
//    */
//   Expr getValueExpr() { attribute_arg_expr(underlyingElement(this), unresolveElement(result)) }

//   /**
//    * Gets the attribute to which this is an argument.
//    */
//   Attribute getAttribute() {
//     attribute_args(underlyingElement(this), _, unresolveElement(result), _, _)
//   }

//   /**
//    * Gets the zero-based index of this argument in the containing
//    * attribute's argument list.
//    */
//   int getIndex() { attribute_args(underlyingElement(this), _, _, result, _) }

//   override Location getLocation() { attribute_args(underlyingElement(this), _, _, _, result) }

//   override string toString() {
//     if underlyingElement(this) instanceof @attribute_arg_empty
//     then result = "empty argument"
//     else
//       exists(string prefix, string tail |
//         (if exists(this.getName()) then prefix = this.getName() + "=" else prefix = "") and
//         (
//           if underlyingElement(this) instanceof @attribute_arg_type
//           then tail = this.getValueType().getName()
//           else
//             if underlyingElement(this) instanceof @attribute_arg_constant_expr
//             then tail = this.getValueConstant().toString()
//             else
//               if underlyingElement(this) instanceof @attribute_arg_expr
//               then tail = this.getValueExpr().toString()
//               else tail = this.getValueText()
//         ) and
//         result = prefix + tail
//       )
//   }
// }
