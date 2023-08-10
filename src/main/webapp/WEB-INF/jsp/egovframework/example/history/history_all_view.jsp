<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="/js/history_all_view.js"></script>

    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>통합승인내역조회</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="DAOUTRX" id="DAOUTRX" value="<c:out value="${historyVo.daoutrx}" />">
                <input type="hidden" name="AMOUNT" id="AMOUNT" value="<c:out value="${fn:replace(historyVo.amount, ',', '')}" />">
                <input type="hidden" name="CREATED_ID" id="CREATED_ID" value="${sessionScope.login_id}">
                <input type="hidden" name="CANCELMEMO" id="CANCELMEMO" value="사용자의 인해 일반취소">                
                <input type="hidden" name="CANCELTYPE" id="CANCELTYPE" value="">                
                <input type="hidden" name="cp_type" id="cp_type" value="<c:out value="${historyVo.cp_type}" />">                
                
                <input type="hidden" name="username" id="username" value="<c:out value="${historyVo.username}" />">                
                <input type="hidden" name="userphone" id="userphone" value="<c:out value="${historyVo.userphone}" />">                
                <input type="hidden" name="CPID" id="CPID" value="<c:out value="${historyVo.cpid}" />">                
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
                            <td>${historyVo.userid }</td>
                            <th>요청금액</th>
                            <td>${historyVo.amount }원</td>
                        </tr>
                        <tr>
                            <th>원천사수수료율</th>
                            <td>2.75%</td>
                            <th>원천사수수료</th>
                            <td>27,500원</td>
                        </tr>
                        <tr>
                            <th>승인일자</th>
                            <td>${historyVo.authdate }</td>
                            <th>취소일자</th>
                            <td>${historyVo.canceldate }</td>
                        </tr>
                        <tr>
                            <th>구매자</th>
                            <td>${historyVo.username }</td>
                            <th>신용카드금액(원)</th>
                            <td>${historyVo.amount }원</td>
                        </tr>
                        <tr>
                            <th>수수료</th>
                            <td>${historyVo.commission }%</td>
                            <th>수수료 제외 금액</th>
                            <td>${historyVo.commission_total }원</td>
                        </tr>
                        <tr>
                            <th>카드계열</th>
                            <td>${historyVo.cardname }</td>
                            <th>승인번호</th>
                            <td>${historyVo.authno }</td>
                        </tr>
                        <tr>
                            <th>할부개월수</th>
                            <td>${historyVo.quota eq '00'?'일시불':(historyVo.quota eq '0'?'일시불':historyVo.quota) }</td>
                            <th>주문번호</th>
                            <td>${historyVo.orderno }</td>
                        </tr>
                        <tr>
                            <th>터미널ID</th>
                            <td>${historyVo.terminalid }</td>
                            <th>매출전표</th>
                            <td>${historyVo.tax }</td>
                        </tr>
                        <tr>
                            <th>고객이름</th>
                            <td>${historyVo.username }</td>
                            <th>고객전화번호</th>
                            <td>${historyVo.userphone }</td>
                        </tr>            
                        <c:choose>
                            <c:when test="${sessionScope.role_id eq '1001'}">
                            <tr>
                                <th>영업대행</th>
                                <td>${historyVo.business_nm3 }</td>
                                <th>대리점</th>
                                <td>${historyVo.business_nm2 }</td>
                            </tr>                            
                                <c:choose>
                                    <c:when test="${empty historyVo.canceldate}">
                                        <tr>
                                            <th>가맹점</th>
                                            <td>${historyVo.business_nm }</td>
                                            <th>취소금액</th>
                                            <td><input class="w180" type="text" name="AMOUNT2" id="AMOUNT2" value="">원</td>	                                
                                        </tr>      
                                    </c:when>
                                    <c:when test="${!empty historyVo.canceldate}">
                                        <tr>
                                            <th>가맹점</th>
                                            <td>${historyVo.business_nm }</td>
                                            <th>취소금액</th>
                                            <td>${historyVo.amountMod }</td>
                                        </tr>      
                                    </c:when>
                                </c:choose>
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1002'}">
                                <c:choose>
                                    <c:when test="${empty historyVo.canceldate}">
                                        <tr>
                                            <th>대리점</th>
                                            <td>${historyVo.business_nm2 }</td>
                                            <th>가맹점</th>
                                            <td>${historyVo.business_nm }</td>
                                        </tr>    				                            
                                    </c:when>
                                    <c:when test="${!empty historyVo.canceldate}">
                                        <tr>
                                            <th>대리점</th>
                                            <td>${historyVo.business_nm2 }</td>
                                            <th>가맹점</th>
                                            <td>${historyVo.business_nm }</td>
                                        </tr>   
                                        <tr>
                                            <th>취소금액</th>
                                            <td colspan="3">${historyVo.amountMod }</td>
                                        </tr> 				                            
                                    </c:when>
                                </c:choose>							    
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1003'}">
                                <c:choose>
                                <c:when test="${empty historyVo.canceldate}">
                                    <tr>
                                        <th>가맹점</th>
                                        <td colspan="7">${historyVo.business_nm }</td>
                                    </tr>       
                                </c:when>
                                <c:when test="${!empty historyVo.canceldate}">
                                    <tr>
                                        <th>가맹점</th>
                                        <td>${historyVo.business_nm }</td>
                                        <th>취소금액</th>
                                        <td>${historyVo.amountMod }</td>
                                    </tr>      
                                </c:when>	
                                </c:choose>
                            </c:when>
                        </c:choose>	
                        <tr>
                            <th>중복결제</th>
                            <td>중복</td>
                            <th>지급일</th>
                            <td>D+${historyVo.period }</td>
                        </tr> 							    	                        
                        <!-- tr>
                            <th>거래상태</th>
                            <td>결제완료</td>
                            <th>수취인주소</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>전체취소</th>
                            <td></td>
                            <th>부분취소</th>
                            <td></td>
                        </tr-->
                    </tbody>
                </table>

                <div class="btn_box">
                    <!-- a href="#!"class="a_btn a_btn_default" >자동취소</a-->
                    <a href="/history/history_all.do?view_type=L" class="dark_line_btn">이전</a>
                    <c:if test="${(empty historyVo.canceldate && sessionScope.role_id eq '1001' && historyVo.cp_type eq '1') || empty historyVo.canceldate && sessionScope.role_id eq '1001' && historyVo.cp_type eq '2'}">
                    <a href="javascript:fnCardCancel();"class="dark_full_btn" id="totalCancel">전체취소</a>
                    <a href="javascript:fnCardCancel2();"class="dark_full_btn" id="partCancel">부분취소</a>
                    </c:if>
                    <a href="javascript:fnCardReceipt('<c:out value="${historyVo.canceltype}" />');"class="dark_full_btn" >영수증</a>
                    <a href="/history/history_all.do"class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>
    <!-- //container -->

<!-- //wrap -->