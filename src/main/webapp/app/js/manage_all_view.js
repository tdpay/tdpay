$(function() {
    
	$("#frmMod").on("click", function(){
		var frm = $("#frm")[0];
		frm.action = "/app/manage/manage_all_modify.do";
		frm.submit();
	});
	
	getOption2('#roleStore', 'high_store_list', store_id, 'N', '');
	$('#roleStore').click(function(){
		getOption2('#roleStore2', 'high_store_list', $('#roleStore').val(),'N', '');
	});	
});

