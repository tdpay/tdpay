$(function() {
	
	$("#gnb6000").addClass('on');
    $("#6000_sub").addClass('on');
    $("#6005").addClass('on');
    
    notice05_data();
});

var frmAdd = function(){
	
	var frm = $("#frm2")[0];
	frm.action = "/notice/notice05_write.do";
	frm.view_type.value = "N";
	frm.submit();
}

var frmInfo = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/notice/notice05_write.do";
	frm.no.value = val;
	frm.view_type.value = "I";
	frm.submit();
}
var frmView = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/notice/notice05_view.do";
	frm.no.value = val;
	frm.view_type.value = "V";
	frm.submit();
}
var frmDel = function(val){
	
	var param = new Object();
	param.no	 		 = val;

	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
		    url:  '/notice/notice05Del.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	notice05_data();
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});
	}
	
}

var notice05_data = function(){
	
	var param = new Object();
	param.check			 	 = $(":input:radio[name=check]:checked").val();
	param.searchKeyword 	 = $("#searchKeyword").val();
	param.store_id 			 = $("#store_id").val();
	param.view_type		 	 = view_type_s;
	$.post("notice05_data.do", param, function(data) {
		$("#notice05_data").html(data);
	});
	view_type_s = "";
}

var enterkey = function(){
	if (window.event.keyCode == 13) { 
		notice05_data();
	} 
}
/* pagination 페이지 링크 function */
var fn_link_page = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	param.check			 	 = $(":input:radio[name=check]:checked").val();
	param.searchKeyword 	 = $("#searchKeyword").val();
	param.store_id 			 = $("#store_id").val();	
	$.post("notice05_data.do", param, function(data) {
		$("#notice05_data").html(data);
	});
}