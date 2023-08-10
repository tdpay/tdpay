$(function() {
	
	$("#6000").addClass('on');
    $("#6000_sub").addClass('on');
    $("#6001").addClass('on');
    
});


var fnSubmit = function(){
	
	var frm = $("#frm")[0];
	frm.action = "/payment/cardCancel.do";
	frm.submit();
	
	/*
	var param = $('#frm').serialize();
	
	$.ajax({
	    url:  '/payment/cardCancel.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	
	    	if(data == 'SUCCESS'){
	    		alert('정상적으로 취소되었습니다.');
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
	*/
	
}


var fnReset = function(){
	$("#CPID").val('');
	$("#DAOUTRX").val('');
	$("#AMOUNT").val('');
	$("#CANCELMEMO").val('');
}