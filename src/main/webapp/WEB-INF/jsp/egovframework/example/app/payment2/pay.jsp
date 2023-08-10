<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/app/js/payment_client2.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>수기결제(케이에스넷)</p>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
			<form name="frm" id="frm" method="post" action="" target="">
			<input type="hidden" name="no" id="no" value="<c:out value="${payment2Vo.no}" />">
			<input type="hidden" name="mid" id="mid" value="<c:out value="${payment2Vo.cpid}" />">
			<input type="hidden" name="productType" 	 id="productType"  	  value="REAL">
			<input type="hidden" name="taxFreeAmount" 	 id="taxFreeAmount"   value="0">
			<input type="hidden" name="interestType" 	 id="interestType"    value="PG">
			<input type="hidden" name="currencyType" 	 id="currencyType"    value="KRW">
			<input type="hidden" name="USERID" id="USERID" value="<c:out value="${payment2Vo.userid}" />">
			<input type="hidden" name="orderNumb" id="orderNumb" value="<c:out value="${payment2Vo.orderno}" />">
			<input type="hidden" name="totalAmount" id="totalAmount" value="<c:out value="${payment2Vo.amount}" />">
			<input type="hidden" name="sndMobile" id="sndMobile" value="<c:out value="${payment2Vo.userphone}" />">
			<input type="hidden" name="userName" id="userName" value="<c:out value="${payment2Vo.username}" />">
			<input type="hidden" name="productName" id="productName" value="<c:out value="${payment2Vo.productname}" />">
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>결제금액</th>
                                <td>
                                  <fmt:formatNumber value="${payment2Vo.amount }" pattern="#,###" />
                                </td>
                            </tr>
                            <tr>
                                <th>카드번호</th>
                                <td>
                                    <input type="text" name="cardNumb" placeholder="카드번호 입력" id="cardNumb" onKeyUp="chk_Number(this);" value="">
                                </td>
                            </tr>
                            <tr>
                                <th>카드유효기간</th>
                                <td>
                                    <input type="text" name="expiryDate" placeholder="YYMM" id="expiryDate" onKeyUp="chk_Number(this);" value="">
                                </td>
                            </tr>
                            <tr>
                                <th>할부 개월</th>
                                <td>
								<select name="installMonth" placeholder="" id="installMonth">
                                          <c:forEach var="i" begin="0" end="${payment2Vo.sms_quota}">
										<c:choose>
											<c:when test="${i == 0}">
												<option value="0" >일시불</option>
											</c:when>
											<c:when test="${i < 10 && i > 1}">
												<option value="0<c:out value="${i}" />">0<c:out value="${i}" /></option>
											</c:when>
											<c:when test="${i > 10}">
												<option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
											</c:when>
										</c:choose>
									</c:forEach>											
								</select>	                                
                                </td>
                            </tr>                                                      
                            <tr>
                                <th>상품명</th>
                                <td>
                                   <c:out value="${payment2Vo.productname}" />
                                </td>
                            </tr>
                            <tr>
                                <th>고객이름</th>
                                <td>
                                   <c:out value="${payment2Vo.username}" />
                                </td>
                            </tr>
                            <tr>
                                <th>email</th>
                                <td>
                                    <input  type="text" name="userEmail" placeholder="" id="userEmail" value="" >
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <c:if test="${payment2Vo.resultcode ne '0000' && !empty payment2Vo.no}">
                    <div class="send_btn" id="send_btn">
                        <button class="btn-active" onclick="fnSubmit();" type="button">등록</button>
                    </div>
                    </c:if>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

