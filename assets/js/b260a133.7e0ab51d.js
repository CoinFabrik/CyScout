"use strict";(self.webpackChunkcyscout=self.webpackChunkcyscout||[]).push([[41],{6921:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>l,contentTitle:()=>i,default:()=>h,frontMatter:()=>r,metadata:()=>c,toc:()=>a});var o=n(6070),s=n(1503);const r={},i="Contribute",c={id:"Contributing",title:"Contribute",description:"Thank you for your interest in contributing to the development of new detectors.",source:"@site/docs/Contributing.md",sourceDirName:".",slug:"/Contributing",permalink:"/CyScout/Contributing",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Variable",permalink:"/CyScout/Classes/Variable"},next:{title:"Detectors",permalink:"/CyScout/Detectors/"}},l={},a=[{value:"Getting Started",id:"getting-started",level:3},{value:"Detectors",id:"detectors",level:3},{value:"Test Cases",id:"test-cases",level:3}];function d(e){const t={a:"a",code:"code",h1:"h1",h3:"h3",header:"header",li:"li",ol:"ol",p:"p",strong:"strong",ul:"ul",...(0,s.R)(),...e.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsx)(t.header,{children:(0,o.jsx)(t.h1,{id:"contribute",children:"Contribute"})}),"\n",(0,o.jsx)(t.p,{children:"Thank you for your interest in contributing to the development of new detectors."}),"\n",(0,o.jsx)(t.h3,{id:"getting-started",children:"Getting Started"}),"\n",(0,o.jsxs)(t.p,{children:["Create a new issue on our ",(0,o.jsx)(t.a,{href:"https://github.com/CoinFabrik/CyScout",children:"repository"})," with the name of the new detector or test case you wish to contribute. Then, link a new branch to that issue."]}),"\n",(0,o.jsx)(t.h3,{id:"detectors",children:"Detectors"}),"\n",(0,o.jsx)(t.p,{children:"In order to build a custom detector, you need to first import all static analysis primitives you need to use."}),"\n",(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsxs)(t.li,{children:["\n",(0,o.jsxs)(t.p,{children:[(0,o.jsx)(t.code,{children:"import codeql.solidity.ast.AST"})," for AST language constructs (binary, unary and tertiary operations, control statements, loops, functions, contracts, etc.)"]}),"\n"]}),"\n",(0,o.jsxs)(t.li,{children:["\n",(0,o.jsxs)(t.p,{children:[(0,o.jsx)(t.code,{children:"import codeql.solidity.controlflow.ControlFlowGraph"})," for CFG constructs (SSA, basic blocks, control flow nodes, etc.)"]}),"\n"]}),"\n",(0,o.jsxs)(t.li,{children:["\n",(0,o.jsxs)(t.p,{children:[(0,o.jsx)(t.code,{children:"import codeql.solidity.dataflow.DataFlow"})," for DFA constructs (to define sinks and sources for local flow analysis)"]}),"\n"]}),"\n"]}),"\n",(0,o.jsx)(t.p,{children:"For global data flow analysis, you must write a class that implements DataFlow::ConfigSig. Refer to our global flow example or to the official codeQL guide for more information on this specific case."}),"\n",(0,o.jsx)(t.h3,{id:"test-cases",children:"Test Cases"}),"\n",(0,o.jsx)(t.p,{children:"When you create a new detector, please also add a new test case. To add a new one:"}),"\n",(0,o.jsxs)(t.ol,{children:["\n",(0,o.jsxs)(t.li,{children:["\n",(0,o.jsxs)(t.p,{children:["Create a new folder in the ",(0,o.jsx)(t.a,{href:"https://github.com/CoinFabrik/stacy/tree/main/tests",children:(0,o.jsx)(t.code,{children:"tests"})})," directory. ",(0,o.jsx)(t.strong,{children:"Remember to follow the snake_case/underscore naming convention for the folder name"}),"."]}),"\n"]}),"\n",(0,o.jsxs)(t.li,{children:["\n",(0,o.jsxs)(t.p,{children:["Within this folder, create two directories: ",(0,o.jsx)(t.code,{children:"vulnerable-example"})," and ",(0,o.jsx)(t.code,{children:"remediated-example"}),". Fill each with the relevant files for their respective test cases."]}),"\n"]}),"\n"]}),"\n",(0,o.jsxs)(t.p,{children:["For guidance, refer to the ",(0,o.jsx)(t.code,{children:"detector_name"})," template in ",(0,o.jsx)(t.a,{href:"https://github.com/CoinFabrik/stacy/tree/main/templates/tests",children:(0,o.jsx)(t.code,{children:"templates/test-case"})}),"."]})]})}function h(e={}){const{wrapper:t}={...(0,s.R)(),...e.components};return t?(0,o.jsx)(t,{...e,children:(0,o.jsx)(d,{...e})}):d(e)}},1503:(e,t,n)=>{n.d(t,{R:()=>i,x:()=>c});var o=n(758);const s={},r=o.createContext(s);function i(e){const t=o.useContext(r);return o.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function c(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:i(e.components),o.createElement(r.Provider,{value:t},e.children)}}}]);