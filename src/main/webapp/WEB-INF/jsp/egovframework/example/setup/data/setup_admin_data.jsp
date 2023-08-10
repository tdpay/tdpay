<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

    <div class="list_ttl">
        <span class="total"><strong>총 <c:out value="${cnt}" />개</strong></span>
        <div class="view_box">
            <button onclick="frmAdd();" class="point_btn">등록</button>
        </div>
    </div>
    <form name="frm2" id="frm2" action="" method="post">
        <table class="table_layout03">
            <caption>운영자 계정관리</caption>
            <thead>
                <tr>
                    <th class="num">No</th>
                    <th class="state">현황</th>
                    <th class="admin_id">아이디</th>
                    <th class="name">이름</th>
                    <th class="tel">연락처</th>
                    <th class="date">가입일시</th>
                    <th class="management">관리</th>
                </tr>                      
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${!empty resultList}">									
                    <c:forEach var="result" items="${resultList}" varStatus="status">	
                    <tr >
                        <td onclick="frmInfo('<c:out value="${result.store_id}" />')" class="num"><c:out value="${result.rownum}" /></td>
                        <td onclick="frmInfo('<c:out value="${result.store_id}" />')" class="state"><c:out value="${result.state}" /></td>
                        <td onclick="frmInfo('<c:out value="${result.store_id}" />')" class="admin_id"><c:out value="${result.store_id}" /></td>
                        <td onclick="frmInfo('<c:out value="${result.store_id}" />')" class="name"><c:out value="${result.ceo}" /></td>
                        <td onclick="frmInfo('<c:out value="${result.store_id}" />')" class="tel"><c:out value="${result.phone_num}" /></td>
                        <td onclick="frmInfo('<c:out value="${result.store_id}" />')" class="date"><c:out value="${result.created_datetime}" /></td>
                        <td class="management">
                            <button onclick="frmDel('<c:out value="${result.store_id}" />')" class="img_del" type="button"></button>		
                        </td>
                    </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="7">조회 내역이 없습니다</td>
                    </tr>
                </c:otherwise>
            </c:choose>																
            </tbody>
        </table>
        <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
        <input type="hidden" name="store_id" id="store_id" value=""/>
    </form>

    <!-- pager -->
    <div class="paging">
        <ul class="pager_btn">
        
            <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"  />
            
        </ul>
    </div>
    <!-- //pager -->

