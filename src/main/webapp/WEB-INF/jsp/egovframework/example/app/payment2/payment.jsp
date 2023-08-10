<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/app/js/payment2.js"></script>
<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>수기결제(케이에스넷)</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
			<form name="frm" id="frm" method="post" action="/app/payment2/cardSugido.do" target="">
			<input type="hidden" name="loginId" 		 id="loginId" 		  value="<c:out value="${sessionScope.login_id}" />">
			<input type="hidden" name="mid" 			 id="mid"   		  value="<c:out value='${CPID}' />">
			<input type="hidden" name="productType" 	 id="productType"  	  value="REAL">
			<input type="hidden" name="taxFreeAmount" 	 id="taxFreeAmount"   value="0">
			<input type="hidden" name="interestType" 	 id="interestType"    value="PG">
			<input type="hidden" name="currencyType" 	 id="currencyType"    value="KRW">
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                  <input  type="text" name="USERID" placeholder="" id="USERID" value="">
                                </td>
                            </tr>
                            <tr>
                                <th>주문번호</th>
                                <td>
                                   <input type="text" name="orderNumb" placeholder="주문번호 상세 입력" id="orderNumb" value="">
                                </td>
                            </tr>
                            <tr>
                                <th>결제금액</th>
                                <td>
                                   <input type="text" name="totalAmount" placeholder="숫자만 입력" id="totalAmount" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr>
                                <th>카드번호</th>
                                <td>
                                   <input type="text" name="cardNumb" placeholder="숫자만 입력" id="cardNumb" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr>
                                <th>카드유효기간</th>
                                <td>
                                   <input type="text" name="expiryDate" placeholder="YYMM" id="expiryDate" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr>
                                <th>할부 개월</th>
                                <td>
									<select  name="installMonth" id="installMonth">
                                           <c:forEach var="i" begin="0" end="12">
											<c:choose>
												<c:when test="${i == 0}">
													<option value="00" >일시불</option>
												</c:when>
												<c:when test="${i < 10 && i > 1}">
													<option value="0<c:out value="${i}" />" >0<c:out value="${i}" /></option>
												</c:when>
												<c:when test="${i >= 10}">
													<option value="<c:out value="${i}" />" ><c:out value="${i}" /></option>
												</c:when>
											</c:choose>
										</c:forEach>											
                                    </select>	                                
                                </td>
                            </tr>
                            <tr>
                                <th>SMS 할부 개월</th>
                                <td>
                                    <div class="radio_box">
                                        <ul>
                                            <li>
                                                <input type="radio" id="sms_quota01" name="sms_quota" value="6" checked>
                                                <label for="sms_quota01">6개월</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="sms_quota02" name="sms_quota" value="12" >
                                                <label for="sms_quota02">12개월</label>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>                            
                            <tr>
                                <th>상품명</th>
                                <td>
                                    <input type="text" name="productName" placeholder="구매 상품명 상세 입력" id="productName" value="">
                                </td>
                            </tr>
                            <tr>
                                <th>고객이름</th>
                                <td>
                                    <input type="text" name="userName" placeholder="" id="userName" value="">
                                </td>
                            </tr>
                            <tr>
                                <th>고객전화번호</th>
                                <td>
                                    <input type="text" name="sndMobile" placeholder="" id="sndMobile" value="" onKeyUp="chk_Number(this);">
                                </td>
                            </tr>
                            <tr>
                                <th>고객이메일</th>
                                <td>
                                    <input  type="text" name="userEmail" placeholder="" id="userEmail" value="" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn">
	                    <button class="btn-default" type="button" onclick="fnReset();">입력 초기화</button>
                        <button class="btn-active" type="button" onclick="fnSubmit();">관리자 키인결제</button>
	                    <button class="btn-line" type="button" onclick="fnLinkSubmit();">결제 링크전송(SMS)</button>
                    </div>    
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

