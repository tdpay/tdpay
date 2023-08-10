<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="nav">
    <div class="inner">
        <nav>
            <select onchange="window.open(value,'_self');" name="" id="">
            <c:forEach var="result" items="${sessionScope.SUBMENU2}" varStatus="status">
				<c:if test="${result.high_menu_id eq '4000'}">
                	<option <c:out value="${result.menu_id eq '4001'?'selected':''}" /> value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
				</c:if>            
            </c:forEach>            
            </select>
        </nav>
    </div>
</div>

<script src="/app/js/history_all.js"></script>

<section class="manage_basic basic_bg">
    <div class="inner">
        <div class="ttl">
            <h2 class="ttl_left">통합승인내역조회(정산정보)</h2>
        </div>
        <form name="frm2" id="frm2" action="" method="post">
            <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
            <input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">        
            <input type="hidden" name="no" id="no" value="">
            <input type="hidden" name="daoutrx" id="daoutrx" value="">        
            <input type="hidden" name="cpid" id="cpid" value="">        
            <div class="manage_list_wrap">
                <c:forEach var="result" items="${resultList}" varStatus="status">	
                <div class="manage_list" >
                    <ul onclick="location.href='history_all_detail_view.do'">
                        <li class="store_id">
                            <span class="list_left">상점아이디</span>
                            <span class="list_right"><c:out value="${result.userid}" /></span>
                        </li>
                        <li>
                            <span class="list_left">터미널 ID</span>
                            <span class="list_right"><c:out value="${result.terminalid}" /></span>
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
                </c:forEach>
            </div>
        </form>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

