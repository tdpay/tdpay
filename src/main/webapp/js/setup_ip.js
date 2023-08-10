$(function() {
	
	$("#gnb8000").addClass('on');
    $("#8000_sub").addClass('on');
    $("#8005").addClass('on');
    
    setup_ip_data();
    
});

var enterkey = function(){
	if (window.event.keyCode == 13) { 
		setup_ip_data();
	} 
}

var setup_ip_data = function(){
	
	var param = new Object();
	param.check	  		   = $("input[name='check']:checked").val();
	param.searchKeyword	   = $("#searchKeyword").val();
	
	$.post("setup_ip_data.do", param, function(data) {
		$("#setup_ip_data").html(data);
	});
	
}

var frmAdd = function(){

	if($("#ip1").val() == ""){
		alert("IP를 입력하세요!");
		$("#ip1").focus();
		return;
	}
	if($("#ip2").val() == ""){
		alert("IP를 입력하세요!");
		$("#ip2").focus();
		return;
	}
	if($("#ip3").val() == ""){
		alert("IP를 입력하세요!");
		$("#ip3").focus();
		return;
	}
	if($("#ip4").val() == ""){
		alert("IP를 입력하세요!");
		$("#ip4").focus();
		return;
	}
	if($("#memo").val() == ""){
		alert("메모를 입력하세요!");
		$("#memo").focus();
		return;
	}
	
	var param = new Object();
	param.ip		   = $("#ip1").val() + "." + $("#ip2").val() + "." + $("#ip3").val() + "." + $("#ip4").val();
	param.memo		   = $("#memo").val();
	param.role_id	   = $("input[name='role_id']:checked").val();
	param.created_id   = $("#created_id").val();
	
	$.ajax({
		url:  '/setup/setup_ip_add.do',
		type: 'POST',
		data: param,
		success: function(data){
			setup_ip_data();
		},
		error: function(e){
			alert(e.reponseText);
		},
		complete: function() {
			$('.btn_closed').trigger("click");
		}
	});
	
}

var frmDel = function(val){
	
	var param = new Object();
	param.no		   = val;
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/setup/setup_ip_del.do',
			type: 'POST',
			data: param,
			success: function(data){
				setup_ip_data();
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}


/* pagination 페이지 링크 function */
var fn_link_page = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	$.post("setup_ip_data.do", param, function(data) {
		$("#setup_ip_data").html(data);
	});
}
