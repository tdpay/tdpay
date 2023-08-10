$(function() {
	
	$("#gnb7000").addClass('on');
    $("#7000_sub").addClass('on');
    $("#7006").addClass('on');
});

//지급보류해제
var fnHold = function(){
	var frm = $("#frm")[0];
	frm.action = "/settlement/settlement_all_mod.do";
	frm.submit();
}

//전체취소
var fnCardCancel = function(){
	
	var frm = $("#frm")[0];
	frm.CANCELTYPE.value="1";
	
	var url = "";
	if(frm.cp_type.value == "1"){
		url = "/payment/cardCancel.do";
		
		var param = $('#frm').serialize();
		
		$.ajax({
		    url:  url,
		    type: 'POST',
		    data: param,
		    success: function(data){

	    	   $.each(data, function(key, value){
	    		   if(key == 'SUCCESS'){
	    			   var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
	    			   setTimeout(function () {
	    				   window.open('https://agent.payjoa.co.kr/common/PayInfoPrintDirectCard.jsp?DAOUTRX='+value+'&STATUS=12', 'popup', options);
	    			   }, 2000);
	    			   
	    			   alert("정상적으로 취소되었습니다.");
	    			   $("#totalCancel").remove();
	    			   $("#partCancel").remove();
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
		
	}else if(frm.cp_type.value == "2"){
		url = "/payment2/cardCancel.do";
//		frm.action = url;	
//		frm.submit();

		var param = $('#frm').serialize();
		
		$.ajax({
		    url:  url,
		    type: 'POST',
		    data: param,
		    success: function(data){

	    	   $.each(data, function(key, value){
	    		   if(key == 'SUCCESS'){
	    			   var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
	    			   setTimeout(function () {
	    				   window.open('https://ksta.ksnet.co.kr/mint/tsk/pgi01/mad/pgimad04m0.jsp?tr_no='+value, 'popup', options);
	    			   }, 2000);
	    			   
	    			   alert("정상적으로 취소되었습니다.");
	    			   $("#totalCancel").remove();
	    			   $("#partCancel").remove();
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
	
	
}

//부분취소
var fnCardCancel2 = function(){
	
	var frm = $("#frm")[0];
	
	if(frm.AMOUNT2.value == ""){
		alert("부분취소금액을 입력하세요!");
		frm.AMOUNT2.focus();
		return;
	}
	
	frm.CANCELTYPE.value	=	"3";
	frm.AMOUNT.value		=	frm.AMOUNT2.value;
	var url = "";
	if(frm.cp_type.value == "1"){
		url = "/payment/cardCancel.do";
		
		var param = $('#frm').serialize();
		
		$.ajax({
		    url:  url,
		    type: 'POST',
		    data: param,
		    success: function(data){

	    	   $.each(data, function(key, value){
	    		   if(key == 'SUCCESS'){
	    			   var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
	    			   setTimeout(function () {
	    				   window.open('https://agent.payjoa.co.kr/common/PayInfoPrintDirectCard.jsp?DAOUTRX='+value+'&STATUS=16', 'popup', options);
	    			   }, 2000);
	    			   
	    			   alert("정상적으로 취소되었습니다.");
	    			   $("#totalCancel").remove();
	    			   $("#partCancel").remove();
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
		
	}else if(frm.cp_type.value == "2"){
		url = "/payment2/cardCancel.do";
//		frm.action = url;	
//		frm.submit();
		
		var param = $('#frm').serialize();
		
		$.ajax({
		    url:  url,
		    type: 'POST',
		    data: param,
		    success: function(data){

	    	   $.each(data, function(key, value){
	    		   if(key == 'SUCCESS'){
	    			   var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
	    			   setTimeout(function () {
	    				   window.open('https://ksta.ksnet.co.kr/mint/tsk/pgi01/mad/pgimad04m0.jsp?tr_no='+value, 'popup', options);
	    			   }, 2000);
	    			   
	    			   alert("정상적으로 취소되었습니다.");
	    			   $("#totalCancel").remove();
	    			   $("#partCancel").remove();
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
	
}

var fnCardReceipt = function(val){
   var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
   if($("#cp_type").val() == "2"){
	   window.open('https://ksta.ksnet.co.kr/mint/tsk/pgi01/mad/pgimad04m0.jsp?tr_no='+value, 'popup', options);
   }else{
	   window.open('https://agent.payjoa.co.kr/common/PayInfoPrintDirectCard.jsp?DAOUTRX='+$("#daoutrx").val()+'&STATUS='+val, 'popup', options);
   }
}