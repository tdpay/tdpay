<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		

    <table class="table_layout02">
        <caption>로그인정보 관리</caption>
        <thead>
            <tr>
                <th class="num">인증방법</th>
                <th class="state">휴대폰</th>
                <th class="admin_id">이메일</th>
                <th class="management">관리</th>
            </tr>                      
        </thead>
        <tbody>
            <c:if test="${!empty resultList}">
            <c:forEach var="result" items="${resultList}" varStatus="status">	
            <tr>
                <td><c:out value="${result.auth_type eq 'phone_num' ?'휴대폰':'이메일'}" /></td>
                <td><c:out value="${result.phone_num}" /></td>
                <td><c:out value="${result.email}" /></td>
                <td class="management">
                    <button onclick="frmDel('${result.auth_type}','${result.no}');" class="img_del" type="button"></button>
                </td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${empty resultList}">
                <tr>
                    <td colspan="4">등록 내역이 없습니다</td>
                </tr>
            </c:if>								
        </tbody>
    </table>

	  



