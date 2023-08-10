<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="/js/settlement_his_view.js"></script>

    <div class="inner">
        <div class="ttl_box">
            <h2>지급보류/해제/별도가감</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="AMOUNT" id="AMOUNT" value="<c:out value="${fn:replace(settlementVO.amount, ',', '')}" />">
                <input type="hidden" name="daoutrx" id="daoutrx" value="<c:out value="${settlementVO.daoutrx}" />">
                <input type="hidden" name="DAOUTRX" id="DAOUTRX" value="<c:out value="${settlementVO.daoutrx}" />">
                <input type="hidden" name="CREATED_ID" id="CREATED_ID" value="<c:out value="${sessionScope.login_id}" />">
                <input type="hidden" name="cpid" id="cpid" value="<c:out value="${settlementVO.cpid}" />">
                <input type="hidden" name="CANCELTYPE" id="CANCELTYPE" value="">       
                <input type="hidden" name="cp_type" id="cp_type" value="<c:out value="${settlementVO.cp_type}" />">                
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
                            <td><c:out value="${settlementVO.period}" />일</td>
                        </tr>
                        <tr>
                            <th>승인일자</th>
                            <td><c:out value="${settlementVO.authdate}" /></td>
                            <th>취소일자</th>
                            <td><c:out value="${settlementVO.canceldate}" /></td>
                        </tr>
                        <tr>
                            <th>은행</th>
                            <td><c:out value="${settlementVO.bank_nm}" /></td>
                            <th>주문번호</th>
                            <td><c:out value="${settlementVO.orderno}" /></td>
                        </tr>
                        <tr>
                            <th>구매자</th>
                            <td><c:out value="${settlementVO.username}" /></td>
                            <th>상품명</th>
                            <td><c:out value="${settlementVO.productname}" /></td>
                        </tr>
                        <tr>
                            <th>거래금액</th>
                            <td><c:out value="${settlementVO.amount}" />원</td>
                            <th>수수료</th>
                            <td><c:out value="${settlementVO.commission}" />%</td>
                        </tr>
                        <tr>
                            <th>부가세</th>
                            <td><c:out value="${settlementVO.vat}" />원</td>
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
                            <th>영업대행</th>
                            <td><c:out value="${settlementVO.business_nm3}" /></td>
                            <th>대리점</th>
                            <td><c:out value="${settlementVO.business_nm2}" /></td>
                        </tr>
                        <c:choose>
                            <c:when test="${empty settlementVO.canceldate}">
                                <tr>
                                    <th>상태</th>
                                    <td><c:out value="${settlementVO.state}" /></td>
                                    <th>취소금액</th>
                                    <td><input class="width_s" type="text" name="AMOUNT2" id="AMOUNT2" value="">원</td>	                                
                                </tr>      
                            </c:when>
                            <c:when test="${!empty settlementVO.canceldate}">
                                <tr>
                                    <th>상태</th>
                                    <td><c:out value="${settlementVO.state}" /></td>
                                    <th>취소금액</th>
                                    <td>${settlementVO.amountMod }</td>
                                </tr>      
                            </c:when>
                        </c:choose>                           
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="/settlement/settlement_his.do?view_type=L" class="dark_line_btn">이전</a>
                    <a href="javascript:fnHold();"class="dark_full_btn" >지급보류해제</a>
                    <c:if test="${empty settlementVO.canceldate && sessionScope.role_id eq '1001' && settlementVO.cp_type ne '3'}">
                    <a href="javascript:fnCardCancel();"class="dark_full_btn" id="totalCancel">전체취소</a>
                    <a href="javascript:fnCardCancel2();"class="dark_full_btn" id="partCancel">부분취소</a>
                    </c:if>   
                    <a href="javascript:fnCardReceipt('<c:out value="${settlementVO.canceltype}" />');"class="dark_full_btn" >영수증</a>
                    <a href="/settlement/settlement_his.do" class="gray_line_btn" >목록</a>
                </div>
            </form>
        </div>
    </div>
    <!-- //container -->

<!-- //wrap -->