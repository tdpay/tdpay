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
	
	$("#gnb5000").addClass('on');
    $("#5000_sub").addClass('on');
    $("#5006").addClass('on');
    
    $("#pageUnit").val("20");
    today();
    settlement_his_data();
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

var frmView = function(val, val2, val3){
	
	var frm = $("#frm2")[0];
	frm.action = "/settlement/settlement_his_view.do";
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
	f.action = "/settlement/settlement_his_excel.do";
	f.submit();
}

var settlement_his_data = function(){
	
	var param = new Object();
	param.userid		 	 = $("#userid").val();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.terminalid 		 = $("#terminalid").val();
	param.state 			 = $("#state").val();
	param.commission 		 = $("#commission").val();
	param.tax_state 		 = $("#tax_state").val();
	param.tax_state2 		 = $("#tax_state2").val();
	param.high_store_id 	 = $("#high_store_id").val();
	param.high_store_id2 	 = $("#high_store_id2").val();
	param.view_type		 	 = view_type_s;
	param.order_id		 	 = $("#order_id").val();
	param.order_no		 	 = $("#order_no").val();
	param.pageUnit 			 = $("#pageUnit").val();
	param.cp_type 			 = $("#cp_type").val();
	param.search_id			 = $("#search_id").val();
	param.search_nm			 = $("#search_nm").val();	
	
	$.post("settlement_his_data.do", param, function(data) {
		$("#settlement_his_data").html(data);
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
	
	settlement_his_data();
}

var settlement_his_init = function(){
	$("#userid").val('');
	$("#start_datetime").val('');
	$("#end_datetime").val('');
	$("#terminalid").val('');
	$("#state").val('');
	$("#commission").val('');
	$("#tax_state").val('');
	$("#tax_state2").val('');
	$("#search_id").val('');
	$("#search_nm").val('');
}

/* pagination 페이지 링크 function */
var fn_link_page = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	param.userid		 	 = $("#userid").val();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.terminalid 		 = $("#terminalid").val();
	param.state 			 = $("#state").val();
	param.commission 		 = $("#commission").val();
	param.tax_state 		 = $("#tax_state").val();
	param.tax_state2 		 = $("#tax_state2").val();
	param.high_store_id 	 = $("#high_store_id").val();
	param.high_store_id2 	 = $("#high_store_id2").val();	
	param.pageUnit 			 = $("#pageUnit").val();
	param.cp_type 			 = $("#cp_type").val();
	param.search_id			 = $("#search_id").val();
	param.search_nm			 = $("#search_nm").val();
	
	$.post("settlement_his_data.do", param, function(data) {
		$("#settlement_his_data").html(data);
	});
}