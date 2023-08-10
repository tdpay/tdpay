$(function() {
	
	$("#8000").addClass('on');
    $("#8000_sub").addClass('on');
    $("#8004").addClass('on');
    
	$("#frmMod").on("click", function(){
		var frm = $("#frm")[0];
		frm.action = "/manage2/manage2_modify.do";
		frm.submit();
	});
});

