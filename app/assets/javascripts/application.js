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
    document.cookie=`${name}=${value}`
    return getCookie(name)
}
function getCookie(name) {
	var value = "; " + document.cookie;
	var parts = value.split("; " + name + "=");
	if (parts.length == 2) return parts.pop().split(";").shift();
}
function delCookie(name) { 
	var exp = new Date(); 
	exp.setTime(exp.getTime() - 1); 
	var cval=getCookie(name); 
	if(cval!=null) 
		document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
} 