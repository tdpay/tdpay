<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

<script>
    $(function() {
        $("#myGnb").height($('#wrap').height() - 55);
    });
</script>

    <div class="list_ttl">
        <span class="total"><strong>총<c:out value="${cnt}" />개</strong></span>
        <c:if test="${sessionScope.role_id eq '1003'}">
            <div class="view_box">
                <button onclick="frmAdd();"	class="point_btn">글 등록</button>
            </div>
        </c:if>
    </div>
    <form name="frm2" id="frm2" action="" method="post">
        <table class="table_layout03">
            <caption>1:1문의(대리점)</caption>
            <colgroup>
                <col style="width:50px;">
                <col style="width:auto;">
                <col style="width:190px;">
                <col style="width:130px;">
                <col style="width:160px;">
                <col style="width:100px;">
                <col style="width:80px;">
                <col style="width:100px;">
            </colgroup>
            <thead>
                <tr>
                    <th class="num">No</th>
                    <th class="title">제목</th>
                    <th class="date">작성자</th>
                    <th class="tel">전화번호</th>
                    <th class="email">이메일</th>
                    <th class="date">등록일자</th>
                    <th class="view">조회</th>
                    <th class="management">관리</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${!empty resultList}">						
                <c:forEach var="result" items="${resultList}" varStatus="status">	
                <tr>
                    <td class="num" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.rownum}" /></td>
                    <td class="title" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.title}" /></td>
                    <td class="writer" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.ceo}" />(<c:out value="${result.store_id}" />)</td>
                    <td class="tel" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.tel}" /></td>
                    <td class="email" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.email}" /></td>		
                    <td class="date" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.created_datetime}" /></td>
                    <td class="view" onclick="frmView('<c:out value="${result.no}" />')"><c:out value="${result.cnt}" /></td>
                    <td class="management">
                        <div class="setting_btn_wrap">
                            <button onclick="frmInfo('<c:out value="${result.no}" />')" class="img_set" type="button"></button>
                            <button onclick="frmDel('<c:out value="${result.no}" />')" class="img_del" type="button"></button>
                        </div>
                    </td>							
                </tr>
                </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8">조회 내역이 없습니다</td>
                    </tr>
                </c:otherwise>
            </c:choose>								
            </tbody>
        </table>
        <input type="hidden" name="no" id="no" value="">
        <input type="hidden" name="role_id" id="role_id" value="1003">
        <input type="hidden" name="view_type" id="view_type" value="">
        <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
        <input type="hidden" name="file_type" id="file_type" value="no5"/>
        <input type="hidden" name="file_check" id="file_check" value="F"/>					
    </form>

    <!-- pager -->
    <div class="paging">
        <ul class="pager_btn">
            <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"  />
        </ul>
    </div>
    <!-- //pager -->


