"use strict";(self.webpackChunkcodeql_research=self.webpackChunkcodeql_research||[]).push([[808],{1636:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>c,contentTitle:()=>o,default:()=>m,frontMatter:()=>l,metadata:()=>r,toc:()=>d});var s=t(6070),i=t(1503);const l={},o="Enclosing",r={id:"Classes/Enclosing",title:"Enclosing",description:"Provides predicates for finding the smallest element that encloses an expression or statement.",source:"@site/docs/Classes/Enclosing.md",sourceDirName:"Classes",slug:"/Classes/Enclosing",permalink:"/CyScout/Classes/Enclosing",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Control Flow Graph",permalink:"/CyScout/Classes/ControlFlowGraph"},next:{title:"Function",permalink:"/CyScout/Classes/Function"}},c={},d=[{value:"Functions",id:"functions",level:2},{value:"stmtEnclosingElement(Solidity::Statement s)",id:"stmtenclosingelementsoliditystatement-s",level:2},{value:"exprEnclosingElement(Solidity::Expression e)",id:"exprenclosingelementsolidityexpression-e",level:2}];function a(e){const n={a:"a",code:"code",h1:"h1",h2:"h2",header:"header",li:"li",p:"p",pre:"pre",ul:"ul",...(0,i.R)(),...e.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsx)(n.header,{children:(0,s.jsx)(n.h1,{id:"enclosing",children:"Enclosing"})}),"\n",(0,s.jsx)(n.p,{children:"Provides predicates for finding the smallest element that encloses an expression or statement."}),"\n",(0,s.jsx)(n.h2,{id:"functions",children:"Functions"}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:(0,s.jsx)(n.a,{href:"#stmtenclosingelementsoliditystatement-s",children:"stmtEnclosingElement(Solidity::Statement s)"})}),"\n",(0,s.jsx)(n.li,{children:(0,s.jsx)(n.a,{href:"#exprenclosingelementsolidityexpression-e",children:"exprEnclosingElement(Solidity::Expression e)"})}),"\n"]}),"\n",(0,s.jsx)(n.h2,{id:"stmtenclosingelementsoliditystatement-s",children:"stmtEnclosingElement(Solidity::Statement s)"}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{children:"AstNode stmtEnclosingElement(Solidity::Statement s) {\n  result.(Solidity::FunctionDefinition).getBody().getChild(_) = s or\n  result = stmtEnclosingElement(s.getParent()) or\n  result = exprEnclosingElement(s.getParent())\n}\n"})}),"\n",(0,s.jsxs)(n.p,{children:["Gets the enclosing element of statement ",(0,s.jsx)(n.code,{children:"s"}),"."]}),"\n",(0,s.jsx)(n.h2,{id:"exprenclosingelementsolidityexpression-e",children:"exprEnclosingElement(Solidity::Expression e)"}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{children:"AstNode exprEnclosingElement(Solidity::Expression e) {\n  result = exprEnclosingElement(e.getParent())\n  or\n  result = stmtEnclosingElement(e.getParent())\n  or\n  result.(Solidity::FunctionBody) = e.getParent()\n}\n"})}),"\n",(0,s.jsxs)(n.p,{children:["Gets the enclosing element of expression ",(0,s.jsx)(n.code,{children:"e"}),"."]})]})}function m(e={}){const{wrapper:n}={...(0,i.R)(),...e.components};return n?(0,s.jsx)(n,{...e,children:(0,s.jsx)(a,{...e})}):a(e)}},1503:(e,n,t)=>{t.d(n,{R:()=>o,x:()=>r});var s=t(758);const i={},l=s.createContext(i);function o(e){const n=s.useContext(l);return s.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function r(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:o(e.components),s.createElement(l.Provider,{value:n},e.children)}}}]);