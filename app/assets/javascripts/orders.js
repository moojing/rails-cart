// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function showErr(errName){
    $(`.error-${errName}`).parent().find('input').css('border-bottom','1px solid #c66185')
} 
function order_validate(e) {
     
    var error = $('.errorwrap');
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    let phoneReg = /\d./
    error.html('');
   
    if (e['order[last_name]'].value.length <=0) {
        $('.error-last-name').html("<span>請輸入姓名</span>");
        showErr('last-name')
    }
    
    if (e['order[first_name]'].value.length <=0) {
        $('.error-first-name').html("<span>請輸入姓名</span>");
        showErr('first-name')
    }
    
    if (!phoneReg.test(e['order[phone]'].value)) {
        $('.error-phone').html("<p><span class='order-error'>只能輸入數字</span></p>");
        showErr('phone')

    }
    
    if (!emailReg.test(e['order[email]'].value)) {
        $('.error-email').html("<p><span class='order-error'>Email格式錯誤！</span></p>");
        showErr('email')
    }
    
}