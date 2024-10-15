"use strict";(self.webpackChunkcodeql_research=self.webpackChunkcodeql_research||[]).push([[50],{615:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>r,contentTitle:()=>c,default:()=>a,frontMatter:()=>i,metadata:()=>d,toc:()=>o});var n=s(6070),l=s(1503);const i={},c="Block Statement",d={id:"Classes/Block",title:"Block Statement",description:"Implements a class to model a solidity block statement",source:"@site/docs/Classes/Block.md",sourceDirName:"Classes",slug:"/Classes/Block",permalink:"/docs/Classes/Block",draft:!1,unlisted:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/Classes/Block.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"BasicBlock",permalink:"/docs/Classes/BasicBlock"},next:{title:"Call",permalink:"/docs/Classes/Call"}},r={},o=[{value:"Methods",id:"methods",level:2},{value:"getAStmt()",id:"getastmt",level:3},{value:"getStmt(int n)",id:"getstmtint-n",level:3},{value:"getLastStmt()",id:"getlaststmt",level:3},{value:"getLastStmtIn()",id:"getlaststmtin",level:3},{value:"getNumStmt()",id:"getnumstmt",level:3},{value:"isEmpty()",id:"isempty",level:3},{value:"getIndexOfStmt(Stmt s)",id:"getindexofstmtstmt-s",level:3}];function h(e){const t={code:"code",h1:"h1",h2:"h2",h3:"h3",header:"header",li:"li",p:"p",pre:"pre",ul:"ul",...(0,l.R)(),...e.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(t.header,{children:(0,n.jsx)(t.h1,{id:"block-statement",children:"Block Statement"})}),"\n",(0,n.jsx)(t.p,{children:"Implements a class to model a solidity block statement"}),"\n",(0,n.jsx)(t.h2,{id:"methods",children:"Methods"}),"\n",(0,n.jsxs)(t.ul,{children:["\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"getAStmt()"})}),"\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"getStmt(int n)"})}),"\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"getLastStmt()"})}),"\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"getLastStmtIn()"})}),"\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"getNumStmt()"})}),"\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"isEmpty()"})}),"\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"getIndexOfStmt(Stmt s)"})}),"\n",(0,n.jsx)(t.li,{children:(0,n.jsx)(t.code,{children:"toString()"})}),"\n"]}),"\n",(0,n.jsx)(t.h3,{id:"getastmt",children:"getAStmt()"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"Stmt getAStmt() { result = this.getAFieldOrChild() }\n"})}),"\n",(0,n.jsx)(t.p,{children:"Gets a body statement of this block."}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,n.jsxs)(t.p,{children:[(0,n.jsx)(t.code,{children:"getAStmt()"})," would have 3 results, for the declarations of ",(0,n.jsx)(t.code,{children:"a"})," and ",(0,n.jsx)(t.code,{children:"b"})," and for the expression statement ",(0,n.jsx)(t.code,{children:"a = b"}),"."]}),"\n",(0,n.jsx)(t.h3,{id:"getstmtint-n",children:"getStmt(int n)"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"Stmt getStmt(int n) { result = this.getChild(n) }\n"})}),"\n",(0,n.jsxs)(t.p,{children:["Gets the ",(0,n.jsx)(t.code,{children:"n"}),"th body statement of this block, indexed from 0.. For example, for the block"]}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,n.jsxs)(t.p,{children:[(0,n.jsx)(t.code,{children:"getStmt(2)"})," result is the expression statement ",(0,n.jsx)(t.code,{children:"a = b"}),"."]}),"\n",(0,n.jsx)(t.h3,{id:"getlaststmt",children:"getLastStmt()"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"Stmt getLastStmt() { result = this.getStmt(this.getNumStmt() - 1) }\n"})}),"\n",(0,n.jsx)(t.p,{children:"Gets the last body statement of this block. For example, for the block"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,n.jsxs)(t.p,{children:[(0,n.jsx)(t.code,{children:"getLastStmt()"})," returns the expression statement ",(0,n.jsx)(t.code,{children:"a = b"}),"."]}),"\n",(0,n.jsx)(t.h3,{id:"getlaststmtin",children:"getLastStmtIn()"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"Stmt getLastStmtIn() {\n    if this.getLastStmt().getChild() instanceof BlockStmt\n    then result = this.getLastStmt().getChild().(BlockStmt).getLastStmtIn()\n    else result = this.getLastStmt()\n}\n"})}),"\n",(0,n.jsx)(t.p,{children:"Gets the last body statement of the block. If the last statement\nis itself a block, returns the last statement of that block, and so on. For example, for the block"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"{ int a; int b = 1; { a = b; } }\n"})}),"\n",(0,n.jsxs)(t.p,{children:[(0,n.jsx)(t.code,{children:"getLastStmtIn()"})," results in the expression statement ",(0,n.jsx)(t.code,{children:"a = b"}),"."]}),"\n",(0,n.jsx)(t.h3,{id:"getnumstmt",children:"getNumStmt()"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"int getNumStmt() { result = count(this.getAStmt()) }\n"})}),"\n",(0,n.jsx)(t.p,{children:"Gets the number of body statements in this block. For example, for the block"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,n.jsxs)(t.p,{children:[(0,n.jsx)(t.code,{children:"getNumStmt()"})," gives 3."]}),"\n",(0,n.jsx)(t.h3,{id:"isempty",children:"isEmpty()"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"predicate isEmpty() { this.getNumStmt() = 0 }\n"})}),"\n",(0,n.jsx)(t.p,{children:"Holds if the block has no statements. For the block"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"{// a comment}\n"})}),"\n",(0,n.jsx)(t.p,{children:"It returns True."}),"\n",(0,n.jsx)(t.h3,{id:"getindexofstmtstmt-s",children:"getIndexOfStmt(Stmt s)"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"int getIndexOfStmt(Stmt s) { this.getStmt(result) = s }\n"})}),"\n",(0,n.jsx)(t.p,{children:"Gets the index of the given statement within this block, indexed from 0. For example, for the block"}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,n.jsxs)(t.p,{children:["if ",(0,n.jsx)(t.code,{children:"s"})," is the expression statement ",(0,n.jsx)(t.code,{children:"a = b"})," then ",(0,n.jsx)(t.code,{children:"getIndexOfStmt(s)"}),"\nhas result 2."]})]})}function a(e={}){const{wrapper:t}={...(0,l.R)(),...e.components};return t?(0,n.jsx)(t,{...e,children:(0,n.jsx)(h,{...e})}):h(e)}},1503:(e,t,s)=>{s.d(t,{R:()=>c,x:()=>d});var n=s(758);const l={},i=n.createContext(l);function c(e){const t=n.useContext(i);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function d(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(l):e.components||l:c(e.components),n.createElement(i.Provider,{value:t},e.children)}}}]);