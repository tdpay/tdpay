<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/app/js/settlement_all_view.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>상세보기</p>
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
                                    GP21062901
                                </td>
                            </tr>
                            <tr>
                                <th>CPID</th>
                                <td>
                                    8700108
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
                                    2021.07.10
                                </td>
                            </tr>
                            <tr>
                                <th>승인일자</th>
                                <td>
                                    2021.07.10
                                </td>
                            </tr>
                            <tr>
                                <th>은행</th>
                                <td>
                                    우리은행
                                </td>
                            </tr>
                            <tr>
                                <th>주문번호</th>
                                <td>
                                    546815230
                                </td>
                            </tr>
                            <tr>
                                <th>구매자</th>
                                <td>
                                 	김구매
                                </td>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td>
                                 	
                                </td>
                            </tr>
                            <tr>
                                <th>거래금액</th>
                                <td>
                                 	100원
                                </td>
                            </tr>
                            <tr>
                                <th>수수료율</th>
                                <td>
                                 	0.00%
                                </td>
                            </tr>
                            <tr>
                                <th>수수료</th>
                                <td>
                                 	0원
                                </td>
                            </tr>
                            <tr>
                                <th>수수료원가</th>
                                <td>
                                 	0원
                                </td>
                            </tr>
                            <tr>
                                <th>수수료부가세</th>
                                <td>
                                 	0원
                                </td>
                            </tr>
                            <tr>
                                <th>지급액</th>
                                <td>
                                 	-2원
                                </td>
                            </tr>
                            <tr>
                                <th>영업대행</th>
                                <td>
                                 	테스트
                                </td>
                            </tr>
                            <tr>
                                <th>대리점</th>
                                <td>
                                 	테스트
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-default" type="button" onclick="location.href='settlement_store_detail.do'">목록</button>
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

