$(function() {
	
	$("#gnb12000").addClass('on');
    $("#12000_sub").addClass('on');
    $("#12010").addClass('on');
    
    $("#frm").validate({

    	submitHandler : function(form){
    		
    		var gp_arr_key;
    		var i = 0 ; 
    		
    	    $("input[name=menu_id]").each(function(){
    	    	if($(this).is(":checked")){
	        		if(i == 0) {
	        			gp_arr_key = $(this).attr("key").split(",");
	        		}else{
	        			gp_arr_key += "," + $(this).attr("key").split(",");
	        		}
	        		i++;
	        	}
    	    });

			console.log(gp_arr_key);
    	    
    	    if(i == 0){
    	    	alert("권한을 하나이상 선택하세요!");
    	    	return;
    	    }
    	    
    		//var frm = $("#frm")[0];
    		//frm.arr_check_id.value = arr_key;
    		//frm.action = "/setup/setup_permission_Mod.do";
    		//frm.submit();
        }
		
    });    
});


var fnSubmit = function(){
	$("#frm").submit();
}
