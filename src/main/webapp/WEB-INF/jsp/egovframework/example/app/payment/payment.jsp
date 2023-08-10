<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/app/js/payment.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>수기결제(페이조아)</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
			<form name="frm" id="frm" method="post" action="/app/payment/cardSugido.do" target="">
			<input type="hidden" name="TAXFREECD" id="TAXFREECD" value="00">
			<input type="hidden" name="PRODUCTTYPE" id="PRODUCTTYPE" value="2">
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                  <input  type="text" name="USERID" placeholder="" id="USERID" value="">
                                  <span class="payment_ess">* sms 전송 내역</span>
                                </td>
                            </tr>
                            <tr>
                                <th>주문번호</th>
                                <td>
                                   <input type="text" name="ORDERNO" placeholder="주문번호 상세 입력" id="ORDERNO" value="">
                                   <span class="payment_ess">* sms 전송 내역</span>
                                </td>
                            </tr>
                            <tr>
                                <th>결제금액</th>
                                <td>
                                   <input type="text" name="AMOUNT" placeholder="숫자만 입력" id="AMOUNT" value="" onKeyUp="chk_Number(this);">
                                   <span class="payment_ess">* sms 전송 내역</span>
                                </td>
                            </tr>
                            <tr>
                                <th>카드번호</th>
                                <td>
                                    <input type="text" name="CARDNO" placeholder="- 제외 입력바랍니다" id="CARDNO" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr>
                                <th>카드유효기간</th>
                                <td>
                                    <input type="text" name="EXPIRATIONDATE" placeholder="YYYYMM" id="EXPIRATIONDATE" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr>
                                <th>할부 개월</th>
                                <td>
									<select  name="QUOTA" id="QUOTA">
                                           <c:forEach var="i" begin="0" end="12">
											<c:choose>
												<c:when test="${i == 0}">
													<option value="00">일시불</option>
												</c:when>
												<c:when test="${i < 10 && i > 1}">
													<option value="0<c:out value="${i}" />">0<c:out value="${i}" /></option>
												</c:when>
												<c:when test="${i >=10}">
													<option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
												</c:when>
											</c:choose>
										</c:forEach>											
                                    </select>	                                
                                </td>
                            </tr>
                            <tr>
                                <th>과금 유형</th>
                                <td>
                                    <div class="radio_box">
                                        <ul>
                                            <li>
                                                <input type="radio" id="BILLTYPE01" name="BILLTYPE" value="13" checked onclick="jsBillType('13');">
                                                <label for="BILLTYPE01">수기일반</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="BILLTYPE02" name="BILLTYPE" value="18" onclick="jsBillType('18');">
                                                <label for="BILLTYPE02">수기비인증</label>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS 할부 개월</th>
                                <td>
                                    <div class="radio_box">
                                        <ul>
                                            <li>
                                                <input type="radio" id="SMS_QUOTA01" name="SMS_QUOTA" value="6" checked>
                                                <label for="SMS_QUOTA01">6개월</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="SMS_QUOTA02" name="SMS_QUOTA" value="12">
                                                <label for="SMS_QUOTA02">12개월</label>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr id="TR_CARDAUTH">
                                <th>카드명의자 주민/사업자번호</th>
                                <td>
                                    <input type="text" name="CARDAUTH" placeholder="카드명의자 주민 앞6자리/사업자번호 입력(000-00-00000)" id="CARDAUTH" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr id="TR_CARDPASSWORD">
                                <th>카드명의자 비밀번호</th>
                                <td>
                                    <input type="password" name="CARDPASSWORD" placeholder="카드명의자 비밀번호 입력" id="CARDPASSWORD" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td>
                                    <input type="text" name="PRODUCTNAME" placeholder="구매 상품명 상세 입력" id="PRODUCTNAME" value="">
                                    <span class="payment_ess">* sms 전송 내역</span>
                                </td>
                            </tr>
                            <tr>
                                <th>고객이름</th>
                                <td>
                                    <input type="text" name="USERNAME" placeholder="" id="USERNAME" value="">
                                    <span class="payment_ess">* sms 전송 내역</span>
                                </td>
                            </tr>
                            <tr>
                                <th>고객전화번호</th>
                                <td>
                                    <input type="text" name="USERPHONE" placeholder="" id="USERPHONE" value="" onKeyUp="chk_Number(this);">
                                    <span class="payment_ess">* sms 전송 내역</span>
                                </td>
                            </tr>
                            <tr>
                                <th>고객이메일</th>
                                <td>
                                    <input  type="text" name="EMAIL" placeholder="" id="EMAIL" value="" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
					<c:if test="${sessionScope.role_id eq '1001'}">
                    <div class="send_btn">
	                    <button class="btn-default" type="button" onclick="fnReset();">입력 초기화</button>
                        <button class="btn-active" type="button" onclick="fnSubmit();">관리자 키인결제</button>
	                    <button class="btn-line" type="button" onclick="fnLinkSubmit();">결제 링크전송(SMS)</button>
                    </div>    
					</c:if>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

<script>
    function goBack() {
        window.history.back();
    }
</script>

