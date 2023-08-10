$(function() {
    $('.contents_wrap .table_layout th.num #check_all').on('change', function () {
        if ($(this).is(':checked')) {
            $('.contents_wrap .table_layout td.num input').prop('checked', true);
        } else {
            $('.contents_wrap .table_layout td.num input').prop('checked', false);
        }
    })

    $('.contents_wrap .table_layout td.num input').on('change', function () {
        var length = $('.contents_wrap .table_layout td.num input:checked').length;
        var total = $('.contents_wrap .table_layout td.num input').length;
        if (length >= total) {
            $('.contents_wrap .table_layout th.num #check_all').prop('checked', true);
        } else {
            $('.contents_wrap .table_layout th.num #check_all').prop('checked', false);
        }
    })

    // 검색버튼 클릭시
    $('.input_date .period_select button').on('click',function(){
        if($(this).hasClass('active')){
            $(this).removeClass('active');
        } else {
            $(this).addClass('active').siblings().removeClass('active');
        }
    });
});