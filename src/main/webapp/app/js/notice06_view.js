$(function() {
	
});

var frmMod = function(val){
	
	var frm = $("#frm")[0];
	frm.action = "/app/notice/notice06_write.do";
	frm.submit();
}
