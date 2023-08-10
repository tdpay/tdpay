$(function() {
	
    getTimeStamp();
    
    $("#frm").validate({
    	rules: { 
    		USERID: { 
    			required : true, 
    			remote: {
    				url : "/common/store_id.do",
    				type : "post",
    				data : {
    						store_id : function(){
    								return $("#USERID").val();
    							}
    						}
    					} 
    		},    		
    		orderNumb: { required : true},
    		totalAmount: { required : true, number:true },
    		cardNumb: { required : true, number:true },
    		expiryDate: { required : true },
    		productName: { required : true },
    		userName: { required : true},
    		sndMobile: { required : true, number:true },
    	}, 
    	
		messages : { 
			USERID : {
				remote : $.validator.format("가맹점 상점ID 확인하십시요."),
			},			
		},    	
    	submitHandler : function(form){
    		
		//	var frm = $("#frm")[0];
		//	frm.sndReply.value = getLocalUrl("kspay_wh_rcv.do");
		//	_pay(frm);

			var param = $('#frm').serialize();
			
			$.ajax({
			    url:  '/app/payment2/cardSugido.do',
			    type: 'POST',
			    data: param,
			    success: function(data){
			    	
			    	if(data == 'SUCCESS'){
			    		alert('결제되었습니다.');
			    	}else{
			    		alert(data);
			    	}
			    },
			    error: function(e){
			        alert(e.reponseText);
			    },
			    complete: function() {
			    }
			});	
			
        }
		
    });
    
});

var fnSubmit = function(){
	
	$("#frm").submit();
}

var fnLinkSubmit = function(){
	
	var frm = $("#frm")[0];
	
	if(frm.USERID.value == ""){
		alert("상점ID를 입력하세요!");
		frm.USERID.focus();
		return;
	}
	if(frm.orderNumb.value == ""){
		alert("주문번호를 입력하세요!");
		frm.orderNumb.focus();
		return;
	}
	if(frm.totalAmount.value == ""){
		alert("결제금액을 입력하세요!");
		frm.totalAmount.focus();
		return;
	}
	if(frm.productName.value == ""){
		alert("상품명을 입력하세요!");
		frm.productName.focus();
		return;
	}
	if(frm.userName.value == ""){
		alert("고객이름을 입력하세요!");
		frm.userName.focus();
		return;
	}
	if(frm.sndMobile.value == ""){
		alert("고객전화번호를 입력하세요!");
		frm.sndMobile.focus();
		return;
	}

	
//	frm.action = "/payment2/payment_link_sms.do";
//	frm.submit();
	
	var param = $('#frm').serialize();
	
	$.ajax({
	    url:  '/app/payment2/payment_link_sms.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
    		alert('sms 발송하였습니다.');
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
	    complete: function() {
	    }
	});	
	
}

var chk_Number = function(object){
	$(object).keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
}



var getTimeStamp = function() {
	var d = new Date();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var hour = d.getHours();
	var minute = d.getMinutes();
	var second = d.getSeconds();

	month = (month < 10 ? "0" : "") + month;
	date = (date < 10 ? "0" : "") + date;
	hour = (hour < 10 ? "0" : "") + hour;
	minute = (minute < 10 ? "0" : "") + minute;
	second = (second < 10 ? "0" : "") + second;

	var s = d.getFullYear() + month + date + hour + minute + second;

	var frm = $("#frm")[0];
	frm.orderNumb.value= s;
}

var fnReset = function(){
	$("#USERID").val('');
	$("#orderNumb").val('');
	$("#totalAmount").val('');
	$("#cardNumb").val('');
	$("#expiryDate").val('');
	$("#productName").val('');
	$("#userName").val('');
	$("#sndMobile").val('');
	$("#userEmail").val('');
}

