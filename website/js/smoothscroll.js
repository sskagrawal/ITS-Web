!function(){function o(){b.keyboardSupport&&H("keydown",w)}function p(){if(!f&&document.body){f=!0;var a=document.body,e=document.documentElement,k=window.innerHeight,l=a.scrollHeight;if(g=document.compatMode.indexOf("CSS")>=0?e:a,h=a,o(),top!=self)d=!0;else if(_&&l>k&&(a.offsetHeight<=k||e.offsetHeight<=k)){var m=document.createElement("div");m.style.cssText="position:absolute; z-index:-10000; top:0; left:0; right:0; height:"+g.scrollHeight+"px",document.body.appendChild(m);var n;j=function(){n||(n=setTimeout(function(){c||(m.style.height="0",m.style.height=g.scrollHeight+"px",n=null)},500))},setTimeout(j,10),H("resize",j);var p={attributes:!0,childList:!0,characterData:!1};if(i=new R(j),i.observe(a,p),g.offsetHeight<=k){var q=document.createElement("div");q.style.clear="both",a.appendChild(q)}}b.fixedBackground||c||(a.style.backgroundAttachment="scroll",e.style.backgroundAttachment="scroll")}}function q(){i&&i.disconnect(),I(ba,v),I("mousedown",x),I("keydown",w),I("resize",j),I("load",p)}function u(a,c,d){if(K(c,d),1!=b.accelerationMax){var e=Date.now(),f=e-t;if(f<b.accelerationDelta){var g=(1+50/f)/2;g>1&&(g=Math.min(g,b.accelerationMax),c*=g,d*=g)}t=Date.now()}if(r.push({x:c,y:d,lastX:c<0?.99:-.99,lastY:d<0?.99:-.99,start:Date.now()}),!s){var h=a===document.body,i=function(e){for(var f=Date.now(),g=0,j=0,k=0;k<r.length;k++){var l=r[k],m=f-l.start,n=m>=b.animationTime,o=n?1:m/b.animationTime;b.pulseAlgorithm&&(o=U(o));var p=l.x*o-l.lastX>>0,q=l.y*o-l.lastY>>0;g+=p,j+=q,l.lastX+=p,l.lastY+=q,n&&(r.splice(k,1),k--)}h?window.scrollBy(g,j):(g&&(a.scrollLeft+=g),j&&(a.scrollTop+=j)),c||d||(r=[]),r.length?Q(i,a,1e3/b.frameRate+1):s=!1};Q(i,a,0),s=!0}}function v(a){f||p();var c=a.target;if(a.defaultPrevented||a.ctrlKey)return!0;if(J(h,"embed")||J(c,"embed")&&/\.pdf/i.test(c.src)||J(h,"object")||c.shadowRoot)return!0;var e=-a.wheelDeltaX||a.deltaX||0,g=-a.wheelDeltaY||a.deltaY||0;l&&(a.wheelDeltaX&&N(a.wheelDeltaX,120)&&(e=-120*(a.wheelDeltaX/Math.abs(a.wheelDeltaX))),a.wheelDeltaY&&N(a.wheelDeltaY,120)&&(g=-120*(a.wheelDeltaY/Math.abs(a.wheelDeltaY)))),e||g||(g=-a.wheelDelta||0),1===a.deltaMode&&(e*=40,g*=40);var i=D(c);return i?!(b.touchpadSupport||!M(g))||(Math.abs(e)>1.2&&(e*=b.stepSize/120),Math.abs(g)>1.2&&(g*=b.stepSize/120),u(i,e,g),a.preventDefault(),void B()):!d||!X||(Object.defineProperty(a,"target",{value:window.frameElement}),parent.wheel(a))}function w(a){var c=a.target,e=a.ctrlKey||a.altKey||a.metaKey||a.shiftKey&&a.keyCode!==m.spacebar;document.body.contains(h)||(h=document.activeElement);var f=/^(textarea|select|embed|object)$/i,g=/^(button|submit|radio|checkbox|file|color|image)$/i;if(a.defaultPrevented||f.test(c.nodeName)||J(c,"input")&&!g.test(c.type)||J(h,"video")||P(a)||c.isContentEditable||e)return!0;if((J(c,"button")||J(c,"input")&&g.test(c.type))&&a.keyCode===m.spacebar)return!0;if(J(c,"input")&&"radio"==c.type&&n[a.keyCode])return!0;var i,j=0,k=0,l=D(h);if(!l)return!d||!X||parent.keydown(a);var o=l.clientHeight;switch(l==document.body&&(o=window.innerHeight),a.keyCode){case m.up:k=-b.arrowScroll;break;case m.down:k=b.arrowScroll;break;case m.spacebar:i=a.shiftKey?1:-1,k=-i*o*.9;break;case m.pageup:k=.9*-o;break;case m.pagedown:k=.9*o;break;case m.home:k=-l.scrollTop;break;case m.end:var p=l.scrollHeight-l.scrollTop,q=p-o;k=q>0?q+10:0;break;case m.left:j=-b.arrowScroll;break;case m.right:j=b.arrowScroll;break;default:return!0}u(l,j,k),a.preventDefault(),B()}function x(a){h=a.target}function B(){clearTimeout(A),A=setInterval(function(){z={}},1e3)}function C(a,b){for(var c=a.length;c--;)z[y(a[c])]=b;return b}function D(a){var b=[],c=document.body,e=g.scrollHeight;do{var f=z[y(a)];if(f)return C(b,f);if(b.push(a),e===a.scrollHeight){var h=F(g)&&F(c),i=h||G(g);if(d&&E(g)||!d&&i)return C(b,S())}else if(E(a)&&G(a))return C(b,a)}while(a=a.parentElement)}function E(a){return a.clientHeight+10<a.scrollHeight}function F(a){var b=getComputedStyle(a,"").getPropertyValue("overflow-y");return"hidden"!==b}function G(a){var b=getComputedStyle(a,"").getPropertyValue("overflow-y");return"scroll"===b||"auto"===b}function H(a,b){window.addEventListener(a,b,!1)}function I(a,b){window.removeEventListener(a,b,!1)}function J(a,b){return(a.nodeName||"").toLowerCase()===b.toLowerCase()}function K(a,b){a=a>0?1:-1,b=b>0?1:-1,e.x===a&&e.y===b||(e.x=a,e.y=b,r=[],t=0)}function M(a){if(a)return k.length||(k=[a,a,a]),a=Math.abs(a),k.push(a),k.shift(),clearTimeout(L),L=setTimeout(function(){try{localStorage.SS_deltaBuffer=k.join(",")}catch(a){}},1e3),!O(120)&&!O(100)}function N(a,b){return Math.floor(a/b)==a/b}function O(a){return N(k[0],a)&&N(k[1],a)&&N(k[2],a)}function P(a){var b=a.target,c=!1;if(document.URL.indexOf("www.youtube.com/watch")!=-1)do if(c=b.classList&&b.classList.contains("html5-video-controls"))break;while(b=b.parentNode);return c}function T(a){var c,d,e;return a*=b.pulseScale,a<1?c=a-(1-Math.exp(-a)):(d=Math.exp(-1),a-=1,e=1-Math.exp(-a),c=d+e*(1-d)),c*b.pulseNormalize}function U(a){return a>=1?1:a<=0?0:(1==b.pulseNormalize&&(b.pulseNormalize/=T(1)),T(a))}function ca(c){for(var d in c)a.hasOwnProperty(d)&&(b[d]=c[d])}var h,i,j,A,L,a={frameRate:150,animationTime:400,stepSize:100,pulseAlgorithm:!0,pulseScale:4,pulseNormalize:1,accelerationDelta:50,accelerationMax:3,keyboardSupport:!0,arrowScroll:50,touchpadSupport:!1,fixedBackground:!0,excluded:""},b=a,c=!1,d=!1,e={x:0,y:0},f=!1,g=document.documentElement,k=[],l=/^Mac/.test(navigator.platform),m={left:37,up:38,right:39,down:40,spacebar:32,pageup:33,pagedown:34,end:35,home:36},n={37:1,38:1,39:1,40:1},r=[],s=!1,t=Date.now(),y=function(){var a=0;return function(b){return b.uniqueID||(b.uniqueID=a++)}}(),z={};if(window.localStorage&&localStorage.SS_deltaBuffer)try{k=localStorage.SS_deltaBuffer.split(",")}catch(a){}var ba,Q=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(a,b,c){window.setTimeout(a,c||1e3/60)}}(),R=window.MutationObserver||window.WebKitMutationObserver||window.MozMutationObserver,S=function(){var a;return function(){if(!a){var b=document.createElement("div");b.style.cssText="height:10000px;width:1px;",document.body.appendChild(b);var c=document.body.scrollTop;document.documentElement.scrollTop;window.scrollBy(0,3),a=document.body.scrollTop!=c?document.body:document.documentElement,window.scrollBy(0,-3),document.body.removeChild(b)}return a}}(),V=window.navigator.userAgent,W=/Edge/.test(V),X=/chrome/i.test(V)&&!W,Y=/safari/i.test(V)&&!W,Z=/mobile/i.test(V),$=/Windows NT 6.1/i.test(V)&&/rv:11/i.test(V),_=Y&&(/Version\/8/i.test(V)||/Version\/9/i.test(V)),aa=(X||Y||$)&&!Z;"onwheel"in document.createElement("div")?ba="wheel":"onmousewheel"in document.createElement("div")&&(ba="mousewheel"),ba&&aa&&(H(ba,v),H("mousedown",x),H("load",p)),ca.destroy=q,window.SmoothScrollOptions&&ca(window.SmoothScrollOptions),"function"==typeof define&&define.amd?define(function(){return ca}):"object"==typeof exports?module.exports=ca:window.SmoothScroll=ca}()