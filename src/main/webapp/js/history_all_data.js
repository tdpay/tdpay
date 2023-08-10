let authdate;
let cpid;

//전체취소
var fnCardCancel = function(){
	
	var frm = $("#allCancelFrm");
	frm.find('#CANCELTYPE').val('1');
	
	var url = "";
	
	
	
	if (confirm("정말 전체취소하시겠습니까?") == true){
		if(frm.find('#cp_type').val() == "1"){
			url = "/payment/cardCancel.do";
			
			var param = $('#allCancelFrm').serialize();
			
			$.ajax({
			    url:  url,
			    type: 'POST',
			    data: param,
			    success: function(data){
	
		    	   $.each(data, function(key, value){
		    		   if(key == 'SUCCESS'){
		    			   /*var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
		    			   setTimeout(function () {
		    				   window.open('https://agent.payjoa.co.kr/common/PayInfoPrintDirectCard.jsp?DAOUTRX='+value+'&STATUS=12', 'popup', options);
		    			   }, 2000);*/
		    			   
		    			   alert("정상적으로 취소되었습니다.");
							
						   $('.pop_wrap').hide();
						   history_all_data();
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
			
		}else if(frm.find('#cp_type').val()){
			url = "/payment2/cardCancel.do";
			
			var param = $('#frm').serialize();
			
			$.ajax({
			    url:  url,
			    type: 'POST',
			    data: param,
			    success: function(data){
	
		    	   $.each(data, function(key, value){
		    		   if(key == 'SUCCESS'){
		    			   /*var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
		    			   setTimeout(function () {
		    				   window.open('https://ksta.ksnet.co.kr/mint/tsk/pgi01/mad/pgimad04m0.jsp?tr_no='+value, 'popup', options);
		    			   }, 2000);
		    			   */
		    			   $('.all_cancel_pop').hide();
						   history_all_data();
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
}

//부분취소
var fnCardCancel2 = function(){
	
	var frm = $("#cancelFrm");
	frm.find('#CANCELTYPE').val('1');
	
	if (confirm("정말 부분취소하시겠습니까?") == true){
		if(frm.find('#AMOUNT2').val() == ""){
			alert("부분취소금액을 입력하세요!");
			frm.find('#AMOUNT2').focus();
			return;
		}
		
		frm.find('#CANCELTYPE').val('3');
		
		frm.find('#AMOUNT').val(frm.find('#AMOUNT2').val());
		var url = "";
		
		if(frm.find('#cp_type').val() == "1"){
			url = "/payment/cardCancel.do";
			
			var param = $('#cancelFrm').serialize();
			
			$.ajax({
			    url:  url,
			    type: 'POST',
			    data: param,
			    success: function(data){
	
		    	   $.each(data, function(key, value){
		    		   if(key == 'SUCCESS'){
		    			   /*var options = 'top=10, left=10, width=533, height=800, status=no, menubar=no, toolbar=no, resizable=no';
		    			   setTimeout(function () {
		    				   window.open('https://agent.payjoa.co.kr/common/PayInfoPrintDirectCard.jsp?DAOUTRX='+value+'&STATUS=16', 'popup', options);
		    			   }, 2000);*/
		    			   
		    			   alert("정상적으로 취소되었습니다.");
		    			   $('.pop_wrap').hide();
						   history_all_data();
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
			
		}else if(frm.find('#cp_type').val() == "2"){
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
}