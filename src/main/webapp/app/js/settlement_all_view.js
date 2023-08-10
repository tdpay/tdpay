$(function() {
	
});

var fnHold = function(){
	var frm = $("#frm")[0];
	frm.action = "/app/settlement/settlement_all_hold.do";
	frm.submit();
}