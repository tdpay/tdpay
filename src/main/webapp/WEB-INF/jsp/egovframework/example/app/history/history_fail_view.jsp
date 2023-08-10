<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>승인실패정보</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
            <form action="#">
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
                                    <c:out value="${historyVo.amount}" />
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
                                    <c:out value="${historyVo.amount}" />
                                </td>
                            </tr>
                            <tr>
                                <th>수수료</th>
                                <td>
                                    0.55%
                                </td>
                            </tr>
                            <tr>
                                <th>수수료 제외 금액</th>
                                <td>
                                    58,000원
                                </td>
                            </tr>
                            <tr>
                                <th>카드계열</th>
                                <td>
                                    하나카드
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
                                    4568710
                                </td>
                            </tr>
                            <tr>
                                <th>단말기번호</th>
                                <td>
                                    456845210
                                </td>
                            </tr>
                            <tr>
                                <th>매출전표</th>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>구매자전화번호</th>
                                <td>
                                    <c:out value="${historyVo.userphone}" />
                                </td>
                            </tr>
                            <tr>
                                <th>구매자이메일</th>
                                <td>
                                    <c:out value="${historyVo.email}" />
                                </td>
                            </tr>
                            <tr>
                                <th>실패메세지</th>
                                <td>
                                    <c:out value="${historyVo.errormessage}" />
                                </td>
                            </tr>
                            <tr>
                                <th>영업대행</th>
                                <td>
                                    영업대행명
                                </td>
                            </tr>
                            <tr>
                                <th>대리점</th>
                                <td>
                                    대리점명
                                </td>
                            </tr>
                            <tr>
                                <th>가맹점</th>
                                <td>
                                    가맹점명
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active width_all" onclick="location.href='history_fail.do'" type="button">목록</button>
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

