$(function() {
	
    
});

var frmMod = function(val){
    
	var frm = $("#frm")[0];
	frm.action = "/app/notice/notice02_write.do";
	frm.submit();
}
