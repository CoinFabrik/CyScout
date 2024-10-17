"use strict";(self.webpackChunkcyscout=self.webpackChunkcyscout||[]).push([[50],{615:(t,e,n)=>{n.r(e),n.d(e,{assets:()=>r,contentTitle:()=>c,default:()=>a,frontMatter:()=>l,metadata:()=>d,toc:()=>o});var s=n(6070),i=n(1503);const l={},c="Block Statement",d={id:"Classes/Block",title:"Block Statement",description:"Implements a class to model a solidity block statement",source:"@site/docs/Classes/Block.md",sourceDirName:"Classes",slug:"/Classes/Block",permalink:"/CyScout/Classes/Block",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"BasicBlock",permalink:"/CyScout/Classes/BasicBlock"},next:{title:"Call",permalink:"/CyScout/Classes/Call"}},r={},o=[{value:"Methods",id:"methods",level:2},{value:"getAStmt()",id:"getastmt",level:3},{value:"getStmt(int n)",id:"getstmtint-n",level:3},{value:"getLastStmt()",id:"getlaststmt",level:3},{value:"getLastStmtIn()",id:"getlaststmtin",level:3},{value:"getNumStmt()",id:"getnumstmt",level:3},{value:"isEmpty()",id:"isempty",level:3},{value:"getIndexOfStmt(Stmt s)",id:"getindexofstmtstmt-s",level:3}];function h(t){const e={code:"code",h1:"h1",h2:"h2",h3:"h3",header:"header",li:"li",p:"p",pre:"pre",ul:"ul",...(0,i.R)(),...t.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsx)(e.header,{children:(0,s.jsx)(e.h1,{id:"block-statement",children:"Block Statement"})}),"\n",(0,s.jsx)(e.p,{children:"Implements a class to model a solidity block statement"}),"\n",(0,s.jsx)(e.h2,{id:"methods",children:"Methods"}),"\n",(0,s.jsxs)(e.ul,{children:["\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"getAStmt()"})}),"\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"getStmt(int n)"})}),"\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"getLastStmt()"})}),"\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"getLastStmtIn()"})}),"\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"getNumStmt()"})}),"\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"isEmpty()"})}),"\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"getIndexOfStmt(Stmt s)"})}),"\n",(0,s.jsx)(e.li,{children:(0,s.jsx)(e.code,{children:"toString()"})}),"\n"]}),"\n",(0,s.jsx)(e.h3,{id:"getastmt",children:"getAStmt()"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"Stmt getAStmt() { result = this.getAFieldOrChild() }\n"})}),"\n",(0,s.jsx)(e.p,{children:"Gets a body statement of this block."}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,s.jsxs)(e.p,{children:[(0,s.jsx)(e.code,{children:"getAStmt()"})," would have 3 results, for the declarations of ",(0,s.jsx)(e.code,{children:"a"})," and ",(0,s.jsx)(e.code,{children:"b"})," and for the expression statement ",(0,s.jsx)(e.code,{children:"a = b"}),"."]}),"\n",(0,s.jsx)(e.h3,{id:"getstmtint-n",children:"getStmt(int n)"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"Stmt getStmt(int n) { result = this.getChild(n) }\n"})}),"\n",(0,s.jsxs)(e.p,{children:["Gets the ",(0,s.jsx)(e.code,{children:"n"}),"th body statement of this block, indexed from 0.. For example, for the block"]}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,s.jsxs)(e.p,{children:[(0,s.jsx)(e.code,{children:"getStmt(2)"})," result is the expression statement ",(0,s.jsx)(e.code,{children:"a = b"}),"."]}),"\n",(0,s.jsx)(e.h3,{id:"getlaststmt",children:"getLastStmt()"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"Stmt getLastStmt() { result = this.getStmt(this.getNumStmt() - 1) }\n"})}),"\n",(0,s.jsx)(e.p,{children:"Gets the last body statement of this block. For example, for the block"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,s.jsxs)(e.p,{children:[(0,s.jsx)(e.code,{children:"getLastStmt()"})," returns the expression statement ",(0,s.jsx)(e.code,{children:"a = b"}),"."]}),"\n",(0,s.jsx)(e.h3,{id:"getlaststmtin",children:"getLastStmtIn()"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"Stmt getLastStmtIn() {\n    if this.getLastStmt().getChild() instanceof BlockStmt\n    then result = this.getLastStmt().getChild().(BlockStmt).getLastStmtIn()\n    else result = this.getLastStmt()\n}\n"})}),"\n",(0,s.jsx)(e.p,{children:"Gets the last body statement of the block. If the last statement\nis itself a block, returns the last statement of that block, and so on. For example, for the block"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"{ int a; int b = 1; { a = b; } }\n"})}),"\n",(0,s.jsxs)(e.p,{children:[(0,s.jsx)(e.code,{children:"getLastStmtIn()"})," results in the expression statement ",(0,s.jsx)(e.code,{children:"a = b"}),"."]}),"\n",(0,s.jsx)(e.h3,{id:"getnumstmt",children:"getNumStmt()"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"int getNumStmt() { result = count(this.getAStmt()) }\n"})}),"\n",(0,s.jsx)(e.p,{children:"Gets the number of body statements in this block. For example, for the block"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,s.jsxs)(e.p,{children:[(0,s.jsx)(e.code,{children:"getNumStmt()"})," gives 3."]}),"\n",(0,s.jsx)(e.h3,{id:"isempty",children:"isEmpty()"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"predicate isEmpty() { this.getNumStmt() = 0 }\n"})}),"\n",(0,s.jsx)(e.p,{children:"Holds if the block has no statements. For the block"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"{// a comment}\n"})}),"\n",(0,s.jsx)(e.p,{children:"It returns True."}),"\n",(0,s.jsx)(e.h3,{id:"getindexofstmtstmt-s",children:"getIndexOfStmt(Stmt s)"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"int getIndexOfStmt(Stmt s) { this.getStmt(result) = s }\n"})}),"\n",(0,s.jsx)(e.p,{children:"Gets the index of the given statement within this block, indexed from 0. For example, for the block"}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"{ int a; int b = 1; a = b; }\n"})}),"\n",(0,s.jsxs)(e.p,{children:["if ",(0,s.jsx)(e.code,{children:"s"})," is the expression statement ",(0,s.jsx)(e.code,{children:"a = b"})," then ",(0,s.jsx)(e.code,{children:"getIndexOfStmt(s)"}),"\nhas result 2."]})]})}function a(t={}){const{wrapper:e}={...(0,i.R)(),...t.components};return e?(0,s.jsx)(e,{...t,children:(0,s.jsx)(h,{...t})}):h(t)}},1503:(t,e,n)=>{n.d(e,{R:()=>c,x:()=>d});var s=n(758);const i={},l=s.createContext(i);function c(t){const e=s.useContext(l);return s.useMemo((function(){return"function"==typeof t?t(e):{...e,...t}}),[e,t])}function d(t){let e;return e=t.disableParentContext?"function"==typeof t.components?t.components(i):t.components||i:c(t.components),s.createElement(l.Provider,{value:e},t.children)}}}]);