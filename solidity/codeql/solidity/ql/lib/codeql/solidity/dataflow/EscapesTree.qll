/**
 * Provides a local analysis for identifying where a variable address or value
 * may escape an _expression tree_, meaning that it is assigned to a variable,
 * passed to a function, or similar.
 */

/*
 * Maintainer note: this file is one of several files that are similar but not
 * identical. Many changes to this file will also apply to the others:
 * - AddressConstantExpression.qll
 * - AddressFlow.qll
 * - EscapesTree.qll
 */

// private import cpp
import codeql.solidity.Expr
import codeql.solidity.controlflow.ControlFlowGraph


//  // Taken from AddressFlow.qll
//  private predicate valueToUpdate(Expression inner, Expression outer, ControlFlowNode node){
//   lvalueToUpdate(inner, outer, node)
// }

// // Taken from AddressFlow.qll
// private predicate lvalueToUpdate(Expression lvalue, Expression outer, ControlFlowNode node) {
//   (
//     exists(Call call | node = call |
//   //     outer = call.getQualifier().getFullyConverted() and
//   //     outer.getUnspecifiedType() instanceof Class and
//   //     not (
//   //       call.getTarget().hasSpecifier("const") and
//   //       // Given the following program:
//   //       // ```
//   //       // struct C {
//   //       //   void* data_;
//   //       //   void* data() const { return data; }
//   //       // };
//   //       // C c;
//   //       // memcpy(c.data(), source, 16)
//   //       // ```
//   //       // the data pointed to by `c.data_` is potentially modified by the call to `memcpy` even though
//   //       // `C::data` has a const specifier. So we further place the restriction that the type returned
//   //       // by `call` should not be of the form `const T*` (for some deeply const type `T`).
//   //       call.getType().isDeeplyConstBelow()
//   //     )
//   //   )
//   //   or
//     assignmentTo(outer, node) and node instanceof Call
//   //   or
//   //   exists(DotFieldAccess fa |
//   //     // `fa.otherField = ...` or `f(&fa)` or similar
//   //     outer = fa.getQualifier().getFullyConverted() and
//   //     valueToUpdate(fa, _, node)
//     )
//   ) and
//   lvalue = outer
//   or
//   exists(Expression lvalueMid |
//     lvalueToLvalueStep(lvalue, lvalueMid) and
//     lvalueToUpdate(lvalueMid, outer, node)
//   )
// }

// // Taken from AddressFlow.qll
// private predicate assignmentTo(Expression updated, ControlFlowNode node) {
//   updated = node.(Assignment).getLValue()
//   // or
//   // updated = node.(CrementOperation).getOperand().getFullyConverted()
// }


// /**
//  * Holds if `f` is an instantiation of `std::addressof`, which effectively
//  * converts a reference to a pointer.
//  */
// private predicate stdAddressOf(Function f) { f.hasQualifiedName("std", "addressof") }

private predicate lvalueToLvalueStepPure(Expression lvalueIn, Expression lvalueOut) {
  // lvalueIn = lvalueOut.(DotFieldAccess).getQualifier().getFullyConverted()
  lvalueIn = lvalueOut.(DotFieldAccess).getQualifier()
  // or
  // lvalueIn.getConversion() = lvalueOut.(ParenthesisExpr)
  // or
  // // When an object is implicitly converted to a reference to one of its base
  // // classes, it gets two `Conversion`s: there is first an implicit
  // // `CStyleCast` to its base class followed by a `ReferenceToExpr` to a
  // // reference to its base class. Whereas an explicit cast to the base class
  // // would produce an rvalue, which would not be convertible to an lvalue
  // // reference, this implicit cast instead produces an lvalue. The following
  // // case ensures that we propagate the property of being an lvalue through
  // // such casts.
  // lvalueIn.getConversion() = lvalueOut and
  // lvalueOut.(CStyleCast).isImplicit()
}

private predicate lvalueToLvalueStep(Expression lvalueIn, Expression lvalueOut) {
  lvalueToLvalueStepPure(lvalueIn, lvalueOut)
  or
  // lvalueIn = lvalueOut.(PrefixCrementOperation).getOperand().getFullyConverted()
  // or
  // C++ only
  // lvalueIn = lvalueOut.(Assignment).getLValue().getFullyConverted()
  lvalueIn = lvalueOut.(Assignment).getLValue()
}

// private predicate pointerToLvalueStep(Expression pointerIn, Expression lvalueOut) {
//   pointerIn = lvalueOut.(ArrayExpr).getArrayBase().getFullyConverted()
//   or
//   pointerIn = lvalueOut.(PointerDereferenceExpr).getOperand().getFullyConverted()
//   or
//   pointerIn = lvalueOut.(PointerFieldAccess).getQualifier().getFullyConverted()
// }

// private predicate lvalueToPointerStep(Expression lvalueIn, Expression pointerOut) {
//   lvalueIn.getConversion() = pointerOut.(ArrayToPointerConversion)
//   or
//   lvalueIn = pointerOut.(AddressOfExpr).getOperand().getFullyConverted()
// }

// private predicate pointerToPointerStep(Expression pointerIn, Expression pointerOut) {
//   (
//     pointerOut instanceof PointerAddExpr
//     or
//     pointerOut instanceof PointerSubExpr
//   ) and
//   pointerIn = pointerOut.getAChild().getFullyConverted() and
//   pointerIn.getUnspecifiedType() instanceof PointerType
//   or
//   pointerIn = pointerOut.(UnaryPlusExpr).getOperand().getFullyConverted()
//   or
//   pointerIn.getConversion() = pointerOut.(Cast)
//   or
//   pointerIn.getConversion() = pointerOut.(ParenthesisExpr)
//   or
//   pointerIn.getConversion() = pointerOut.(TemporaryObjectExpr)
//   or
//   pointerIn = pointerOut.(ConditionalExpr).getThen().getFullyConverted()
//   or
//   pointerIn = pointerOut.(ConditionalExpr).getElse().getFullyConverted()
//   or
//   pointerIn = pointerOut.(CommaExpr).getRightOperand().getFullyConverted()
//   or
//   pointerIn = pointerOut.(StmtExpr).getResultExpr().getFullyConverted()
// }

// private predicate lvalueToReferenceStep(Expression lvalueIn, Expression referenceOut) {
//   lvalueIn.getConversion() = referenceOut.(ReferenceToExpr)
// }

// private predicate referenceToLvalueStep(Expression referenceIn, Expression lvalueOut) {
//   referenceIn.getConversion() = lvalueOut.(ReferenceDereferenceExpr)
// }

// private predicate referenceToPointerStep(Expression referenceIn, Expression pointerOut) {
//   pointerOut =
//     any(FunctionCall call |
//       stdAddressOf(call.getTarget()) and
//       referenceIn = call.getArgument(0).getFullyConverted()
//     )
// }

// private predicate referenceToReferenceStep(Expression referenceIn, Expression referenceOut) {
//   referenceOut =
//     any(FunctionCall call |
//       stdIdentityFunction(call.getTarget()) and
//       referenceIn = call.getArgument(0).getFullyConverted()
//     )
//   or
//   referenceIn.getConversion() = referenceOut.(Cast)
//   or
//   referenceIn.getConversion() = referenceOut.(ParenthesisExpr)
// }

private predicate lvalueFromVariableAccess(VariableAccess va, Expression lvalue) {
  // Base case for non-reference types.
  lvalue = va 
  // and
  // not va.getConversion() instanceof ReferenceDereferenceExpr
  // or
  // // Base case for reference types where we pretend that they are
  // // non-reference types. The type of the target of `va` can be `ReferenceType`
  // // or `FunctionReferenceType`.
  // lvalue = va.getConversion().(ReferenceDereferenceExpr)
  or
  // lvalue -> lvalue
  exists(Expression prev |
    lvalueFromVariableAccess(va, prev) and
    lvalueToLvalueStep(prev, lvalue)
  )
  // or
  // // pointer -> lvalue
  // exists(Expression prev |
  //   pointerFromVariableAccess(va, prev) and
  //   pointerToLvalueStep(prev, lvalue)
  // )
  // or
  // // reference -> lvalue
  // exists(Expression prev |
  //   referenceFromVariableAccess(va, prev) and
  //   referenceToLvalueStep(prev, lvalue)
  // )
}

// private predicate pointerFromVariableAccess(VariableAccess va, Expression pointer) {
//   // pointer -> pointer
//   exists(Expression prev |
//     pointerFromVariableAccess(va, prev) and
//     pointerToPointerStep(prev, pointer)
//   )
//   or
//   // reference -> pointer
//   exists(Expression prev |
//     referenceFromVariableAccess(va, prev) and
//     referenceToPointerStep(prev, pointer)
//   )
//   or
//   // lvalue -> pointer
//   exists(Expression prev |
//     lvalueFromVariableAccess(va, prev) and
//     lvalueToPointerStep(prev, pointer)
//   )
// }

// private predicate referenceFromVariableAccess(VariableAccess va, Expression reference) {
//   // reference -> reference
//   exists(Expression prev |
//     referenceFromVariableAccess(va, prev) and
//     referenceToReferenceStep(prev, reference)
//   )
//   or
//   // lvalue -> reference
//   exists(Expression prev |
//     lvalueFromVariableAccess(va, prev) and
//     lvalueToReferenceStep(prev, reference)
//   )
// }

// private predicate addressMayEscapeAt(Expression e) {
//   exists(Call call |
//     // e = call.getAnArgument().getFullyConverted() and
//     e = call.getAnArgument() and
//     not stdIdentityFunction(call.getTarget()) and
//     not stdAddressOf(call.getTarget())
//     or
//     e = call.getQualifier().getFullyConverted() and
//     e.getUnderlyingType() instanceof PointerType
//   )
//   or
//   // exists(AssignExpr assign | e = assign.getRValue().getFullyConverted())
//   exists(AssignExpr assign | e = assign.getRValue())
//   or
//   // exists(Initializer init | e = init.getExpr().getFullyConverted())
//   exists(Initializer init | e = init.getExpr())
//   or
//   exists(ConstructorFieldInit init | e = init.getExpr().getFullyConverted())
//   or
//   // exists(ReturnStmt ret | e = ret.getExpr().getFullyConverted())
//   exists(ReturnStmt ret | e = ret.getExpr())
//   or
//   exists(ThrowExpr throw | e = throw.getExpr().getFullyConverted())
//   or
//   exists(AggregateLiteral agg | e = agg.getAChild().getFullyConverted())
//   or
//   exists(AsmStmt asm | e = asm.getAChild().(Expression).getFullyConverted())
// }

// private predicate addressMayEscapeMutablyAt(Expression e) {
//   addressMayEscapeAt(e) and
//   exists(Type t | t = e.getType().stripTopLevelSpecifiers() |
//     t instanceof PointerType and
//     not t.(PointerType).getBaseType().isConst()
//     or
//     t instanceof ReferenceType and
//     not t.(ReferenceType).getBaseType().isConst()
//     or
//     // If the address has been cast to an integral type, conservatively assume that it may eventually be cast back to a
//     // pointer to non-const type.
//     t instanceof IntegralType
//     or
//     // If we go through a temporary object step, we can take a reference to a temporary const pointer
//     // object, where the pointer doesn't point to a const value
//     exists(TemporaryObjectExpr temp, PointerType pt |
//       temp.getConversion() = e.(ReferenceToExpr) and
//       pt = temp.getType().stripTopLevelSpecifiers()
//     |
//       not pt.getBaseType().isConst()
//     )
//   )
// }

private predicate lvalueMayEscapeAt(Expression e) {
  // A call qualifier, like `q` in `q.f()`, is special in that the address of
  // `q` escapes even though `q` is not a pointer or a reference.
  none()
  // exists(Call call |
  //   e = call.getQualifier().getFullyConverted() and
  //   e.getType().getUnspecifiedType() instanceof Class
  // )
}

private predicate lvalueMayEscapeMutablyAt(Expression e) {
  lvalueMayEscapeAt(e) 
  // and
  // // A qualifier of a call to a const member function is converted to a const
  // // class type.
  // not e.getType().isConst()
}

// private predicate addressFromVariableAccess(VariableAccess va, Expression e) {
//   pointerFromVariableAccess(va, e)
//   or
//   referenceFromVariableAccess(va, e)
//   or
//   // `e` could be a pointer that is converted to a reference as the final step,
//   // meaning that we pass a value that is two dereferences away from referring
//   // to `va`. This happens, for example, with `void std::vector::push_back(T&&
//   // value);` when called as `v.push_back(&x)`, for a variable `x`. It
//   // can also happen when taking a reference to a const pointer to a
//   // (potentially non-const) value.
//   exists(Expression pointerValue |
//     pointerFromVariableAccess(va, pointerValue) and
//     e = pointerValue.getConversion().(ReferenceToExpr)
//   )
// }

import EscapesTree_Cached

cached
private module EscapesTree_Cached {
  // /**
  //  * Holds if `e` is a fully-converted expression that evaluates to an address
  //  * derived from the address of `va` and is stored in a variable or passed
  //  * across functions. This means `e` is the `Expression.getFullyConverted`-form of:
  //  *
  //  * - The right-hand side of an assignment or initialization;
  //  * - A function argument or return value;
  //  * - The argument to `throw`.
  //  * - An entry in an `AggregateLiteral`, including the compiler-generated
  //  *   `ClassAggregateLiteral` that initializes a `LambdaExpression`; or
  //  * - An expression in an inline assembly statement.
  //  *
  //  * This predicate includes pointers or reference to `const` types. See
  //  * `variableAddressEscapesTreeNonConst` for a version of this predicate that
  //  * does not.
  //  *
  //  * If `va` has reference type, the escape analysis concerns the value pointed
  //  * to by the reference rather than the reference itself. The C++ language does
  //  * not allow taking the address of a reference in any way, so this predicate
  //  * would never produce any results for the reference itself. Callers that are
  //  * not interested in the value referred to by references should exclude
  //  * variable accesses to reference-typed values.
  //  */
  // cached
  // predicate variableAddressEscapesTree(VariableAccess va, Expression e) {
  //   addressMayEscapeAt(e) and
  //   addressFromVariableAccess(va, e)
  //   or
  //   lvalueMayEscapeAt(e) and
  //   lvalueFromVariableAccess(va, e)
  // }

  // /**
  //  * Holds if `e` is a fully-converted expression that evaluates to a non-const
  //  * address derived from the address of `va` and is stored in a variable or
  //  * passed across functions. This means `e` is the `Expression.getFullyConverted`-form
  //  * of:
  //  *
  //  * - The right-hand side of an assignment or initialization;
  //  * - A function argument or return value;
  //  * - The argument to `throw`.
  //  * - An entry in an `AggregateLiteral`, including the compiler-generated
  //  *   `ClassAggregateLiteral` that initializes a `LambdaExpression`; or
  //  * - An expression in an inline assembly statement.
  //  *
  //  * This predicate omits pointers or reference to `const` types. See
  //  * `variableAddressEscapesTree` for a version of this predicate that includes
  //  * those.
  //  *
  //  * If `va` has reference type, the escape analysis concerns the value pointed
  //  * to by the reference rather than the reference itself. The C++ language
  //  * offers no way to take the address of a reference, so this predicate will
  //  * never produce any results for the reference itself. Callers that are not
  //  * interested in the value referred to by references should exclude variable
  //  * accesses to reference-typed values.
  //  */
  // cached
  // predicate variableAddressEscapesTreeNonConst(VariableAccess va, Expression e) {
  //   addressMayEscapeMutablyAt(e) and
  //   addressFromVariableAccess(va, e)
  //   or
  //   lvalueMayEscapeMutablyAt(e) and
  //   lvalueFromVariableAccess(va, e)
  // }

  /**
   * Holds if `e` is a fully-converted expression that evaluates to an lvalue
   * derived from `va` and is used for reading from or assigning to. This is in
   * contrast with a variable access that is used for taking an address (`&x`)
   * or simply discarding its value (`x;`).
   *
   * This analysis does not propagate across assignments or calls. The analysis
   * is also not concerned with whether the lvalue `e` is converted to an rvalue
   * -- to examine that, use the relevant member predicates on `Expression`.
   *
   * If `va` has reference type, the analysis concerns the value pointed to by
   * the reference rather than the reference itself. The expression `e` may be a
   * `Conversion`.
   */
  cached
  predicate variableAccessedAsValue(VariableAccess va, Expression e) {
    lvalueFromVariableAccess(va, e) and
    not lvalueToLvalueStepPure(e, _) 
    // and
    // not e = any(ExprInVoidContext eivc | e = eivc.getConversion*())
  }
}
