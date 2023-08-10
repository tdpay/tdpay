$(function() {
	
 
	$("#gnb12000").addClass('on');
    $("#12000_sub").addClass('on');
    $("#12008").addClass('on');
    
    setup_pg_fee_data();
});


var frmAdd = function(){
	
	var param = new Object();
	param.pgname	   = $("#pgname").val();
	//param.created_id	   = $("#created_id").val();

	if($("#pgname").val() == ''){
		alert("PG사를 입력하세요!");
		return;
	}
	
	$.ajax({
	    url:  '/setup/setup_pg_fee_Add.do',
	    type: 'POST',
	    data: param,
	    success: function(jqXHR,status){
			console.log(jqXHR.status);
	    	if(jqXHR.status=200){
	    		setup_pg_fee_data();
	    		$('.btn_closed').trigger("click");
	    		alert("등록되었습니다.");
	    		return;
	    	}
	    },
	    error: function(jqXHR,e){
	    	if (jqXHR.status == 404) {alert('Requested page not found. [404]');}
	        else if (jqXHR.status == 500) {alert('Internal server error. [500]');}
	        else {alert('Uncaught Error.n' + jqXHR.responseText);}	
	    },
		complete: function() {
		}
	});
}
var frmMod = function(){
	var param = new Object();
	param.pgname	   		= $("#pgname").val();
	param.creditcard_RT	    = $("#creditcard_RT").val();	
	param.creditcardK_RT	= $("#creditcardK_RT").val();	
	param.cellphone_RT	    = $("#cellphone_RT").val();	
	param.cellphonePay_RT	= $("#cellphonePay_RT").val();	
	param.ARS700_RT		    = $("#ARS700_RT").val();		
	param.phonebill_RT	    = $("#phonebill_RT").val();	
	param.accountTRF_RT	    = $("#accountTRF_RT").val();	
	param.vaccountTRF_RT	= $("#vaccountTRF_RT").val();	
	param.CMS_RT		    = $("#CMS_RT").val();		
	param.giftvoucher_RT	= $("#giftvoucher_RT").val();	
	param.sgiftvoucher_RT	= $("#sgiftvoucher_RT").val();	
	param.bgiftvoucher_RT	= $("#bgiftvoucher_RT").val();	
	param.hgiftvoucher_RT	= $("#hgiftvoucher_RT").val();	
	param.eggmony_RT	    = $("#eggmony_RT").val();	
	param.teencash_RT	    = $("#teencash_RT").val();	
	param.tmoney_RT		    = $("#tmoney_RT").val();		
	param.mobilepop_RT	    = $("#mobilepop_RT").val();	
	param.alipay_RT		    = $("#alipay_RT").val();		
	param.kakaopay_RT	    = $("#kakaopay_RT").val();	
	param.terminal_RT	    = $("#terminal_RT").val();	
	
	if($("#pgname").val() == ''){
		alert("PG사 값이 없습니다.!");
		return;
	}
	
	$.ajax({
		url:  '/setup/setup_pg_fee_Mod.do',
		type: 'POST',
		data: param,
		success: function(jqXHR,status){
			console.log(jqXHR.status);
			if(jqXHR.status=200){
				setup_pg_fee_data();
				$('.btn_closed').trigger("click");
				alert("수정되었습니다.");
				return;
			}
		},
		error: function(jqXHR,e){
			if (jqXHR.status == 404) {alert('Requested page not found. [404]');}
			else if (jqXHR.status == 500) {alert('Internal server error. [500]');}
			else {alert('Uncaught Error.n' + jqXHR.responseText);}	
		},
		complete: function() {
		}
	});
}

var frmMod1 = function(val){
	//var param = new Object();
	var frm = $("#frm3")[0];
	frm.action = "/setup/setup_pg_fee_Mod.do";
	frm.pgname.value = val;
	frm.creditcard_RT.value 	 = $("#creditcard_RT").val();
	//frm.view_type.value = "V";
	frm.submit();
}

var frmDel = function(val){
	
	var param = new Object();
	param.no	   = val;
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/setup/setup_pg_fee_Del.do',
			type: 'POST',
			data: param,
			success: function(data){
				alert("삭제되었습니다.");
				setup_pg_fee_data();
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}

var setup_pg_fee_data = function(){
	
	var param = new Object();
	
	$.post("setup_pg_fee_data.do", param, function(data) {
		$("#setup_pg_fee_data").html(data);
	});
}
