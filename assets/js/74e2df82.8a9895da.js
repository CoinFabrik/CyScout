"use strict";(self.webpackChunkcodeql_research=self.webpackChunkcodeql_research||[]).push([[235],{5698:(e,s,i)=>{i.r(s),i.d(s,{assets:()=>a,contentTitle:()=>c,default:()=>o,frontMatter:()=>l,metadata:()=>d,toc:()=>t});var n=i(6070),r=i(1503);const l={},c="Access",d={id:"Classes/Access",title:"Access",description:"Classes",source:"@site/docs/Classes/Access.md",sourceDirName:"Classes",slug:"/Classes/Access",permalink:"/CyScout/Classes/Access",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Classes",permalink:"/CyScout/Classes/"},next:{title:"BasicBlock",permalink:"/CyScout/Classes/BasicBlock"}},a={},t=[{value:"Classes",id:"classes",level:2},{value:"Predicates",id:"predicates",level:2},{value:"Access",id:"access-1",level:2},{value:"Methods",id:"methods",level:3},{value:"Access ()",id:"access-",level:3},{value:"getTarget()",id:"gettarget",level:3},{value:"mayBeImpure()",id:"maybeimpure",level:3},{value:"mayBeGloballyImpure()",id:"maybegloballyimpure",level:3},{value:"toString()",id:"tostring",level:3},{value:"VariableAccess",id:"variableaccess",level:2},{value:"Methods and predicates",id:"methods-and-predicates",level:3},{value:"getAPrimaryQlClass()",id:"getaprimaryqlclass",level:3},{value:"getTarget()",id:"gettarget-1",level:3},{value:"isUsedAsLValue()",id:"isusedaslvalue",level:3},{value:"isModified()",id:"ismodified",level:3},{value:"isRValue()",id:"isrvalue",level:3},{value:"getQualifier()",id:"getqualifier",level:3},{value:"toString()",id:"tostring-1",level:3},{value:"mayBeImpure()",id:"maybeimpure-1",level:3},{value:"mayBeGloballyImpure()",id:"maybegloballyimpure-1",level:3},{value:"isAddressOfAccess()",id:"isaddressofaccess",level:3},{value:"isAddressOfAccessNonConst()",id:"isaddressofaccessnonconst",level:3},{value:"FieldAccess",id:"fieldaccess",level:2},{value:"Methods",id:"methods-1",level:3},{value:"getAPrimaryQlClass()",id:"getaprimaryqlclass-1",level:3},{value:"FieldAccess()",id:"fieldaccess-1",level:3},{value:"getTarget()",id:"gettarget-2",level:3},{value:"PointerFieldAccess",id:"pointerfieldaccess",level:2},{value:"Methods",id:"methods-2",level:3},{value:"getAPrimaryQlClass()",id:"getaprimaryqlclass-2",level:3},{value:"PointerFieldAccess()",id:"pointerfieldaccess-1",level:3},{value:"DotFieldAccess",id:"dotfieldaccess",level:2},{value:"Methods",id:"methods-3",level:3},{value:"getAPrimaryQlClass()",id:"getaprimaryqlclass-3",level:3},{value:"DotFieldAccess()",id:"dotfieldaccess-1",level:3},{value:"ReferenceFieldAccess",id:"referencefieldaccess",level:2},{value:"Methods",id:"methods-4",level:3},{value:"getAPrimaryQlClass()",id:"getaprimaryqlclass-4",level:3},{value:"ReferenceFieldAccess()",id:"referencefieldaccess-1",level:3},{value:"ValueFieldAccess",id:"valuefieldaccess",level:2},{value:"Methods",id:"methods-5",level:3},{value:"getAPrimaryQlClass()",id:"getaprimaryqlclass-5",level:3},{value:"ValueFieldAccess()",id:"valuefieldaccess-1",level:3},{value:"TypeName",id:"typename",level:2},{value:"referenceConversion(Conversion c)",id:"referenceconversionconversion-c",level:2},{value:"exprHasReferenceConversion(Expr e)",id:"exprhasreferenceconversionexpr-e",level:2}];function h(e){const s={a:"a",code:"code",h1:"h1",h2:"h2",h3:"h3",header:"header",li:"li",p:"p",pre:"pre",ul:"ul",...(0,r.R)(),...e.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(s.header,{children:(0,n.jsx)(s.h1,{id:"access",children:"Access"})}),"\n",(0,n.jsx)(s.h2,{id:"classes",children:"Classes"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#access",children:"Access"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#variableaccess",children:"VariableAccess"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#fieldaccess",children:"FieldAccess"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#pointerfieldaccess",children:"PointerFieldAccess"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#dotfieldaccess",children:"DotFieldAccess"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#referencefieldaccess",children:"ReferenceFieldAccess"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#valuefieldaccess",children:"ValueFieldAccess"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#typename",children:"TypeName"})}),"\n"]}),"\n",(0,n.jsx)(s.h2,{id:"predicates",children:"Predicates"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#referenceconversionconversion-c",children:"referenceConversion(Conversion c)"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#exprhasreferenceconversionexpr-e",children:"exprHasReferenceConversion(Expr e)"})}),"\n"]}),"\n",(0,n.jsx)(s.h2,{id:"access-1",children:"Access"}),"\n",(0,n.jsx)(s.h3,{id:"methods",children:"Methods"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#access-",children:"Access()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#gettarget",children:"getTarget()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#maybeimpure",children:"mayBeImpure()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#maybegloballyimpure",children:"mayBeGloballyImpure()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#tostring",children:"toString()"})}),"\n"]}),"\n",(0,n.jsx)(s.h3,{id:"access-",children:"Access ()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"Access() { this instanceof Solidity::AssignmentExpression or \n    this instanceof Solidity::AugmentedAssignmentExpression or\n    this instanceof Solidity::EnumValue or\n    this instanceof Solidity::EnumDeclaration or\n    this instanceof Solidity::VariableDeclaration\n}\n"})}),"\n",(0,n.jsx)(s.h3,{id:"gettarget",children:"getTarget()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"Declaration getTarget() { none() } // overridden in subclasses\n"})}),"\n",(0,n.jsx)(s.p,{children:"Gets the accessed function, variable, or enum constant."}),"\n",(0,n.jsx)(s.h3,{id:"maybeimpure",children:"mayBeImpure()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"predicate mayBeImpure() { none() }\n"})}),"\n",(0,n.jsx)(s.h3,{id:"maybegloballyimpure",children:"mayBeGloballyImpure()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"predicate mayBeGloballyImpure() { none() }\n"})}),"\n",(0,n.jsx)(s.h3,{id:"tostring",children:"toString()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"override string toString() { none() }\n"})}),"\n",(0,n.jsx)(s.h2,{id:"variableaccess",children:"VariableAccess"}),"\n",(0,n.jsx)(s.h3,{id:"methods-and-predicates",children:"Methods and predicates"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#getaprimaryqlclass",children:"getAPrimaryQlClass()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#gettarget-1",children:"getTarget()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#isusedaslvalue",children:"isUsedAsLValue()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#ismodified",children:"isModified()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#isrvalue",children:"isRValue()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#getqualifier",children:"getQualifier()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#tostring-1",children:"toString()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#maybeimpure-1",children:"mayBeImpure()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#maybegloballyimpure-1",children:"mayBeGloballyImpure()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#isaddressofaccess",children:"isAddressOfAccess()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#isaddressofaccessnonconst",children:"isAddressOfAccessNonConst()"})}),"\n"]}),"\n",(0,n.jsx)(s.h3,{id:"getaprimaryqlclass",children:"getAPrimaryQlClass()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:'override string getAPrimaryQlClass() { result = "VariableAccess" }\n'})}),"\n",(0,n.jsx)(s.h3,{id:"gettarget-1",children:"getTarget()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"override Variable getTarget() { varbind(underlyingElement(this), unresolveElement(result)) }\n"})}),"\n",(0,n.jsx)(s.p,{children:"Gets the accessed variable."}),"\n",(0,n.jsx)(s.h3,{id:"isusedaslvalue",children:"isUsedAsLValue()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"predicate isUsedAsLValue() {\n    exists(Assignment a | a.getLValue() = this) or\n    exists(CrementOperation c | c.getOperand() = this) \n}\n"})}),"\n",(0,n.jsx)(s.p,{children:"Holds if this variable access is providing an LValue in a meaningful way.\nFor example, this includes accesses on the left-hand side of an assignment.\nIt does not include accesses on the right-hand side of an assignment, even if they could appear on the left-hand side of some assignment."}),"\n",(0,n.jsx)(s.h3,{id:"ismodified",children:"isModified()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"  predicate isModified() {\n    exists(Solidity::AssignmentExpression a | a.getLeft().getChild() = )\n    or\n    exists(CrementOperation c | c.getOperand() = this)\n}\n"})}),"\n",(0,n.jsx)(s.p,{children:"Holds if this variable access is in a position where it is (directly) modified,\nfor instance by an assignment or increment/decrement operator."}),"\n",(0,n.jsx)(s.h3,{id:"isrvalue",children:"isRValue()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"predicate isRValue() {\n    not exists(AssignExpr ae | ae.getLValue() = this) and\n    not exists(AddressOfExpr addof | addof.getOperand() = this) and\n    not this.getConversion() instanceof ReferenceToExpr and\n    not this.getConversion() instanceof ArrayToPointerConversion\n}\n"})}),"\n",(0,n.jsx)(s.p,{children:"Holds if this variable access is an rvalue."}),"\n",(0,n.jsx)(s.h3,{id:"getqualifier",children:"getQualifier()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"Expr getQualifier() { this.getChild(-1) = result }\n"})}),"\n",(0,n.jsx)(s.p,{children:"Gets the expression generating the variable being accessed."}),"\n",(0,n.jsxs)(s.p,{children:["As a few examples:\nFor ",(0,n.jsx)(s.code,{children:"ptr->x"}),", this gives ",(0,n.jsx)(s.code,{children:"ptr"}),".\nFor ",(0,n.jsx)(s.code,{children:"(*ptr).x"}),", this gives ",(0,n.jsx)(s.code,{children:"(*ptr)"}),".\nFor ",(0,n.jsx)(s.code,{children:"smart_ptr->x"}),", this gives the call to ",(0,n.jsx)(s.code,{children:"operator->"}),"."]}),"\n",(0,n.jsx)(s.p,{children:'This applies mostly to FieldAccesses, but also to static member variables accessed\n"through" a pointer. Note that it does NOT apply to static member variables accessed\nthrough a type name, as in that case the type name is a qualifier on the variable\nrather than a qualifier on the access.'}),"\n",(0,n.jsx)(s.h3,{id:"tostring-1",children:"toString()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:'override string toString() {\n    if exists(this.getTarget())\n    then result = this.getTarget().getName()\n    else result = "variable access"\n}\n'})}),"\n",(0,n.jsx)(s.p,{children:"Gets a textual representation of this variable access."}),"\n",(0,n.jsx)(s.h3,{id:"maybeimpure-1",children:"mayBeImpure()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"  override predicate mayBeImpure() {\n    this.getQualifier().mayBeImpure() or\n    this.getTarget().getType().isVolatile()\n}\n"})}),"\n",(0,n.jsx)(s.h3,{id:"maybegloballyimpure-1",children:"mayBeGloballyImpure()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"override predicate mayBeGloballyImpure() {\n    this.getQualifier().mayBeGloballyImpure() or\n    this.getTarget().getType().isVolatile()\n}\n"})}),"\n",(0,n.jsx)(s.h3,{id:"isaddressofaccess",children:"isAddressOfAccess()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"predicate isAddressOfAccess() { variableAddressEscapesTree(this, _) }\n"})}),"\n",(0,n.jsxs)(s.p,{children:["Holds if this access is used to get the address of the underlying variable\nin such a way that the address might escape. This can be either explicit,\nfor example ",(0,n.jsx)(s.code,{children:"&x"}),", or implicit, for example ",(0,n.jsx)(s.code,{children:"T& y = x"}),"."]}),"\n",(0,n.jsx)(s.h3,{id:"isaddressofaccessnonconst",children:"isAddressOfAccessNonConst()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"predicate isAddressOfAccessNonConst() { variableAddressEscapesTreeNonConst(this, _) }\n"})}),"\n",(0,n.jsxs)(s.p,{children:["Holds if this access is used to get the address of the underlying variable in such a way that the address might escape as a pointer or reference to non-const data. This can be either explicit, for example ",(0,n.jsx)(s.code,{children:"&x"}),", or implicit, for example ",(0,n.jsx)(s.code,{children:"T& y = x"}),"."]}),"\n",(0,n.jsx)(s.h2,{id:"fieldaccess",children:"FieldAccess"}),"\n",(0,n.jsx)(s.h3,{id:"methods-1",children:"Methods"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#getaprimaryqlclass-1",children:"getAPrimaryQlClass()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#fieldaccess-1",children:"FieldAccess()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#gettarget-2",children:"getTarget()"})}),"\n"]}),"\n",(0,n.jsx)(s.h3,{id:"getaprimaryqlclass-1",children:"getAPrimaryQlClass()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:'override string getAPrimaryQlClass() { result = "FieldAccess" }\n'})}),"\n",(0,n.jsx)(s.h3,{id:"fieldaccess-1",children:"FieldAccess()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"FieldAccess() { exists(Field f | varbind(underlyingElement(this), unresolveElement(f))) }\n"})}),"\n",(0,n.jsx)(s.h3,{id:"gettarget-2",children:"getTarget()"}),"\n",(0,n.jsx)(s.p,{children:"Gets the accessed field."}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"override Field getTarget() { result = super.getTarget() }\n"})}),"\n",(0,n.jsx)(s.h2,{id:"pointerfieldaccess",children:"PointerFieldAccess"}),"\n",(0,n.jsxs)(s.p,{children:["A field access whose qualifier is a pointer to a class, struct or union.\nThese typically take the form ",(0,n.jsx)(s.code,{children:"obj->field"}),". Another case is a field access\nwith an implicit ",(0,n.jsx)(s.code,{children:"this->"})," qualifier, which is often a ",(0,n.jsx)(s.code,{children:"PointerFieldAccess"}),"\n(but see also ",(0,n.jsx)(s.code,{children:"ImplicitThisFieldAccess"}),")."]}),"\n",(0,n.jsxs)(s.p,{children:["For example the accesses to ",(0,n.jsx)(s.code,{children:"x"})," and ",(0,n.jsx)(s.code,{children:"y"})," in ",(0,n.jsx)(s.code,{children:"myMethod"})," in the following code\nare each a ",(0,n.jsx)(s.code,{children:"PointerFieldAccess"}),":"]}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"class MyClass {\npublic:\n  void myMethod(MyClass *other) {\n      other->x = y;\n  }\n *\n  int x, y;\n};\n"})}),"\n",(0,n.jsx)(s.h3,{id:"methods-2",children:"Methods"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#getaprimaryqlclass-2",children:"getAPrimaryQlClass()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#pointerfieldaccess-1",children:"PointerFieldAccess()"})}),"\n"]}),"\n",(0,n.jsx)(s.h3,{id:"getaprimaryqlclass-2",children:"getAPrimaryQlClass()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:'override string getAPrimaryQlClass() { result = "PointerFieldAccess" }\n'})}),"\n",(0,n.jsx)(s.h3,{id:"pointerfieldaccess-1",children:"PointerFieldAccess()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"PointerFieldAccess() {\n    exists(PointerType t |\n      t = this.getQualifier().getFullyConverted().getUnspecifiedType() and\n      t.getBaseType() instanceof Class\n    )\n}\n"})}),"\n",(0,n.jsx)(s.h2,{id:"dotfieldaccess",children:"DotFieldAccess"}),"\n",(0,n.jsxs)(s.p,{children:["A field access of the form ",(0,n.jsx)(s.code,{children:"obj.field"}),". The type of ",(0,n.jsx)(s.code,{children:"obj"})," is either a\nclass/struct/union or a reference to one. ",(0,n.jsx)(s.code,{children:"DotFieldAccess"})," has two\nsub-classes, ",(0,n.jsx)(s.code,{children:"ValueFieldAccess"})," and ",(0,n.jsx)(s.code,{children:"ReferenceFieldAccess"}),", to\ndistinguish whether or not the type of ",(0,n.jsx)(s.code,{children:"obj"})," is a reference type."]}),"\n",(0,n.jsx)(s.h3,{id:"methods-3",children:"Methods"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#getaprimaryqlclass-3",children:"getAPrimaryQlClass()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#dotfieldaccess-1",children:"DotFieldAccess()"})}),"\n"]}),"\n",(0,n.jsx)(s.h3,{id:"getaprimaryqlclass-3",children:"getAPrimaryQlClass()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:'override string getAPrimaryQlClass() { result = "DotFieldAccess" }\n'})}),"\n",(0,n.jsx)(s.h3,{id:"dotfieldaccess-1",children:"DotFieldAccess()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"DotFieldAccess() { this.getQualifier().getFullyConverted().getUnspecifiedType() instanceof Class }\n"})}),"\n",(0,n.jsx)(s.h2,{id:"referencefieldaccess",children:"ReferenceFieldAccess"}),"\n",(0,n.jsxs)(s.p,{children:["A field access of the form ",(0,n.jsx)(s.code,{children:"obj.field"}),", where the type of ",(0,n.jsx)(s.code,{children:"obj"})," is a\nreference to a class/struct/union. For example the accesses to ",(0,n.jsx)(s.code,{children:"y"})," in\n",(0,n.jsx)(s.code,{children:"myMethod"})," in the following code:"]}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"class MyClass {\npublic:\n  void myMethod(MyClass a, MyClass &b) {\n    a.x = b.y;\n  }\n *\n  int x, y;\n};\n"})}),"\n",(0,n.jsx)(s.h3,{id:"methods-4",children:"Methods"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#getaprimaryqlclass-4",children:"getAPrimaryQlClass()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#referencefieldaccess-1",children:"ReferenceFieldAccess()"})}),"\n"]}),"\n",(0,n.jsx)(s.h3,{id:"getaprimaryqlclass-4",children:"getAPrimaryQlClass()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:'override string getAPrimaryQlClass() { result = "ReferenceFieldAccess" }\n'})}),"\n",(0,n.jsx)(s.h3,{id:"referencefieldaccess-1",children:"ReferenceFieldAccess()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"ReferenceFieldAccess() { exprHasReferenceConversion(this.getQualifier()) }\n"})}),"\n",(0,n.jsx)(s.h2,{id:"valuefieldaccess",children:"ValueFieldAccess"}),"\n",(0,n.jsxs)(s.p,{children:["A field access of the form ",(0,n.jsx)(s.code,{children:"obj.field"}),", where the type of ",(0,n.jsx)(s.code,{children:"obj"})," is a\nclass/struct/union (and not a reference). For example the accesses to ",(0,n.jsx)(s.code,{children:"x"}),"\nin ",(0,n.jsx)(s.code,{children:"myMethod"})," in the following code:"]}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"class MyClass {\npublic:\n  void myMethod(MyClass a, MyClass &b) {\n    a.x = b.y;\n  }\n\n  int x, y;\n};\n"})}),"\n",(0,n.jsx)(s.h3,{id:"methods-5",children:"Methods"}),"\n",(0,n.jsxs)(s.ul,{children:["\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#getaprimaryqlclass-5",children:"getAPrimaryQlClass()"})}),"\n",(0,n.jsx)(s.li,{children:(0,n.jsx)(s.a,{href:"#valuefieldaccess-1",children:"ValueFieldAccess()"})}),"\n"]}),"\n",(0,n.jsx)(s.h3,{id:"getaprimaryqlclass-5",children:"getAPrimaryQlClass()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:'override string getAPrimaryQlClass() { result = "ValueFieldAccess" }\n'})}),"\n",(0,n.jsx)(s.h3,{id:"valuefieldaccess-1",children:"ValueFieldAccess()"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"ValueFieldAccess() { not exprHasReferenceConversion(this.getQualifier()) }\n"})}),"\n",(0,n.jsx)(s.h2,{id:"typename",children:"TypeName"}),"\n",(0,n.jsx)(s.p,{children:"Not implemented yet."}),"\n",(0,n.jsx)(s.h2,{id:"referenceconversionconversion-c",children:"referenceConversion(Conversion c)"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"private predicate referenceConversion(Conversion c) {\n  c.getType() = c.getExpr().getType().(ReferenceType).getBaseType()\n}\n"})}),"\n",(0,n.jsxs)(s.p,{children:["Holds if ",(0,n.jsx)(s.code,{children:"c"})," is a conversion from type ",(0,n.jsx)(s.code,{children:"T&"})," to ",(0,n.jsx)(s.code,{children:"T"})," (or from ",(0,n.jsx)(s.code,{children:"T&&"})," to ",(0,n.jsx)(s.code,{children:"T"}),")."]}),"\n",(0,n.jsx)(s.h2,{id:"exprhasreferenceconversionexpr-e",children:"exprHasReferenceConversion(Expr e)"}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"private predicate exprHasReferenceConversion(Expr e) { referenceConversion(e.getConversion+()) }\n\n"})}),"\n",(0,n.jsxs)(s.p,{children:["Holds if ",(0,n.jsx)(s.code,{children:"e"})," is a reference expression (that is, it has a type of the form ",(0,n.jsx)(s.code,{children:"T&"}),"), which is converted to a value. For example:"]}),"\n",(0,n.jsx)(s.pre,{children:(0,n.jsx)(s.code,{children:"int myfcn(MyStruct &x) {\n  return x.field;\n}\n"})}),"\n",(0,n.jsxs)(s.p,{children:["In this example, the type of ",(0,n.jsx)(s.code,{children:"x"})," is ",(0,n.jsx)(s.code,{children:"MyStruct&"}),", but it gets implicitly converted to ",(0,n.jsx)(s.code,{children:"MyStruct"})," in the expression ",(0,n.jsx)(s.code,{children:"x.field"}),"."]})]})}function o(e={}){const{wrapper:s}={...(0,r.R)(),...e.components};return s?(0,n.jsx)(s,{...e,children:(0,n.jsx)(h,{...e})}):h(e)}},1503:(e,s,i)=>{i.d(s,{R:()=>c,x:()=>d});var n=i(758);const r={},l=n.createContext(r);function c(e){const s=n.useContext(l);return n.useMemo((function(){return"function"==typeof e?e(s):{...s,...e}}),[s,e])}function d(e){let s;return s=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:c(e.components),n.createElement(l.Provider,{value:s},e.children)}}}]);