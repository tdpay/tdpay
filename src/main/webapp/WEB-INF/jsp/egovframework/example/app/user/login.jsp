<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<meta content="gngpayment" name="Title" />
<meta content="gngpayment" name="Description" />
<meta content="gngpayment" name="Keyword" />
<meta property="og:title" content="gngpayment"  />
<meta property="og:description" content="gngpayment"  />
<meta property="og:url" content="http://gmgadmin.cafe24.com/">
<link rel="shortcut icon" href="/img/favicon.ico">
<meta property="og:image" content="/img/kakaotalk_img.png">

<link href="/app/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="/app/css/common.css" rel="stylesheet" type="text/css"/>
<link href="/app/css/style.css" rel="stylesheet" type="text/css"/>

<script src="/app/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/js/selectBox.js" type="text/javascript"></script>

<title>gmgpayment</title>
</head>
<body>
    <div class="container">
        <div class="main">
            <section class="login_box">
                <div class="inner">
                    <h1>Welcome</h1>
                    <p class="welcome_txt">㈜지엠지페이먼트에 오신 것을 환영합니다.</p>
                    <form id="frm" name="frm" method="post">
                        <fieldset>
                            <div class="form_box">
                                <div class="input_box">
                                    <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력해주세요">
                                    <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
                                </div>
                                <div class="check_box">
                                    <input id="loginKeep" type="checkbox" id="save_id" name="save_id" value="Y" onclick="saveJs();">
                                    <label for="loginKeep">ID저장</label> 
                                </div>
                                <button class="login_btn" onclick="goLogin();return false;" id="login">로그인</button>
                                 <a href="javascript:goLoginNo();" class="direct_login">인증없이 로그인</a>	
                            </div>
                            <div class="help_box">
                                <ul>
                                    <li><span class="find_id">아이디/</span><span class="find_pw">비번찾기</span></li>
                                </ul>
                            </div>
                        </fieldset>
						<input type="hidden" name="check" id="check"> 
						<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}"> 
						<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}">                         
                    </form>
                    <p class="copyright">Copyright 2020 gmgpayment. All Rights Reserved</p>
                </div>
            </section>
        </div>
        <section class="popup login_popup">
            <div class="header">
                <div class="inner">
                    <p>로그인 추가인증 선택</p>
                    <button class="close_btn" type="button"></button>
                </div>
            </div>
            <div class="cont">
                <div class="inner">
                    <p class="guide">
                        정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 28조에 제 1항 제2호 개인정보의 보호조치에 따라 “로그인 시 추가인증"이 필요하게 되었습니다. 따라서 추가인증 수단을 사전에 등록하신 후 로그인시 해당 수단을 선택하여 인증하여 주시기 바랍니다.
                    </p>
                    <div class="confirm_tab">
                        <p class="tab_info">
                            아래 인증 수단 중 택일하여<br>
                            추가인증을 진행하여 주시기 바랍니다.
                        </p>
                        <div class="tab_box">
                            <button class="on" id="but1" type="button">이메일 인증</button>
                            <button type="button" id="but2">휴대폰 인증</button>
                        </div>
                        <div class="tab_list on">
                            <div class="confirm_info">
                                <ul>
                                    <li>·가맹점관리자 계정 내 등록된 이메일 주소로 인증번호가 발송됩니다.</li>
                                    <li>·선택한 정보로 수신된 인증번호를 입력하여 주시기 바랍니다.</li>
                                    <li>·'다른 이메일 주소 등록'을 클릭하여 인증정보 추가 등록이 5개까지 
                                        가능합니다.</li>
                                </ul>
                            </div>
                            <div class="confirm_select">
                            	<c:set var="email_cnt" value="" />
                                <ul>
								<c:forEach var="result" items="${sessionScope.EMAIL_USER}" varStatus="status">	
								<c:set var="email_cnt" value="${status.count}" />                                
                                    <li>
                                        <div class="radio_box">
                                            <input type="radio" id="email_select<c:out value="${status.count}" />" name="email_select" value="<c:out value="${result.email}" />">
                                            <label for="email_select<c:out value="${status.count}" />">
                                                <span class="info01"><c:out value="${result.business_nm}" /></span>
                                                <span class="info02"><c:out value="${result.email}" /></span>
                                            </label>
                                        </div>
                                    </li>
                                </c:forEach>
                                </ul>
                            </div>
                            <div class="send_tab">
                                <button class="send" onclick="auth_js('2');" type="button">이메일 발송</button>
                                <c:if test="${email_cnt < 4}">
                                <button class="other email_register" type="button">다른 이메일 주소 등록</button>
                                </c:if>
                            </div>
                        </div>
                        <div class="tab_list">
                            <div class="confirm_info">
                                <ul>
                                    <li>·가맹점관리자 계정 내 등록된 휴대폰 번호로 인증번호가 발송됩니다.</li>
                                    <li>·선택한 정보로 수신된 인증번호를 입력하여 주시기 바랍니다.</li>
                                    <li>·'다른 휴대폰 번호 등록'을 클릭하여 인증정보 추가 등록이 5개까지 
                                        가능합니다.</li>
                                </ul>
                            </div>
                            <div class="confirm_select">
                      		    <c:set var="sms_cnt" value="" />
                                <ul>
								<c:forEach var="result" items="${sessionScope.SMS_USER}" varStatus="status">	
								<c:set var="sms_cnt" value="${status.count}" />
                                    <li>
                                        <div class="radio_box">
                                            <input type="radio" id="phone<c:out value="${status.count}" />" name="phone_select" value="<c:out value="${result.phone_num}" />">
                                            <label for="phone<c:out value="${status.count}" />">
                                                <span class="info01"><c:out value="${result.business_nm}" /></span>
                                                <span class="info02"><c:out value="${result.phone_num2}" /></span>
                                            </label>
                                        </div>
                                    </li>
								</c:forEach>
                                </ul>
                            </div>
                            <div class="send_tab">
                                <button class="send" onclick="auth_js('1');" type="button">문자 발송</button>
                                <c:if test="${sms_cnt < 4}">
                                <button class="other phone_register" type="button">다른 휴대폰 번호 등록</button>
                                </c:if>
                            </div>
                        </div>
                        <div class="auth_confirm">
                            <input type="text" name="auth_no" id="auth_no">
                            <button onclick="auth_result();" type="button">인증번호</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="popup confirm_popup email_popup">
            <div class="header">
                <div class="inner">
                    <p>로그인 추가인증 선택</p>
                </div>
            </div>
            <div class="cont">
                <div class="inner">
                    <p class="guide">
                        등록된 이메일 주소 이외에 추가로 등록하실 다른 이메일 주소를 입력해주시기 바랍니다.<br> 아래 입력하신 인증 정보는 다음 추가 인증 시 리스트에 포함됩니다.
                    </p>
                    <div class="confirm_table">
                        <form name="frm2" id="frm2" method="post">
						<input type="hidden" name="created_id" value="${sessionScope.login_id}"> 
						<input type="hidden" name="updated_id" value="${sessionScope.login_id}"> 	          
						<input type="hidden" name="check_no2" value=""> 	              
                            <fieldset>
                                <table>
                                    <tbody>
                                        <tr class="store_id">
                                            <th>MID(상점아이디)</th>
                                            <td>${sessionScope.login_id}</td>
                                        </tr>
                                        <tr class="account_num">
                                            <th>정산계좌번호<br>(뒤 5자리)</th>
                                            <td>
                                                <div>
                                                    <span>*****</span>
                                                    <input type="text" name="account_num2" id="account_num2" value="">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="company">
                                            <th>회사명</th>
                                            <td><input type="text" name="business_nm2" id="business_nm2" value=""></td>
                                        </tr>
                                        <tr class="email">
                                            <th>이메일</th>
                                            <td>
                                                <input class="email_id" type="text" name="email1" id="email1" value="">
                                                <span>@</span>
                                                <input class="domain" type="text" name="email2" id="email2" value="">
                                                <select name="email3" id="email3" onchange="emailSel(this.value);">
                                                    <option value="">직접입력</option>
                                                </select>
                                                <button type="button" onclick="emailAddCheck('1');" class="btn_digit btn_send">인증번호 발송</button>
                                            </td>
                                        </tr>
                                        <tr class="confirm_num">
                                            <th>인증번호</th>
                                            <td>
                                                <input type="text" name="auth_no_2" id="auth_no_2" placeholder="인증번호">
                                                <button type="button" id="auth_no_3_check2" onclick="emailAddCheck('2');">인증번호</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p class="not_send">※ 메일 수신이 안 될 경우 스팸메일함도 확인하여 주시기 바랍니다.</p>
                                <div class="send_tab">
                                    <button onclick="emailAdd();" class="register_btn btn-active" type="button">등록</button>
                                    <button class="back_btn btn-default" type="button">돌아가기</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="popup confirm_popup phone_popup">
            <div class="header">
                <div class="inner">
                    <p>로그인 추가인증 선택</p>
                </div>
            </div>
            <div class="cont">
                <div class="inner">
                    <p class="guide">
                        등록된 휴대폰 번호 이외에 추가로 등록하실 다른 휴대폰 번호를 입력해주시기 바랍니다.<br> 아래 입력하신 인증 정보는 다음 추가 인증 시 리스트에 포함됩니다.
                    </p>
                    <div class="confirm_table">
					<form name="frm1" method="post">
					<input type="hidden" name="created_id" value="${sessionScope.login_id}"> 
					<input type="hidden" name="updated_id" value="${sessionScope.login_id}"> 
                            <fieldset>
                                <table>
                                    <tbody>
                                        <tr class="store_id">
                                            <th>MID(상점아이디)</th>
                                            <td>${sessionScope.login_id}</td>
                                        </tr>
                                        <tr class="account_num">
                                            <th>정산계좌번호<br>(뒤 5자리)</th>
                                            <td>
                                                <div>
                                                    <span>*****</span>
                                                    <input type="text" name="account_num1" id="account_num1">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="company">
                                            <th>회사명</th>
                                            <td><input type="text" name="business_nm1" id="business_nm1"></td>
                                        </tr>
                                        <tr class="phone">
                                            <th>휴대폰 번호</th>
                                            <td>
                                                <input class="phone_num" name="check_no1" id="check_no1" type="tel">
                                                <button type="button" onclick="smsAddCheck('1');">인증번호 발송</button>
                                            </td>
                                        </tr>
                                        <tr class="confirm_num">
                                            <th>인증번호</th>
                                            <td>
                                                <input type="text" name="auth_no_1" id="auth_no_1" placeholder="인증번호">
                                                <button type="button" id="auth_no_3_check1" onclick="smsAddCheck('2');">인증번호</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="send_tab">
                                    <button onclick="smsAdd();" class="register_btn btn-active" type="button">등록</button>
                                    <button class="back_btn btn-default" type="button">돌아가기</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="popup confirm_popup find_popup find_id_popup">
            <div class="header">
                <div class="inner">
                    <p>아이디찾기</p>
                    <button class="close_btn" type="button"></button>
                </div>
            </div>
            <div class="cont">
                <div class="inner">
                    <div class="confirm_table">
                        <form action="#">
                            <fieldset>
                                <table>
                                    <tbody id="id_show1">
                                        <tr class="rep_birth">
                                            <th>대표자 생년월일</th>
                                            <td>
                                                <input type="text" name="ceo_birth_1" id="ceo_birth_1">
                                                <span>(ex.19770101)</span>
                                            </td>
                                        </tr>
                                        <tr class="rep_num">
                                            <th>사업자번호</th>
                                            <td>
                                                <div>
                                                    <input type="text" name="corp_regist_num_1" id="corp_regist_num_1">
                                                    <span>(-없이 입력)</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="account_num">
                                            <th>정산계좌번호<br>(뒤 5자리)</th>
                                            <td>
                                                <div>
                                                    <span>*****</span>
                                                    <input type="text" name="account_num_1" id="account_num_1">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tbody id="id_show2">
                                        <tr class="rep_birth">
                                            <th>아이디</th>
                                            <td>
                                               <span id="spanid"></span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="send_tab">
                                    <button onclick="idSearch();" id="idok" class="register_btn btn-active" type="button">조회</button>
                                    <button class="back_btn btn-default" id="idok2" type="button">돌아가기</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="popup confirm_popup find_popup find_pw_popup">
            <div class="header">
                <div class="inner">
                    <p>비밀번호찾기</p>
                    <button class="close_btn" type="button"></button>
                </div>
            </div>
            <div class="cont">
                <div class="inner">
                    <div class="confirm_table">
                        <form action="#">
                            <fieldset>
                                <table>
                                    <tbody>
                                        <tr class="type">
                                            <th>선택</th>
                                            <td>
                                                <div class="radio_box">
                                                    <div>
                                                        <input type="radio" id="pw1" name="corp_type" value="1" checked>
                                                        <label for="pw1">개인</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" id="pw2" name="corp_type" value="2">
                                                        <label for="pw2">법인</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" id="pw3" name="corp_type" value="3">
                                                        <label for="pw3">비영리법인</label>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="store_id">
                                            <th>MID(상점아이디)</th>
                                            <td>
                                                <input type="text" name="store_id" id="store_id">
                                            </td>
                                        </tr>
                                        <tr class="rep_birth">
                                            <th>대표자 생년월일</th>
                                            <td>
                                                <input type="text" name="ceo_birth_2" id="ceo_birth_2">
                                                <span class="txt_change">(ex.19770101)</span>
                                            </td>
                                        </tr>
                                        <tr class="rep_num">
                                            <th>사업자번호</th>
                                            <td>
                                                <div>
                                                    <input type="text" name="corp_regist_num_2" id="corp_regist_num_2">
                                                    <span>(-없이 입력)</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="account_num">
                                            <th>정산계좌번호<br>(뒤 5자리)</th>
                                            <td>
                                                <div>
                                                    <span>*****</span>
                                                    <input type="text" name="account_num_2" id="account_num_2">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="type">
                                            <th>인증방법 선택</th>
                                            <td>
                                                <div class="radio_box">
                                                    <div>
                                                        <input type="radio" id="certify01" name="auth_type" value="phone" checked>
                                                        <label for="certify01">휴대폰</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" id="certify02" name="auth_type" value="email">
                                                        <label for="certify02">이메일</label>
                                                    </div>
                                                    <button onclick="auth_send();" type="button">인증번호 발송</button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>인증번호</th>
                                            <td>
                                                <input type="text" name="auth_no_3" id="auth_no_3" onchange="js_auth_no_3(this);" placeholder="인증번호">
                                                <button id="auth_no_3_check3" onclick="auth_check();" type="button">인증번호</button> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="send_tab">
                                    <button onclick="pwSearch();" class="register_btn btn-active" type="button">조회</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="popup confirm_popup find_popup change_pw_popup">
            <div class="header">
                <div class="inner">
                    <p>비밀번호변경</p>
                    <button class="close_btn" type="button"></button>
                </div>
            </div>
            <div class="cont">
                <div class="inner">
                    <div class="confirm_table">
                        <form action="#">
                            <fieldset>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>새비밀번호</th>
                                            <td>
                                                <input type="password" name="newpasswd" id="newpasswd" placeholder="새 비밀번호 입력">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>새비밀번호 확인</th>
                                            <td>
                                                <input type="password" name="newpasswd2" id="newpasswd2" placeholder="새 비밀번호 확인">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="send_tab">
                                    <button onclick="pwSearch2();" class="register_btn btn-active" type="button">인증확인</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="popup confirm_popup find_popup pw_change_first">
            <div class="header">
                <div class="inner">
                    <p>비밀번호변경</p>
                    <button class="close_btn" type="button"></button>
                </div>
            </div>
            <div class="cont">
                <div class="inner">
                    <div class="confirm_table">
                        <form action="#">
                            <fieldset>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>현재비밀번호</th>
                                            <td>
                                                <input type="password" name="passwd2" id="passwd2" placeholder="현재 비밀번호 입력">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>새비밀번호</th>
                                            <td>
                                                <input type="password" name="newpasswd3" id="newpasswd3" placeholder="새 비밀번호 입력">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>새비밀번호 확인</th>
                                            <td>
                                                <input type="password" name="newpasswd4" id="newpasswd4" placeholder="새 비밀번호 확인">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="send_tab">
                                    <button onclick="pwChange();" class="register_btn btn-active" type="button">확인</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

<script>
    $(function(){
        // 팝업 공통 - 팝업 닫기
        $('.close_btn').on('click',function(){
            $(this).parents('.popup').hide();
            sesionRemove();
        });
        $('.back_btn').on('click',function(){
            $(this).parents('.popup').hide();
        });
        // 추가인증 탭
        $('.tab_box button').on('click',function(){
            var idx = $(this).index();
            if($(this).hasClass('on')){
            } else {
                $('.tab_box button').removeClass('on');
                $(this).addClass('on');
                $('.tab_list').removeClass('on').eq(idx).addClass('on');
            }  
            
        });
        
   	<c:choose>
		<c:when test="${sessionScope.EMAIL_CHECK eq 'EMAIL_SUCCESS'}">
			$('#but1').addClass('on');
			$('#but2').removeClass('on');
			$('.tab_list').removeClass('on').eq(0).addClass('on');
		</c:when>
		<c:when test="${sessionScope.SMS_CHECK eq 'SMS_SUCCESS'}">
			$('#but2').addClass('on');
			$('#but1').removeClass('on');
			$('.tab_list').removeClass('on').eq(1).addClass('on');
		</c:when>
	</c:choose>
	
        // 로그인 클릭시 추가인증 팝업
        /*
        $('.login_btn').on('click',function(){
            $('.login_popup').show();
        });
        */
        // 이메일 주소 등록시 팝업
        $('.email_register').on('click',function(){
            $('.email_popup').show();
        });
        // 휴대폰 번호 등록시 팝업
        $('.phone_register').on('click',function(){
            $('.phone_popup').show();
        });
        // 아이디찾기 팝업
        $('.find_id').on('click',function(){
            $('.find_id_popup').show();
    		$('#id_show1').show();
    		$('#id_show2').hide();	
    		$('#idok').show();
    		$('#idok2').hide();		    		
            
        });
        // 비밀번호찾기 팝업
        $('.find_pw').on('click',function(){
            $('.find_pw_popup').show();
        });
        // 비밀번호 찾기 유형 선택
        $('#pw1').on('change', function () {
            if ($(this).is(':checked')) {
                $('.find_pw_popup table tr.rep_birth th').text('대표자 생년월일');
                $('.txt_change').removeClass('hidden');
            }
        });
        $('#pw2').on('change', function () {
            if ($(this).is(':checked')) {
                $('.find_pw_popup table tr.rep_birth th').text('법인등록번호');
                $('.txt_change').addClass('hidden');
            }
        });
        $('#pw3').on('change', function () {
            if ($(this).is(':checked')) {
                $('.find_pw_popup table tr.rep_birth th').text('대표자 생년월일');
                $('.txt_change').removeClass('hidden');
            }
        });
        // 비밀번호 변경 팝업
        /*
        $('.find_pw_popup .register_btn').on('click',function(){
            $('.find_pw_popup').hide();
            $('.change_pw_popup').show();
        });
        */
	   	<c:choose>
			<c:when test="${sessionScope.SMS_CHECK eq 'SMS_FALSE1'}">
				alert("인증번호를 확인하세요.");
			</c:when>
			<c:when test="${sessionScope.SMS_CHECK eq 'SMS_FALSE2'}">
				alert("정산계좌번호(뒤 5자리), 회사명을 확인하세요");
			</c:when>
			<c:when test="${sessionScope.EMAIL_CHECK eq 'EMAIL_FALSE1'}">
				alert("인증번호를 확인하세요.");
			</c:when>
			<c:when test="${sessionScope.EMAIL_CHECK eq 'EMAIL_FALSE2'}">
				alert("정산계좌번호(뒤 5자리), 회사명을 확인하세요");
			</c:when>
			<c:when test="${sessionScope.LOGIN_CHECK eq 'LOGIN_SUCCESS' and LOGIN eq '2'}">
				$('.login_popup').show();
				getOption('#email3', 'email', 'E', '');
			</c:when>
			<c:when test="${sessionScope.LOGIN_CHECK eq 'LOGIN_FALSE'}">
				sesionRemove();
				alert("ID, Password 를 확인하세요");
			</c:when>
		</c:choose>
		
    });
    
	function sesionRemove(){
		var param = new Object();
		
		$.ajax({
		    url:  '/app/sesionRemove.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});				
	}   
	
	function goLogin(){

		var frm = document.frm;
		
		if(frm.loginId.value == ""){
			alert("아이디를 입력해주세요.");
			frm.loginId.focus();
			return;
		}
		if(frm.passwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			frm.passwd.focus();
			return;
		}
		
		frm.action = "/app/loginAction.do";
		frm.submit();
       	
	}	

	function goLoginNo(){

		var frm = document.frm;
		
		if(frm.loginId.value == ""){
			alert("아이디를 입력해주세요.");
			frm.loginId.focus();
			return;
		}
		if(frm.passwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			frm.passwd.focus();
			return;
		}
		
		var param = new Object();
		param.loginId	 		 = $('#loginId').val();
		param.passwd			 = $('#passwd').val();
		
		if($("input:checkbox[name='save_id']").is(":checked")){
			param.save_id		 = "Y";
		}else{
			param.save_id		 = "N";
		}
		
		$.ajax({
		    url:  "/app/loginActionNo.do",
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == 'false'){
		    		alert("ID, Password 를 확인하세요");
		    		return;
		    	}else if(data == 'login_first'){
		    		alert("처음로그인시 인증로그인을 해야합니다.");
		    		return;		    		
		    	}else{
		    		var ActionURL = data;
		    		makeform(ActionURL);
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});	
       	
	}		

	function makeform(ActionURL) {
		var f = document.frm;
		f.action = ActionURL;
		f.submit();
	}
	
	function auth_js(val){
		
		var url_page = "";
		var param = new Object();
		param.check	 		 = val;
		param.type	 		 = "1";
		
		if(val == 1){
			param.check_no		 = $("input[name='phone_select']:checked").val();
			url_page = "/app/smsAction.do";
		}else{
			param.check_no		 = $("input[name='email_select']:checked").val();
			url_page = "/app/emailAction.do";
		}
		
		$.ajax({
		    url:  url_page,
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	alert('인증번호가 발송되었습니다.');
		    	$('#check').val(data);
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});		
	}
	
	function auth_result(){
		
		if($('#auth_no').val() == ""){
			alert("인증번호를 입력해주세요!");
			$('#auth_no').focus();
			return;
		}
		
		var param = new Object();
		param.check	 		 = $('#check').val();
		param.auth_no		 = $('#auth_no').val();
		
		if($("input:checkbox[name='save_id']").is(":checked")){
			param.save_id		 = "Y";
		}else{
			param.save_id		 = "N";
		}
		
		$.ajax({
		    url:  "/app/smsEmailCheck.do",
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "AUTH_FALSE"){
		    		alert("인증번호를 확인하세요.");
		    		return;
		    	}else if(data == "LOGIN_FIRST"){
		    		$('.email_popup').hide();
		    		$('.phone_popup').hide();
		    		$('.pw_change_first').show();
		    		return;			    		
		    	}else{
		    		var ActionURL = data;
		    		makeform(ActionURL);
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});		
	}
	
	
	function smsAddCheck(val){
		
		var url_page = "";
		if($('#account_num1').val() == ""){
			alert("정산계좌번호 입력해주세요!");
			$('#account_num1').focus();
			return;
		}
		if($('#business_nm1').val() == ""){
			alert("회사명을 입력해주세요!");
			$('#business_nm1').focus();
			return;
		}
		if($('#check_no1').val() == ""){
			alert("휴대폰번호를 입력해주세요!");
			$('#check_no1').focus();
			return;
		}
		if(val == '2'){
			if($('#auth_no_1').val() == ""){
				alert("인증번호를 입력해주세요!");
				$('#auth_no_1').focus();
				return;
			}
		}
		
		var param = new Object();
		param.account_num	 		 = $('#account_num1').val();
		param.business_nm			 = $('#business_nm1').val();
		param.check_no				 = $('#check_no1').val();
		
		if(val == '1'){
			url_page = '/app/smsAddCheck.do';
		}else if(val == '2'){
			param.auth_no_1				 = $('#auth_no_1').val();
			url_page = '/app/smsAddCheck2.do';
		}		
		
		$.ajax({
		    url:  url_page,
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	if(val == '1'){
			    	if(data == "AUTH_SUCCESS"){
			    		alert("인증번호가 발송 되었습니다.");
			    		return;
			    	}else{
						alert("정산계좌번호및 회사명을 확인해주세요!");
						return;		    		
			    	}
		    	}else{
			    	if(data == "AUTH_SUCCESS"){
						alert("정상인증 되었습니다.");
			    		return;
			    	}else if(data == "AUTH_FALSE1"){
						alert("정산계좌번호및 회사명을 확인해주세요!");
						return;		    		
			    	}else if(data == "AUTH_FALSE2"){
						alert("인증번호를 확인해주세요!");
						return;		    		
			    	}
		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});		
	}
	
	function smsAdd(){

		var frm = document.frm1;
		if(frm.account_num1.value == ""){
			alert("정산계좌번호 입력해주세요!");
			frm.account_num1.focus();
			return;
		}
		if(frm.business_nm1.value == ""){
			alert("회사명을 입력해주세요!");
			frm.business_nm1.focus();
			return;
		}
		if(frm.check_no1.value == ""){
			alert("휴대폰번호를 입력해주세요!");
			frm.check_no1.focus();
			return;
		}
		if(frm.auth_no_1.value == ""){
			alert("인증번호를 입력해주세요!");
			frm.auth_no_1.focus();
			return;
		}
		
		frm.action = "/app/smsAdd.do"; 
		frm.submit();
       	
	}	
	
	function emailAddCheck(val){
		
		var url_page = "";
		if($('#account_num2').val() == ""){
			alert("정산계좌번호 입력해주세요!");
			$('#account_num2').focus();
			return;
		}
		if($('#business_nm2').val() == ""){
			alert("회사명을 입력해주세요!");
			$('#business_nm2').focus();
			return;
		}
		if($('#email1').val() == ""){
			alert("이메일을 입력해주세요!");
			$('#email1').focus();
			return;
		}
		if($('#email2').val() == ""){
			alert("이메일을 입력해주세요!");
			$('#email2').focus();
			return;
		}
		if(val == '2'){
			if($('#auth_no_2').val() == ""){
				alert("인증번호를 입력해주세요!");
				$('#auth_no_2').focus();
				return;				
			}
		}
		
		var param = new Object();
		param.account_num	 		 = $('#account_num2').val();
		param.business_nm			 = $('#business_nm2').val();
		param.check_no				 = $('#email1').val() + "@" +$('#email2').val();
		
		if(val == '1'){
			url_page = '/app/emailAddCheck.do';
		}else if(val == '2'){
			param.auth_no_2			 = $('#auth_no_2').val();
			url_page = '/app/emailAddCheck2.do';
		}
		
		$.ajax({
		    url:  url_page,
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
				if(val == '1'){
			    	if(data == "AUTH_SUCCESS"){
			    		alert("인증번호가 발송 되었습니다.");
			    		return;
			    	}else{
						alert("정산계좌번호및 회사명을 확인해주세요!");
						return;		    		
			    	}
				}else{
			    	if(data == "AUTH_SUCCESS"){
			    		alert("정상인증 되었습니다.");
			    		return;
			    	}else if(data == "AUTH_FALSE1"){
						alert("정산계좌번호및 회사명을 확인해주세요!");
						return;		    		
			    	}else if(data == "AUTH_FALSE2"){
			    		alert("인증번호를 확인해주세요!");
						return;		    		
			    	}
				}		    	
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});		
	}	
	
	function emailAdd(){

		var frm = document.frm2;
		if(frm.account_num2.value == ""){
			alert("정산계좌번호 입력해주세요!");
			frm.account_num2.focus();
			return;
		}
		if(frm.business_nm2.value == ""){
			alert("회사명을 입력해주세요!");
			frm.business_nm2.focus();
			return;
		}
		if(frm.email1.value == ""){
			alert("이메일을 입력해주세요!");
			frm.email1.focus();
			return;
		}
		if(frm.email2.value == ""){
			alert("이메일을 입력해주세요!");
			frm.email2.focus();
			return;
		}
		if(frm.auth_no_2.value == ""){
			alert("인증번호를 입력해주세요!");
			frm.auth_no_2.focus();
			return;
		}
		
		frm.check_no2.value = frm.email1.value + "@" +frm.email2.value;
		frm.action = "/app/emailAdd.do"; 
		frm.submit();
       	
	}	
	
	function idSearch(){
		
		if($('#ceo_birth_1').val() == ""){
			alert("대표자 생년월일을 입력해주세요!");
			$('#ceo_birth_1').focus();
			return;
		}
		if($('#corp_regist_num_1').val() == ""){
			alert("사업자번호를 입력해주세요!");
			$('#corp_regist_num_1').focus();
			return;
		}
		if($('#account_num_1').val() == ""){
			alert("정산계좌번호를 입력해주세요!");
			$('#account_num_1').focus();
			return;
		}
		
		var param = new Object();
		param.ceo_birth	 			 = $('#ceo_birth_1').val();
		param.corp_regist_num		 = $('#corp_regist_num_1').val();
		param.account_num			 = $('#account_num_1').val();
		
		$.ajax({
		    url:  '/app/idSearch.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "ID_FALSE"){
					alert("입력된 정보를 확인해주세요!");
					return;		    		
		    	}else{
		    		$('#id_show1').hide();
		    		$('#id_show2').show();		  
		    		$('#idok').hide();
		    		$('#idok2').show();		    		
		    		$('#spanid').text(data);
					return;		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});			
		
	}
	
	function auth_send(){
		
		var radioValue = $("input[name='corp_type']:checked").val();
		var auth_type = $("input[name='auth_type']:checked").val();
		
		if($('#store_id').val() == ""){
			alert("가맹점ID를 입력해주세요!");
			$('#store_id').focus();
			return;
		}
		
		if(radioValue == "1" || radioValue == "3"){
			if($('#ceo_birth_2').val() == ""){
				alert("대표자 생년월일을 입력해주세요!");
				$('#ceo_birth_2').focus();
				return;
			}
		}
		if(radioValue == "2"){
			if($('#ceo_birth_2').val() == ""){
				alert("법인등록번호를 입력해주세요!");
				$('#ceo_birth_2').focus();
				return;
			}
		}
		if($('#corp_regist_num_2').val() == ""){
			alert("사업자번호를 입력해주세요!");
			$('#corp_regist_num_2').focus();
			return;
		}
		if($('#account_num_2').val() == ""){
			alert("정산계좌번호를 입력해주세요!");
			$('#account_num_2').focus();
			return;
		}
		
		var param = new Object();
		param.corp_type	 			 = radioValue;
		param.store_id	 			 = $('#store_id').val();
		param.ceo_birth	 			 = $('#ceo_birth_2').val();
		param.corp_regist_num		 = $('#corp_regist_num_2').val();
		param.account_num			 = $('#account_num_2').val();
		param.auth_type	 			 = auth_type;
		
		$.ajax({
		    url:  '/app/auth_send.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "INFO_FALSE"){
					alert("입력된 정보를 확인해주세요!");
					return;		    		
		    	}else{
		    		alert("인증번호가 발송 되었습니다.");
					return;		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});	
	}
	
	function auth_check(){
		var radioValue = $("input[name='corp_type']:checked").val();
		var auth_type = $("input[name='auth_type']:checked").val();
		
		if($('#store_id').val() == ""){
			alert("가맹점ID를 입력해주세요!");
			$('#store_id').focus();
			return;
		}
		
		if(radioValue == "1" || radioValue == "3"){
			if($('#ceo_birth_2').val() == ""){
				alert("대표자 생년월일을 입력해주세요!");
				$('#ceo_birth_2').focus();
				return;
			}
		}
		if(radioValue == "2"){
			if($('#ceo_birth_2').val() == ""){
				alert("법인등록번호를 입력해주세요!");
				$('#ceo_birth_2').focus();
				return;
			}
		}
		if($('#corp_regist_num_2').val() == ""){
			alert("사업자번호를 입력해주세요!");
			$('#corp_regist_num_2').focus();
			return;
		}
		if($('#account_num_2').val() == ""){
			alert("정산계좌번호를 입력해주세요!");
			$('#account_num_2').focus();
			return;
		}
		
		var param = new Object();
		param.corp_type	 			 = radioValue;
		param.store_id	 			 = $('#store_id').val();
		param.ceo_birth	 			 = $('#ceo_birth_2').val();
		param.corp_regist_num		 = $('#corp_regist_num_2').val();
		param.account_num			 = $('#account_num_2').val();
		param.auth_type	 			 = auth_type;
		param.auth_no				 = $('#auth_no_3').val();
		
		$.ajax({
		    url:  '/app/auth_check.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "INFO_FALSE"){
					alert("입력된 정보를 확인해주세요!");
					return;		    		
		    	}else if(data == "AUTH_FALSE"){
		    		alert("인증 번호를 확인해주세요.");
					return;		    		
		    	}else{
		    		alert("정상인증 되었습니다.");
					return;		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});	
	}
	
	function pwSearch(){
		
		var radioValue = $("input[name='corp_type']:checked").val();
		var auth_type = $("input[name='auth_type']:checked").val();
		
		if($('#store_id').val() == ""){
			alert("가맹점ID를 입력해주세요!");
			$('#store_id').focus();
			return;
		}
		
		if(radioValue == "1" || radioValue == "3"){
			if($('#ceo_birth_2').val() == ""){
				alert("대표자 생년월일을 입력해주세요!");
				$('#ceo_birth_2').focus();
				return;
			}
		}
		if(radioValue == "2"){
			if($('#ceo_birth_2').val() == ""){
				alert("법인등록번호를 입력해주세요!");
				$('#ceo_birth_2').focus();
				return;
			}
		}
		if($('#corp_regist_num_2').val() == ""){
			alert("사업자번호를 입력해주세요!");
			$('#corp_regist_num_2').focus();
			return;
		}
		if($('#account_num_2').val() == ""){
			alert("정산계좌번호를 입력해주세요!");
			$('#account_num_2').focus();
			return;
		}
		
		var param = new Object();
		param.corp_type	 			 = radioValue;
		param.store_id	 			 = $('#store_id').val();
		param.ceo_birth	 			 = $('#ceo_birth_2').val();
		param.corp_regist_num		 = $('#corp_regist_num_2').val();
		param.account_num			 = $('#account_num_2').val();
		param.auth_type	 			 = auth_type;
		param.auth_no				 = $('#auth_no_3').val();
		
		$.ajax({
		    url:  '/app/pwSearch.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "INFO_FALSE"){
					alert("입력된 정보를 확인해주세요!");
					return;		    		
		    	}else if(data == "AUTH_FALSE"){
		    		alert("인증 번호를 확인해주세요.");
					return;		    		
		    	}else if(data == "AUTH_SUCCESS"){
		            $('.find_pw_popup').hide();
		            $('.change_pw_popup').show();		    		
					return;		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});	
		
	}
	
	function pwSearch2(){
		
		if($('#newpasswd').val() == ""){
			alert("새비밀번호를 입력해주세요!");
			$('#newpasswd').focus();
			return;
		}
		
		if($('#newpasswd2').val() == ""){
			alert("새비밀번호 확인을 입력해주세요!");
			$('#newpasswd2').focus();
			return;
		}
		if($('#newpasswd').val() != $('#newpasswd2').val()){
			alert("비밀번호가 일치하지 않습니다.");
			$('#newpasswd').focus();
			return;
		}

		
		var param = new Object();
		param.passwd	 			 = $('#newpasswd').val();
		param.store_id	 			 = $('#store_id').val();
		param.type		 			 = "1";
		
		$.ajax({
		    url:  '/app/pwSearch2.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "INFO_SUCCESS"){
		    		alert("비밀번호가 변경 되었습니다.");
		            $('.find_pw_popup').hide();
		            $('.change_pw_popup').hide();	
					return;		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});	
		
	}
	
	$('#id_show2').hide();
	
	function emailSel(val){
		var frm = document.frm2;
		frm.email2.value = val;
	}
	
	function saveJs(){
		if($("input:checkbox[name='save_id']").is(":checked")){
			$.cookie("save_id", 'Y', { expires: 365, path: '/'});
			$.cookie("loginId", $("#loginId").val(), { expires: 365, path: '/'});
		}else{
			$.removeCookie("save_id", { path: '/' });
			$.removeCookie("loginId", { path: '/' });
		}
	}
	
	if($.cookie("save_id") == 'Y'){
		$("input:checkbox[name='save_id']").prop("checked", true);
		$("#loginId").val($.cookie("loginId"));
	}
	
	function pwChange(){
		
		if($('#passwd2').val() == ""){
			alert("현재비밀번호로 입력해주세요!");
			$('#passwd2').focus();
			return;
		}
		
		if($('#newpasswd3').val() == ""){
			alert("새비밀번호를 입력해주세요!");
			$('#newpasswd3').focus();
			return;
		}
		
		if($('#newpasswd4').val() == ""){
			alert("새비밀번호 확인을 입력해주세요!");
			$('#newpasswd4').focus();
			return;
		}
		if($('#newpasswd3').val() != $('#newpasswd4').val()){
			alert("비밀번호가 일치하지 않습니다.");
			$('#newpasswd3').focus();
			return;
		}
		if($('#passwd2').val() == $('#newpasswd3').val()){
			alert("현재비밀번호랑 새 비밀번호가 동일합니다.");
			$('#passwd2').focus();
			return;
		}
		
		var param = new Object();
		param.passwd	 			 = $('#passwd2').val();
		param.newpasswd	 			 = $('#newpasswd3').val();
		param.login_first		 	 = "N";
		
		$.ajax({
		    url:  '/app/pwSearch3.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "INFO_FALSE"){
		    		alert("현재 비밀번호가 맞지않습니다.");
					return;		
		    	}else{
		    		alert("비밀번호가 변경 되었습니다.");
		    		$('.pw_change_first').hide();
		    		var ActionURL = data;
		    		makeform(ActionURL);		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});	
		
	}	
</script>



</html>
--%>