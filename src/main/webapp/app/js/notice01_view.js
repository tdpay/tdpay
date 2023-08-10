$(function() {
	

});

var frmMod = function(val){
	
	var frm = $("#frm")[0];
	frm.action = "/app/notice/notice01_write.do";
	frm.submit();
}
