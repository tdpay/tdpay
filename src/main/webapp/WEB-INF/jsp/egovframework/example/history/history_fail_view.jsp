<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/history_fail_view.js"></script>

    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>승인실패조회(단말기 제외)</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
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
                            <td>${historyVo.userid}</td>
                            <th>요청금액</th>
                            <td>${historyVo.amount}원</td>
                        </tr>
                        <tr>
                            <th>승인일자</th>
                            <td>${historyVo.authdate}</td>
                            <th>취소일자</th>
                            <td>${historyVo.canceldate}</td>
                        </tr>
                        <tr>
                            <th>구매자</th>
                            <td>${historyVo.username}</td>
                            <th>신용카드금액(원)</th>
                            <td>${historyVo.amount}원</td>
                        </tr>
                        <tr>
                            <th>승인번호</th>
                            <td>${historyVo.authno}</td>
                            <th>할부개월수</th>
                            <td>${historyVo.quota eq '00'?'일시불':(historyVo.quota eq '0'?'일시불':historyVo.quota)}</td>
                        </tr>
                        <tr>
                            <th>주문번호</th>
                            <td>${historyVo.orderno}</td>
                            <th>구매자전화번호</th>
                            <td>${historyVo.userphone}</td>
                        </tr>
                        <tr>
                            <th>구매자이메일</th>
                            <td>${historyVo.email}</td>
                            <th>실패메세지</th>
                            <td>${historyVo.errormessage}</td>
                        </tr>
                        
                        <c:choose>
                            <c:when test="${sessionScope.role_id eq '1001'}">
                            <tr>
                                <th>영업대행</th>
                                <td>${historyVo.business_nm3 }</td>
                                <th>대리점</th>
                                <td>${historyVo.business_nm2 }</td>
                            </tr>                            
                            <tr>
                                <th>가맹점</th>
                                <td colspan="3">${historyVo.business_nm }</td>
                            </tr>      
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1002'}">
                            <tr>
                                <th>대리점</th>
                                <td>${historyVo.business_nm2 }</td>
                                <th>가맹점</th>
                                <td>${historyVo.business_nm }</td>
                            </tr>                            
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1003'}">
                            <tr>
                                <th>가맹점</th>
                                <td colspan="3">${historyVo.business_nm }</td>
                            </tr>    
                            </c:when>
                        </c:choose>		
                        
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="/history/history_fail.do?view_type=L" class="dark_line_btn">이전</a>
                    <a href="/history/history_fail.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>
    <!-- //container -->

    <!-- //wrap -->