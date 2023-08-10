
$(function() {
	
    $("#frm").validate({
    	rules: { 
    		CARDNO: { required : true, number:true },
    		EXPIRATIONDATE: { required : true, number:true },
    		CARDAUTH: { 
    			number: true, 
                required: function(){
                    if($('#BILLTYPE').val() == "13"){
                        return true;
                    }
                    return false;   
                }
    		},
    		CARDPASSWORD: { 
    			number: true, 
                required: function(){
                	if($('#BILLTYPE').val() == "13"){
                        return true;
                    }
                    return false;   
                }
    		},
    	}, 
    	
    	submitHandler : function(form){
//			var frm = $("#frm")[0];
//			frm.action = "/app/pay/cardSugido.do";
//			frm.submit();
			
			var param = $('#frm').serialize();
			
			$.ajax({
			    url:  '/app/pay/cardSugido.do',
			    type: 'POST',
			    data: param,
			    success: function(data){
			    	
		    	   $.each(data, function(key, value){
		    		   if(key == 'SUCCESS'){
		    			   $('#send_btn').remove();
		    			   var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
		    			   setTimeout(function () {
		    				   window.open('https://agent.payjoa.co.kr/common/PayInfoPrintDirectCard.jsp?DAOUTRX='+value+'&STATUS=11', 'popup', options);
		    			   }, 2000);
		    			   
		    			   alert("결제되었습니다");
		    			   
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

var fnSubmit = function(){
	$("#frm").submit();
}


