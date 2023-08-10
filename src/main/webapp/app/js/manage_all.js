var nCount=1;

/*
$(document).ready(function() {
	
	$(window).scroll(function () {
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
 	 		onAdd();
 	 	}	
  	});
	
	onAdd();
});
*/

function onAdd(){
 	
 	nCount++;
 	
	var param = new Object();
	param.searchKeyword 	 = $("#searchKeyword").val();
	param.searchKeyword1 	 = $("#searchKeyword1").val();
	param.searchKeyword2 	 = $("#searchKeyword2").val();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.business_nm 		 = $("#business_nm").val();
	param.email 			 = $("#email").val();
	param.tel 				 = $("#tel").val();
	param.phone_num 		 = $("#phone_num").val();
	param.ceo			 	 = $("#ceo").val();
	param.person_nm 		 = $("#person_nm").val();
	param.terminal_id 		 = $("#terminal_id").val();
	param.state 			 = $("#state").val();
	param.role_id 			 = $("#role_id").val();
	param.roleStore 		 = $("#roleStore").val();
	param.roleStore2 		 = $("#roleStore2").val();
	param.pageUnit 			 = nCount;
	
 	$.ajax({
  		 async: true,
 		 url: '/app/manage/manage_all_data.do',
 		 data: param,
 		 success: function(data) {
 			 var response = data.trim();
 			 if(response == "") {
   				 alert('리스트가 더 없습니다.');
 			 } else {
    			$("#list").append(response);     
    			$("#list2").empty();     
 			 }
 		 },
 		 error: function(data, status, err) {
             alert('서버와의 통신이 실패했습니다.');
 	     }
 	});
}

var frmInfo = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/manage/manage_all_modify.do";
	frm.store_id.value = val;
	frm.submit();
}
var frmView = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/manage/manage_all_view.do";
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


