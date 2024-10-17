"use strict";(self.webpackChunkcyscout=self.webpackChunkcyscout||[]).push([[829],{9036:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>d,contentTitle:()=>i,default:()=>p,frontMatter:()=>c,metadata:()=>s,toc:()=>a});var o=n(6070),r=n(1503);const c={},i="Incorrect exponentiation",s={id:"Detectors/incorrect-exp",title:"Incorrect exponentiation",description:"Description",source:"@site/docs/Detectors/incorrect-exp.md",sourceDirName:"Detectors",slug:"/Detectors/incorrect-exp",permalink:"/CyScout/Detectors/incorrect-exp",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Divide before multiply",permalink:"/CyScout/Detectors/divide-before-multiply"},next:{title:"incorrect-shift",permalink:"/CyScout/Detectors/incorrect-shift"}},d={},a=[{value:"Description",id:"description",level:2},{value:"Exploit Scenario:",id:"exploit-scenario",level:2},{value:"Recommendation",id:"recommendation",level:2}];function l(e){const t={a:"a",code:"code",h1:"h1",h2:"h2",header:"header",p:"p",pre:"pre",...(0,r.R)(),...e.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsx)(t.header,{children:(0,o.jsx)(t.h1,{id:"incorrect-exponentiation",children:"Incorrect exponentiation"})}),"\n",(0,o.jsx)(t.h2,{id:"description",children:"Description"}),"\n",(0,o.jsxs)(t.p,{children:["Based on Slither's ",(0,o.jsx)(t.a,{href:"https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-exponentiation",children:"incorrect-exp detector"}),"."]}),"\n",(0,o.jsxs)(t.p,{children:["Detect use of bitwise xor ",(0,o.jsx)(t.code,{children:"^"})," instead of exponential ",(0,o.jsx)(t.code,{children:"**"}),"."]}),"\n",(0,o.jsx)(t.h2,{id:"exploit-scenario",children:"Exploit Scenario:"}),"\n",(0,o.jsx)(t.pre,{children:(0,o.jsx)(t.code,{children:"contract Bug{\n    uint UINT_MAX = 2^256 - 1;\n    ...\n}\n"})}),"\n",(0,o.jsxs)(t.p,{children:["Alice deploys a contract in which ",(0,o.jsx)(t.code,{children:"UINT_MAX"})," incorrectly uses ",(0,o.jsx)(t.code,{children:"^"})," operator instead of ",(0,o.jsx)(t.code,{children:"**"})," for exponentiation"]}),"\n",(0,o.jsx)(t.h2,{id:"recommendation",children:"Recommendation"}),"\n",(0,o.jsxs)(t.p,{children:["Use the correct operator ",(0,o.jsx)(t.code,{children:"**"})," for exponentiation."]})]})}function p(e={}){const{wrapper:t}={...(0,r.R)(),...e.components};return t?(0,o.jsx)(t,{...e,children:(0,o.jsx)(l,{...e})}):l(e)}},1503:(e,t,n)=>{n.d(t,{R:()=>i,x:()=>s});var o=n(758);const r={},c=o.createContext(r);function i(e){const t=o.useContext(c);return o.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function s(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:i(e.components),o.createElement(c.Provider,{value:t},e.children)}}}]);