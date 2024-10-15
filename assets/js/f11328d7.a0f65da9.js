"use strict";(self.webpackChunkcodeql_research=self.webpackChunkcodeql_research||[]).push([[221],{1143:(e,r,n)=>{n.r(r),n.d(r,{assets:()=>i,contentTitle:()=>o,default:()=>u,frontMatter:()=>a,metadata:()=>c,toc:()=>l});var t=n(6070),s=n(1503);const a={},o=void 0,c={id:"Detectors/transfer-from",title:"transfer-from",description:"transfer-from uses arbitrary from",source:"@site/docs/Detectors/transfer-from.md",sourceDirName:"Detectors",slug:"/Detectors/transfer-from",permalink:"/CyScout/Detectors/transfer-from",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"msg-value-in-for-loop",permalink:"/CyScout/Detectors/msg-value-in-for-loop"},next:{title:"Unchecked Send",permalink:"/CyScout/Detectors/unchecked-send"}},i={},l=[{value:"transfer-from uses arbitrary <code>from</code>",id:"transfer-from-uses-arbitrary-from",level:2},{value:"Usage",id:"usage",level:2},{value:"Description",id:"description",level:2},{value:"Recomendation",id:"recomendation",level:3},{value:"Example",id:"example",level:2},{value:"Vulnerable",id:"vulnerable",level:3},{value:"Fixed",id:"fixed",level:3}];function d(e){const r={a:"a",code:"code",h2:"h2",h3:"h3",p:"p",pre:"pre",...(0,s.R)(),...e.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsxs)(r.h2,{id:"transfer-from-uses-arbitrary-from",children:["transfer-from uses arbitrary ",(0,t.jsx)(r.code,{children:"from"})]}),"\n",(0,t.jsx)(r.h2,{id:"usage",children:"Usage"}),"\n",(0,t.jsx)(r.pre,{children:(0,t.jsx)(r.code,{className:"language-bash",children:"codeql query run codeql-research/solidity/ql/lib/slither-arbitrary-send-erc20.ql -d /path-to-database/\n"})}),"\n",(0,t.jsx)(r.h2,{id:"description",children:"Description"}),"\n",(0,t.jsxs)(r.p,{children:["Based on the ",(0,t.jsx)(r.a,{href:"https://github.com/crytic/slither/wiki/Detector-Documentation#arbitrary-from-in-transferfrom",children:"arbitrary-send-erc20"})," detector from Slither.\nDetects wrongful usage of an arbitrary ",(0,t.jsx)(r.code,{children:"from"})," variable\nin a transfer call."]}),"\n",(0,t.jsx)(r.h3,{id:"recomendation",children:"Recomendation"}),"\n",(0,t.jsxs)(r.p,{children:["Use ",(0,t.jsx)(r.code,{children:"msg.sender"})," instead."]}),"\n",(0,t.jsx)(r.h2,{id:"example",children:"Example"}),"\n",(0,t.jsx)(r.h3,{id:"vulnerable",children:"Vulnerable"}),"\n",(0,t.jsx)(r.pre,{children:(0,t.jsx)(r.code,{className:"language-javascript",children:"contract A{  \n    function a(address from, address to, uint256 amount) public {\n        erc20.transferFrom(from, to, amount);\n    }\n}\n"})}),"\n",(0,t.jsx)(r.h3,{id:"fixed",children:"Fixed"}),"\n",(0,t.jsx)(r.pre,{children:(0,t.jsx)(r.code,{className:"language-javascript",children:"contract A{  \n    function a(address from, address to, uint256 amount) public {\n        erc20.transferFrom(msg.sender, to, amount);\n    }\n}\n"})})]})}function u(e={}){const{wrapper:r}={...(0,s.R)(),...e.components};return r?(0,t.jsx)(r,{...e,children:(0,t.jsx)(d,{...e})}):d(e)}},1503:(e,r,n)=>{n.d(r,{R:()=>o,x:()=>c});var t=n(758);const s={},a=t.createContext(s);function o(e){const r=t.useContext(a);return t.useMemo((function(){return"function"==typeof e?e(r):{...r,...e}}),[r,e])}function c(e){let r;return r=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:o(e.components),t.createElement(a.Provider,{value:r},e.children)}}}]);