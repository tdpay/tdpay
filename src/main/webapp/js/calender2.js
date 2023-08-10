$(function() {
	
	$("#gnb5000").addClass('on');
    $("#5000_sub").addClass('on');
    $("#5001").addClass('on');
    
    calendar_data('0');
});

var jsStoreId = function(){
	
	if($("#search_nm").val() == ''){
		if($("#search_id").val() == "store_id") {
			alert('가맹점ID를 입력해주세요!');
		} else if($("#search_id").val() == "business_nm") {
			alert('가맹점이름을 검색해주세요!')
		}
		//alert('가맹점ID 또는 가맹점이름을 검색해주세요!');
		$("#search_nm").focus();
		return;
	}
	
	var param = new Object();
	param.search_nm 			 = $("#search_nm").val();

	$.ajax({
	    url:  '/settlement/storeid_search.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	
	    	if(data == 'none'){
	    		alert('가맹점ID 가 가맹점이 없습니다.');
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
	
	var param = new Object();
	
	if($("#search_nm").val() == ''){
		if($("#search_id").val() == "store_id") {
			alert('가맹점ID를 입력해주세요!');
		} else if($("#search_id").val() == "business_nm") {
			alert('가맹점이름을 검색해주세요!');
		}
		//alert('가맹점ID 또는 가맹점이름을 검색해주세요!');
		$("#search_nm").focus();
		return;
	}
	
	param.yyyy			 	 = $("#yyyy2").val();
	param.ym 				 = $("#yyyy2").val()+val;
	param.search_id		 	 = $("#search_id").val();
	param.search_nm 		 = $("#search_nm").val();
	param.role_id 			 = $("#role_id").val();
	
	$.post("calendar_data.do", param, function(data) {
		$("#calendar_data").html(data);
	});
}


var calendar_data = function(val){
	
	if(val == 1) {
		if($("#search_nm").val() == ''){
			if($("#search_id").val() == "store_id") {
				alert('가맹점ID를 입력해주세요!');
			} else if($("#search_id").val() == "business_nm") {
				alert('가맹점이름을 검색해주세요!');
			}
			//alert('가맹점ID 또는 가맹점이름을 검색해주세요!');
			$("#search_nm").focus();
			return;
		}
	}
	
	var param = new Object();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	param.search_id		 	 = $("#search_id").val();
	param.search_nm 		 = $("#search_nm").val();
	param.role_id 			 = $("#role_id").val();
	
	$.post("calendar_data.do", param, function(data) {
		$("#calendar_data").html(data);
	});
}