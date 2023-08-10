<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="/js/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/js/summernote-0.8.18-dist/summernote-lite.css">	
<style>
.note-editor .note-editable {
    line-height: 150%;  //개행 간격을 알맞게 설정
}	
</style>		
<script src="/js/notice04_write.js"></script>

    <div class="inner">
        <div class="ttl_box">
            <h2>1:1문의(가맹점)</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="store_id" id="store_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="role_id" id="role_id" value="${sessionScope.role_id}" />
                <input type="hidden" name="no" id="no" value=${noticeVO.no } />
                <input type="hidden" name="file_type" id="file_type" value="no4" />
                <input type="hidden" name="arrChk" id="arrChk"/>

                <table class="table_layout01 board_layout">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <c:choose>
                            <c:when test="${sessionScope.role_id eq '1001'}">
                                <tr>
                                    <th>작성자</th>
                                    <td>
                                        ${noticeVO.ceo }(<c:out value="${noticeVO.store_id}" />)
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
                                <tr>
                                    <th>전화번호</th>
                                    <td>${noticeVO.tel }</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>${noticeVO.email }</td>
                                </tr>												
                                <tr class="editor">
                                    <th>내용</th>
                                    <td>${noticeVO.content }</td>
                                </tr>
                                <tr class="comment">
                                    <th>답변</th>
                                    <td>
                                    <textarea class="w_all" name="reply" id="reply" cols="202" rows="7">${noticeVO.reply }</textarea>
                                    </td>
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
                            </c:when>
                            <c:otherwise>
                                <c:if test="${view_type eq 'I'}">
                                <tr>
                                    <th>등록일</th>
                                    <td>${noticeVO.created_datetime }</td>
                                </tr>
                                <tr>
                                    <th>조회</th>
                                    <td>${noticeVO.cnt }</td>
                                </tr>	
                                </c:if>							
                                <tr>
                                    <th>제목</th>
                                    <td>
                                        <input class="w_all" type="text" id="title" name="title" value="${noticeVO.title }">
                                    </td>													
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>
                                        <input class="w_all" type="text" id="tel" name="tel" value="${noticeVO.tel }">
                                    </td>													
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <input class="w_all" type="text" id="email" name="email" value="${noticeVO.email }">
                                    </td>													
                                </tr>												
                                <tr class="editor">
                                    <th>내용</th>
                                    <td>
                                        <textarea id="content" name="content" cols="202" rows="7">${noticeVO.content }</textarea>
                                    </td>								
                                </tr>
                                <tr class="file_add">
                                    <th>첨부파일</th>
                                    <td>
                                        <div class="file_add_btn">
                                            <input type="text" class="w180" name="file_nm" id="file_nm" value="" placeholder="" readonly>
                                            <input type="file" id="file_add" name="file" >
                                            <label for="file_add">
                                                <span class="search_btn"></span>
                                            </label>
                                        </div>
                                        <c:if test="${view_type eq 'I'}">
                                            <div class="file_delete">
                                                <button type="button">파일삭제</button>
                                                <c:forEach var="result" items="${resultList}" varStatus="status">	
                                                    <input id="delete_check_${result.file_num }" class="check_new" type="checkbox" name="chk" key="${result.file_num }">
                                                    <label for="delete_check_${result.file_num }">${result.file_nm }</label>
                                                </c:forEach>
                                            </div>
                                        </c:if>	
                                    </td>								
                                </tr>
                            </c:otherwise>
                        </c:choose>		
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="/notice/notice04.do?view_type=L" class="dark_line_btn">이전</a>
                    <c:choose>
                        <c:when test="${sessionScope.role_id eq '1001'}">
                            <a href="javascript:frmMod();" class="dark_line_btn">수정</a>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${view_type eq 'I'}">
                                <a href="javascript:frmMod();" class="dark_line_btn">수정</a>
                            </c:if>	
                            <c:if test="${view_type eq 'N'}">
                                <a href="javascript:frmAdd();" class="dark_full_btn">등록</a>
                            </c:if>	
                        </c:otherwise>
                    </c:choose>	 
                    <a href="/notice/notice04.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>
	
    <script>
    function goBack() {
        window.history.back();
    }
    </script>


