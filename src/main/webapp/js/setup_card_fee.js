$(function() {
	
 
	$("#gnb12000").addClass('on');
    $("#12000_sub").addClass('on');
    $("#12007").addClass('on');
    
    setup_card_fee_data();
});


var frmAdd = function(){
	
	var param = new Object();
	param.cardcode	   = $("#cardcode").val();
	param.cardname	   = $("#cardname").val();
	param.rate	   = $("#rate").val();
	param.created_id	   = $("#created_id").val();

	if($("#cardname").val() == ''){
		alert("카드사를 입력하세요!");
		return;
	}
	if($("#rate").val() == ''){
		alert("수수료율을 입력하세요!");
		return;
	}
	
	$.ajax({
	    url:  '/setup/setup_card_fee_Add.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
//	    	if(data > 0){
//	    		alert("중복되었습니다.");
//	    		return;
//	    	}
	    	if(data == 1){
	    		setup_card_fee_data();
	    		$('.btn_closed').trigger("click");
	    		alert("등록되었습니다.");
	    	}
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
		complete: function() {
		}
	});
	
}

var frmDel = function(val){
	
	var param = new Object();
	param.no	   = val;
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/setup/setup_card_fee_Del.do',
			type: 'POST',
			data: param,
			success: function(data){
				alert("삭제되었습니다.");
				setup_card_fee_data();
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}

var frmMod = function() {
	
	var param = new Object();
	
	var arrCardfee = new Array();
	
	
	
	$("input[name=rate]").each(function(index, item) {
		
		var cardfeeInfo = new Object();
		
		cardfeeInfo.rate = $(item).val();
		
		var cardcodeVal = $("input[name=cardcode]:eq(" + index + ")").val();
		cardfeeInfo.cardcode = cardcodeVal;
		
		if($(item).val() != '') {
			arrCardfee.push(cardfeeInfo);
		}
	});
	
	param.cardfeeList	   	   = arrCardfee;

	
	
	if (confirm("수정하시겠습니까?") == true){    //확인
		$.ajax({
			url:  '/setup/setup_card_fee_Mod.do',
			type: 'POST',
			data: param,
			success: function(data){
				alert("수정되었습니다.");
				setup_card_fee_data();
			},
			error: function(e){
				alert(e.reponseText);
			},
			complete: function() {
			}
		});
	}
	
}
var setup_card_fee_data = function(){
	
	var param = new Object();
	
	$.post("setup_card_fee_data.do", param, function(data) {
		$("#setup_card_fee_data").html(data);
	});
}
