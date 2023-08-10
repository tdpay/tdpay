
let seqno;
let period_date;
let cpid;
let cp_type;

$(function() {
    $( ".date_form" ).datepicker({
		showOn: "both",
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        buttonImageOnly: false,
        showMonthAfterYear: true,
        hideIfNoPrevNext: true,
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		dayNames: ['일','월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일','월', '화', '수', '목', '금', '토']
	});
	
	//$("#gnb7000").addClass('on');
    //$("#7000_sub").addClass('on');
    //$("#7002").addClass('on');
    
    today('day');
    sales_manage_data();
    
});

var getDateStr = function(myDate){
	var year = myDate.getFullYear();
	var month = ("0"+(myDate.getMonth()+1)).slice(-2);
	var day = ("0"+myDate.getDate()).slice(-2);
	return ( year + '-' + month + '-' + day );
}

/* 오늘 날짜 */
var today = function(type) {
	var d = new Date();
//	return getDateStr(d);
	
	$("#start_datetime").val(getDateStr(d));
	$("#end_datetime").val(getDateStr(d));
	
	$("#day_type").val(type);
}

/* 오늘로부터 며칠전 날짜 */
var prevDay = function(days, type) {
	var d = new Date();
	$("#end_datetime").val(getDateStr(d));
	
	var dayOfMonth = d.getDate();
	d.setDate(dayOfMonth - days);
	$("#start_datetime").val(getDateStr(d));
	
	$("#day_type").val(type);
}

/* 오늘로부터 몇개월전 날짜 */
var prevMonth = function(month, type) {
	var d = new Date();
	$("#end_datetime").val(getDateStr(d));
	
	var monthOfYear = d.getMonth();
	d.setMonth(monthOfYear - month);
	$("#start_datetime").val(getDateStr(d));
	
	$("#day_type").val(type);
}

var sales_manage_data = function(){
	
	var param = new Object();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.day_type		 	 = $("#day_type").val();
	param.cp_type			 = $("#cp_type").val();
	$.post("sales_manage_data.do", param, function(data) {
		$("#sales_manage_data").html(data);
	});
}
