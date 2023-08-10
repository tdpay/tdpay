$(function() {
    
	//    $("#1000").addClass('on');
	//    $("#1000_sub").addClass('on');
	//    $("#1001").addClass('on');
  
	$("#frmMod").on("click", function(){
		var frm = $("#frm")[0];
		frm.action = "/manage/manage_all_modify.do";
		frm.submit();
	});
	
	getOption2('#roleStore', 'high_store_list', store_id, 'N', '');
	$('#roleStore').click(function(){
		getOption2('#roleStore2', 'high_store_list', $('#roleStore').val(),'N', '');
	});
});

