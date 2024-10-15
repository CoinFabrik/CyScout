"use strict";(self.webpackChunkcodeql_research=self.webpackChunkcodeql_research||[]).push([[669],{323:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>a,contentTitle:()=>s,default:()=>h,frontMatter:()=>c,metadata:()=>o,toc:()=>l});var r=t(6070),i=t(1503);const c={},s=void 0,o={id:"Detectors/incorrect-shift",title:"incorrect-shift",description:"Incorrect shift in assembly",source:"@site/docs/Detectors/incorrect-shift.md",sourceDirName:"Detectors",slug:"/Detectors/incorrect-shift",permalink:"/CyScout/Detectors/incorrect-shift",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Incorrect exponentiation",permalink:"/CyScout/Detectors/incorrect-exp"},next:{title:"is-unreachable",permalink:"/CyScout/Detectors/is-unreachable"}},a={},l=[{value:"Incorrect shift in assembly",id:"incorrect-shift-in-assembly",level:2},{value:"Usage",id:"usage",level:2},{value:"Description",id:"description",level:2},{value:"Recomendation",id:"recomendation",level:3},{value:"Example",id:"example",level:2},{value:"Vulnerable",id:"vulnerable",level:3},{value:"Fixed",id:"fixed",level:3}];function d(e){const n={a:"a",code:"code",h2:"h2",h3:"h3",p:"p",pre:"pre",...(0,i.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(n.h2,{id:"incorrect-shift-in-assembly",children:"Incorrect shift in assembly"}),"\n",(0,r.jsx)(n.h2,{id:"usage",children:"Usage"}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-bash",children:"codeql query run codeql-research/solidity/ql/lib/slither-bitshift-order.ql -d /path-to-database/\n"})}),"\n",(0,r.jsx)(n.h2,{id:"description",children:"Description"}),"\n",(0,r.jsxs)(n.p,{children:["Based on Slither's ",(0,r.jsx)(n.a,{href:"https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-shift-in-assembly",children:"incorrect-shift detector"}),".\nDetects if the values in a shift operation are reversed."]}),"\n",(0,r.jsx)(n.h3,{id:"recomendation",children:"Recomendation"}),"\n",(0,r.jsx)(n.p,{children:"Invert the order of call arguments\nto correctly perform the shift operation."}),"\n",(0,r.jsx)(n.h2,{id:"example",children:"Example"}),"\n",(0,r.jsx)(n.h3,{id:"vulnerable",children:"Vulnerable"}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-javascript",children:"contract C {\n    function f() internal returns (uint a) {\n        assembly {\n            a := shr(a, 8)\n        }\n    }\n}\n"})}),"\n",(0,r.jsx)(n.h3,{id:"fixed",children:"Fixed"}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-javascript",children:"contract C {\n    function f() internal returns (uint a) {\n        assembly {\n            a := shr(8, a)\n        }\n    }\n}\n"})})]})}function h(e={}){const{wrapper:n}={...(0,i.R)(),...e.components};return n?(0,r.jsx)(n,{...e,children:(0,r.jsx)(d,{...e})}):d(e)}},1503:(e,n,t)=>{t.d(n,{R:()=>s,x:()=>o});var r=t(758);const i={},c=r.createContext(i);function s(e){const n=r.useContext(c);return r.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function o(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:s(e.components),r.createElement(c.Provider,{value:n},e.children)}}}]);