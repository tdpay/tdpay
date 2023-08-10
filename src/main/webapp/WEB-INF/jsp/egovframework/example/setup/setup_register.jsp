<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="/js/setup_register.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>운영자 계정 추가</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />					
                <input type="hidden" name="arr_check_id" id="arr_check_id" value="" />					
                <input type="hidden" name="role_id" id="role_id" value="1001" />					
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>아이디</th>						   
                            <td>
                                <input class="w180" type="text" name="store_id" id="store_id" >
                                <!-- button type="button" class="overlap_check">중복확인</button-->
                            </td>
                            <th>비밀번호</th>
                            <td>
                                <input class="w180" type="password" name="passwd" id="passwd" >
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input class="w180" type="text" name="ceo" id="ceo">
                            </td>
                            <th>휴대폰</th>
                            <td>
                                <input class="w180" type="text" name="phone_num" id="phone_num" >
                            </td>
                        </tr>
                        <tr>
                            <th>현황</th>
                            <td colspan="3">
                                <select class="w180" name="state" placeholder="" id="state">
                                    <option value="Y">이용중</option>
                                    <option value="N">정지중</option>
                                </select>
                            </td>								
                        </tr>
                        <tr>
                            <th>권한</th>
                            <td colspan="3">
                                <table class="table_layout01 multi_table_layout">
                                    <colgroup>
                                        <col style="width:160px;">
                                        <col style="width:auto;">
                                    </colgroup>
                                    <tbody>       
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                    <c:choose>
                                        <c:when test="${!empty result.menu_url}">
                                            <tr>
                                                <th><c:out value="${result.menu_nm}" /></th>
                                                <td>
                                                    <div class="check_box">
                                                        <input type="checkbox" id="M_<c:out value="${result.menu_id}" />" name="menu_id" key="<c:out value="${result.menu_id}" />">
                                                        <label for="M_<c:out value="${result.menu_id}" />"><c:out value="${result.menu_nm}" /></label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <th><c:out value="${result.menu_nm}" /></th>
                                                <td>
                                                    <c:forEach var="result2" items="${resultList2}" varStatus="status">
                                                    <c:if test="${result.menu_id eq result2.high_menu_id}">
                                                        <div class="check_box">
                                                            <input type="checkbox" id="M_<c:out value="${result2.menu_id}" />" name="menu_id" key="<c:out value="${result2.menu_id}" />">
                                                            <label for="M_<c:out value="${result2.menu_id}" />"><c:out value="${result2.menu_nm}" /></label>
                                                        </div>
                                                    </c:if>
                                                    </c:forEach> 
                                                </td>
                                            </tr>			    
                                        </c:otherwise>
                                    </c:choose>		
                                    </c:forEach>  
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:fnSubmit();" class="dark_full_btn">등록</a>
                    <a href="/setup/setup_admin.do" class="gray_line_btn" id="go_back">목록</a>
                </div>
            </form>
        </div>
    </div>
	
