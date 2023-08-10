<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/settlement_all_view.js"></script>

    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>통합정산조회</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="daoutrx" id="daoutrx" value="<c:out value="${settlementVO.daoutrx}" />">
                <input type="hidden" name="created_id" id="created_id" value="<c:out value="${sessionScope.login_id}" />">
                <input type="hidden" name="cpid" id="cpid" value="<c:out value="${settlementVO.cpid}" />">
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>상점ID</th>
                            <td><c:out value="${settlementVO.userid}" /></td>
                            <th>터미널ID</th>
                            <td><c:out value="${settlementVO.terminalid}" /></td>
                        </tr>
                        <tr>
                            <th>매입구분</th>
                            <td>매입</td>
                            <th>지급일자</th>
                            <td><c:out value="${settlementVO.period}" /></td>
                        </tr>
                        <tr>
                            <th>승인일자</th>
                            <td><c:out value="${settlementVO.authdate}" /></td>
                            <th>은행</th>
                            <td><c:out value="${settlementVO.bank_nm}" /></td>
                        </tr>
                        <tr>
                            <th>주문번호</th>
                            <td><c:out value="${settlementVO.orderno}" /></td>
                            <th>구매자</th>
                            <td><c:out value="${settlementVO.username}" /></td>
                        </tr>
                        <tr>
                            <th>상품명</th>
                            <td><c:out value="${settlementVO.productname}" /></td>
                            <th>거래금액</th>
                            <td><c:out value="${settlementVO.amount}" />원</td>
                        </tr>
                        <tr>
                            <th>수수료율</th>
                            <td><c:out value="${settlementVO.commission}" />%</td>
                            <th>수수료</th>
                            <td><c:out value="${settlementVO.franchisee_commission}" />원</td>
                        </tr>
                        <tr>
                            <th>수수료원가</th>
                            <td><c:out value="${settlementVO.commission2}" />원</td>
                            <th>수수료부가세</th>
                            <td><c:out value="${settlementVO.vat}" />원
                            </td>
                        </tr>
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
                            <th>영업대행</th>
                            <td><c:out value="${settlementVO.business_nm3}" /></td>
                        </tr>        
                        <c:choose>
                            <c:when test="${sessionScope.role_id eq '1001'}">
                                <tr>
                                    <th>영업대행</th>
                                    <td><c:out value="${settlementVO.business_nm3}" /></td>
                                    <th>대리점</th>
                                    <td><c:out value="${settlementVO.business_nm2}" /></td>
                                </tr>  
                                <tr>
                                    <th>상태</th>
                                    <td colspan="3"><c:out value="${settlementVO.state}" /></td>
                                </tr> 
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1002'}">
                                <tr>
                                    <th>대리점</th>
                                    <td><c:out value="${settlementVO.business_nm2}" /></td>
                                    <th>상태</th>
                                    <td><c:out value="${settlementVO.state}" /></td>
                                </tr> 
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1003'}">
                                <tr>
                                    <th>상태</th>
                                    <td colspan="3"><c:out value="${settlementVO.state}" /></td>
                                </tr>  
                            </c:when>
                        </c:choose>	

                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="/settlement/settlement_all.do?view_type=L" class="dark_line_btn">이전</a>
                    <c:if test="${sessionScope.role_id eq '1001'}">
                    <a href="javascript:fnHold();"class="dark_full_btn">지급보류</a>
                    </c:if>
                    <a href="/settlement/settlement_all.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>
    <!-- //container -->

<!-- //wrap -->