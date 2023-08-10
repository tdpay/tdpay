<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="/js/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/js/summernote-0.8.18-dist/summernote-lite.css">	
<style>
.note-editor .note-editable {
    line-height: 150%;  //개행 간격을 알맞게 설정
}	
</style>	
<script src="/app/js/notice01_write.js"></script>

<section class="notion_write_basic">
    <div class="header">
        <div class="inner">
            <p>글 등록</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="notion_write_cont">
        <div class="inner">
			<form  name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
			<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="no" id="no" value=${noticeVO.no } />
			<input type="hidden" name="arrChk" id="arrChk"/>
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>작성자</th>
                                <td>
                         		           관리자
                                </td>
                            </tr>
                            <tr>
                                <th>구분</th>
                                <td>
                                    <div class="check_box">
                                        <input type="checkbox" id="notice_type" name="notice_type" value="Y" ${noticeVO.notice_type eq 'Y'? 'checked':'' }>
                                        <label for="notice_type">공지글</label>
                                    </div>
                                </td>
                            </tr>
                            <c:if test="${view_type eq 'I'}">
                            <tr>
                                <th>등록일</th>
                                <td>
                                    ${noticeVO.created_datetime }
                                </td>
                            </tr>
                            <tr>
                                <th>조회</th>
                                <td>
                                    ${noticeVO.cnt }
                                </td>
                            </tr>
                            </c:if>		
                            <tr>
                                <th>제목</th>
                                <td>
                                    <input type="text" id="title" name="title" value="${noticeVO.title }">
                                </td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <div class="editor">
                                        <textarea id="content" name="content" cols="202" rows="7">${noticeVO.content }</textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                    <div class="search_input">
                                        <input type="file" id="file_add" name="file">
                                        <label for="file_add">
                                            <input type="text" name="file_nm" id="file_nm" placeholder="선택된 파일 없음" readonly>
                                            <span class="file_add"></span>
                                        </label>
                                    </div>
                                    <c:if test="${view_type eq 'I'}">
                                    <div class="delete_input">
                                        <button type="button">파일삭제</button>
                                        <c:forEach var="result" items="${resultList}" varStatus="status">	
	                                        <input id="file_delete_${result.file_num }" type="checkbox" name="chk" key="${result.file_num }">
	                                        <label for="file_delete_${result.file_num }">${result.file_nm }</label>
                                        </c:forEach>                                        
                                    </div>
                                    </c:if>	
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="function_btn">
                   		<c:if test="${view_type eq 'I'}">
                        <button onclick="frmMod();" class="btn-default btn-border-blue" type="button">수정</button>
                        </c:if>	
                        <c:if test="${view_type eq 'N'}">
                        <button onclick="frmAdd();" class="btn-active" type="button">등록</button>
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

