$(function() {
	
});

var jsStoreId = function(){
	
	if($("#store_id").val() == ''){
		alert('가맹점ID를 검색해주세요!');
		$("#store_id").focus();
		return;
	}
	
	var param = new Object();
	param.store_id 			 = $("#store_id").val();

	$.ajax({
	    url:  '/app/settlement/storeid_search.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	
	    	if(data == 'none'){
	    		alert('가맹점 ID가 없습니다.');
	    	}else{
	    		$("#storeIdNm").text(data);
	    	}
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
	    complete: function() {
	    }
	});
}

var jsCalendar = function(val){
	
	
	if($("#store_id").val() == ''){
		alert('가맹점ID를 검색해주세요!');
		$("#store_id").focus();
		return;
	}
	
	var frm = $("#frm2")[0];
	frm.action = "/app/settlement/calendar.do";
	frm.yyyy.value = $("#yyyy2").val();
	frm.ym.value = $("#yyyy2").val()+val;
	frm.store_id.value = $("#store_id").val();
	frm.role_id.value = $("#role_id").val();
	frm.submit();
}

var calendar_data = function(val){
	
	if(val == '1'){
		if($("#store_id").val() == ''){
			alert('가맹점ID를 검색해주세요!');
			$("#store_id").focus();
			return;
		}	
	}
	
	var frm = $("#frm2")[0];
	frm.action = "/app/settlement/calendar.do";
	frm.yyyy.value = $("#yyyy").val();
	frm.ym.value = $("#yyyy").val()+$("#mm").val();
	frm.store_id.value = $("#store_id").val();
	frm.role_id.value = $("#role_id").val();
	frm.submit();
	
}