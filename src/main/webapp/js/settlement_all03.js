
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
	
	$("#gnb7000").addClass('on');
    $("#7000_sub").addClass('on');
    $("#7010").addClass('on');
    
    today('day');
    $("#pageUnit").val("20");
    settlement_all_data();
    
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

var frmView = function(val, val2, val3){
	
	var frm = $("#frm2")[0];
	frm.action = "/settlement/settlement_all_view.do";
	frm.no.value = val;
	frm.daoutrx.value = val2;
	frm.cpid.value = val3;
	frm.submit();
}
var doExcelDownload = function(){
	var arr_key;
	var i = 0 ; 
	
    $("input[name=check_id]").each(function(){
    	if($(this).is(":checked")){
        		if(i == 0) {
        			arr_key 			= $(this).attr("key").split(",");
        		}else{
        			arr_key 			+= "," + $(this).attr("key").split(",");
        		}
        		i++;
        	}
    });
    
    if(i == 0){
    	alert("하나이상 선택하세요!");
    	return;
    }
    
    var f = document.frm2;
    f.arr_check_id.value = arr_key;
	f.action = "/settlement/settlement_all_excel.do";
	f.submit();
}

var settlement_all_data = function(){
	
	var param = new Object();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.amount1 			 = $("#amount1").val();
	param.amount2 			 = $("#amount2").val();
	param.cardcode 			 = $("#cardcode").val();
	param.cardno 			 = $("#cardno").val();
	param.quota 			 = $("#quota").val();
	param.username		 	 = $("#username").val();
	param.roleStore 		 = $("#roleStore").val();
	param.roleStore2 		 = $("#roleStore2").val();
	param.roleStore3 		 = $("#roleStore3").val();
	param.orderno 			 = $("#orderno").val();
	param.terminalid 		 = $("#terminalid").val();
	param.state 			 = $("#state").val();
	param.commission 		 = $("#commission").val();
	param.tax_state 		 = $("#tax_state").val();
	param.tax_state2 		 = $("#tax_state2").val();
	param.high_store_id 	 = $("#high_store_id").val();
	param.high_store_id2 	 = $("#high_store_id2").val();
	param.view_type		 	 = view_type_s;
	param.day_type		 	 = $("#day_type").val();
	param.order_id		 	 = $("#order_id").val();
	param.order_no		 	 = $("#order_no").val();
	param.pageUnit 			 = $("#pageUnit").val();
	param.cp_type 			 = $("#cp_type").val();
	param.search_id			 = $("#search_id").val();
	param.search_nm			 = $("#search_nm").val();
	param.settlement_type	 = $("#settlement_type").val();
	param.cp_type			 = $("#cp_type").val();
	param.period			 = $("#period").val();
	param.seqno			 	 = $("#seqno").val();
	param.paymenttype		 = $("#paymenttype").val();
	$.post("settlement_all_data2.do", param, function(data) {
		$("#settlement_all_data").html(data);
	});
	view_type_s = "";
}

var frmOrder = function(id){
	
	if($("#order_id").val() == ''){
	}else{
		if($("#order_id").val() == id && $("#order_no").val() == "1"){
			$("#order_no").val("2");
		}else if($("#order_id").val() == id && $("#order_no").val() == "2"){
			$("#order_no").val("1");
		}else{
			$("#order_no").val("1");
		}
	}
	
	$("#order_id").val(id);
	
	settlement_all_data();
}

var settlement_all_init = function(){
	$("#start_datetime").val('');
	$("#end_datetime").val('');
	$("#amount1").val('');
	$("#amount2").val('');
	$("#cardcode").val('');
	$("#cardno").val('');
	$("#quota").val('');
	$("#username").val('');
	$("#orderno").val('');
	$("#roleStore").val('');
	$("#roleStore2").val('');
	$("#terminalid").val('');
	$("#state").val('');
	$("#commission").val('');
	$("#tax_state").val('');
	$("#tax_state2").val('');
	$("#search_id").val('');
	$("#search_nm").val('');
	$("#settlement_type").val('');
	$("#cp_type").val('1');
	$("#period").val('0');
	$("#seqno").val('');
}

/* pagination 페이지 링크 function */
var fn_link_page = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.amount1 			 = $("#amount1").val();
	param.amount2 			 = $("#amount2").val();
	param.cardcode 			 = $("#cardcode").val();
	param.cardno 			 = $("#cardno").val();
	param.quota 			 = $("#quota").val();
	param.username		 	 = $("#username").val();
	param.roleStore 		 = $("#roleStore").val();
	param.roleStore2 		 = $("#roleStore2").val();
	param.roleStore3 		 = $("#roleStore3").val();
	param.orderno 			 = $("#orderno").val();
	param.terminalid 		 = $("#terminalid").val();
	param.state 			 = $("#state").val();
	param.commission 		 = $("#commission").val();
	param.tax_state 		 = $("#tax_state").val();
	param.tax_state2		 = $("#tax_state2").val();
	param.high_store_id 	 = $("#high_store_id").val();
	param.high_store_id2 	 = $("#high_store_id2").val();	
	param.pageUnit 			 = $("#pageUnit").val();
	param.cp_type 			 = $("#cp_type").val();
	param.search_id			 = $("#search_id").val();
	param.search_nm			 = $("#search_nm").val();
	param.settlement_type	 = $("#settlement_type").val();
	param.cp_type			 = $("#cp_type").val();
	param.period			 = $("#period").val();
	param.paymenttype		 = $("#paymenttype").val();
	$.post("settlement_all_data2.do", param, function(data) {
		$("#settlement_all_data").html(data);
	});
}

var detail = function(param0, param1, param2, param3){
	var param = new Object();
	param.seqno	   		     = param0;
	param.period_date 		 = param1;
	param.cpid 				 = param2;
	param.cp_type			 = param3;
	
	seqno = param0;
	period_date = param1;
	cpid = param2;
	cp_type = param3;
	
	$.post("settlement_all_info.do", param, function(data) {
		$("#dim").html(data);
	});
}

var fn_link_page2 = function(pageNo){

	var param = new Object();
	param.pageIndex 	 = pageNo;
	param.pageUnit 		 = 10;	
	param.seqno		 	 = seqno;
	param.period_date 	 = period_date;
	param.cpid 			 = cpid;
	param.cp_type 		 = cp_type;
	$.post("settlement_all_info.do", param, function(data) {
		$("#dim").html(data);
	});
}
