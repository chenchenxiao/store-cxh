/**
 * Created by i on 2017/7/30.
 */
jQuery(document).ready(function($) {
    $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
    });
});
$(document).ready(function(c) {
    $('.alert-close').on('click', function(c){
        $('.message').fadeOut('slow', function(c){
            $('.message').remove();
        });
    });
});
$(document).ready(function(c) {
    $('.alert-close1').on('click', function(c){
        $('.message1').fadeOut('slow', function(c){
            $('.message1').remove();
        });
    });
});