$(function() {
	
});

var frmAdd = function(){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/notice/notice06_write.do";
	frm.view_type.value = "N";
	frm.submit();
}

var frmInfo = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/notice/notice06_write.do";
	frm.no.value = val;
	frm.view_type.value = "I";
	frm.submit();
}
var frmView = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/notice/notice06_view.do";
	frm.no.value = val;
	frm.view_type.value = "V";
	frm.submit();
}
var frmDel = function(val){
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		var frm = $("#frm2")[0];
		frm.action = "/app/notice/notice06Del.do";
		frm.no.value = val;
		frm.submit();
	}
}

var notice06_data = function(){
	
	var frm = $("#frm1")[0];
	frm.action = "/app/notice/notice06.do";
	frm.submit();
}