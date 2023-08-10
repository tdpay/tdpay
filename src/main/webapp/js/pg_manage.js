$(function() {
	
 
	$("#gnb12000").addClass('on');
    $("#12000_sub").addClass('on');
    $("#12007").addClass('on');
    
    pg_manage_data();
});


var frmAdd = function(){
	
	var param = new Object();
	param.bank_code	   = $("#bank_code").val();
	param.bank_nm	   = $("#bank_nm").val();

	if($("#bank_code").val() == ''){
		alert("코드명을 입력하세요!");
		return;
	}
	if($("#bank_nm").val() == ''){
		alert("은행명을 입력하세요!");
		return;
	}
	
	$.ajax({
	    url:  '/setup/pgManageAdd.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	if(data > 0){
	    		alert("코드명이 중복되었습니다.");
	    		return;
	    	}
	    	if(data == 0){
	    		setup_bank_data();
	    		$('.btn_closed').trigger("click");
	    	}
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
		complete: function() {
		}
	});
	
}

var frmDel = function(val){
	
	var param = new Object();
	param.bank_code	   = val;
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/setup/pgManageDel.do',
			type: 'POST',
			data: param,
			success: function(data){
				setup_bank_data();
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}

var pg_manage_data = function(){
	
	var param = new Object();
	
	$.post("pg_manage_data.do", param, function(data) {
		$("#pg_manage_data").html(data);
	});
}
