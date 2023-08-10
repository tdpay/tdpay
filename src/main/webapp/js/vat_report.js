	
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
    $("#7009").addClass('on');

    today('day');
    vat_report_data();
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


var doExcelDownload1 = function(){
	/*var arr_key;
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
    f.arr_check_id.value = arr_key;*/
	var f = document.frm2;
	f.yyyy.value = $("#yyyy").val();
	f.ym.value = $("#yyyy").val()+$("#mm").val();
	f.action = "/settlement/settlement_store_vat_excel.do";
	f.submit();
}

var doExcelDownload2 = function(){
	/*var arr_key;
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
    f.arr_check_id.value = arr_key;*/
	var f = document.frm3;
	f.yyyy.value = $("#yyyy").val();
	f.ym.value = $("#yyyy").val()+$("#mm").val();
	f.action = "/settlement/settlement_branch_vat_excel.do";
	f.submit();
}

var doExcelDownload3 = function(){
	/*var arr_key;
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
    f.arr_check_id.value = arr_key;*/
	var f = document.frm4;
	f.yyyy.value = $("#yyyy").val();
	f.ym.value = $("#yyyy").val()+$("#mm").val();
	f.action = "/settlement/settlement_manage_vat_excel.do";
	f.submit();
}

var vat_report1_data = function(){
	var param = new Object();
	//param.start_datetime 	 = $("#start_datetime").val();
	//param.end_datetime 		 = $("#end_datetime").val();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	//param.corp_regist_num 	 = $("#corp_regist_num").val();
	param.pageUnit 			 = $("#pageUnit").val();
	
	$.post("vat_report1_data.do", param, function(data) {
		$("#vat_report1_data").html(data);
	});
	
}

var vat_report2_data = function(){
	var param = new Object();
	//param.start_datetime 	 = $("#start_datetime").val();
	//param.end_datetime 		 = $("#end_datetime").val();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	//param.corp_regist_num 	 = $("#corp_regist_num").val();
	param.pageUnit 			 = $("#pageUnit").val();
	
	$.post("vat_report2_data.do", param, function(data) {
		$("#vat_report2_data").html(data);
	});
}

var vat_report3_data = function(){
	var param = new Object();
	//param.start_datetime 	 = $("#start_datetime").val();
	//param.end_datetime 		 = $("#end_datetime").val();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	//param.corp_regist_num 	 = $("#corp_regist_num").val();
	param.pageUnit 			 = $("#pageUnit").val();
	
	$.post("vat_report3_data.do", param, function(data) {
		$("#vat_report3_data").html(data);
	});
}

var vat_report_data = function(){
	
	vat_report1_data();
	vat_report2_data();
	vat_report3_data();
	
}


var vat_report_init = function(){
	$("#start_datetime").val('');
	$("#end_datetime").val('');
	$("#corp_regist_num").val('');
}

/* pagination 페이지 링크 function */
var fn_link_page1 = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	//param.start_datetime 	 = $("#start_datetime").val();
	//param.end_datetime 		 = $("#end_datetime").val();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	//param.corp_regist_num 	 = $("#corp_regist_num").val();
	param.pageUnit 			 = $("#pageUnit").val();
	
	$.post("vat_report1_data.do", param, function(data) {
		$("#vat_report1_data").html(data);
	});
}
var fn_link_page2 = function(pageNo){
	
	var param = new Object();
	param.pageIndex 		 = pageNo;
	//param.start_datetime 	 = $("#start_datetime").val();
	//param.end_datetime 		 = $("#end_datetime").val();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	//param.corp_regist_num 	 = $("#corp_regist_num").val();
	param.pageUnit 			 = $("#pageUnit").val();
	
	$.post("vat_report2_data.do", param, function(data) {
		$("#vat_report2_data").html(data);
	});
}
var fn_link_page3 = function(pageNo){
	
	var param = new Object();
	param.pageIndex 		 = pageNo;
	//param.start_datetime 	 = $("#start_datetime").val();
	//param.end_datetime 		 = $("#end_datetime").val();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	//param.corp_regist_num 	 = $("#corp_regist_num").val();
	param.pageUnit 			 = $("#pageUnit").val();
	
	$.post("vat_report3_data.do", param, function(data) {
		$("#vat_report3_data").html(data);
	});
}


