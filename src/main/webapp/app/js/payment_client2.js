
$(function() {
	
    $("#frm").validate({
    	rules: { 
    		cardNumb: { required : true, number:true },
    		expiryDate: { required : true, number:true }
    	}, 
    	
    	submitHandler : function(form){
			
			var param = $('#frm').serialize();
			
			$.ajax({
			    url:  '/app/pay2/cardSugido.do',
			    type: 'POST',
			    data: param,
			    success: function(data){
			    	
			    	if(data == 'SUCCESS'){
			    		alert('결제되었습니다.');
			    		$('#send_btn').remove();
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


