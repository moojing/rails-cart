// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require toastr




//cookie 

function setCookie(name,value){
	value = encodeURIComponent(JSON.stringify(value).replaceAll(' ','+'))
    document.cookie=`${name}=${value}; path=/;`
    return getCookie(name)
}
function getCookie(name) {
	var value = "; " + document.cookie;
	var parts = value.split("; " + name + "=");
	let res
	if (parts.length == 2){
		res= parts.pop().split(";").shift(); 
		return JSON.parse(decodeURIComponent(res).replaceAll('+',' '))
	}else{
		return undefined
	}
}
function delCookie(name) { 
	var exp = new Date(); 
	exp.setTime(exp.getTime() - 1); 
	var cval=getCookie(name); 
	if(cval!=null) 
		document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
} 

String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.split(search).join(replacement);
};