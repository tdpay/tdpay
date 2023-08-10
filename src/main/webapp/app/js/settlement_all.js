$(function() {
    
});


var frmView = function(val, val2, val3){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/settlement/settlement_all_view.do";
	frm.no.value = val;
	frm.daoutrx.value = val2;
	frm.cpid.value = val3;
	frm.submit();
}



