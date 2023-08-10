$(function() {
	
	//$("#gnb10000").addClass('on');
    //$("#10000_sub").addClass('on');
    //$("#10002").addClass('on');
    
//	var nowDate = new Date();
//	var nowYear = nowDate.getFullYear();
//	var nowMonth = nowDate.getMonth() +1;
//	var nowDay = nowDate.getDate();
//
//	if(nowMonth < 10){ nowMonth = "0"+nowMonth; }
//	if(nowDay < 10){nowDay = "0"+nowDay; }
//
//	let today = new Date();   
//	let hours = today.getHours(); // 시
//	let minutes = today.getMinutes();  // 분
//	let seconds = today.getSeconds();  // 초
//	
//	var todayDate = nowYear + "-" + nowMonth + "-" +nowDay+" "+hours+":"+minutes+":"+seconds;
//	$("#todayDate").val(todayDate);
	
});

//var sendFile = function(file, el) {
//	var form_data = new FormData();
//  	form_data.append('file2', file);
//  	form_data.append('uploadFile', 'no1');
//  	$.ajax({
//    	data: form_data,
//    	type: "POST",
//    	url: '/common/upload.do',
//    	cache: false,
//    	contentType: false,
//    	enctype: 'multipart/form-data',
//    	processData: false,
//    	success: function(img_name) {
//      		$(el).summernote('editor.insertImage', img_name);
//    	}
//  	});
//}

var frmAdd = function(){
	var frm = $("#frm")[0];
	frm.action = "/limitchange/limitchangeAdd.do";
	frm.submit();
}
var frmMod = function(val){
	var frm = $("#frm")[0];
	frm.action = "/limitchange/limitchangeMod.do";
	frm.submit();
}
var frmDel = function(val,val2){
	
	var param = new Object();
	param.auth_type	   = val;
	param.no		   = val2;
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/limitchange/limitchangeDel.do',
			type: 'POST',
			data: param,
			success: function(data){
				//setup_login_data();
				alert("삭제 되었습니다.");
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}
//var setup_login_data = function(){
//	
//	var param = new Object();
//	param.store_id 	 = $("#store_id").val();
//	
//	$.post("setup_login_data.do", param, function(data) {
//		$("#setup_login_data").html(data);
//	});
//}