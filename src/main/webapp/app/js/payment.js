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
    		ORDERNO: { required : true},
    		AMOUNT: { required : true, number:true },
    		CARDNO: { required : true, number:true },
    		EXPIRATIONDATE: { required : true, number:true },
    		CARDAUTH: { 
    			number: true, 
                required: function(){
                    if($('input:radio[name="BILLTYPE"]:checked').val() == "13"){
                        return true;
                    }
                    return false;   
                }
    		},
    		CARDPASSWORD: { 
    			number: true, 
                required: function(){
                    if($('input:radio[name="BILLTYPE"]:checked').val() == "13"){
                        return true;
                    }
                    return false;   
                }
    		},    		
    		PRODUCTNAME: { required : true },
    		USERNAME: { required : true},
    		USERPHONE: { required : true, number:true },
    	}, 
    	
		messages : { 
			USERID : {
				remote : $.validator.format("가맹점 상점ID 확인하십시요."),
			},			
		},    	
    	submitHandler : function(form){
			var param = $('#frm').serialize();
			
			$.ajax({
			    url:  '/app/payment/cardSugido.do',
			    type: 'POST',
			    data: param,
			    success: function(data){
			    	
		    	   $.each(data, function(key, value){
		    		   if(key == 'SUCCESS'){
		    			   var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
		    			   setTimeout(function () {
		    				   window.open('https://agent.payjoa.co.kr/common/PayInfoPrintDirectCard.jsp?DAOUTRX='+value+'&STATUS=11', 'popup', options);
		    			   }, 2000);
		    			   alert("결제되었습니다");
		    		   }else if(key == "9103"){
		    			   alert("과금 유형을 확인해주세요.");
		    		   }else{
		    			   alert(value);
		    		   }
		    	   });
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

var jsBillType = function(val){
	
	if(val == "13"){
       $("#TR_CARDAUTH").show();
       $("#TR_CARDPASSWORD").show();
	}else{
		$("#TR_CARDAUTH").hide();
		$("#TR_CARDPASSWORD").hide();
	}
	
	
}

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
	if(frm.ORDERNO.value == ""){
		alert("주문번호를 입력하세요!");
		frm.ORDERNO.focus();
		return;
	}
	if(frm.AMOUNT.value == ""){
		alert("결제금액을 입력하세요!");
		frm.AMOUNT.focus();
		return;
	}
	if(frm.PRODUCTNAME.value == ""){
		alert("상품명을 입력하세요!");
		frm.PRODUCTNAME.focus();
		return;
	}
	if(frm.USERNAME.value == ""){
		alert("고객이름을 입력하세요!");
		frm.USERNAME.focus();
		return;
	}
	if(frm.USERPHONE.value == ""){
		alert("고객전화번호를 입력하세요!");
		frm.USERPHONE.focus();
		return;
	}
	
	var param = $('#frm').serialize();
	
	$.ajax({
	    url:  '/app/payment/payment_link_sms.do',
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
	frm.ORDERNO.value= s;
}

var fnReset = function(){
	$("#CPID").val('');
	$("#ORDERNO").val('');
	$("#AMOUNT").val('');
	$("#CARDNO").val('');
	$("#EXPIRATIONDATE").val('');
	$("#QUOTA").val('');
	$("#CARDAUTH").val('');
	$("#CARDPASSWORD").val('');
	$("#PRODUCTNAME").val('');
	$("#USERNAME").val('');
	$("#USERPHONE").val('');
	$("#EMAIL").val('');
}