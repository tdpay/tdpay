<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <script src="/js/notice02_view.js"></script>	
    
	<!-- container -->	
    <div class="inner">
        <div class="ttl_box">
            <h2>자료실</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="no" id="no" value=${noticeVO.no } />
                <input type="hidden" name="view_type" id="view_type" value="I">
                <input type="hidden" name="file_type" id="file_type" value="no2"/>
                <input type="hidden" name="file_check" id="file_check" value="F"/>			
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td>관리자</td>
                        </tr>
                        <tr>
                            <th>구분</th>
                            <td>
                                <label for="notice_type">${noticeVO.notice_type eq 'Y'? '공지':'' } </label>
                            </td>
                        </tr>
                        <tr>
                            <th>등록일</th>
                            <td>${noticeVO.created_datetime }</td>
                        </tr>
                        <tr>
                            <th>조회</th>
                            <td>${noticeVO.cnt }</td>
                        </tr>	
                        <tr>
                            <th>제목</th>
                            <td>${noticeVO.title }</td>
                        </tr>
                        <tr class="editor">
                            <th>내용</th>
                            <td>${noticeVO.content }</td>
                        </tr>
                        <tr class="file_add">
                            <th>첨부파일</th>
                            <td>
                            <c:set var="comma" value=","/>
                            <c:forEach var="result" items="${resultList}" varStatus="status">	
                                <a href="/fileDownload.do?no=${result.file_num }"><label for="delete_check_${result.file_nm }">${result.file_nm }</label></a>
                                <c:if test="${!status.last}">${comma}</c:if>
                            </c:forEach>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="/notice/notice02.do?view_type=L" class="dark_line_btn">이전</a>
                    <c:if test="${sessionScope.role_id eq '1001'}">
                    <a href="javascript:frmMod();" class="dark_line_btn">수정</a>
                    </c:if>
                    <a href="/notice/notice02.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>
	
	
	


