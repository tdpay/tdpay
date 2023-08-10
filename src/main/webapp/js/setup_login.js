$(function() {
	
 
	$("#gnb8000").addClass('on');
    $("#8000_sub").addClass('on');
    $("#8002").addClass('on');
    
    getOption('#email3', 'email', 'E', '');
    setup_login_data();
});

function emailSel(val){
	var frm = document.frm2;
	frm.email2.value = val;
}

var AuthAction = function(){
	
	var param = new Object();
	param.type		   = $("input[name='type']:checked").val();
	param.check_no	   = $("#phone_num").val();

	$("#check_no").val($("#phone_num").val());
	
	if($("#phone_num").val() == ''){
		alert("휴대폰번호를 입력하세요!");
		return;
	}
	$.ajax({
	    url:  '/setup/AuthAction.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	alert('인증번호가 발송되었습니다.');
	    	$('#check').val(data);
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
	    complete: function() {
	    }
	});
	
}

var AuthAction2 = function(){
	
	var param = new Object();
	param.type		   = $("input[name='type']:checked").val();
	param.check_no	   = $("#email1").val()+"@"+$("#email2").val();

	$("#check_no").val($("#email1").val()+"@"+$("#email2").val());
	
	if($("#email1").val() == ''){
		alert("이메일 주소를 입력하세요!");
		return;
	}
	if($("#email2").val() == ''){
		alert("이메일 주소를 입력하세요!");
		return;
	}
	
	$.ajax({
	    url:  '/setup/AuthAction.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	alert('인증번호가 발송되었습니다.');
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
	    complete: function() {
	    }
	});
	
}

var AuthActionCehck = function(){
	
	var param = new Object();
	param.type		   = $("input[name='type']:checked").val();
	param.auth_no	   = $("#setup_auth_no").val();

	if($("#setup_auth_no").val() == ''){
		alert("인증번호를 입력하세요!");
		return;
	}
	
	$.ajax({
	    url:  '/setup/AuthActionCehck.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	if(data == "AUTH_SUCCESS"){
				alert("정상인증 되었습니다.");
				$("#authResult").val(data);
	    		return;
	    	}else if(data == "AUTH_FALSE"){
				alert("인증번호를 확인해주세요!");
				$("#authResult").val(data);
				return;		    		
	    	}
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
	    complete: function() {
	    }
	});
	
}

var AuthActionAdd = function(){
	
	if($("#authResult").val() != "AUTH_SUCCESS"){
		alert("인증번호를 확인해주세요!");
		return;
	}
	var param = new Object();
	param.type		   = $("input[name='type']:checked").val();
	
	if($("input[name='type']:checked").val() == "1"){
		param.check_no	   = $("#phone_num").val();
	}
	if($("input[name='type']:checked").val() == "2"){
		param.check_no	   = $("#email1").val()+"@"+$("#email2").val();
	}
	param.store_id	   = $("#store_id").val();
	param.created_id   = $("#created_id").val();

	$.ajax({
	    url:  '/setup/AuthActionAdd.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	$('.popup_wrap').hide();	    	
            $('.dim').fadeOut();
	    	setup_login_data();
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
	    complete: function() {
	    }
	});
	
}

var frmDel = function(val,val2){
	
	var param = new Object();
	param.auth_type	   = val;
	param.no		   = val2;
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/setup/setupLoginDel.do',
			type: 'POST',
			data: param,
			success: function(data){
				setup_login_data();
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}

var setup_login_data = function(){
	
	var param = new Object();
	param.store_id 	 = $("#store_id").val();
	
	$.post("setup_login_data.do", param, function(data) {
		$("#setup_login_data").html(data);
	});
}
