$(function() {
	
	$("#gnb12000").addClass('on');
    $("#12000_sub").addClass('on');
    $("#12001").addClass('on');
    
    $("#frm").validate({
    	rules: { 
    		store_id: { 
    			required : true, 
    			idCk : true,
    			remote: {
    				url : "/common/check_id.do",
    				type : "post",
    				data : {
    							id : function(){
    								return $("#store_id").val();
    							}
    						}
    					} 
    		},
    		passwd: { required : true},
    		ceo: { required : true},
    		phone_num: { required : true, maxlength : 13, telnum: true},
    	}, 
    	//규칙체크 실패시 출력될 메시지
		messages : { 
			store_id : {
				remote : $.validator.format("이미 존재하는 상점ID 입니다."),
				idCk : "영문,숫자 포함(8~15)입니다."
			},			
			phone_num: { telnum : "핸드폰 번호가 잘못되었습니다."},
		},
    	
    	submitHandler : function(form){
    		
    		var arr_key;
    		var i = 0 ; 
    		
    	    $("input[name=menu_id]").each(function(){
    	    	if($(this).is(":checked")){
    	        		if(i == 0) {
    	        			arr_key 			= $(this).attr("key").split(",");
    	        		}else{
    	        			arr_key 			+= "," + $(this).attr("key").split(",");
    	        		}
    	        		i++;
    	        	}
    	    });
    	    
    	    if(i == 0){
    	    	alert("권한을 하나이상 선택하세요!");
    	    	return;
    	    }
    	    
    		var frm = $("#frm")[0];
    		frm.arr_check_id.value = arr_key;
    		frm.action = "/setup/setupAdd.do";
    		frm.submit();
        }
		
    });

    // 유효성 체크
    $.validator.addMethod("telnum", function(telnum, element){
      var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
      if(!pattern.test(telnum)){
        return this.optional(element)||false;
      }
      return true;
    });    
    $.validator.addMethod("idCk",  function( value, element ) {
    	return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z]).{8,15}$/.test(value);
	});     
});

var fnSubmit = function(){
	$("#frm").submit();
}

