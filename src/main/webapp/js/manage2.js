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
	
	
	$("#2000").addClass('on');
    $("#2000_sub").addClass('on');
    $("#2001").addClass('on');

    $("#pageUnit").val("20");
	//	today();
    manage2_data();
    
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

var frmInfo = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/manage2/manage2_modify.do";
	frm.store_id.value = val;
	frm.submit();
}
var frmView = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/manage2/manage2_view.do";
	frm.store_id.value = val;
	frm.submit();
}
var frmDel = function(val){
	
	var param = new Object();
	param.store_id		 = val;

	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
		    url:  '/manage2/manage2Del.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	manage2_data();
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});
	}
	
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
	f.action = "/manage2/manage2_excel.do";
	f.submit();
}

var manage2_data = function(){
	
	var param = new Object();
	param.searchKeyword 	 = $("#searchKeyword").val();
	param.searchKeyword1 	 = $("#searchKeyword1").val();
	param.searchKeyword2 	 = $("#searchKeyword2").val();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.store_id 			 = $("#store_id").val();
	param.business_nm 		 = $("#business_nm").val();
	param.email 			 = $("#email").val();
	param.tel 				 = $("#tel").val();
	param.phone_num 		 = $("#phone_num").val();
	param.ceo			 	 = $("#ceo").val();
	param.person_nm 		 = $("#person_nm").val();
	param.terminal_id 		 = $("#terminal_id").val();
	param.state 			 = $("#state").val();
	param.role_id 			 = $("#role_id").val();
	param.roleStore 		 = $("#roleStore").val();
	param.roleStore2 		 = $("#roleStore2").val();
	param.high_store_id 	 = $("#high_store_id").val();
	param.high_store_id2 	 = $("#high_store_id2").val();
	param.pageUnit 			 = $("#pageUnit").val();
	param.commission 		 = $("#commission").val();
	param.tax 				 = $("#tax").val();
	param.period 			 = $("#period").val();
	param.view_type		 	 = view_type_s;
	param.day_type		 	 = $("#day_type").val();
	param.order_id		 	 = $("#order_id").val();
	param.order_no		 	 = $("#order_no").val();	
	param.search_id 		 = $("#search_id").val();
	param.search_nm 		 = $("#search_nm").val();
	
	$.post("manage2_data.do", param, function(data) {
		$("#manage2_data").html(data);
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
	
	manage2_data();
}

var manage2_init = function(){
	$("#start_datetime").val('');
	$("#end_datetime").val('');
	$("#business_nm").val('');
	$("#email").val('');
	$("#tel").val('');
	$("#phone_num").val('');
	$("#searchKeyword2").val('');
	$("#person_nm").val('');
	$("#terminal_id").val('');
	$("#state").val('');
	$("#commission").val('');
	$("#tax").val('');
	$("#period").val('');
	$("#search_id").val('');
	$("#search_nm").val('');
}

/* pagination 페이지 링크 function */
var fn_link_page = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	param.searchKeyword 	 = $("#searchKeyword").val();
	param.searchKeyword1 	 = $("#searchKeyword1").val();
	param.searchKeyword2 	 = $("#searchKeyword2").val();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.business_nm 		 = $("#business_nm").val();
	param.email 			 = $("#email").val();
	param.tel 				 = $("#tel").val();
	param.phone_num 		 = $("#phone_num").val();
	param.ceo			 	 = $("#ceo").val();
	param.person_nm 		 = $("#person_nm").val();
	param.terminal_id 		 = $("#terminal_id").val();
	param.state 			 = $("#state").val();
	param.role_id 			 = $("#role_id").val();
	param.roleStore 		 = $("#roleStore").val();
	param.roleStore2 		 = $("#roleStore2").val();
	param.high_store_id 	 = $("#high_store_id").val();
	param.high_store_id2 	 = $("#high_store_id2").val();
	param.pageUnit 			 = $("#pageUnit").val();
	param.commission 		 = $("#commission").val();
	param.tax 				 = $("#tax").val();
	param.period 			 = $("#period").val();	
	param.search_id 		 = $("#search_id").val();
	param.search_nm 		 = $("#search_nm").val();	
	$.post("manage2_data.do", param, function(data) {
		$("#manage2_data").html(data);
	});
}