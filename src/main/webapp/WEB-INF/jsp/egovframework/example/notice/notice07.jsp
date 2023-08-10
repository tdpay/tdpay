<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!-- container -->
    <script>
    var view_type_s = '<c:out value="${view_type}" />';
    </script>	
	<script src="/js/notice07.js"></script>
	

    <div class="inner">
        <div class="ttl_box">
            <h2>결제취소요청</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>검색조건</th>
                            <td>
                                <div class="radio_box">
                                    <input type="radio" name="check" value="total" class="input_checkbox" id="total" ${searchNoticeVO.check eq 'total'?'checked':''}> <label for="total">전체</label>
                                </div> 
                                <div class="radio_box"> 
                                    <input type="radio" name="check" value="title" class="input_checkbox" id="title" ${searchNoticeVO.check eq 'title'?'checked':''}> <label for="title">제목</label>
                                </div> 
                                <div class="radio_box"> 
                                    <input type="radio" name="check" value="content" class="input_checkbox" id="content" ${searchNoticeVO.check eq 'content'?'checked':''}> <label for="content">내용</label>
                                </div> 
                                <div class="radio_box"> 
                                    <input type="radio" name="check" value="ceo" class="input_checkbox" id="ceo" ${searchNoticeVO.check eq 'ceo'?'checked':''}> <label for="ceo">작성자</label>
                                </div>
                            </td>								
                        </tr>
                        <tr>
                            <th>검색어</th>
                            <td>
                                <input class="w370" type="text" name="searchKeyword" placeholder="" id="searchKeyword" value="${searchNoticeVO.searchKeyword }" onkeyup="enterkey()">
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:notice07_data();" class="dark_full_btn">검색</a>
                </div>

                <input type="hidden" name="no" id="no" value="">
                <c:if test="${sessionScope.role_id ne '1001'}">
                <input type="hidden" name="role_id" id="role_id" value="<c:out value="${sessionScope.role_id}" />">
                <input type="hidden" name="store_id" id="store_id" value="<c:out value="${sessionScope.login_id}" />">
                </c:if>
                <input type="hidden" name="view_type" id="view_type" value="">
                <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
                <input type="hidden" name="file_type" id="file_type" value="no7"/>
                <input type="hidden" name="file_check" id="file_check" value="F"/>							
            </form>
        </div>
            
        <div class="layout_wrap" id="notice07_data"></div>
    </div>

	

