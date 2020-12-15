function _toConsumableArray(t){return _arrayWithoutHoles(t)||_iterableToArray(t)||_unsupportedIterableToArray(t)||_nonIterableSpread()}function _nonIterableSpread(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}function _unsupportedIterableToArray(t,n){if(t){if("string"==typeof t)return _arrayLikeToArray(t,n);var e=Object.prototype.toString.call(t).slice(8,-1);return"Object"===e&&t.constructor&&(e=t.constructor.name),"Map"===e||"Set"===e?Array.from(e):"Arguments"===e||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)?_arrayLikeToArray(t,n):void 0}}function _iterableToArray(t){if("undefined"!=typeof Symbol&&Symbol.iterator in Object(t))return Array.from(t)}function _arrayWithoutHoles(t){if(Array.isArray(t))return _arrayLikeToArray(t)}function _arrayLikeToArray(t,n){(null==n||n>t.length)&&(n=t.length);for(var e=0,i=new Array(n);e<n;e++)i[e]=t[e];return i}function _classCallCheck(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}function _defineProperties(t,n){for(var e=0;e<n.length;e++){var i=n[e];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,i.key,i)}}function _createClass(t,n,e){return n&&_defineProperties(t.prototype,n),e&&_defineProperties(t,e),t}(window.webpackJsonp=window.webpackJsonp||[]).push([[11],{cPR9:function(t,n,e){"use strict";e.r(n),e.d(n,"NotificationsModule",(function(){return K}));var i,a=e("ofXK"),r=e("tyNb"),o=e("2Vo4"),c=e("nYR2"),s=e("3E0/"),l=e("0EQZ"),u=e("fXoL"),b=e("LRXf"),d=((i=function(){function t(n){_classCallCheck(this,t),this.http=n}return _createClass(t,[{key:"getAll",value:function(t){return this.http.get("notifications/".concat(t,"/subscriptions"))}},{key:"updateUserSubscriptions",value:function(t,n){return this.http.put("notifications/".concat(t,"/subscriptions"),{selections:n})}}]),t}()).\u0275fac=function(t){return new(t||i)(u.dc(b.a))},i.\u0275prov=u.Pb({token:i,factory:i.\u0275fac,providedIn:"root"}),i),p=e("twBr"),g=e("i2dy"),f=e("N2vX"),h=e("3Pt+"),m=e("bTqV"),v=e("bSwM");function y(t,n){if(1&t){var e=u.ac();u.Zb(0,"div",11),u.Zb(1,"div",12),u.Nc(2),u.Yb(),u.Zb(3,"mat-checkbox",13),u.hc("change",(function(t){u.Cc(e);var i=n.$implicit,a=u.lc(3);return t?a.toggleAllRowsFor(i):null})),u.Yb(),u.Yb()}if(2&t){var i=n.$implicit,a=u.lc(3);u.Fb(2),u.Oc(i),u.Fb(1),u.rc("checked",a.allRowsSelectedFor(i))("indeterminate",a.selections[i].hasValue()&&!a.allRowsSelectedFor(i))("disabled","browser"===i&&!a.supportsBrowserNotifications)}}function k(t,n){if(1&t&&(u.Xb(0),u.Lc(1,y,4,4,"div",10),u.Wb()),2&t){var e=u.lc(2);u.Fb(1),u.rc("ngForOf",e.availableChannels)}}function C(t,n){if(1&t){var e=u.ac();u.Zb(0,"div",11),u.Zb(1,"mat-checkbox",16),u.hc("click",(function(t){return u.Cc(e),t.stopPropagation()}))("change",(function(t){u.Cc(e);var i=n.$implicit,a=u.lc().$implicit,r=u.lc(2);return t?r.selections[i].toggle(a.notif_id):null})),u.Yb(),u.Yb()}if(2&t){var i=n.$implicit,a=u.lc().$implicit,r=u.lc(2);u.Fb(1),u.rc("checked",r.selections[i].isSelected(a.notif_id))("disabled","browser"===i&&!r.supportsBrowserNotifications)}}function P(t,n){if(1&t&&(u.Zb(0,"div",14),u.Zb(1,"div",15),u.Nc(2),u.Yb(),u.Lc(3,C,2,2,"div",10),u.Yb()),2&t){var e=n.$implicit,i=n.last,a=u.lc(2);u.Jb("no-border",i),u.Fb(2),u.Oc(e.name),u.Fb(1),u.rc("ngForOf",a.availableChannels)}}function _(t,n){if(1&t&&(u.Zb(0,"div",5),u.Zb(1,"div",6),u.Zb(2,"div",7),u.Nc(3),u.Yb(),u.Lc(4,k,2,1,"ng-container",8),u.Yb(),u.Lc(5,P,4,4,"div",9),u.Yb()),2&t){var e=n.$implicit,i=n.first;u.Fb(3),u.Oc(e.group_name),u.Fb(1),u.rc("ngIf",i),u.Fb(1),u.rc("ngForOf",e.subscriptions)}}var w,O,F=((w=function(){function t(n,e,i,a,r){_classCallCheck(this,t),this.route=n,this.api=e,this.currentUser=i,this.toast=a,this.cd=r,this.loading$=new o.a(!1),this.supportsBrowserNotifications="Notification"in window,this.availableChannels=[],this.selections={},this.allNotifIds=[]}return _createClass(t,[{key:"ngOnInit",value:function(){var t=this;this.route.data.subscribe((function(n){t.subscriptions=n.api.subscriptions,t.availableChannels=n.api.available_channels,t.allNotifIds=n.api.all_notif_ids,t.availableChannels.forEach((function(e){t.selections[e]=new l.c(!0,n.api.selections[e])}))})),"granted"!==Notification.permission&&this.bindToBrowserNotifSubscription()}},{key:"toggleAllRowsFor",value:function(t){var n;this.allRowsSelectedFor(t)?this.selections[t].clear():(n=this.selections[t]).select.apply(n,_toConsumableArray(this.allNotifIds))}},{key:"allRowsSelectedFor",value:function(t){return this.selections[t].selected.length===this.allNotifIds.length}},{key:"saveSettings",value:function(){var t=this;this.loading$.next(!0);var n=this.getPayload();this.api.updateUserSubscriptions(this.currentUser.get("id"),n).pipe(Object(c.a)((function(){return t.loading$.next(!1)}))).subscribe((function(){t.toast.open("Notification settings updated.")}))}},{key:"getPayload",value:function(){var t=this,n={};return Object.keys(this.selections).forEach((function(e){n[e]=t.selections[e].selected})),n}},{key:"bindToBrowserNotifSubscription",value:function(){var t=this;this.selections.browser.changed.pipe(Object(s.a)(1)).subscribe((function(n){n.added.length&&!n.removed.length&&("denied"===Notification.permission?(t.toast.open("Notifications blocked. Please enable them for this site from browser settings."),t.selections.browser.clear(),t.cd.markForCheck()):Notification.requestPermission().then((function(n){"granted"!==n&&(t.selections.browser.clear(),t.cd.markForCheck())})))}))}}]),t}()).\u0275fac=function(t){return new(t||w)(u.Tb(r.a),u.Tb(d),u.Tb(p.a),u.Tb(g.a),u.Tb(u.i))},w.\u0275cmp=u.Nb({type:w,selectors:[["notification-subscriptions"]],decls:7,vars:4,consts:[["menuPosition","agent-mailbox",1,"box-shadow"],[1,"be-container"],[1,"table","material-panel",3,"ngSubmit"],["class","setting-group",4,"ngFor","ngForOf"],["mat-raised-button","","color","accent","trans","",1,"submit-button",3,"disabled"],[1,"setting-group"],[1,"row"],["trans","",1,"name-column","strong"],[4,"ngIf"],["class","row indent",3,"no-border",4,"ngFor","ngForOf"],["class","channel-column",4,"ngFor","ngForOf"],[1,"channel-column"],["trans","",1,"channel-name"],[3,"checked","indeterminate","disabled","change"],[1,"row","indent"],["trans","",1,"name-column"],[3,"checked","disabled","click","change"]],template:function(t,n){1&t&&(u.Ub(0,"material-navbar",0),u.Zb(1,"div",1),u.Zb(2,"form",2),u.hc("ngSubmit",(function(){return n.saveSettings()})),u.Lc(3,_,6,3,"div",3),u.Zb(4,"button",4),u.mc(5,"async"),u.Nc(6,"Save Settings"),u.Yb(),u.Yb(),u.Yb()),2&t&&(u.Fb(3),u.rc("ngForOf",n.subscriptions),u.Fb(1),u.rc("disabled",u.nc(5,2,n.loading$)))},directives:[f.a,h.J,h.u,h.v,a.s,m.b,a.t,v.a],pipes:[a.b],styles:["[_nghost-%COMP%]{display:block;background-color:var(--be-background-alternative);min-height:100vh}.be-container[_ngcontent-%COMP%]{padding-top:35px;padding-bottom:35px}.table[_ngcontent-%COMP%]{border-radius:4px}.setting-group[_ngcontent-%COMP%]{margin-bottom:10px}.row[_ngcontent-%COMP%]{display:flex;align-items:center;border-bottom:1px solid var(--be-divider-default);padding:10px}.row.no-border[_ngcontent-%COMP%]{border-bottom:none}.row.indent[_ngcontent-%COMP%]{padding-left:20px}.name-column[_ngcontent-%COMP%]{flex:1 1 auto}.strong[_ngcontent-%COMP%]{font-weight:500;font-size:1.5rem;align-self:flex-end}.channel-name[_ngcontent-%COMP%]{margin-bottom:10px}.channel-column[_ngcontent-%COMP%]{width:75px;text-align:center;text-transform:capitalize}.submit-button[_ngcontent-%COMP%]{margin-top:15px}"],changeDetection:0}),w),x=e("JIr8"),N=e("5+tZ"),A=e("EY2u"),M=e("LRne"),Y=((O=function(){function t(n,e,i){_classCallCheck(this,t),this.router=n,this.subscriptions=e,this.currentUser=i}return _createClass(t,[{key:"resolve",value:function(t,n){var e=this;return this.subscriptions.getAll(+this.currentUser.get("id")).pipe(Object(x.a)((function(){return e.router.navigate(["/account/settings"]),A.a})),Object(N.a)((function(t){return t?Object(M.a)(t):(e.router.navigate(["/account/settings"]),A.a)})))}}]),t}()).\u0275fac=function(t){return new(t||O)(u.dc(r.h),u.dc(d),u.dc(p.a))},O.\u0275prov=u.Pb({token:O,factory:O.\u0275fac,providedIn:"root"}),O),Z=e("kmQS"),S=e("f+iI"),T=e("OnlV"),$=e("WWJw"),I=e("Rd8u");function R(t,n){if(1&t){var e=u.ac();u.Zb(0,"li"),u.Zb(1,"button",4),u.hc("click",(function(){u.Cc(e);var t=n.$implicit;return u.lc().selectPage(t)})),u.Nc(2),u.Yb(),u.Yb()}if(2&t){var i=n.$implicit,a=u.lc();u.Fb(1),u.Jb("active",a.currentPage===i),u.rc("disabled",a.disabled),u.Fb(1),u.Oc(i)}}var j,L,U,J,B,E=((j=function(){function t(n){_classCallCheck(this,t),this.router=n,this.pageChanged=new u.p,this.disabled=!0}return _createClass(t,[{key:"selectPage",value:function(t){this.currentPage!==t&&(this.currentPage=t,this.pageChanged.next(t),this.router.navigate([],{queryParams:{page:t},replaceUrl:!0}))}},{key:"nextPage",value:function(){var t=this.currentPage+1;this.selectPage(t<=this.numberOfPages?t:this.currentPage)}},{key:"prevPage",value:function(){var t=this.currentPage-1;this.selectPage(t>=1?t:this.currentPage)}},{key:"shouldHide",get:function(){return this.numberOfPages<2}},{key:"pagination",set:function(t){t&&(this.numberOfPages=t.last_page>10?10:t.last_page,this.numberOfPages>1&&(this.iterator=Array.from(Array(this.numberOfPages).keys()).map((function(t){return t+1})),this.currentPage=t.current_page))}}]),t}()).\u0275fac=function(t){return new(t||j)(u.Tb(r.h))},j.\u0275cmp=u.Nb({type:j,selectors:[["pagination-widget"]],hostVars:2,hostBindings:function(t,n){2&t&&u.Jb("hidden",n.shouldHide)},inputs:{disabled:"disabled",pagination:"pagination"},outputs:{pageChanged:"pageChanged"},decls:8,vars:3,consts:[[1,"page-numbers"],["type","button","mat-button","","trans","",1,"prev",3,"disabled","click"],[4,"ngFor","ngForOf"],["type","button","mat-button","","trans","",1,"next",3,"disabled","click"],["type","button","mat-flat-button","","color","gray",1,"page-number-button",3,"disabled","click"]],template:function(t,n){1&t&&(u.Zb(0,"ul",0),u.Zb(1,"li"),u.Zb(2,"button",1),u.hc("click",(function(){return n.prevPage()})),u.Nc(3,"Previous"),u.Yb(),u.Yb(),u.Lc(4,R,3,4,"li",2),u.Zb(5,"li"),u.Zb(6,"button",3),u.hc("click",(function(){return n.nextPage()})),u.Nc(7,"Next"),u.Yb(),u.Yb(),u.Yb()),2&t&&(u.Fb(2),u.rc("disabled",n.disabled),u.Fb(2),u.rc("ngForOf",n.iterator),u.Fb(2),u.rc("disabled",n.disabled))},directives:[m.b,I.a,a.s],styles:["[_nghost-%COMP%]{display:block}ul[_ngcontent-%COMP%]{display:flex;align-items:center;justify-content:center;flex-wrap:wrap;width:100%}li[_ngcontent-%COMP%]{margin:0 3px 6px}.page-number-button[_ngcontent-%COMP%]{width:40px;height:40px;min-width:40px;line-height:40px;padding:0}.active[_ngcontent-%COMP%]{background-color:var(--be-accent-default);color:var(--be-accent-contrast)}.next[_ngcontent-%COMP%], .prev[_ngcontent-%COMP%]{color:var(--be-accent-default)}"],changeDetection:0}),j),W=[{path:"",component:(L=function(){function t(n,e,i,a){_classCallCheck(this,t),this.settings=n,this.notifications=e,this.breakpoints=i,this.route=a,this.pagination$=new o.a(null)}return _createClass(t,[{key:"ngOnInit",value:function(){this.loadPage(this.route.snapshot.queryParams.page||1)}},{key:"loadPage",value:function(t){var n=this;this.notifications.load({page:t,perPage:25}).subscribe((function(t){n.pagination$.next(t.pagination)}))}},{key:"markAsRead",value:function(t){this.pagination$.value.data.find((function(n){return n.id===t.id})).read_at=t.read_at}}]),t}(),L.\u0275fac=function(t){return new(t||L)(u.Tb(Z.a),u.Tb(S.a),u.Tb(T.a),u.Tb(r.a))},L.\u0275cmp=u.Nb({type:L,selectors:[["notification-page"]],decls:8,vars:13,consts:[[3,"menuPosition"],[1,"be-container"],[3,"notifications","compact","markedAsRead"],[3,"pagination","disabled","pageChanged"]],template:function(t,n){if(1&t&&(u.Ub(0,"material-navbar",0),u.Zb(1,"div",1),u.Zb(2,"notification-list",2),u.hc("markedAsRead",(function(t){return n.markAsRead(t)})),u.mc(3,"async"),u.mc(4,"async"),u.Yb(),u.Zb(5,"pagination-widget",3),u.hc("pageChanged",(function(t){return n.loadPage(t)})),u.mc(6,"async"),u.mc(7,"async"),u.Yb(),u.Yb()),2&t){var e,i=null==(e=u.nc(3,5,n.pagination$))?null:e.data;u.rc("menuPosition",n.settings.get("vebto.navbar.defaultPosition")),u.Fb(2),u.rc("notifications",i)("compact",u.nc(4,7,n.breakpoints.isMobile$)),u.Fb(3),u.rc("pagination",u.nc(6,9,n.pagination$))("disabled",u.nc(7,11,n.notifications.loading$))}},directives:[f.a,$.a,E],pipes:[a.b],styles:["[_nghost-%COMP%]{display:block;min-height:100vh;background-color:var(--be-background-alternative)}.be-container[_ngcontent-%COMP%]{padding-top:25px;padding-bottom:25px}pagination-widget[_ngcontent-%COMP%]{margin-top:35px}"],changeDetection:0}),L)},{path:"settings",component:F,resolve:{api:Y}}],X=((U=function t(){_classCallCheck(this,t)}).\u0275mod=u.Rb({type:U}),U.\u0275inj=u.Qb({factory:function(t){return new(t||U)},imports:[[r.l.forChild(W)],r.l]}),U),Q=e("MKyN"),V=e("CXWK"),q=e("gFpt"),D=e("6rvT"),H=((B=function t(){_classCallCheck(this,t)}).\u0275mod=u.Rb({type:B}),B.\u0275inj=u.Qb({factory:function(t){return new(t||B)},imports:[[a.c,m.c,D.a]]}),B),K=((J=function t(){_classCallCheck(this,t)}).\u0275mod=u.Rb({type:J}),J.\u0275inj=u.Qb({factory:function(t){return new(t||J)},imports:[[a.c,h.n,h.D,X,q.a,Q.a,V.a,H,v.b,m.c]]}),J)}}]);
//# sourceMappingURL=11-es5.976f629f975b30b6e17c.js.map