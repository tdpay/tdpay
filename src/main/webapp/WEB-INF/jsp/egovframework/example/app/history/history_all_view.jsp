<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="/app/js/history_all_view.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>통합승인내역정보</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
            <form name="frm" id="frm" method="post">
                <input type="hidden" name="DAOUTRX" id="DAOUTRX" value="<c:out value="${historyVo.daoutrx}" />">
                <input type="hidden" name="AMOUNT" id="AMOUNT" value="<c:out value="${fn:replace(historyVo.amount, ',', '')}" />">
                <input type="hidden" name="CREATED_ID" id="CREATED_ID" value="${sessionScope.login_id}">
                <input type="hidden" name="RETURN_URL" id="RETURN_URL" value="/app/history/history_all.do">                
                <input type="hidden" name="CANCELMEMO" id="CANCELMEMO" value="사용자의 인해 일반취소"> 
                <input type="hidden" name="CANCELTYPE" id="CANCELTYPE" value=""> 
                <input type="hidden" name="cp_type" id="cp_type" value="<c:out value="${historyVo.cp_type}" />">                
                
                <input type="hidden" name="username" id="username" value="<c:out value="${historyVo.username}" />">                
                <input type="hidden" name="userphone" id="userphone" value="<c:out value="${historyVo.userphone}" />">    
                <input type="hidden" name="CPID" id="CPID" value="<c:out value="${historyVo.cpid}" />">                  
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                    <c:out value="${historyVo.userid}" />
                                </td>
                            </tr>
                            <tr>
                                <th>요청금액</th>
                                <td>
                                    <c:out value="${historyVo.amount}" />원
                                </td>
                            </tr>
                            <tr>
                                <th>승인일자</th>
                                <td>
                                    <c:out value="${historyVo.authdate}" />
                                </td>
                            </tr>
                            <tr>
                                <th>취소일자</th>
                                <td>
                                    <c:out value="${historyVo.canceldate}" />
                                </td>
                            </tr>
                            <tr>
                                <th>구매자</th>
                                <td>
                                    <c:out value="${historyVo.username}" />
                                </td>
                            </tr>
                            <tr>
                                <th>신용카드금액(원)</th>
                                <td>
                                    <c:out value="${historyVo.amount}" />원
                                </td>
                            </tr>
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <c:out value="${historyVo.commission}" />%
                                </td>
                            </tr>
                            <tr>
                                <th>수수료 제외 금액</th>
                                <td>
                                    <c:out value="${historyVo.commission_total}" />
                                </td>
                            </tr>
                            <tr>
                                <th>카드계열</th>
                                <td>
                                    <c:out value="${historyVo.cardname}" />
                                </td>
                            </tr>
                            <tr>
                                <th>승인번호</th>
                                <td>
                                    <c:out value="${historyVo.authno}" />
                                </td>
                            </tr>
                            <tr>
                                <th>할부개월수</th>
                                <td>
                                    <c:out value="${historyVo.quota eq '00'?'일시불':historyVo.quota}" />
                                </td>
                            </tr>
                            <tr>
                                <th>주문번호</th>
                                <td>
                                    <c:out value="${historyVo.orderno}" />
                                </td>
                            </tr>
                            <tr>
                                <th>터미널ID</th>
                                <td>
                                    <c:out value="${historyVo.terminalid}" />
                                </td>
                            </tr>
                            <tr>
                                <th>단말기번호</th>
                                <td>
                                    <c:out value="${historyVo.imei}" />
                                </td>
                            </tr>
                            <tr>
                                <th>매출전표</th>
                                <td>
                                    <c:out value="${historyVo.tax}" />
                                </td>
                            </tr>
                            <tr>
                                <th>고객이름</th>
                                <td>
                                    <c:out value="${historyVo.username}" />
                                </td>
                            </tr>
                            <tr>
                                <th>고객전화번호</th>
                                <td>
                                    <c:out value="${historyVo.userphone}" />
                                </td>
                            </tr>
						    <c:choose>
							    <c:when test="${sessionScope.role_id eq '1001'}">                            
	                            <tr>
	                                <th>영업대행</th>
	                                <td>
	                                    <c:out value="${historyVo.business_nm3}" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>대리점</th>
	                                <td>
	                                    <c:out value="${historyVo.business_nm2}" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가맹점</th>
	                                <td>
	                                    <c:out value="${historyVo.business_nm}" />
	                                </td>
	                            </tr>
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1002'}">                            
	                            <tr>
	                                <th>대리점</th>
	                                <td>
	                                    <c:out value="${historyVo.business_nm2}" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가맹점</th>
	                                <td>
	                                    <c:out value="${historyVo.business_nm}" />
	                                </td>
	                            </tr>
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1003'}">                            
	                            <tr>
	                                <th>가맹점</th>
	                                <td>
	                                    <c:out value="${historyVo.business_nm}" />
	                                </td>
	                            </tr>
							    </c:when>
						    </c:choose>		
							<c:if test="${sessionScope.role_id eq '1001' and empty historyVo.canceldate}">
	                            <tr>
	                                <th>취소금액</th>
	                                <td>
	                                    <input type="text" type="text" name="AMOUNT2" placeholder="" id="AMOUNT2">
	                                </td>
	                            </tr>										
							</c:if>
							<c:if test="${!empty historyVo.canceldate}">
	                            <tr>
	                                <th>취소금액</th>
	                                <td>
	                                    <c:out value="${historyVo.amountMod}" />
	                                </td>
	                            </tr>		    
							</c:if>
                            <tr>
                                <th>지급일</th>
                                <td>
                                    D+<c:out value="${historyVo.period}" />
                                </td>
                            </tr>								
                        </tbody>
                    </table>
                    <div class="send_btn">
	                    <!-- button class="btn-default" type="button">자동취소</button-->
	                    <c:if test="${(empty historyVo.canceldate && sessionScope.role_id eq '1001' && historyVo.cp_type eq '1') || empty historyVo.canceldate && sessionScope.role_id eq '1001' && historyVo.cp_type eq '2'}">
	                    <button class="btn-line" type="button" onclick="fnCardCancel();" id="totalCancel">전체취소</button>
	                    <button class="btn-line" type="button" onclick="fnCardCancel2();" id="partCancel">부분취소</button>
	                    </c:if>
                        <button class="btn-line" type="button" onclick="fnCardReceipt('<c:out value="${historyVo.canceltype}" />');" >영수증</button>
                        <button class="btn-active" type="button" onclick="location.href='history_all.do'" >목록</button>
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

