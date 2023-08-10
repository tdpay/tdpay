<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/app/js/settlement_all_view.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>통합정산조회</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="daoutrx" id="daoutrx" value="<c:out value="${settlementVO.daoutrx}" />">
                <input type="hidden" name="created_id" id="created_id" value="<c:out value="${sessionScope.login_id}" />">
                <input type="hidden" name="cpid" id="cpid" value="<c:out value="${settlementVO.cpid}" />">
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                    <c:out value="${settlementVO.userid}" />
                                </td>
                            </tr>
                            <tr>
                                <th>터미널ID</th>
                                <td>
                                    <c:out value="${settlementVO.terminalid}" />
                                </td>
                            </tr>
                            <tr>
                                <th>매입구분</th>
                                <td>
                                    매입
                                </td>
                            </tr>
                            <tr>
                                <th>지급일자</th>
                                <td>
                                    <c:out value="${settlementVO.period}" />
                                </td>
                            </tr>
                            <tr>
                                <th>승인일자</th>
                                <td>
                                    <c:out value="${settlementVO.authdate}" />
                                </td>
                            </tr>
                            <tr>
                                <th>은행</th>
                                <td>
                                    <c:out value="${settlementVO.bank_nm}" />
                                </td>
                            </tr>
                            <tr>
                                <th>주문번호</th>
                                <td>
                                    <c:out value="${settlementVO.orderno}" />
                                </td>
                            </tr>
                            <tr>
                                <th>구매자</th>
                                <td>
                                 	<c:out value="${settlementVO.username}" />
                                </td>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td>
                                 	<c:out value="${settlementVO.productname}" />
                                </td>
                            </tr>
                            <tr>
                                <th>거래금액</th>
                                <td>
                                 	<c:out value="${settlementVO.amount}" />
                                </td>
                            </tr>
                            <tr>
                                <th>부가세</th>
                                <td>
                                 	<c:out value="${settlementVO.vat}" />
                                </td>
                            </tr>
                            <tr>
                                <th>가맹점 수수료</th>
                                <td>
                                 	<c:out value="${settlementVO.commission}" />%
                                </td>
                            </tr>
                            
						    <c:choose>
							    <c:when test="${sessionScope.role_id eq '1001'}">                            
	                            <tr>
	                                <th>영업대행</th>
	                                <td>
	                                    <c:out value="${settlementVO.business_nm3}" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>대리점</th>
	                                <td>
	                                    <c:out value="${settlementVO.business_nm2}" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가맹점</th>
	                                <td>
	                                    <c:out value="${settlementVO.business_nm}" />
	                                </td>
	                            </tr>
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1002'}">                            
	                            <tr>
	                                <th>대리점</th>
	                                <td>
	                                    <c:out value="${settlementVO.business_nm2}" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가맹점</th>
	                                <td>
	                                    <c:out value="${settlementVO.business_nm}" />
	                                </td>
	                            </tr>
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1003'}">                            
	                            <tr>
	                                <th>가맹점</th>
	                                <td>
	                                    <c:out value="${settlementVO.business_nm}" />
	                                </td>
	                            </tr>
							    </c:when>
						    </c:choose>		
	
                            <tr>
                                <th>지급액</th>
                                <td>
								<c:choose>
									<c:when test="${sessionScope.role_id eq '1004'}">
										<c:out value="${settlementVO.commission_total}" />원
									</c:when>
									<c:when test="${sessionScope.role_id eq '1003'}">
										<c:out value="${settlementVO.commission_total2}" />원
									</c:when>
									<c:when test="${sessionScope.role_id eq '1002'}">
										<c:out value="${settlementVO.commission_total3}" />원
									</c:when>
									<c:when test="${sessionScope.role_id eq '1001'}">
										<c:out value="${settlementVO.commission_total4}" />원
									</c:when>
								</c:choose>                                
                                </td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td>
                                 	<c:out value="${settlementVO.state}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active" type="button" onclick="fnHold();">지급보류</button>
                        <button class="btn-default" type="button" onclick="location.href='settlement_all.do'">목록</button>
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

