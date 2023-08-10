$(function() {
	
	$("#gnb10000").addClass('on');
    $("#10000_sub").addClass('on');
    $("#10003").addClass('on');
    
});

var frmMod = function(val){
    
	var frm = $("#frm")[0];
	frm.action = "/notice/notice02_write.do";
	frm.submit();
}
