
var frmInfo = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/manage/manage_branch_modify.do";
	frm.store_id.value = val;
	frm.submit();
}
var frmView = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/manage/manage_branch_view.do";
	frm.store_id.value = val;
	frm.submit();
}
var frmDel = function(val){
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		var frm = $("#frm2")[0];
		frm.action = "/app/manage/manageDel.do";
		frm.store_id.value = val;
		frm.submit();
	}

}
