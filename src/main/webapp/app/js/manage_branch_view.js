$(function() {
    
	$("#frmMod").on("click", function(){
		var frm = $("#frm")[0];
		frm.action = "/app/manage/manage_branch_modify.do";
		frm.submit();
	});
});

