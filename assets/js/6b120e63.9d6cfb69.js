"use strict";(self.webpackChunkcodeql_research=self.webpackChunkcodeql_research||[]).push([[962],{6842:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>l,contentTitle:()=>s,default:()=>u,frontMatter:()=>r,metadata:()=>i,toc:()=>o});var c=t(6070),a=t(1503);const r={},s=void 0,i={id:"Detectors/is-unreachable",title:"is-unreachable",description:"Is unreachable",source:"@site/docs/Detectors/is-unreachable.md",sourceDirName:"Detectors",slug:"/Detectors/is-unreachable",permalink:"/CyScout/docs/Detectors/is-unreachable",draft:!1,unlisted:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/Detectors/is-unreachable.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"incorrect-shift",permalink:"/CyScout/docs/Detectors/incorrect-shift"},next:{title:"msg-value-in-for-loop",permalink:"/CyScout/docs/Detectors/msg-value-in-for-loop"}},l={},o=[{value:"Is unreachable",id:"is-unreachable",level:2},{value:"Usage",id:"usage",level:2},{value:"Description",id:"description",level:2},{value:"Recomendation",id:"recomendation",level:3},{value:"Example",id:"example",level:2},{value:"Vulnerable",id:"vulnerable",level:3},{value:"Fixed",id:"fixed",level:3}];function d(e){const n={code:"code",h2:"h2",h3:"h3",p:"p",pre:"pre",...(0,a.R)(),...e.components};return(0,c.jsxs)(c.Fragment,{children:[(0,c.jsx)(n.h2,{id:"is-unreachable",children:"Is unreachable"}),"\n",(0,c.jsx)(n.h2,{id:"usage",children:"Usage"}),"\n",(0,c.jsx)(n.pre,{children:(0,c.jsx)(n.code,{className:"language-bash",children:"codeql query run codeql-research/solidity/ql/lib/is-unreachable.ql -d /path-to-database/\n"})}),"\n",(0,c.jsx)(n.h2,{id:"description",children:"Description"}),"\n",(0,c.jsx)(n.p,{children:"Detects dead code on a CFG level, in the form of unreachable basic blocks."}),"\n",(0,c.jsx)(n.h3,{id:"recomendation",children:"Recomendation"}),"\n",(0,c.jsx)(n.p,{children:"Eliminate code that can't be executed and thus has no effect in\nthe logic of the final program."}),"\n",(0,c.jsx)(n.h2,{id:"example",children:"Example"}),"\n",(0,c.jsx)(n.h3,{id:"vulnerable",children:"Vulnerable"}),"\n",(0,c.jsx)(n.pre,{children:(0,c.jsx)(n.code,{className:"language-javascript",children:"contract A{  \n    function a(uint256 t) public {\n        if(false)\n        {\n            revert();\n        }\n    }\n}\n"})}),"\n",(0,c.jsx)(n.h3,{id:"fixed",children:"Fixed"}),"\n",(0,c.jsx)(n.pre,{children:(0,c.jsx)(n.code,{className:"language-javascript",children:"contract A{  \n    function a(uint256 t) public {\n        // if(false)\n        {\n            revert();\n        }\n    }\n}\n"})})]})}function u(e={}){const{wrapper:n}={...(0,a.R)(),...e.components};return n?(0,c.jsx)(n,{...e,children:(0,c.jsx)(d,{...e})}):d(e)}},1503:(e,n,t)=>{t.d(n,{R:()=>s,x:()=>i});var c=t(758);const a={},r=c.createContext(a);function s(e){const n=c.useContext(r);return c.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function i(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(a):e.components||a:s(e.components),c.createElement(r.Provider,{value:n},e.children)}}}]);