$(function() {
	
	$("#frmMod").on("click", function(){
		var frm = $("#frm")[0];
		frm.action = "/app/manage2/manage2_modify.do";
		frm.submit();
	});
});

