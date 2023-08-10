$(function() {
	
	$("#gnb8000").addClass('on');
    $("#8000_sub").addClass('on');
    $("#8001").addClass('on');
    
    setup_admin_data();
    
});

var frmAdd = function(){
	
	var frm = $("#frm2")[0];
	frm.action = "/setup/setup_register.do";
	frm.submit();
}

var frmInfo = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/setup/setup_modify.do";
	frm.store_id.value = val;
	frm.submit();
}
var frmDel = function(val){
	
	var param = new Object();
	param.store_id	 	 = val;

	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
		    url:  '/setup/setupDel.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	setup_admin_data();
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});
	}	
}

var setup_admin_data = function(){
	
	var param = new Object();
	param.ceo 	 			= $("#ceo").val();
	param.view_type		 	= view_type_s;
	$.post("setup_admin_data.do", param, function(data) {
		$("#setup_admin_data").html(data);
	});
	
	view_type_s = "";
}

var enterkey = function(){
	if (window.event.keyCode == 13) { 
		setup_admin_data();
	} 
}

/* pagination 페이지 링크 function */
var fn_link_page = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	param.ceo 	 			 = $("#ceo").val();
	$.post("setup_admin_data.do", param, function(data) {
		$("#setup_admin_data").html(data);
	});
}
