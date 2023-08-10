
$(function(){

    // nav scroll sticky
    $(window).scroll(function(){
        var sticky = $('#nav'),
            scroll = $(window).scrollTop();
    
        if(scroll >= 140) {
            sticky.addClass('fixed');
            $('.basic_bg').addClass('nav_fix');
        } else {
            sticky.removeClass('fixed');
            $('.basic_bg').removeClass('nav_fix');
        }
    });

    // search_table 가입일자 탭
    $('.join_date .select_date li').on('click',function(){
        if($(this).hasClass('on')){}
        else{
            $('.join_date .select_date li').removeClass('on')
            $(this).addClass('on');
        }
    });

})