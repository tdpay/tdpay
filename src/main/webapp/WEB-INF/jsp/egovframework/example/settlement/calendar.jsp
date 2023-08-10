<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<script src="/js/calender2.js"></script>
    
    <!-- container -->
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
	<c:set var="sysMm"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
    <div class="inner">
        <div class="layout_wrap">
            <div class="ttl_box">
                <h2>정산승인달력</h2>
            </div>
            <form name="" id="" method="post" action="" target="">
                <input type="hidden" name="role_id" id="role_id" value="<c:out value='${sessionScope.role_id}' />">
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <c:choose>
                            <c:when test="${sessionScope.role_id ne '1004'}">
                                <tr>
                                    <th>상점ID/상점명</th>
                                <td>
                                    <select class="w110" name="search_id" placeholder="" id="search_id">
                                    	<option value="business_nm" ${searchSettlementVO.search_id eq 'business_nm' ?'selected':''}>상점명</option>
                                        <option value="store_id" ${searchSettlementVO.search_id eq 'store_id' ?'selected':''}>상점ID</option>
                                    </select>
                                    <input class="w180" type="text" name="search_nm" placeholder="" id="search_nm" value="${searchSettlementVO.search_nm}"> 
                                </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="store_id" id="store_id" value="<c:out value='${sessionScope.login_id}' />">
                            </c:otherwise>
                        </c:choose>							
                        <tr>
                            <th>지급월</th>
                            <td>
                                <select class="w110" name="yyyy" placeholder="" id="yyyy">
                                    <c:forEach var="i" begin="2021" end="${sysYear}">
                                        <option value="<c:out value="${i}" />" <c:out value="${i eq sysYear ?'selected':''}" />><c:out value="${i}" /></option>
                                    </c:forEach>											
                                </select>
                                <select class="w180" name="mm" placeholder="" id="mm">
                                    <c:forEach var="i" begin="0" end="12">
                                        <c:choose>
                                            <c:when test="${i < 10 && i > 0}">
                                                <option value="0<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />>0<c:out value="${i}" /></option>
                                            </c:when>
                                            <c:when test="${i >= 10}">
                                                <option value="<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />><c:out value="${i}" /></option>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>											
                                </select>										
                            </td>								
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:calendar_data('1');" class="dark_full_btn">내역조회</a>
                </div>
            </form>
        </div>

            <div class="layout_wrap calender_wrap" id="calendar_data">

        </div>
    </div>
    <!-- //container -->


	  
<!-- //wrap -->




