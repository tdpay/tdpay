<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String mobileCheck = request.getServerName();
%>
<script>
	var isMobile = false;
	var arrMobileKeyWord = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson','Windows Phone');
	for (var word in arrMobileKeyWord){
		if (navigator.userAgent.match(arrMobileKeyWord[word]) != null){
			isMobile = true;
			break;
		}
	}
	if(isMobile) {
		location.href='/app/user/login.do';	
	 }
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<meta content="(주)티디페이먼츠" name="Title" />
<meta content="(주)티디페이먼츠" name="Description" />
<meta content="(주)티디페이먼츠" name="Keyword" />
<meta property="og:title" content="(주)티디페이먼츠"  />
<meta property="og:description" content="(주)티디페이먼츠"  />
<meta property="og:url" content="http://tdpaypg.co.kr/">
<link rel="shortcut icon" href="/img/favicon.ico">
<meta property="og:image" content="/img/kakaotalk_img.png">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="/css/common.css" rel="stylesheet" type="text/css"/>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>

<script src="/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/js/jquery.fullPage.min.js" type="text/javascript"></script>
<script src="/js/owl.carousel.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="/js/slick.min.js" type="text/javascript"></script>
<script src="/js/script.js" type="text/javascript"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="/js/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
<script src="/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/js/selectBox.js" type="text/javascript"></script>

<title>(주)티디페이먼츠</title>
</head>
<body>

<div class="intro">
	<div class="visual_box">
        <c:set var="baseURL" value="${pageContext.request.serverName}" />
        <c:choose>
            <c:when test="${baseURL eq 'localhost' || baseURL eq 'tadmin.tdpaypg.co.kr'}">
                <span class="intro_bg"></span>
            </c:when>
            <c:when test="${baseURL eq 'mpartner.tdpaypg.co.kr'}">
                <span class="intro_bg bg01"></span>
            </c:when>
            <c:when test="${baseURL eq 'partner.tdpaypg.co.kr'}">
                <span class="intro_bg bg02"></span>
            </c:when>
            <c:when test="${baseURL eq 'store.tdpaypg.co.kr'}">
                <span class="intro_bg bg03"></span>
            </c:when>
            <c:otherwise>
                <span class="intro_bg bg03"></span>
            </c:otherwise>
        </c:choose>
	</div>
	<div class="login_box">
		<form id="frm" name="frm" method="post">
            <div class="login_ttl">
                <strong>Welcome</strong>
                <em>(주)티디페이먼츠에 오신 것을 환영합니다.</em>
            </div>
            <div class="input_box">
                <div class="input_wrap">
                    <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력해주세요.">
                </div>
                <div class="input_wrap">
                    <input type="password" id="passwd" name="passwd" onkeyup="enterkey()" placeholder="비밀번호를 입력해주세요.">
                </div>
            </div>
            <div class="option_box">
                <div class="check_box">
                    <input type="checkbox" id="save_id" name="save_id" value="Y" onclick="saveJs();">
                    <label for="save_id">ID저장</label>
                </div>	
                <div class="find_box">
                    <a href="javascript:void(0);" class="go_find go_id">아이디/</a>
                    <a href="javascript:void(0);" class="go_find go_pw">비번찾기</a>
                </div>
            </div>		
            <div class="btn_wrap">
                <a class="login_btn" href="javascript:goLogin();" id="login">로그인</a>
                <a href="javascript:goLoginNo();" class="direct_login">인증없이 로그인</a>
            </div>
            <p class="copyright">Copyright 2022 tdpayments. All Rights Reserved</p>	
            <input type="hidden" name="check" id="check"> 
            <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}"> 
            <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}"> 
		</form>
	</div>

</div>


<!-- 추가 인증 선택 -->
<div class="pop_wrap login_confirm01 pop680 pop_off">
	<div class="pop_cont ">
		<div class="pop_top">
			<strong class="pop_ttl">로그인 추가인증 선택</strong>
			<a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
		</div>
		<div class="pop_body">
            <div class="pop_inner">
                <span class="txt">
                    정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 28조에 제 1항 제2호 개인정보의<br />
                    보호조치에 따라 “로그인 시 추가인증"이 필요하게 되었습니다. 따라서 추가인증 수단을 사전에<br /> 
                    등록하신 후 로그인시 해당 수단을 선택하여 인증하여 주시기 바랍니다.
                </span>
                <em>아래 인증 수단 중 택일하여 추가인증을 진행하여 주시기 바랍니다.</em>
                <div class="btn_box confirm_tab">
                    <a href="javascript:void(0);" class="dark_line_btn on">이메일 인증</a>
                    <a href="javascript:void(0);" class="dark_line_btn off">휴대폰 인증</a>
                </div>				
                <div class="tab_wrap">
                    <div class="tab">
                        <span class="txt">· 가맹점관리자 계정 내 등록된 이메일 주소로 인증번호가 발송됩니다.</span>
                        <span class="txt">· 선택한 정보로 수신된 인증번호를 입력하여 주시기 바랍니다.</span>
                        <span class="txt">· '다른 이메일 주소 등록'을 클릭하여 인증정보 추가 등록이 4개까지 가능합니다</span>

                        <div class="inner_bottom login_add_radio">
                            <c:set var="email_cnt" value="" />
                            <ul>
                            	<!-- <li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select1" name="email_select" value="starup@starmon.co.kr" />
                                        <label for="email_select1" />
                                            <span>주식회사 스타업 <i>starup@starmon.co.kr</i></span>
                                        </label>
                                    </div>	
                                </li>
                                <li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select2" name="email_select" value="jdy.dev@starmon.co.kr" />
                                        <label for="email_select2" />
                                            <span>주식회사 스타업 <i>jdy.dev@starmon.co.kr</i></span>
                                        </label>
                                    </div>	
                                </li>
                                <li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select3" name="email_select" value="pja.dev@starmon.co.kr" />
                                        <label for="email_select3" />
                                            <span>주식회사 스타업 <i>pja.dev@starmon.co.kr</i></span>
                                        </label>
                                    </div>	
                                </li>
                                <li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select4" name="email_select" value="gms.dev@starmon.co.kr" />
                                        <label for="email_select4" />
                                            <span>주식회사 스타업 <i>gms.dev@starmon.co.kr</i></span>
                                        </label>
                                    </div>	
                                </li>
                                <li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select5" name="email_select" value="uwal@uwal.co.kr" />
                                        <label for="email_select5" />
                                            <span>주식회사 스타업 <i>starmon@starmon.co.kr</i></span>
                                        </label>
                                    </div>	
                                </li> -->
                            	<!--<c:if test="${!empty loginInfo.person_nm1}">
                            	<li>
                            		${sessionScope.sessionLoginAction}
                                    <div class="radio_box">
                                        <input type="radio" id="email_select1" name="email_select" value="${loginInfo.person_email1}" />
                                        <label for="email_select1" />
                                            <span>${loginInfo.person_nm1}<i>${loginInfo.person_email1}</i></span>
                                        </label>
                                    </div>	
                                </li>
                            	</c:if>
                            	<c:if test="${!empty loginInfo.person_nm2}">
                            	<li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select2" name="email_select" value="${loginInfo.person_email2}" />
                                        <label for="email_select2" />
                                            <span>${loginInfo.person_nm2}<i>${loginInfo.person_email2}</i></span>
                                        </label>
                                    </div>	
                                </li>
                            	</c:if>
                            	<c:if test="${!empty loginInfo.person_nm3}">
                            	<li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select3" name="email_select" value="${loginInfo.person_email3}" />
                                        <label for="email_select3" />
                                            <span>${loginInfo.person_nm3}<i>${loginInfo.person_email3}</i></span>
                                        </label>
                                    </div>	
                                </li>
                            	</c:if>-->
                                <c:forEach var="result" items="${sessionScope.EMAIL_USER}" varStatus="status">	
                                <c:set var="email_cnt" value="${status.count}" />
                                <li>
                                    <div class="radio_box">
                                        <input type="radio" id="email_select<c:out value="${status.count}" />" name="email_select" value="<c:out value="${result.email}" />">
                                        <label for="email_select<c:out value="${status.count}" />" class="">
                                            <span><c:out value="${result.business_nm}" /><i><c:out value="${result.email}" /></i></span>
                                        </label>
                                    </div>	
                                </li>
                                </c:forEach>
                            </ul>
                            <div class="btn_box">
                                <a href="javascript:auth_js('2');" class="dark_full_btn">이메일 발송</a>
                                <c:if test="${email_cnt < 4}">
                                <a href="javascript:void(0);" class="gray_line_btn register_email">다른 이메일 주소 등록</a>
                                </c:if>
                            </div>
                        </div>				
                        <div class="layout_wrap">
                            <table class="table_layout01">
                                <colgroup>
                                    <col style="width:140px;">
                                    <col style="width:auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>인증번호</th>
                                        <td>
                                            <input class="" type="text" name="auth_no1" id="auth_no1" placeholder="인증번호" />
                                            <button class="list_btn" type="button" onclick="auth_result('1');">인증번호</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>					
                    </div>
                    <div class="tab">
                        <span class="txt">· 가맹점관리자 계정 내 등록된 휴대폰 번호로 인증번호가 발송됩니다.</span>
                        <span class="txt">· 선택한 정보로 수신된 인증번호를 입력하여 주시기 바랍니다.</span>
                        <span class="txt">· '다른 휴대폰 등록'을 클릭하여 인증정보 추가 등록이 4개까지 가능합니다</span>
                        <div class="inner_bottom login_add_radio">
                            <c:set var="sms_cnt" value="" />
                            <ul>
                                <c:forEach var="result" items="${sessionScope.SMS_USER}" varStatus="status">	
                                <c:set var="sms_cnt" value="${status.count}" />
                                <li>
                                    <div class="radio_box">
                                        <input type="radio" id="phone_select<c:out value="${status.count}" />" name="phone_select" value="<c:out value="${result.phone_num}" />">
                                        <label for="phone_select<c:out value="${status.count}" />" class="">
                                            <span><c:out value="${result.business_nm}" /><i><c:out value="${result.phone_num2}" /></i></span>
                                        </label>
                                    </div>	
                                </li>
                                </c:forEach>
                            </ul>
                            <div class="btn_box">
                                <a href="javascript:auth_js('1');" class="dark_line_btn">문자 발송</a>
                                <c:if test="${sms_cnt < 4}">
                                <a href="javascript:void(0);" class="gray_line_btn register_phone" >다른 휴대폰 등록</a>
                                </c:if>
                            </div>
                        </div>				
                        <div class="layout_wrap">
                            <table class="table_layout01">
                                <colgroup>
                                    <col style="width:140px;">
                                    <col style="width:auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>인증번호</th>
                                        <td>
                                            <input class="" type="text" name="auth_no2" id="auth_no2" placeholder="인증번호" />
                                            <button class="list_btn" type="button" onclick="auth_result('2');">인증번호</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>					
                    </div>
                </div>
            </div>
		</div>
    </div> 
    <div class="dim"></div>
</div>
<!-- 추가 인증 선택-->

<!-- 추가 인증 등록 -->
<div class="pop_wrap login_confirm02 pop680 pop_off">
	<div class="pop_cont">
		<div class="pop_top">
			<strong class="pop_ttl">로그인 추가인증 선택</strong>
			<a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
		</div>
		<div class="pop_body">
			<div class="pop_inner">
				<div class="inner_top">
					<span class="txt">
						등록된 휴대폰 번호 이외에 추가로 등록하실 다른 휴대폰 번호를 입력해주시기 바랍니다.<br />
						아래 입력하신 인증 정보는 다음 추가 인증 시 리스트에 포함됩니다.
					</span>			
				</div>
				<div class="inner_bottom">
					<form name="frm1" method="post">
                        <input type="hidden" name="created_id" value="${sessionScope.login_id}"> 
                        <input type="hidden" name="updated_id" value="${sessionScope.login_id}"> 								
                        <table class="table_layout01">
                            <colgroup>
                                <col style="width:140px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>MID(상점아이디)</th>
                                    <td>${sessionScope.login_id}</td>
                                </tr>
                                <tr>
                                    <th>정산계좌번호<br>(뒤 5자리)</th>
                                    <td>***** &nbsp;<input type="text" name="account_num1" id="account_num1" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>회사명</th>
                                    <td>
                                        <input type="text" name="business_nm1" id="business_nm1" placeholder="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대폰번호</th>
                                    <td>
                                        <input type="text" name="check_no1" id="check_no1" placeholder="010-0000-0000">
                                        <button type="button" class="list_btn" onclick="smsAddCheck('1');">인증번호 발송</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>인증번호</th>
                                    <td>
                                        <input type="text" name="auth_no_1" id="auth_no_1"  placeholder="인증번호">
                                        <button type="button" id="auth_no_3_check1" onclick="smsAddCheck('2');"class="confirm_before_btn off list_btn">휴대폰 인증</button>									
                                    </td>
                                </tr>
                            </tbody>
                        </table>
					</form>
					<div class="btn_box">
						<a href="javascript:smsAdd();" class="dark_full_btn">등록</a>
						<a href="javascript:void(0);" class="gray_line_btn register_phone_back">돌아가기</a>
					</div>					
				
				</div>				
			</div>
		</div>
	</div>
    <div class="dim"></div>
</div>
<!-- //추가 인증 등록 -->

<!-- 추가 인증 등록2 -->
<div class="pop_wrap login_confirm03 pop680 pop_off">
	<div class="pop_cont">
		<div class="pop_top">
			<strong class="pop_ttl">로그인 추가인증 선택</strong>
			<a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
		</div>
		<div class="pop_body">
			<div class="pop_inner">
				<div class="inner_top">
					<span class="txt">
						등록된 이메일 주소 이외에 추가로 등록하실 다른 이메일 주소를 입력해주시기 바랍니다.<br />
						아래 입력하신 인증 정보는 다음 추가 인증 시 리스트에 포함됩니다.
					</span>			
				</div>
				<div class="inner_bottom">
					<form name="frm2" method="post">
                        <input type="hidden" name="created_id" value="${sessionScope.login_id}"> 
                        <input type="hidden" name="updated_id" value="${sessionScope.login_id}"> 					
                        <input type="hidden" name="check_no2" value=""> 					
                        <table class="table_layout01">
                            <colgroup>
                                <col style="width:140px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>MID(상점아이디)</th>
                                    <td>${sessionScope.login_id}</td>
                                </tr>
                                <tr>
                                    <th>정산계좌번호<br>(뒤 5자리)</th>
                                    <td>***** &nbsp;<input type="text" name="account_num2" id="account_num2" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th>회사명</th>
                                    <td>
                                        <input type="text" name="business_nm2" id="business_nm2" placeholder="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <input class="w110" type="text" placeholder="" name="email1" id="email1">
                                        <span class="">@</span>
                                        <input class="w110" type="text" placeholder="" name="email2" id="email2">
                                        <select name="email3" id="email3" onchange="emailSel(this.value);">
                                            <option value="">직접입력</option>
                                        </select>
                                        <button type="button" onclick="emailAddCheck('1');" class="list_btn btn_send">인증번호 발송</button>
                                    </td>
                                    
                                    </td>
                                </tr>
                                <tr>
                                    <th>인증번호</th>
                                    <td>
                                        <input type="text" name="auth_no_2" id="auth_no_2" placeholder="인증번호">
                                        <button type="button" id="auth_no_3_check2" onclick="emailAddCheck('2');"class="confirm_before_btn off list_btn">인증확인</button>								
                                    </td>
                                </tr>
                            </tbody>
                        </table>
					</form>
					<span class="txt_note">※ 메일 수신이 안 될 경우 스팸메일함도 확인하여 주시기 바랍니다.</sp>
					<div class="btn_box">
						<a href="javascript:emailAdd();" class="dark_full_btn">등록</a>
						<a href="javascript:void(0);" class="gray_line_btn register_email_back">돌아가기</a>
					</div>					
				
				</div>				
			</div>
		</div>
	</div>
    <div class="dim"></div>
</div>
<!-- //추가 인증 등록2 -->

<!-- 아이디찾기 -->
<div class="pop_wrap id_find_popup pop500 pop_off">
	<div class="pop_cont">
		<div class="pop_top">
			<strong class="pop_ttl">아이디찾기</strong>
			<a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
		</div>
		<div class="pop_body">
			<div class="pop_inner">
				<div class="inner_top">
					<span class="txt">
						임시패스워드는 관리자 메일로 발송됩니다.
					</span>			
				</div>
				<div class="inner_bottom">
					<table class="table_layout01">
                        <colgroup>
                            <col style="width:140px;">
                            <col style="width:auto;">
                        </colgroup>
						<tbody id="id_show1">
							<tr>
								<th>대표자 생년월일</th>
                                <td>
                                    <input type="text" name="ceo_birth_1" id="ceo_birth_1">
                                    <span class="unit">(ex. 19770101)</span>
                                </td>
							</tr>
							<tr>
								<th>사업자번호</th>
								<td>
                                    <input type="text" name="corp_regist_num_1" id="corp_regist_num_1" placeholder="">
                                    <span class="unit">(-없이 입력)</span>
                                </td>
							</tr>
							<tr>
								<th>정산계좌번호<br>(뒤 5자리)</th>
								<td>***** &nbsp;<input type="text" name="account_num_1" id="account_num_1" placeholder=""></td>
							</tr>
						</tbody>
						<tbody id="id_show2">
							<tr>
								<th>아이디</th>
								<td><span id="spanid"></span></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_box">
						<a href="javascript:idSearch();" id="idok" class="dark_full_btn">조회</a>
						<a href="javascript:void(0);" id="idok2" class="gray_line_btn btn_closed">확인</a>
					</div>					
				</div>				
			</div>
		</div>
    </div>
    <div class="dim"></div>
</div>
<!-- //아이디찾기  -->

<!-- 비밀번호찾기 -->
<div class="pop_wrap pw_find_popup pop680 pop_off">
	<div class="pop_cont">
		<div class="pop_top">
			<strong class="pop_ttl">비밀번호찾기</strong>
			<a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
		</div>
		<div class="pop_body">
			<div class="pop_inner">
				<div class="inner_top">
					<span class="txt">
						임시패스워드는 관리자 메일로 발송됩니다.
					</span>			
				</div>
				<div class="inner_bottom">
					<table class="table_layout01">
                        <colgroup>
                            <col style="width:140px;">
                            <col style="width:auto;">
                        </colgroup>
						<tbody>
							<tr>
								<th>선택</th>
								<td>
									<div class="radio_box">
										<input type="radio" name="corp_type" value="1" class="input_checkbox" id="pw1" checked>
										<label for="pw1">개인</label>
									</div>
									<div class="radio_box">
										<input type="radio" name="corp_type" value="2" class="input_checkbox" id="pw2">
										<label for="pw2">법인</label>
									</div>
									<div class="radio_box">
										<input type="radio" name="corp_type" value="3" class="input_checkbox" id="pw3">
										<label for="pw3">비영리법인</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>가맹점ID</th>
								<td><input type="text" name="store_id" id="store_id"></td>
							</tr>
							<tr>
								<th class="">대표자 생년월일</th>
								<td><input type="text" name="ceo_birth_2" id="ceo_birth_2"><span class="txt_change">&nbsp;(ex.19770101)</span></td>
							</tr>
							<tr>
								<th>사업자번호</th>
								<td><input type="text" name="corp_regist_num_2" id="corp_regist_num_2" placeholder=""><span class="">&nbsp;(-없이 입력)</span></td>
							</tr>
							<tr>
								<th>정산계좌번호<br>(뒤 5자리)</th>
								<td>***** &nbsp;<input type="text" name="account_num_2" id="account_num_2" placeholder=""><span class=""></span></td>
                            </tr>
                            <tr>
                                <th>인증방법 선택</th>
                                <td>
                                    <div class="radio_box">
										<input type="radio" name="auth_type" value="phone" class="input_checkbox" id="certify01" checked>
										<label for="certify01">휴대폰</label>
									</div>
									<div class="radio_box">
										<input type="radio" name="auth_type" value="email" class="input_checkbox" id="certify02">
										<label for="certify02">이메일</label>
                                    </div>
                                    <button onclick="auth_send();" type="button" class="list_btn">인증번호 발송</button>
                                </td>
                            </tr>
                            <tr>
                                <th>인증번호</th>
                                <td>
                                    <input type="text" name="auth_no_3" id="auth_no_3" onchange="js_auth_no_3(this);" placeholder="인증번호" class="w180">
                                    <button type="button" id="auth_no_3_check3" onclick="auth_check();"class="confirm_before_btn off list_btn">휴대폰 인증</button>                               
                                </td>
                            </tr>
						</tbody>
					</table>
					<div class="btn_box">
						<a href="javascript:pwSearch();" class="dark_full_btn">조회</a>
					</div>					
				</div>				
			</div>
		</div>
	</div>
    <div class="dim"></div>
</div>
<!-- //비밀번호찾기  -->

<!-- 비밀번호변경 -->
<div class="pop_wrap pw_change pop500 pop_off">
	<div class="pop_cont">
		<div class="pop_top">
			<strong class="pop_ttl">비밀번호변경</strong>
			<a class="btn_closed" href="#!"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
		</div>
		<div class="pop_body">
			<div class="pop_inner">
				<div class="inner_bottom">
					<table class="table_layout01">
                        <colgroup>
                            <col style="width:140px;">
                            <col style="width:auto;">
                        </colgroup>
						<tbody>
							<tr>
								<th>새비밀번호</th>
								<td>
                                    <input class="w_all" type="password" name="newpasswd" id="newpasswd" placeholder="새 비밀번호 입력">
                                </td>
							</tr>
							<tr>
								<th>새비밀번호 확인</th>
								<td>
                                    <input class="w_all" type="password" name="newpasswd2" id="newpasswd2" placeholder="새 비밀번호 확인">
                                </td>
							</tr>
						</tbody>
					</table>
					<div class="btn_box">
						<a href="javascript:pwSearch2();" class="dark_full_btn">인증확인</a>
					</div>					
				</div>				
			</div>
		</div>
    </div>
    <div class="dim"></div>
</div>
<!-- //비밀번호변경  -->


<!-- 초기비밀번호인증 -->
<div class="pop_wrap pw_find_popup_first pop500 pop_off">
    <div class="pop_cont">
        <div class="pop_top">
            <strong class="pop_ttl">비밀번호변경</strong>
            <a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
        </div>
        <div class="pop_body">
            <div class="pop_inner">
                <div class="inner_bottom">
                    <table class="table_layout01">
                        <colgroup>
                            <col style="width:140px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>인증방법 선택</th>
                                <td>
                                    <div class="radio_box">
                                        <input type="radio" name="certify" value="phone_num" class="input_checkbox" id="certify01_first" checked>
                                        <label for="certify01_first">휴대폰</label>
                                    </div>
                                    <div class="radio_box">
                                        <input type="radio" name="certify" value="email" class="input_checkbox" id="certify02_first" >
                                        <label for="certify02_first">이메일</label>
                                    </div>
                                    <button onclick="authSend();" type="button" class="list_btn">인증번호 발송</button>
                                </td>
                            </tr>
                            <tr>
                                <th>인증번호</th>
                                <td>
                                    <input type="text" name="auth_no" id="auth_no" placeholder="인증번호" class="width_180">
                                    <button type="button" onclick="authCheck();" class="list_btn">인증확인</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <span class="txt_note">인증확인후 조회버튼을 눌러주세요</span>
                    <div class="btn_box">
                        <a href="javascript:passWd();" class="dark_full_btn first_pw_change">조회</a>
                    </div>					
                </div>				
            </div>
        </div>
    </div>
    <div class="dim"></div>
</div>
<!-- //초기비밀번호인증  -->		
<!-- 초기비밀번호변경 -->
<div class="pop_wrap pw_change_first pop500 pop_off">
    <div class="pop_cont">
        <div class="pop_top">
            <strong class="pop_ttl">비밀번호변경</strong>
            <a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
        </div>
        <div class="pop_body">
            <div class="pop_inner">
                <div class="inner_bottom">
                    <table class="table_layout01">
                        <colgroup>
                            <col style="Width:140px;">
                            <col style="Width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>현재비밀번호</th>
                                <td>
                                    <input class="w_all" type="password" name="passwd2" id="passwd2" placeholder="현재 비밀번호 입력">
                                </td>
                            </tr>
                            <tr>
                                <th>새비밀번호</th>
                                <td>
                                    <input class="w_all" type="password" name="newpasswd3" id="newpasswd3" placeholder="새 비밀번호 입력">
                                </td>
                            </tr>
                            <tr>
                                <th>새비밀번호 확인</th>
                                <td>
                                    <input class="w_all" type="password" name="newpasswd4" id="newpasswd4" placeholder="새 비밀번호 확인">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn_box">
                        <a href="javascript:pwChange();" class="dark_full_btn">확인</a>
                    </div>					
                </div>				
            </div>
        </div>
    </div>
    <div class="dim"></div>
</div>
<!-- //초기비밀번호변경  -->


</body>
<script type="text/javascript">

    $('.btn_closed').on('click', function(){
		$('.pop_wrap').hide();
	});

	 $('.btn_closed').on('click', function(){
		$('.id_find_popup').hide();
		//sesionRemove();
	});

    $('.register_phone').on('click', function(){
		$('.login_confirm01').hide();
		$('.login_confirm02').show();
	});
    $('.register_phone_back').on('click', function(){
		$('.login_confirm01').show();
		$('.login_confirm02').hide();
	});

	$('.register_email').on('click', function(){
        $('.login_confirm01').hide();
		$('.login_confirm03').show();
	});
	$('.register_email_back').on('click', function(){
        $('.login_confirm01').show();
		$('.login_confirm03').hide();
	});

	$('.go_id').on('click', function(){
		$('#idok').show();
		$('#idok2').hide();
		$('.id_find_popup').show();
		$('#id_show1').show();
		$('#id_show2').hide();
	});

	$('.go_pw').on('click', function(){
		$('.pw_find_popup').show();
	});

    $('.go_pw_change').on('click', function(){
		$('.pw_find_popup').hide();
		$('.pw_change').show();
	});

    $('.first_pw_change').on('click', function(){
        $('.pw_find_popup_first').hide();
        $('.pw_change_first').show();
    });
    
	$('#pw1').on('change', function () {
	  if ($(this).is(':checked')) {
		$('.pw_find_popup table tr:nth-child(3) th').text('대표자 생년월일');
		$('.txt_change').removeClass('hidden');
	  }
	});
	$('#pw2').on('change', function () {
	  if ($(this).is(':checked')) {
		$('.pw_find_popup table tr:nth-child(3) th').text('법인등록번호');
		$('.txt_change').addClass('hidden');
	  }
	});
	$('#pw3').on('change', function () {
	  if ($(this).is(':checked')) {
		$('.pw_find_popup table tr:nth-child(3) th').text('대표자 생년월일');
		$('.txt_change').removeClass('hidden');
	  }
	});
	
	$("#auth_no_1").keyup(function() { 
		$("#auth_no_3_check1").attr('class','confirm_before_btn on');
	});
	$("#auth_no_2").keyup(function() { 
		$("#auth_no_3_check2").attr('class','confirm_before_btn on');
	});
	$("#auth_no_3").keyup(function() { 
		$("#auth_no_3_check3").attr('class','confirm_before_btn on');
	});

/*
	$('.btn_login').on('click', function(){
		$('.login_confirm01').show();
		$('.dim').show();
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
			$('.login_confirm01').show();
			$('.dim').show();
			getOption('#email3', 'email', 'E', '');
		</c:when>
		<c:when test="${sessionScope.LOGIN_CHECK eq 'LOGIN_FALSE'}">
			sesionRemove();
			alert("ID, Password 를 확인하세요");
		</c:when>
	</c:choose>



	$('.btn_comfirmed').on('click', function(){	
		$('.popup01').hide();
		$('.dim').hide();

	});

	$(function(){
  
	  var tab = $('.btn_box.confirm_tab a'); 
	  var box = $('.pop_wrap .tab_wrap .tab'); 
	  
	  box.eq(0).show(); 
	  
	  tab.click(function(e){
	 
		var idx = $(tab).index(this);

		$(tab).removeClass('on').eq(idx).addClass('on');
		$(this).addClass('on');
		box.hide();
		box.eq(idx).fadeIn(200);
		e.preventDefault();
		
	  });
	  
	<c:choose>
		<c:when test="${sessionScope.EMAIL_CHECK eq 'EMAIL_SUCCESS'}">
			$(tab).removeClass('on').eq(0).addClass('on');
			$(this).addClass('on');
			box.hide();
			box.eq(0).fadeIn(200);
			e.preventDefault();
		</c:when>
		<c:when test="${sessionScope.SMS_CHECK eq 'SMS_SUCCESS'}">
			$(tab).removeClass('on').eq(1).addClass('on');
			$(this).addClass('on');
			box.hide();
			box.eq(1).fadeIn(200);
			e.preventDefault();
		</c:when>
	</c:choose>
	
	  
	});

	function sesionRemove(){
		var param = new Object();
		
		$.ajax({
		    url:  '/sesionRemove.do',
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
		
		var param = new Object();
		param.loginId	 		 = $('#loginId').val();
		param.passwd			 = $('#passwd').val();
		
		//frm.action = "/loginAction.do";
		//frm.submit();
		
		$.ajax({
		    url:  "/loginAction.do",
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	if(data == 'false'){
		    		alert("ID, Password 를 확인하세요");
		    		return;
		    	} // else if(data == 'login_first'){
		    	//	alert("처음로그인시 인증로그인을 해야합니다.");
		    	//	return;
		    	//}
		    	else{
		    		/*var ActionURL = data;
		    		makeform(ActionURL);*/
		    		$('.login_confirm01').show();
		    		
		    	}
		    	
		    },
		    error: function(e){
		        alert(e.reponseText);
		    },
		    complete: function() {
		    }
		});	
       	
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
		    url:  "/loginActionNo.do",
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == 'false'){
		    		alert("ID, Password 를 확인하세요");
		    		return;
		    	} // else if(data == 'login_first'){
		    	//	alert("처음로그인시 인증로그인을 해야합니다.");
		    	//	return;
		    	//}
		    	else{
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
			url_page = "/smsAction.do";
		}else{
			param.check_no		 = $("input[name='email_select']:checked").val();
			console.log($("input[name='email_select']:checked").val());
			url_page = "/emailAction.do";
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
	
	function auth_result(val){
		
		if($('#auth_no'+val).val() == ""){
			alert("인증번호를 입력해주세요!");
			$('#auth_no'+val).focus();
			return;
		}
		
		var param = new Object();
		param.check	 		 = $('#check').val();
		param.auth_no		 = $('#auth_no'+val).val();
		
		if($("input:checkbox[name='save_id']").is(":checked")){
			param.save_id		 = "Y";
		}else{
			param.save_id		 = "N";
		}
		
		$.ajax({
		    url:  "/smsEmailCheck.do",
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "AUTH_FALSE"){
		    		alert("인증번호를 확인하세요.");
		    		return;
		    	}else if(data == "LOGIN_FIRST"){
		    		$('.login_confirm01').hide();
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
			url_page = '/smsAddCheck.do';
		}else if(val == '2'){
			param.auth_no_1				 = $('#auth_no_1').val();
			url_page = '/smsAddCheck2.do';
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
		
		frm.action = "/smsAdd.do"; 
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
			url_page = '/emailAddCheck.do';
		}else if(val == '2'){
			param.auth_no_2			 = $('#auth_no_2').val();
			url_page = '/emailAddCheck2.do';
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
		frm.action = "/emailAdd.do"; 
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
		    url:  '/idSearch.do',
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
		    url:  '/auth_send.do',
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
		    url:  '/auth_check.do',
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
		    url:  '/pwSearch.do',
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
		    		$('.pw_find_popup').hide();
		    		$('.pw_change').show();
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
		
		var pw = $("#newpasswd").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
//		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(pw.length < 8 || pw.length > 15){
		 alert("8자리 ~ 15자리 이내로 입력해주세요.");
		 return;
		}else if(pw.search(/\s/) != -1){
		 alert("비밀번호는 공백 없이 입력해주세요.");
		 return;
		}else if( num < 0 && eng < 0 ){
		 alert("영문,숫자중 2가지 이상을 혼합하여 입력해주세요.");
		 return;
		}
		
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
		    url:  '/pwSearch2.do',
		    type: 'POST',
		    data: param,
		    success: function(data){
		    	
		    	if(data == "INFO_SUCCESS"){
		    		alert("비밀번호가 변경 되었습니다.");
		    		// $('.dim').fadeOut();
		    		// $('.popup_wrap .popup').fadeOut();
		    		$('.id_find_popup').hide();		    		
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
	
	function enterkey() { 
		if (window.event.keyCode == 13) { 
			goLogin();
		} 
	}

	function pwChange(){
		
		if($('#passwd2').val() == ""){
			alert("현재비밀번호로 입력해주세요!");
			$('#passwd2').focus();
			return;
		}

		var pw = $("#newpasswd3").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
//		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(pw.length < 8 || pw.length > 15){
		 alert("8자리 ~ 15자리 이내로 입력해주세요.");
		 return;
		}else if(pw.search(/\s/) != -1){
		 alert("비밀번호는 공백 없이 입력해주세요.");
		 return;
		}else if( num < 0 && eng < 0 ){
		 alert("영문,숫자중 2가지 이상을 혼합하여 입력해주세요.");
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
		    url:  '/pwSearch3.do',
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
