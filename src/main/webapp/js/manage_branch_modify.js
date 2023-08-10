$(function() {
    
    $("#frm").validate({
    	rules: { 
    		store_id: { 
    			required : true, 
    			remote: {
    				url : "/common/check_id.do",
    				type : "post",
    				data : {
    							id : function(){
    								return $("#store_id").val();
    							}
    						}
    					} 
    		},
    		business_nm: { required : true},
    		ceo: { required : true},
    		corp_regist_num: { required : true, maxlength : 12},
    		corp_regist_num2: { 
                required: function(){
                    if($('#corp_type').val() == 'B'){
                        return true;
                    }
                    return false;
                },
    			maxlength : 14
   			},    		
    		ceo_birth: { required : true, maxlength : 10, date : true},
    		bank_code: { required : true},
    		account_num: { required : true, maxlength : 30},
    		accounter: { required : true, maxlength : 30},
    		business_cond: { required : true, maxlength : 30},
    		industry_type: { required : true, maxlength : 30},
    		tel: { required : true, telnum: true, maxlength : 20},
    		fax: { required : true, telnum: true, maxlength : 20},
    		phone_num: { required : true, maxlength : 13, telnum: true},
    		email: { required : true, email : true},
    		hompage: { required : true, url : true},
    		person_nm1: { required : true},
    		person_phone1: { required : true, maxlength : 13, telnum: true},
    		person_email1: { required : true, maxlength : 50, email : true},
    		person_nm2: { required : true},
    		person_phone2: { required : true, maxlength : 13, telnum: true},
    		person_email2: { required : true, maxlength : 50, email : true},
    		contract_date: { required : true, date : true},
    		person_nm3: { required : true},
    		person_phone3: { required : true, maxlength : 13, telnum: true},
    		person_email3: { required : true, maxlength : 50, email : true},
//    		commission: { required : true, maxlength : 5, number : true},
//    		zip_code: { required : true},
    		address: { required : true},
    		detail_address: { required : true},
//    		hompage: { url : true , maxlength : 100}, 
    		passwd: { required : false},
    		repasswd: {
    			equalTo: passwd
    		}
    	}, 
    	//규칙체크 실패시 출력될 메시지
		messages : { 
			store_id : {
				remote : $.validator.format("이미 존재하는 상점ID 입니다.")
			},			
//			id: { required : "필수로입력하세요", minlength : "최소 {0}글자이상이어야 합니다", remote : "존재하는 아이디입니다" }, 
//			business_nm: { required : "필수로입력하세요"},
//			ceo: { required : "필수로입력하세요"},
//			corp_regist_num: { telnum: "사업자등록번호 가 잘못 되었습니다."},
//			ceo_birth: { required : "필수로입력하세요"},
//			bank_code: { required : "필수로입력하세요"},
//			account_num: { telnum : "계좌번호가 잘못 되었습니다."},
//			business_cond: { required : "필수로입력하세요"},
//			industry_type: { required : "필수로입력하세요"},
			tel: { telnum : "전화번호가 잘못되었습니다."},
			fax: { telnum : "팩스번호가 잘못되었습니다."},
			phone_num: { telnum : "핸드폰 번호가 잘못되었습니다."},
//			email: { email : "메일규칙에 어긋납니다"},
//			person_nm1: { required : "필수로입력하세요"},
			person_phone1: { telnum : "핸드폰 번호가 잘못되었습니다."},
//			person_email1: { required : "필수로입력하세요"},
//			person_nm2: { required : "필수로입력하세요"},
			person_phone2: { telnum : "핸드폰 번호가 잘못되었습니다."},
//			person_email2: { required : "필수로입력하세요"},
//			contract_date: { required : "필수로입력하세요"},
//			person_nm3: { required : "필수로입력하세요"},
			person_phone3: { telnum : "핸드폰 번호가 잘못되었습니다."},
//			person_email3: { required : "필수로입력하세요"},
//			zip_code: { required : "필수로입력하세요"},
//			address: { required : "필수로입력하세요"},
//			detail_address: { required : "필수로입력하세요"},
//			hompage: { url : "정상적인 URL이 아닙니다" },
			repasswd: {equalTo : "비밀번호가 일치하지 않습니다."}
		},
    	
    	submitHandler : function(form){
			var frm = $("#frm")[0];
			frm.action = "/manage/manageMod.do";
			frm.submit();
        }
		
    });
    // 유효성 체크
    $.validator.addMethod("telnum", function(telnum, element){
      var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
      if(!pattern.test(telnum)){
        return this.optional(element)||false;
      }
      return true;
    });    
});

var jsDaumPostcode = function () {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip_code').value = data.zonecode;
            document.getElementById('address').value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('detail_address').focus();
        }
	}).open({
		popupName: 'postcodePopup'
	});
}	

var fnSubmit = function(){
	$("#frm").submit();
}