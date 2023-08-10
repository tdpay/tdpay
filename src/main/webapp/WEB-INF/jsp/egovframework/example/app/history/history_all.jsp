<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="nav">
    <div class="inner">
        <nav>
            <select onchange="window.open(value,'_self');" name="" id="">
            <c:forEach var="result" items="${sessionScope.SUBMENU2}" varStatus="status">
				<c:if test="${result.high_menu_id eq '6000'}">
                	<option <c:out value="${result.menu_id eq '6001'?'selected':''}" /> value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
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
            <h2 class="ttl_left">통합승인내역조회</h2>
            <button onclick="location.href='history_all_search.do'" class="ttl_right" type="button"><span>상세검색</span></button>
        </div>
        <form name="frm2" id="frm2" action="" method="post">
		<input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
		<input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">        
		<input type="hidden" name="no" id="no" value="">
		<input type="hidden" name="daoutrx" id="daoutrx" value="">        
		<input type="hidden" name="cpid" id="cpid" value="">        
        <div class="manage_list_wrap">
            <div class="list_info">
                <span class="list_total">총 <strong> <c:out value="${historyVO.total_approval_cnt}" /></strong>개/결과 금액 합계 :<c:out value="${historyVO.total_approval}" /> 원</span>
                <!-- span class="excel_down">※ 엑셀 다운로드는 PC에서만 가능합니다.</span-->
            </div>
            <c:forEach var="result" items="${resultList}" varStatus="status">	
            <div class="manage_list" >
                <ul onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')">
                    <li class="store_id">
                        <span class="list_left">상점아이디</span>
                        <span class="list_right"><c:out value="${result.userid}" /></span>
                    </li>
                    <li>
                        <span class="list_left">터미널 ID</span>
                        <span class="list_right"><c:out value="${result.terminalid}" /></span>
                    </li>
                    <li>
                        <span class="list_left">단말기번호</span>
                        <span class="list_right"><c:out value="${result.imei}" /></span>
                    </li>
                    <li>
                        <span class="list_left">매입구분</span>
                        <span class="list_right">매입</span>
                    </li>
                    <li>
                        <span class="list_left">지급일</span>
                        <span class="list_right">D+<c:out value="${result.period}" /></span>
                    </li>
                    <li>
                        <span class="list_left">요청금액</span>
                        <span class="list_right"><c:out value="${result.amount}" />원</span>
                    </li>
                    <li>
                        <span class="list_left">승인일자</span>
                        <span class="list_right"><c:out value="${result.authdate}" /></span>
                    </li>
                    <li>
                        <span class="list_left">승인번호</span>
                        <span class="list_right"><c:out value="${result.authno}" /></span>
                    </li>
                    <li>
                        <span class="list_left">거래상태</span>
                        <span class="list_right">
						<c:choose>
							<c:when test="${!empty result.canceldate}">
								<span class="pay_state_cancel">결제취소</span>
							</c:when>
							<c:when test="${!empty result.authdate}">
								<span class="pay_state_finish">결제완료</span>
							</c:when>
						</c:choose>		                        
                        </span>
                    </li>
                    <li class="txt_red">
                        <span class="list_left">고액건</span>
                        <span class="list_right"><c:out value="${fn:replace(result.amount, ',', '') >= 3000000 ? '고액':'일반'}" /></span>
                    </li>
				    <c:choose>
					    <c:when test="${sessionScope.role_id eq '1001'}">
	                    <li>
	                        <span class="list_left">영업대행</span>
	                        <span class="list_right"><c:out value="${result.business_nm3}" /></span>
	                    </li>
	                    <li>
	                        <span class="list_left">대리점</span>
	                        <span class="list_right"><c:out value="${result.business_nm2}" /></span>
	                    </li>
	                    <li>
	                        <span class="list_left">가맹점</span>
	                        <span class="list_right"><c:out value="${result.business_nm}" /></span>
	                    </li>
					    </c:when>
					    <c:when test="${sessionScope.role_id eq '1002'}">
	                    <li>
	                        <span class="list_left">대리점</span>
	                        <span class="list_right"><c:out value="${result.business_nm2}" /></span>
	                    </li>
	                    <li>
	                        <span class="list_left">가맹점</span>
	                        <span class="list_right"><c:out value="${result.business_nm}" /></span>
	                    </li>
					    </c:when>
					    <c:when test="${sessionScope.role_id eq '1003'}">
	                    <li>
	                        <span class="list_left">가맹점</span>
	                        <span class="list_right"><c:out value="${result.business_nm}" /></span>
	                    </li>
					    </c:when>
				    </c:choose>	                    
                </ul>
                <div class="manage_list_btn">
                    <button onclick="location.href='history_all_detail.do'" type="button">정산정보 상세보기</button>
                </div>
            </div>
            </c:forEach>
        </div>
        </form>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

