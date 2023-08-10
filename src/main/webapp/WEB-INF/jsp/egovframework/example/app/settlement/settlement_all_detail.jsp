<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/app/js/settlement_all.js"></script>

<div id="nav">
    <div class="inner">
        <nav>
            <select onchange="window.open(value,'_self');" name="" id="">
            <c:forEach var="result" items="${sessionScope.SUBMENU2}" varStatus="status">
				<c:if test="${result.high_menu_id eq '5000'}">
                	<option <c:out value="${result.menu_id eq '5002'?'selected':''}" /> value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
				</c:if>            
            </c:forEach>
            </select>
        </nav>
    </div>
</div>

<section class="manage_basic basic_bg">
    <div class="inner">
        <div class="ttl">
            <h2 class="ttl_left">통합정산조회(상세)</h2>
        </div>
        <div class="manage_list detail_list">
            <ul>
                <li>
                    <span class="list_left">총결제금액</span>
                    <span class="list_right">458,451,000원</span>
                </li>
                <li>
                    <span class="list_left">승인건</span>
                    <span class="list_right">78건</span>
                </li>
                <li>
                    <span class="list_left">취소금액</span>
                    <span class="list_right">8,451,000원</span>
                </li>
                <li>
                    <span class="list_left">취소건</span>
                    <span class="list_right">70건</span>
                </li>
            </ul>
        </div>
		<form class="table_layout" name="frm2" id="frm2" action="" method="post">
            <div class="manage_list_wrap">
                <div class="manage_list">
                    <ul onclick="location.href='settlement_all_detail_view.do'">
                        <li class="store_id">
                            <span class="list_left">상점아이디</span>
                            <span class="list_right">GP21031201</span>
                        </li>
                        <li>
                            <span class="list_left">터미널 ID</span>
                            <span class="list_right">87000108</span>
                        </li>
                        <li>
                            <span class="list_left">매입구분</span>
                            <span class="list_right">매입</span>
                        </li>
                        <li>
                            <span class="list_left">지급일자</span>
                            <span class="list_right">2021.07.05</span>
                        </li>
                        <li>
                            <span class="list_left">승인일자</span>
                            <span class="list_right">2021.07.10</span>
                        </li>
                        <li>
                            <span class="list_left">거래금액</span>
                            <span class="list_right">55,000원</span>
                        </li>
                    </ul>
                </div>
            </div>
        </form>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

