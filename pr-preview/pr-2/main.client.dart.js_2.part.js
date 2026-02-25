((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
h4(d,e,f,g){var x
y.z.a(e)
x=B.N(y.w,y.a)
if(e!=null)x.k(0,"click",new A.h5(e))
return x},
h5:function h5(d){this.a=d},
jf(d,e,f,g,h,i){return new A.ed(h,f,i,e,g,d,null)},
jo(d,e,f,g,h){return new A.el(g,h,f,e,d,null)},
ak(d,e){return new A.eh(e,d,null)},
ed:function ed(d,e,f,g,h,i,j){var _=this
_.f=d
_.w=e
_.x=f
_.y=g
_.z=h
_.Q=i
_.a=j},
el:function el(d,e,f,g,h,i){var _=this
_.c=d
_.d=e
_.e=f
_.x=g
_.z=h
_.a=i},
eh:function eh(d,e,f){this.c=d
this.Q=e
this.a=f},
b3:function b3(d,e){this.a=d
this.b=e},
aj:function aj(){},
a5:function a5(){},
dv:function dv(d,e,f,g){var _=this
_.ry=d
_.to=null
_.x1=!1
_.c=_.b=_.a=_.cy=null
_.d=e
_.e=null
_.f=f
_.w=_.r=null
_.x=g
_.Q=_.z=_.y=null
_.as=!1
_.at=!0
_.ax=!1
_.CW=null
_.cx=!1},
J:function J(){},
dw:function dw(d,e,f){var _=this
_.c=_.b=_.a=_.cy=_.ry=null
_.d=d
_.e=null
_.f=e
_.w=_.r=null
_.x=f
_.Q=_.z=_.y=null
_.as=!1
_.at=!0
_.ax=!1
_.CW=null
_.cx=!1}}
B=c[0]
C=c[2]
A=a.updateHolder(c[5],A)
A.ed.prototype={
D(d){var x=this,w=y.w,v=B.N(w,w),u=x.y
if(u!=null)v.E(0,u)
w=B.N(w,y.a)
u=x.z
if(u!=null)w.E(0,u)
w.E(0,A.lT().$1$1$onClick(x.f,y.v))
return new B.W("button",null,x.w,x.x,v,w,x.Q,null)}}
A.el.prototype={
D(d){var x,w=this,v=null,u=y.w
u=B.N(u,u)
u.E(0,w.x)
u.k(0,"viewBox",w.c)
x=w.d
x=x==null?v:B.eT(x.b)+x.a
if(x!=null)u.k(0,"width",x)
x=w.e
x=x==null?v:B.eT(x.b)+x.a
if(x!=null)u.k(0,"height",x)
return new B.W("svg",v,v,v,u,v,w.z,v)}}
A.eh.prototype={
D(d){var x=null,w=y.w
w=B.N(w,w)
w.k(0,"d",this.c)
return new B.W("path",x,x,x,w,x,this.Q,x)}}
A.b3.prototype={}
A.aj.prototype={
M(){var x=this.bC(),w=($.E+1)%16777215
$.E=w
w=new A.dv(x,w,this,C.c)
x.c=w
x.sbp(this)
return w}}
A.a5.prototype={
b5(){},
aG(d){y.k.a(d).$0()
this.c.bK()},
sbp(d){B.h(this).h("a5.T?").a(d)}}
A.dv.prototype={
b0(){return this.ry.D(this)},
F(){var x=this
if(x.w.c)x.ry.toString
x.cd()
x.aI()},
cd(){try{this.ry.b5()}finally{}this.ry.toString},
a4(){var x=this
x.w.toString
if(x.x1){x.ry.toString
x.x1=!1}x.be()},
a6(d){var x
y.g.a(d)
x=this.ry
x.toString
B.h(x).h("a5.T").a(d)
return!0},
J(d){y.g.a(d)
this.aM(d)
this.ry.sbp(d)},
ab(d){var x
y.g.a(d)
try{x=this.ry
x.toString
B.h(x).h("a5.T").a(d)}finally{}this.aK(d)},
a0(){this.ry.toString
this.bY()},
ag(){this.aL()
this.ry=this.ry.c=null}}
A.J.prototype={
M(){var x=($.E+1)%16777215
$.E=x
return new A.dw(x,this,C.c)}}
A.dw.prototype={
gm(){return y.i.a(B.e.prototype.gm.call(this))},
F(){if(this.w.c)this.r.toString
this.aI()},
a6(d){y.i.a(B.e.prototype.gm.call(this))
return!0},
b0(){return y.i.a(B.e.prototype.gm.call(this)).D(this)},
a4(){this.w.toString
this.be()}}
var z=a.updateTypes(["z<b,~(n)>({onChange:~(0^)?,onClick:~()?,onInput:~(0^)?})<k?>"])
A.h5.prototype={
$1(d){var x
B.m(d)
x=B.y(d.target)
x=x==null?!1:x instanceof $.jB()
if(x)d.preventDefault()
this.a.$0()},
$S:3};(function aliases(){var x=A.a5.prototype
x.c3=x.b5})();(function installTearOffs(){var x=a.installStaticTearOff
x(A,"lT",0,null,["$1$3$onChange$onClick$onInput","$0","$1$0","$1$1$onClick"],["h4",function(){return A.h4(null,null,null,y.b)},function(d){return A.h4(null,null,null,d)},function(d,e){return A.h4(null,d,null,e)}],0,0)})();(function inheritance(){var x=a.inherit,w=a.inheritMany
x(A.h5,B.ai)
w(B.j,[A.J,A.aj])
w(A.J,[A.ed,A.el,A.eh])
x(A.b3,B.b4)
x(A.a5,B.k)
w(B.ba,[A.dv,A.dw])})()
B.fA(b.typeUniverse,JSON.parse('{"ed":{"J":[],"j":[]},"el":{"J":[],"j":[]},"eh":{"J":[],"j":[]},"b3":{"f5":[]},"aj":{"j":[]},"dv":{"e":[],"K":[]},"J":{"j":[]},"dw":{"e":[],"K":[]}}'))
var y={g:B.C("aj"),i:B.C("J"),w:B.C("b"),b:B.C("@"),z:B.C("~()?"),v:B.C("~"),k:B.C("~()"),a:B.C("~(n)")};(function lazyInitializers(){var x=a.lazyFinal
x($,"mF","jB",()=>B.eg(B.ek(),"HTMLAnchorElement",B.C("ao")))})()};
(a=>{a["dyKwTPm5/RcD4nG59tIFSvhvrcc="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.client.dart.js_2.part.js.map
