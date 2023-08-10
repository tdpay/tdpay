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
<script src="/app/js/notice05_write.js"></script>	
	
<section class="notion_write_basic">
    <div class="header">
        <div class="inner">
            <p>글 등록</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="notion_write_cont">
        <div class="inner">
			<form name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
			<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="store_id" id="store_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="role_id" id="role_id" value="${sessionScope.role_id}" />
			<input type="hidden" name="no" id="no" value=${noticeVO.no } />
			<input type="hidden" name="file_type" id="file_type" value="no5" />
			<input type="hidden" name="arrChk" id="arrChk"/>
                <fieldset>
                    <table>
                        <tbody>
						<c:choose>
						    <c:when test="${sessionScope.role_id eq '1001'}">                        
                            <tr>
                                <th>작성자</th>
                                <td>
                                    ${noticeVO.ceo }(${noticeVO.store_id })
                                </td>
                            </tr>
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
                            <tr>
                                <th>제목</th>
                                <td>
                                    ${noticeVO.title }
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    ${noticeVO.tel }
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    ${noticeVO.email }
                                </td>
                            </tr>                            
                            <tr>
                                <th>내용</th>
                                <td>
                                    <div class="editor">
                                        ${noticeVO.content }
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>답변</th>
                                <td>
                                    <textarea name="reply" id="reply" cols="202" rows="7">${noticeVO.reply }</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                    <div class="delete_input">
                                        <c:set var="comma" value=","/>
                                        <c:forEach var="result" items="${resultList}" varStatus="status">	
                                        <label onclick="location.href='/fileDownload.do?no=${result.file_num }'" for="file_delete">${result.file_nm }</label>
                                        <c:if test="${!status.last}">${comma}</c:if>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
						    </c:when>
						    <c:otherwise>
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
                                <th>전화</th>
                                <td>
                                    <input type="text" id="tel" name="tel" value="${noticeVO.tel }">
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <input type="text" id="email" name="email" value="${noticeVO.email }">
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
						    </c:otherwise>
					    </c:choose>		
                        </tbody>
                    </table>
                    <div class="function_btn">
					    <c:choose>
						    <c:when test="${sessionScope.role_id eq '1001'}">
		                       <button onclick="frmMod();" class="btn-default btn-border-blue" type="button">수정</button>
						    </c:when>
						    <c:otherwise>
                      		  	<c:if test="${view_type eq 'I'}">
			                       <button onclick="frmMod();" class="btn-default btn-border-blue" type="button">수정</button>
	                            </c:if>	
	                        	<c:if test="${view_type eq 'N'}">
			                       <button onclick="frmAdd();" class="btn-active" type="button">등록</button>
	                            </c:if>	
						    </c:otherwise>
					    </c:choose>	 
                        <button onclick="location.href='/app/notice/notice05.do'" class="btn-default" type="button">목록</button>
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

