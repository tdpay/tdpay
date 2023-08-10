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
	<script src="/js/notice02_write.js"></script>	
    
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
            <input type="hidden" name="arrChk" id="arrChk"/>

                <table class="table_layout01 board_layout">
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
                                <div class="check_box">
                                    <input type="checkbox" id="notice_type" name="notice_type" value="Y" ${noticeVO.notice_type eq 'Y'? 'checked':'' }> 
                                    <label for="notice_type">공지글</label>
                                </div>
                            </td>
                        </tr>
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
                            <td><input class="w_all" type="text" id="title" name="title" value="${noticeVO.title }"></td>
                        </tr>
                        <tr class="editor">
                            <th>내용</th>
                            <td><textarea id="content" name="content" cols="202" rows="7">${noticeVO.content }</textarea></td>
                        </tr>
                        <tr class="file_add">
                            <th>첨부파일</th>
                            <td>
                                <div class="file_add_btn">
                                    <input type="text" class="w180" name="file_nm" id="file_nm" value="" placeholder="" readonly>
                                    <input type="file" id="file_add" name="file"> 
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
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="/notice/notice02.do?view_type=L" class="dark_line_btn">이전</a>
                    <c:if test="${view_type eq 'I'}">
                    <a href="javascript:frmMod();" class="dark_line_btn">수정</a>
                    </c:if>	
                    <c:if test="${view_type eq 'N'}">
                    <a href="javascript:frmAdd();" class="dark_full_btn">등록</a>
                    </c:if>	
                    <a href="/notice/notice02.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>
	
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
	


