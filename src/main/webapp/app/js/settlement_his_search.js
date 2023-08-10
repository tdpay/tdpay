$(function() {
	
   
    getOption('#roleStore', 'high_store_id', '', '');
    $('#roleStore').click(function(){
    	getOption2('#roleStore2', 'high_store_list', $('#roleStore').val(),'N', '');
   	});
    
    today();
});

var getDateStr = function(myDate){
	var year = myDate.getFullYear();
	var month = ("0"+(myDate.getMonth()+1)).slice(-2);
	var day = ("0"+myDate.getDate()).slice(-2);
	return ( year + '-' + month + '-' + day );
}

/* 오늘 날짜 */
var today = function() {
	var d = new Date();
//	return getDateStr(d);
	
	$("#start_datetime").val(getDateStr(d));
	$("#end_datetime").val(getDateStr(d));
}

/* 오늘로부터 며칠전 날짜 */
var prevDay = function(days) {
	var d = new Date();
	$("#end_datetime").val(getDateStr(d));
	
	var dayOfMonth = d.getDate();
	d.setDate(dayOfMonth - days);
	$("#start_datetime").val(getDateStr(d));
}

/* 오늘로부터 몇개월전 날짜 */
var prevMonth = function(month) {
	var d = new Date();
	$("#end_datetime").val(getDateStr(d));
	
	var monthOfYear = d.getMonth();
	d.setMonth(monthOfYear - month);
	$("#start_datetime").val(getDateStr(d));
}

var settlement_his_data = function(){

	var frm = $("#frm")[0];
	frm.action = "/app/settlement/settlement_his.do";
	frm.submit();
	
}

var settlement_his_init = function(){
	$("#userid").val('');
	$("#start_datetime").val('');
	$("#end_datetime").val('');
	$("#terminalid").val('');
	$("#state").val('');
	$("#commission").val('');
	$("#tax").val('');
	$("#tax2").val('');
}


