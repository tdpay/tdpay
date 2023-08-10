$(function() {
	searchList();
});

var searchList = function(){
	
	var param = new Object();
	param.check			 	 = $(":input:radio[name=check]:checked").val();
	param.searchKeyword 	 = $("#searchKeyword").val();
	param.store_id			 = $('#store_id').val();
	
	$.post("/limitchange/limitchange_data.do", param, function(data) {
		$("#limitchange_data").html(data);
	});
}



var frmAdd = function(){
	
	var frm = $("#frm")[0];
	frm.action = "/limitchange/limitchangeAdd.do";
	frm.submit();
}
var frmMod = function(val){
	
    var arrChk = "";
    var i = 0 ; 
    
    $("input[name=chk]").each(function(){
    	if($(this).is(":checked")){
        		if(i == 0) {
        			arrChk 	= $(this).attr("key");
        		}else{
        			arrChk 	+= "," + $(this).attr("key");
        		}
        		i++;
        	}
    });
    
    $("#arrChk").val(arrChk);	
    
	var frm = $("#frm")[0];
	frm.action = "/notice/notice01Mod.do";
	frm.submit();
}
var frmDel = function(val,val2){
	
	var param = new Object();
	param.auth_type	   = val;
	param.no		   = val2;
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/limitchange/limitchangeDel.do',
			type: 'POST',
			data: param,
			success: function(data){
				//setup_login_data();
				alert("삭제 되었습니다.");
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}
var frmSearchList = function(){
	
	var frm = $("#frm1")[0];
	frm.action = "/limitchange/limitchange_list.do";
	//frm.submit();
}

