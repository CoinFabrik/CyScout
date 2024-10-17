"use strict";(self.webpackChunkcyscout=self.webpackChunkcyscout||[]).push([[405],{6124:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>d,contentTitle:()=>s,default:()=>u,frontMatter:()=>o,metadata:()=>i,toc:()=>a});var c=t(6070),r=t(1503);const o={},s="Unchecked Send",i={id:"Detectors/unchecked-send",title:"Unchecked Send",description:"Description",source:"@site/docs/Detectors/unchecked-send.md",sourceDirName:"Detectors",slug:"/Detectors/unchecked-send",permalink:"/CyScout/Detectors/unchecked-send",draft:!1,unlisted:!1,tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"transfer-from",permalink:"/CyScout/Detectors/transfer-from"},next:{title:"Unrpotected self destruct",permalink:"/CyScout/Detectors/unprotected-self-destruct"}},d={},a=[{value:"Description",id:"description",level:2},{value:"Exploit Scenario:",id:"exploit-scenario",level:2},{value:"Recommendation",id:"recommendation",level:2}];function l(e){const n={a:"a",code:"code",h1:"h1",h2:"h2",header:"header",p:"p",pre:"pre",...(0,r.R)(),...e.components};return(0,c.jsxs)(c.Fragment,{children:[(0,c.jsx)(n.header,{children:(0,c.jsx)(n.h1,{id:"unchecked-send",children:"Unchecked Send"})}),"\n",(0,c.jsx)(n.h2,{id:"description",children:"Description"}),"\n",(0,c.jsxs)(n.p,{children:["Based on Slither's ",(0,c.jsx)(n.a,{href:"https://github.com/crytic/slither/wiki/Detector-Documentation#unchecked-send",children:"unchecked-send detector"}),"."]}),"\n",(0,c.jsx)(n.p,{children:"The return value of a send is not checked."}),"\n",(0,c.jsx)(n.h2,{id:"exploit-scenario",children:"Exploit Scenario:"}),"\n",(0,c.jsx)(n.pre,{children:(0,c.jsx)(n.code,{children:"contract MyConc{\n    function my_func(address payable dst) public payable{\n        dst.send(msg.value);\n    }\n}\n"})}),"\n",(0,c.jsx)(n.p,{children:"The return value of send is not checked, so if the send fails, the Ether will be locked in the contract. If send is used to prevent blocking operations, consider logging the failed send."}),"\n",(0,c.jsx)(n.h2,{id:"recommendation",children:"Recommendation"}),"\n",(0,c.jsx)(n.p,{children:"Ensure that the return value of send is checked or logged."})]})}function u(e={}){const{wrapper:n}={...(0,r.R)(),...e.components};return n?(0,c.jsx)(n,{...e,children:(0,c.jsx)(l,{...e})}):l(e)}},1503:(e,n,t)=>{t.d(n,{R:()=>s,x:()=>i});var c=t(758);const r={},o=c.createContext(r);function s(e){const n=c.useContext(o);return c.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function i(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:s(e.components),c.createElement(o.Provider,{value:n},e.children)}}}]);