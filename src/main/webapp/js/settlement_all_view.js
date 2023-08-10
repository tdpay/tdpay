$(function() {
	
	$("#gnb7000").addClass('on');
    $("#7000_sub").addClass('on');
    $("#7002").addClass('on');
});

var fnHold = function(){
	var frm = $("#frm")[0];
	frm.action = "/settlement/settlement_all_hold.do";
	frm.submit();
}