google.maps.__gjsload__('overlay', function(_){var Yu=_.na("j"),Zu=_.n(),$u=function(a){a.$f=a.$f||new Zu;return a.$f},av=function(a){this.U=new _.fg(function(){var b=a.$f;if(a.getPanes()){if(a.getProjection()){if(!b.j&&a.onAdd)a.onAdd();b.j=!0;a.draw()}}else{if(b.j)if(a.onRemove)a.onRemove();else a.remove();b.j=!1}},0)},bv=function(a,b){function c(){return _.gg(e.U)}var d=$u(a),e=d.Ee;e||(e=d.Ee=new av(a));_.C(d.W||[],_.R.removeListener);var f=d.da=d.da||new _.ul,g=b.__gm;f.bindTo("zoom",g);f.bindTo("offset",g);f.bindTo("center",g,"projectionCenterQ");
f.bindTo("projection",b);f.bindTo("projectionTopLeft",g);f=d.$h=d.$h||new Yu(f);f.bindTo("zoom",g);f.bindTo("offset",g);f.bindTo("projection",b);f.bindTo("projectionTopLeft",g);a.bindTo("projection",f,"outProjection");a.bindTo("panes",g);d.W=[_.R.addListener(a,"panes_changed",c),_.R.addListener(g,"zoom_changed",c),_.R.addListener(g,"offset_changed",c),_.R.addListener(b,"projection_changed",c),_.R.addListener(g,"projectioncenterq_changed",c)];c();b instanceof _.pe&&(_.Lm(b,"Ox"),_.Nm("Ox","-p",a))},
ev=function(a){if(a){var b=a.getMap(),c=a.__gmop;if(c){if(c.map==b)return;a.__gmop=null;c.gg()}if(b&&b instanceof _.pe){var d=b.__gm;d.overlayLayer?a.__gmop=new cv(b,a,d.overlayLayer):d.j.then(function(e){e=e.ra;var f=new dv(b,e);e.sa(f);d.overlayLayer=f;ev(a)})}}},cv=function(a,b,c){this.map=a;this.oa=b;this.Yl=c;this.qe=!1;_.Lm(this.map,"Ox");_.Nm("Ox","-p",this.oa);c.l.push(this);c.j&&fv(this,c.j);c.m.Rf()},fv=function(a,b){a.oa.get("projection")!=b&&(a.oa.bindTo("panes",a.map.__gm),a.oa.set("projection",
b))},dv=function(a,b){this.A=a;this.m=b;this.j=null;this.l=[]};_.B(Yu,_.S);Yu.prototype.changed=function(a){"outProjection"!=a&&(a=!!(this.get("offset")&&this.get("projectionTopLeft")&&this.get("projection")&&_.K(this.get("zoom"))),a==!this.get("outProjection")&&this.set("outProjection",a?this.j:null))};_.B(av,_.S);cv.prototype.draw=function(){this.qe||(this.qe=!0,this.oa.onAdd&&this.oa.onAdd());this.oa.draw&&this.oa.draw()};cv.prototype.gg=function(){_.Om("Ox","-p",this.oa);this.oa.unbindAll();this.oa.set("panes",null);this.oa.set("projection",null);_.gb(this.Yl.l,this);this.qe&&(this.qe=!1,this.oa.onRemove?this.oa.onRemove():this.oa.remove())};dv.prototype.dispose=_.n();
dv.prototype.Ab=function(a,b,c,d,e,f){var g=this.j=this.j||new _.Am(this.A,this.m,_.n());g.Ab(a,b,c,d,e,f);a=_.ua(this.l);for(b=a.next();!b.done;b=a.next())b=b.value,fv(b,g),b.draw()};_.He("overlay",{Pg:function(a){if(a){var b=a.getMap();if(b&&b instanceof _.pe||a.__gmop)ev(a);else{b=a.getMap();var c=$u(a),d=c.ql;c.ql=b;d&&(c=$u(a),(d=c.da)&&d.unbindAll(),(d=c.$h)&&d.unbindAll(),a.unbindAll(),a.set("panes",null),a.set("projection",null),_.C(c.W,_.R.removeListener),c.W=null,c.Ee&&(c.Ee.U.Ma(),c.Ee=null),_.Om("Ox","-p",a));b&&bv(a,b)}}},preventMapHitsFrom:function(a){_.Dn(a,{onClick:function(b){return _.Vm(b.event)},Ha:function(b){return _.Sm(b)},$b:function(b){return _.Tm(b)},Ua:function(b){return _.Tm(b)},
La:function(b){return _.Um(b)}}).xc(!0)},preventMapHitsAndGesturesFrom:function(a){a.addEventListener("click",_.Hd);a.addEventListener("contextmenu",_.Hd);a.addEventListener("dblclick",_.Hd);a.addEventListener("mousedown",_.Hd);a.addEventListener("mousemove",_.Hd);a.addEventListener("MSPointerDown",_.Hd);a.addEventListener("pointerdown",_.Hd);a.addEventListener("touchstart",_.Hd);a.addEventListener("wheel",_.Hd)}});});