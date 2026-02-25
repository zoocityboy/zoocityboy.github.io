((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,D,A={
aL(d){var x=$.i8.q(0,d)
if(x==null){x=new A.cP(d,B.c([],y.C))
$.i8.k(0,d,x)}return x},
cQ:function cQ(d,e){this.a=d
this.b=e},
bA:function bA(d,e){this.c=d
this.a=e},
dL:function dL(d,e,f,g,h,i,j){var _=this
_.d$=d
_.e$=e
_.f$=f
_.cy=null
_.db=g
_.c=_.b=_.a=null
_.d=h
_.e=null
_.f=i
_.w=_.r=null
_.x=j
_.Q=_.z=_.y=null
_.as=!1
_.at=!0
_.ax=!1
_.CW=null
_.cx=!1},
ah:function ah(d,e,f){var _=this
_.w=d
_.x=e
_.y=null
_.z=f
_.d=$
_.c=_.b=_.a=null},
cP:function cP(d,e){var _=this
_.a=d
_.e=_.d=_.c=_.b=$
_.f=e
_.r=!0},
ep:function ep(){},
jn(d,e){return new A.ej(e,d,null)},
ee:function ee(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.at=g
_.a=h},
ej:function ej(d,e,f){this.e=d
this.w=e
this.a=f},
es:function es(d,e){this.a=d
this.b=e},
bM:function bM(d,e){this.b=d
this.a=e},
dY:function dY(d,e,f,g,h,i,j){var _=this
_.d$=d
_.e$=e
_.f$=f
_.cy=null
_.db=g
_.c=_.b=_.a=null
_.d=h
_.e=null
_.f=i
_.w=_.r=null
_.x=j
_.Q=_.z=_.y=null
_.as=!1
_.at=!0
_.ax=!1
_.CW=null
_.cx=!1},
db:function db(d,e){this.c=d
this.a=e},
dB:function dB(d,e){this.c=d
this.a=e},
cq:function cq(d,e,f){this.c=d
this.d=e
this.a=f},
kv(){return new A.ar(null)},
ar:function ar(d){this.a=d},
dE:function dE(){this.d=!1
this.c=null},
f2:function f2(d){this.a=d},
f1:function f1(d){this.a=d},
kl(d){var x,w,v=y.w,u=B.N(v,v)
for(x=0;x<B.a8(d.length);++x){w=B.y(d.item(x))
u.k(0,B.G(w.name),B.G(w.value))}return u},
iM(d){var x=null
return new B.cA(d,x,x,x,x)}},E,C
B=c[0]
D=c[2]
A=a.updateHolder(c[3],A)
E=c[6]
C=c[5]
A.cQ.prototype={
aq(){return"AttachTarget."+this.b}}
A.bA.prototype={
M(){var x=B.aR(y.b),w=($.E+1)%16777215
$.E=w
return new A.dL(null,!1,!1,x,w,this,D.c)}}
A.dL.prototype={
Z(){var x=this.f
x.toString
y.h.a(x)
return E.L},
S(){var x,w,v=this.f
v.toString
y.h.a(v)
x=this.e
x.toString
x=new A.ah(B.c([],y.k),E.l,x)
x.ap("")
w=A.aL(x.x)
D.a.l(w.f,x)
w.r=!0
x.sbz(v.c)
return x},
X(d){var x
y.n.a(d)
x=this.f
x.toString
y.h.a(x)
d.sde(E.l)
d.sbz(x.c)},
U(){var x,w
this.c1()
x=this.d$
x.toString
y.n.a(x)
w=A.aL(x.x)
D.a.v(w.f,x)
w.a5()}}
A.ah.prototype={
sde(d){var x=this,w=x.x
if(w===d)return
w=A.aL(w)
D.a.v(w.f,x)
w.a5()
x.x=d
w=A.aL(d)
D.a.l(w.f,x)
w.r=!0
A.aL(x.x).a5()},
sbz(d){y.f.a(d)
if(this.y===d)return
this.y=d
A.aL(this.x).a5()},
T(d,e){var x,w,v,u,t=this
d.a=t
try{x=d.gC()
w=e==null?null:e.gC()
if(w==null&&D.a.R(t.w,x))return
if(w!=null&&!D.a.R(t.w,w))w=null
v=t.w
D.a.v(v,x)
u=w!=null?D.a.b4(v,w)+1:0
D.a.cO(v,u,x)
A.aL(t.x).a5()}finally{d.a1()}},
v(d,e){D.a.v(this.w,e.gC())
e.a=null
A.aL(this.x).a5()}}
A.cP.prototype={
gbF(){var x,w=this,v=w.b
if(v===$){x=B.y(B.m(b.G.document).querySelector(w.a.b))
x.toString
w.b!==$&&B.hi()
w.b=x
v=x}return v},
dg(d){var x,w,v,u,t,s,r,q,p,o,n,m=this
if(d||m.r){D.a.ai(m.f,new A.ep())
m.r=!1}x=m.c
if(x===$){w=A.kl(B.m(m.gbF().attributes))
m.c!==$&&B.hi()
m.c=w
x=w}for(v=m.f,u=v.length,t=0;t<v.length;v.length===u||(0,B.al)(v),++t){s=v[t].y
if(s!=null)x.E(0,s)}r=B.ht(y.w)
for(q=0;v=m.gbF(),q<B.a8(B.m(v.attributes).length);++q)r.l(0,B.G(B.y(B.m(v.attributes).item(q)).name))
if(x.a!==0)for(u=new B.ap(x,B.h(x).h("ap<1,2>")).gt(0);u.j();){p=u.d
o=p.a
B.cR(v,o,p.b)
r.v(0,o)}if(r.a!==0)for(u=B.iG(r,r.r,r.$ti.c),o=u.$ti.c;u.j();){n=u.d
if(n==null)n=o.a(n)
v.removeAttribute(n)}},
a5(){return this.dg(!1)}}
A.ee.prototype={
D(d){var x=this,w=null,v=y.w
v=B.N(v,v)
v.k(0,"cx",x.c)
v.k(0,"cy",x.d)
v.k(0,"r",x.e)
return new B.W("circle",w,w,w,v,w,x.at,w)}}
A.ej.prototype={
D(d){var x=null
return new B.W("span",x,x,this.e,x,x,this.w,x)}}
A.es.prototype={
aq(){return"Display."+this.b}}
A.bM.prototype={
M(){var x=B.aR(y.b),w=($.E+1)%16777215
$.E=w
return new A.dY(null,!1,!1,x,w,this,D.c)}}
A.dY.prototype={
Z(){var x=this.f
x.toString
return y.B.a(x).b},
S(){var x=this.CW.d$
x.toString
return B.jY(x,null)},
X(d){y.u.a(d)}}
A.db.prototype={
D(d){var x=y.F
return new A.cq(this.c,B.c([C.ak(B.c([],x),"M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z")],x),null)}}
A.dB.prototype={
D(d){var x=y.F
return new A.cq(this.c,B.c([new A.ee("12","12","4",B.c([],x),null),C.ak(B.c([],x),"M12 4h.01"),C.ak(B.c([],x),"M20 12h.01"),C.ak(B.c([],x),"M12 20h.01"),C.ak(B.c([],x),"M4 12h.01"),C.ak(B.c([],x),"M17.657 6.343h.01"),C.ak(B.c([],x),"M17.657 17.657h.01"),C.ak(B.c([],x),"M6.343 17.657h.01"),C.ak(B.c([],x),"M6.343 6.343h.01")],x),null)}}
A.cq.prototype={
D(d){var x=this.c,w=y.w
return C.jo(this.d,B.aV(["fill","none","stroke","currentColor","stroke-width","2","stroke-linecap","round","stroke-linejoin","round"],w,w),new C.b3("px",x),"0 0 24 24",new C.b3("px",x))}}
A.ar.prototype={
bC(){return new A.dE()}}
A.dE.prototype={
b5(){this.c3()
this.d=B.aH(B.y(B.m(b.G.document).documentElement).getAttribute("data-theme"))==="dark"},
D(d){var x,w=this,v=null,u=y.F,t=B.c([],u),s=w.d?"dark":"light",r=y.w
t.push(new A.bA(B.aV(["data-theme",s],r,r),v))
r=B.aV(["aria-label","Theme Toggle"],r,r)
s=A.iM(w.d?E.q:v)
s=A.jn(B.c([new A.db(20,v)],u),s)
x=A.iM(w.d?v:E.q)
t.push(C.jf(B.c([s,A.jn(B.c([new A.dB(20,v)],u),x)],u),r,"theme-toggle",v,new A.f2(w),v))
return new A.bM(t,v)}}
var z=a.updateTypes(["a(ah,ah)"])
A.ep.prototype={
$2(d,e){var x=y.n
x.a(d)
x.a(e)
return d.z-e.z},
$S:z+0}
A.f2.prototype={
$0(){var x,w=this.a
w.aG(new A.f1(w))
x=B.m(B.m(b.G.window).localStorage)
w=w.d?"dark":"light"
x.setItem("jaspr:theme",w)},
$S:0}
A.f1.prototype={
$0(){var x=this.a
x.d=!x.d},
$S:0};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.dW,[A.cQ,A.es])
x(B.j,[A.bA,A.bM])
x(B.aX,[A.dL,A.dY])
w(A.ah,B.bJ)
w(A.cP,B.k)
w(A.ep,B.bF)
x(C.J,[A.ee,A.ej,A.db,A.dB,A.cq])
w(A.ar,C.aj)
w(A.dE,C.a5)
x(B.bc,[A.f2,A.f1])})()
B.fA(b.typeUniverse,JSON.parse('{"ah":{"a2":[],"hy":[],"aY":[]},"bA":{"j":[]},"dL":{"P":[],"e":[],"K":[]},"ee":{"J":[],"j":[]},"ej":{"J":[],"j":[]},"bM":{"j":[]},"dY":{"P":[],"e":[],"K":[]},"db":{"J":[],"j":[]},"dB":{"J":[],"j":[]},"cq":{"J":[],"j":[]},"ar":{"aj":[],"j":[]},"dE":{"a5":["ar"],"a5.T":"ar"}}'))
var y=(function rtii(){var x=B.C
return{h:x("bA"),n:x("ah"),b:x("e"),B:x("bM"),C:x("q<ah>"),F:x("q<j>"),k:x("q<n>"),u:x("hx"),w:x("b"),f:x("z<b,b>?")}})();(function constants(){var x=a.makeConstList
E.l=new A.cQ(0,"html")
E.q=new A.es(0,"none")
E.L=x([],y.F)})();(function staticFields(){$.i8=B.N(B.C("cQ"),B.C("cP"))})()};
(a=>{a["ogVBhJwV4yLBzxtU4cUpAj9AAaU="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.client.dart.js_1.part.js.map
