<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/app/js/notice01_view.js"></script>	
<section class="notion_view_basic">
    <div class="header">
        <div class="inner">
            <p>공지사항</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="notion_view_cont">
        <div class="inner">
			<form name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
			<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="no" id="no" value=${noticeVO.no } />
			<input type="hidden" name="view_type" id="view_type" value="I">
			<input type="hidden" name="file_type" id="file_type" value="no1"/>
			<input type="hidden" name="file_check" id="file_check" value="F"/>	
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>작성자</th>
                                <td>
                                    <div class="view_box">
                                        <p>관리자</p>
                                    </div>
                                </td>
                            </tr>
                            <c:if test="${noticeVO.notice_type eq 'Y'}">
                            <tr>
                                <th>구분</th>
                                <td>
                                    <div class="view_box">
                                                                                       공지
                                    </div>
                                </td>
                            </tr>
                            </c:if>
                            <tr>
                                <th>등록일</th>
                                <td>
                                    <div class="view_box">
                                        <p>${noticeVO.created_datetime }</p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>조회</th>
                                <td>
                                    <div class="view_box">
                                        <p>${noticeVO.cnt }</p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td>
                                    <div class="view_box">
                                        <p>
                                            ${noticeVO.title }
                                        </p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <div class="view_box">
                                        ${noticeVO.content }
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                    <div class="view_box attached">
                                    	<c:set var="comma" value=","/>
                                    	<c:forEach var="result" items="${resultList}" varStatus="status">	
                                        <p> <a href="/fileDownload.do?no=${result.file_num }">${result.file_nm }</a></p>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="view_btn">
                    	<c:if test="${sessionScope.role_id eq '1001'}">
                        <button onclick="frmMod();" class="btn-active" type="button">수정</button>
                        </c:if>
                        <button onclick="location.href='/app/notice/notice01.do'" class="btn-default" type="button">목록</button>
                    </div>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

<script>
    function goBack() {
        window.history.back();
    }
</script>

