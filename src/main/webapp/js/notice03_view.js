$(function() {
	
	$("#gnb10000").addClass('on');
    $("#10000_sub").addClass('on');
    $("#10004").addClass('on');
    
});

var frmMod = function(val){
	
	var frm = $("#frm")[0];
	frm.action = "/notice/notice03_write.do";
	frm.submit();
}
