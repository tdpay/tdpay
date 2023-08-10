<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<script src="/js/setup_modify.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>계정 권한 설정</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />					
                <input type="hidden" name="store_id" id="store_id" value="${setupVO.store_id}" />	
                <input type="hidden" name="arr_check_id" id="arr_check_id" value="" />		
                <input type="hidden" name="role_id" id="role_id" value="1001" />											
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>가맹점</th>
                            <td>
                                <table class="table_layout01 multi_table_layout">
                                    <colgroup>
                                        <col style="width:160px;">
                                        <col style="width:auto;">
                                    </colgroup>
                                    <tbody>
                                   		<c:forEach var="result" items="${menu}" varStatus="status">
                                        <tr>
                                            <th>${result.menu_nm}</th>
                                            <c:choose>
	                                       		<c:when test="${!empty result.menu_url}">
	                                       		<td>
	                                                <div class="check_box">    
	                                                    <input type="checkbox" id="check_${result.menu_id}" name="gp_menu_id" value="${result.menu_id}">
	                                                    <label for="check_${result.menu_id}">${result.menu_nm}</label>
	                                                </div>
	                                            </td>
	                                            </c:when>
	                                            <c:otherwise>
	                                            <td>
	                                            	<c:forEach var="result2" items="${subMenu}" varStatus="status">
	                                                <c:if test="${result.menu_id eq result2.high_menu_id}">
	                                                <div class="check_box">
	                                                    <input type="checkbox" id="check_${result2.menu_id}" name="mgp_menu_id" value="${result2.menu_id}">
	                                                    <label for="check_${result2.menu_id}">${result2.menu_nm}</label>
	                                                </div>
	                                                </c:if>
	                                                </c:forEach>
	                                            </td>
	                                            </c:otherwise>     
                                            </c:choose>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>대리점</th>
                            <td>
                            	<input type="hidden" name="bgp_role_id" value="1003" />
                                <table class="table_layout01 multi_table_layout">
                                    <colgroup>
                                        <col style="width:160px;">
                                        <col style="width:auto;">
                                    </colgroup>
                                    <tbody>
                                        <c:forEach var="result" items="${menu}" varStatus="status">
                                        <tr>
                                            <th>${result.menu_nm}</th>
                                            <c:choose>
	                                       		<c:when test="${!empty result.menu_url}">
	                                       		<td>
	                                                <div class="check_box">
	                                                    <input type="checkbox" id="check_${result.menu_id}" name="bgp_menu_id" value="${result.menu_id}">
	                                                    <label for="check_${result.menu_id}">${result.menu_nm}</label>
	                                                </div>
	                                            </td>
	                                            </c:when>
	                                            <c:otherwise>
	                                            <td>
	                                            	<c:forEach var="result2" items="${subMenu}" varStatus="status">
	                                                <c:if test="${result.menu_id eq result2.high_menu_id}">
	                                                <div class="check_box">
	                                                    <input type="checkbox" id="check_${result2.menu_id}" name="mgp_menu_id" value="${result2.menu_id}">
	                                                    <label for="check_${result2.menu_id}">${result2.menu_nm}</label>
	                                                </div>
	                                                </c:if>
	                                                </c:forEach>
	                                            </td>
	                                            </c:otherwise>     
                                            </c:choose>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>영업대리점</th>
                            <td>
                                <input type="hidden" name="mgp_role_id" value="1002" />
                                <table class="table_layout01 multi_table_layout">
                                    <colgroup>
                                        <col style="width:160px;">
                                        <col style="width:auto;">
                                    </colgroup>
                                    <tbody>
                                        <c:forEach var="result" items="${menu}" varStatus="status">
                                        <tr>
                                            <th>${result.menu_nm}</th>
                                            <c:choose>
	                                       		<c:when test="${!empty result.menu_url}">
	                                       		<td>
	                                                <div class="check_box">
	                                                    <input type="checkbox" id="check_${result.menu_id}" name="mgp_menu_id" value="${result.menu_id}">
	                                                    <label for="check_${result.menu_id}">${result.menu_nm}</label>
	                                                </div>
	                                            </td>
	                                            </c:when>
	                                            <c:otherwise>
	                                            <td>
	                                            	<c:forEach var="result2" items="${subMenu}" varStatus="status">
	                                            	<c:if test="${result.menu_id eq result2.high_menu_id}">
	                                                <div class="check_box">
	                                                    <input type="checkbox" id="check_${result2.menu_id}" name="mgp_menu_id" value="${result2.menu_id}">
	                                                    <label for="check_${result2.menu_id}">${result2.menu_nm}</label>
	                                                </div>
	                                                </c:if>
	                                                </c:forEach>
	                                            </td>
	                                            </c:otherwise>     
                                            </c:choose>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:fnSubmit();" class="dark_full_btn">정보수정</a>
                </div>
            </form>
        </div>
    </div>


