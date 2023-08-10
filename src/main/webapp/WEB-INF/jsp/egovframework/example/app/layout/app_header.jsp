<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
    <div class="header_top">
        <div class="inner">
            <h1>
                <a href="/app/main/main.do">
                    <img src="/app/img/main_logo.png" alt="지엠지페이먼트">
                </a>
            </h1>
            <div class="logout_btn">
	            <button onclick="location.href='/app/user/mypage_info.do'" type="button">정보수정</button>
                <button type="button" onclick="location.href='/app/logout.do'">로그아웃</button>
            </div>
        </div>
    </div>
    <div class="header_nav">
        <div class="inner">
            <ul>
            	<c:forEach var="result" items="${sessionScope.MENU}" varStatus="status">
					<c:choose>
						<c:when test="${!empty result.menu_url}">
				            <li><a href="${result.menu_url}">${result.menu_nm}</a></li>
						</c:when>
						<c:otherwise>
		            		<c:forEach var="result2" items="${sessionScope.SUBMENU}" varStatus="status2">
		            			<c:if test="${result.menu_id eq result2.high_menu_id}">
		               		 	<li><a href="${result2.menu_url}">${result.menu_nm}</a></li>
		               		 	</c:if>
		                	</c:forEach>			    
						</c:otherwise>
					</c:choose>		            	
                </c:forEach>
            </ul>
        </div>
    </div>
</header>