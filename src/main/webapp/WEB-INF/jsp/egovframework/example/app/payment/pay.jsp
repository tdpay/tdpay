<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/app/js/payment_client.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>수기결제</p>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
			<form name="frm" id="frm" method="post" action="" target="">
			<input type="hidden" name="NO" id="NO" value="<c:out value="${paymentVo.no}" />">
			<input type="hidden" name="CPID" id="CPID" value="<c:out value="${paymentVo.cpid}" />">
			<input type="hidden" name="USERID" id="USERID" value="<c:out value="${paymentVo.userid}" />">
			<input type="hidden" name="ORDERNO" id="ORDERNO" value="<c:out value="${paymentVo.orderno}" />">
			<input type="hidden" name="PRODUCTTYPE" id="PRODUCTTYPE" value="<c:out value="${paymentVo.producttype}" />">
			<input type="hidden" name="BILLTYPE" id="BILLTYPE" value="<c:out value="${paymentVo.billtype}" />">
			<input type="hidden" name="TAXFREECD" id="TAXFREECD" value="<c:out value="${paymentVo.taxfreecd}" />">
			<input type="hidden" name="AMOUNT" id="AMOUNT" value="<c:out value="${paymentVo.amount}" />">
			<input type="hidden" name="USERPHONE" id="USERPHONE" value="<c:out value="${paymentVo.userphone}" />">
			<input type="hidden" name="USERNAME" id="USERNAME" value="<c:out value="${paymentVo.username}" />">
			<input type="hidden" name="PRODUCTNAME" id="PRODUCTNAME" value="<c:out value="${paymentVo.productname}" />">
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>결제금액</th>
                                <td>
                                  <fmt:formatNumber value="${paymentVo.amount }" pattern="#,###" />
                                </td>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td>
                                   <c:out value="${paymentVo.productname}" />
                                </td>
                            </tr>
                            <tr>
                                <th>고객이름</th>
                                <td>
                                   <c:out value="${paymentVo.username}" />
                                </td>
                            </tr>
                            <tr>
                                <th>카드번호</th>
                                <td>
                                    <input type="text" name="CARDNO" placeholder="카드번호 입력" id="CARDNO" >
                                </td>
                            </tr>
                            <tr>
                                <th>카드유효기간</th>
                                <td>
                                    <input type="text" name="EXPIRATIONDATE" placeholder="YYYYMM" id="EXPIRATIONDATE">
                                </td>
                            </tr>
                            <tr>
                                <th>할부 개월</th>
                                <td>
								<select name="QUOTA" placeholder="" id="QUOTA">
                                          <c:forEach var="i" begin="0" end="${paymentVo.sms_quota}">
										<c:choose>
											<c:when test="${i == 0}">
												<option value="00">일시불</option>
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
                            <c:if test="${paymentVo.billtype eq '13'}">
                            <tr>
                                <th>카드명의자 주민/사업자번호</th>
                                <td>
                                    <input type="text" name="CARDAUTH" placeholder="카드명의자 주민 앞6자리/사업자번호 입력" id="CARDAUTH">
                                </td>
                            </tr>
                            <tr>
                                <th>카드명의자 비밀번호</th>
                                <td>
                                    <input type="password" name="CARDPASSWORD" placeholder="카드명의자 비밀번호 입력" id="CARDPASSWORD">
                                </td>
                            </tr>
                            </c:if>
                            <tr>
                                <th>email</th>
                                <td>
                                    <input type="text" name="EMAIL" placeholder="이메일 입력" id="EMAIL">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn" id="send_btn">
                        <button class="btn-active" onclick="fnSubmit();" type="button">등록</button>
                    </div>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

