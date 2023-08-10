<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script language="javascript" src="https://kspay.ksnet.to/store/KSPayWebV1.4/js/kspay_web.js"></script>
	<script src="/js/payment2.js"></script>
	
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>수기결제(케이에스넷)</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post"  target="">
                <!-- 0. 공통 환경설정 -->
                <input type="hidden" name="loginId" 		 id="loginId" 		  value="<c:out value="${sessionScope.login_id}" />">
                <input type="hidden" name="mid" 			 id="mid"   		  value="<c:out value='${CPID}' />">
                <input type="hidden" name="productType" 	 id="productType"  	  value="REAL">
                <input type="hidden" name="taxFreeAmount" 	 id="taxFreeAmount"   value="0">
                <input type="hidden" name="interestType" 	 id="interestType"    value="PG">
                <input type="hidden" name="currencyType" 	 id="currencyType"    value="KRW">
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <!-- 필수값 -->
                            <th>상점ID</th>						   
                            <td>
                                <input class="w500" type="text" name="USERID" placeholder="" id="USERID" value="">
                                <span class="pay_ess">* sms 전송 내역</span>	
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>주문번호</th>						   
                            <td>
                                <input class="w500" type="text" name="orderNumb" placeholder="주문번호 상세 입력" id="orderNumb" value="">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>결제금액</th>						   
                            <td>
                                <input class="w500" type="text" name="totalAmount" placeholder="숫자만 입력" id="totalAmount" value="" onKeyUp="chk_Number(this);">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>							
                        <tr>
                            <!-- 필수값 -->
                            <th>카드번호</th>						   
                            <td>
                                <input class="w500" type="text" name="cardNumb" placeholder="- 제외 입력해주세요." id="cardNumb" value="" onKeyUp="chk_Number(this);">
                            </td>
                        </tr>				
                        <tr>
                            <!-- 필수값 -->
                            <th>카드유효기간</th>						   
                            <td>
                                <input class="w500" type="text" name="expiryDate" placeholder="YYMM" id="expiryDate" value="" onKeyUp="chk_Number(this);">
                            </td>
                        </tr>								
                        <tr>
                            <!-- 필수값 -->
                            <th>할부 개월</th>						   
                            <td>
                                <select class="w180" name="installMonth" placeholder="" id="installMonth">
                                    <c:forEach var="i" begin="0" end="12">
                                        <c:choose>
                                            <c:when test="${i == 0}">
                                                <option value="0">일시불</option>
                                            </c:when>
                                            <c:when test="${i < 10 && i > 1}">
                                                <option value="0<c:out value="${i}" />">0<c:out value="${i}" /></option>
                                            </c:when>
                                            <c:when test="${i >= 10}">
                                                <option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>											
                                </select>									 
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>SMS 할부 개월</th>						   
                            <td>
                                <div class="radio_box">
                                    <input type="radio" name="sms_quota" value="6" class="input_checkbox" id="sms_quota01" checked>
                                    <label for="sms_quota01">6개월</label>
                                </div>
                                <div class="radio_box">
                                    <input type="radio" name="sms_quota" value="12" class="input_checkbox" id="sms_quota02" >
                                    <label for="sms_quota02">12개월</label>
                                </div>
                            </td>
                        </tr>														
                        <tr>
                            <!-- 필수값 -->
                            <th>상품명</th>						   
                            <td>
                                <input class="w500" type="text" name="productName" placeholder="구매 상품명 상세 입력" id="productName" value="">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>고객이름</th>						   
                            <td>
                                <input class="w500" type="text" name="userName" placeholder="" id="userName" value="">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>고객전화번호</th>						   
                            <td>
                                <input class="w500" type="text" name="sndMobile" placeholder="" id="sndMobile" value="" onKeyUp="chk_Number(this);">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <th>고객이메일</th>						   
                            <td>
                                <input class="w500" type="text" name="userEmail" placeholder="" id="userEmail" value="" >
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <button type="reset" onclick="fnReset();" class="gray_line_btn">입력 초기화</button>
                    <a href="javascript:fnSubmit();" class="dark_full_btn">관리자 키인결제</a>
                    <a href="javascript:fnLinkSubmit();" class="dark_line_btn">결제 링크전송(SMS)</a>
                </div>
            </form>
        </div>
    </div>
	<!-- //container -->

