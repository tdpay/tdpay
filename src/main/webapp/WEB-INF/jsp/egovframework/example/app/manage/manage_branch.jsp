<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/app/js/manage_branch.js"></script>

<section class="manage_basic basic_bg">
    <div class="inner">
        <div class="ttl">
            <h2 class="ttl_left">대리점관리</h2>
            <button onclick="location.href='manage_branch_search.do'" class="ttl_right" type="button"><span>상세검색</span></button>
        </div>
		<form  name="frm2" id="frm2" action="" method="post">
		<input type="hidden" name="store_id" id="store_id" value="" />
		<input type="hidden" name="role_id" id="role_id" value="1003" />
		<input type="hidden" name="arr_check_id" id="arr_check_id" value="" />
        <div class="manage_list_wrap">
            <div class="list_info">
                <span class="list_total">총 <strong><c:out value="${cnt}" /></strong>개</span>
                <span class="excel_down">※ 엑셀 다운로드는 PC에서만 가능합니다.</span>
            </div>
			<c:forEach var="result" items="${resultList}" varStatus="status">	
            <div class="manage_list">
                <ul onclick="frmView('<c:out value="${result.store_id}" />')">
                    <li class="store_id">
                        <span class="list_left">상점아이디</span>
                        <span class="list_right"><c:out value="${result.store_id}" /></span>
                    </li>
                    <li>
                        <span class="list_left">회사명</span>
                        <span class="list_right"><c:out value="${result.business_nm}" /></span>
                    </li>
                    <li>
                        <span class="list_left">회사번호</span>
                        <span class="list_right"><c:out value="${result.tel}" /></span>
                    </li>
                    <li>
                        <span class="list_left">터미널 ID</span>
                        <span class="list_right"><c:out value="${result.terminal_id}" /></span>
                    </li>
                    <li>
                        <span class="list_left">매입구분</span>
                        <span class="list_right">매입</span>
                    </li>
                    <li>
                        <span class="list_left">담당자</span>
                        <span class="list_right"><c:out value="${result.person_nm1}" /></span>
                    </li>
                    <li>
                        <span class="list_left">이메일</span>
                        <span class="list_right"><c:out value="${result.person_email1}" /></span>
                    </li>
                    <li>
                        <span class="list_left">상태</span>
                        <span class="list_right"><c:out value="${result.state eq 'Y'?'사용중':'미사용'}" /></span>
                    </li>
                </ul>
                <div class="manage_list_btn">
                    <button onclick="frmInfo('<c:out value="${result.store_id}" />')" class="more" type="button"><span>수정</span></button>
                    <button class="delete" onclick="frmDel('<c:out value="${result.store_id}" />')" type="button"><span>삭제</span></button>
                </div>
            </div>
            </c:forEach>
            
        </div>
        </form>
        <c:if test="${sessionScope.role_id eq '1001'}">
        <div class="register_btn">
            <button onclick="location.href='manage_branch_register.do'" type="button">대리점등록</button>
        </div>
        </c:if>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

