<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/setup_login.js"></script>	
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>로그인정보 관리</h2>
            <button class="link_reg setup_pop_btn"> 등록</button>
        </div>
        <div class="layout_wrap">
            <form class="table_layout02_wrap" name="frm" id="frm" action="" method="post">
                <input type="hidden" name="store_id" id="store_id" value="<c:out value="${sessionScope.login_id}" />">
                <input type="hidden" name="auth_type" id="auth_type">
                <input type="hidden" name="no" id="no">
                
                <div id="setup_login_data"></div>
            
            </form>
        </div>
    </div>
    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <div class="pop_wrap setup_pop pop680 pop_off">
        <div class="pop_cont">
            <div class="pop_top">
                <strong class="pop_ttl">로그인정보 추가</strong>
                <a class="btn_closed" href="#!"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
            </div>
            <div class="pop_body">
                <div class="pop_inner">
                    <form name="frm2" id="frm2">
                        <input type="hidden" name="store_id" id="store_id" value="<c:out value="${sessionScope.login_id}" />">
                        <input type="hidden" name="created_id" id="created_id" value="<c:out value="${sessionScope.login_id}" />">
                        <input type="hidden" name="check_no" id="check_no" value="">
                        <input type="hidden" name="authResult" id="authResult" value="0">
                        <table class="table_layout01">
                            <colgroup>
                                <col style="width:140px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>인증방법</th>
                                    <td>
                                        <div class="radio_box">
                                            <input type="radio" name="type" id="certifyTel" value="1" checked> 
                                            <label for="certifyTel">휴대폰</label>
                                        </div>
                                        <div class="radio_box">
                                            <input type="radio" name="type" id="certifyEmail" value="2"> 
                                            <label for="certifyEmail">이메일</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="cert_how cert_tel">
                                    <th>휴대폰</th>
                                    <td>
                                        <input class="w110" type="text" name="phone_num" id="phone_num">
                                        <button type="button" class="list_btn" onclick="AuthAction();">인증번호 전송</button>
                                    </td>
                                </tr>
                                <tr class="cert_how cert_email">
                                    <th>이메일</th>
                                    <td>
                                        <input class="w110" type="text" placeholder="" name="email1" id="email1">
                                        <span class="">@</span>
                                        <input class="w110" type="text" placeholder="" name="email2" id="email2">
                                        <select name="email3" id="email3" onchange="emailSel(this.value);">
                                            <option value="">직접입력</option>
                                        </select>
                                        <button type="button" class="list_btn" onclick="AuthAction2();">인증번호 전송</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>인증번호</th>
                                    <td>
                                        <input class="w110" type="text" placeholder="인증번호" name="setup_auth_no" id="setup_auth_no">
                                        <button type="button" class="list_btn" onclick="AuthActionCehck();">확인</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn_box">
                            <a href="javascript:AuthActionAdd();" class="dark_full_btn">등록</a>
                        </div>					
                    </form>
                </div>		
            </div>
        </div>
        <div class="dim"></div>
    </div>
    <!-- //로그인 정보 변경  -->

    <script>
        $(function(){

            // 팝업 오픈
            $('.setup_pop_btn').on('click',function(){
                $('.setup_pop').show();
            });
            
            // 로그인정보 인증방법선택
            if($('#certifyTel').is(':checked')){
                $('.cert_email').hide();
                $('.cert_tel').show();
            } else if($('#certifyEmail').is(':checked')){
                $('.cert_tel').hide();
                $('.cert_email').show();
            }

            $('.radio_box input[name="type"]').on('click',function(){
                if($('#certifyTel').is(':checked')){
                    $('.cert_email').hide();
                    $('.cert_tel').show();
                } else if($('#certifyEmail').is(':checked')){
                    $('.cert_tel').hide();
                    $('.cert_email').show();
                }
                
            });
        });
    </script>
	  



