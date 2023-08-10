<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <script src="/js/notice07_view.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>결제취소요청</h2>
        </div>
        <div class="col">
            <form name="frm" id="frm" method="post" action="" target="" >
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="no" id="no" value=${noticeVO.no } />
                <input type="hidden" name="view_type" id="view_type" value="I">
                <input type="hidden" name="file_type" id="file_type" value="no7"/>
                <input type="hidden" name="file_check" id="file_check" value="F"/>	
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:170px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td>
                                <div class="view_box_inner">
                                    <p>${noticeVO.ceo }(<c:out value="${noticeVO.store_id}" />)</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>등록일</th>
                            <td>
                                <div class="view_box_inner">
                                    <p>${noticeVO.created_datetime }</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>조회</th>
                            <td>
                                <div class="view_box_inner">
                                    <p>${noticeVO.cnt }</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <div class="view_box_inner">
                                    <p>${noticeVO.title }</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>
                                <div class="view_box_inner">
                                    <p>${noticeVO.tel }</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <div class="view_box_inner">
                                    <p>${noticeVO.email }</p>
                                </div>
                            </td>
                        </tr>		
                        <tr>
                            <th>결제날짜</th>
                            <td>
                                <p>${noticeVO.authdate }</p>
                            </td>													
                        </tr>											
                        <tr>
                            <th>금액</th>
                            <td>
                                <p>${noticeVO.amount }원</p>
                            </td>													
                        </tr>											
                        <tr>
                            <th class="order_num">
                                주문번호(영수증번호)
                            </th>
                            <td>
                                <p>${noticeVO.orderno }</p>
                            </td>													
                        </tr>											
                        <tr>
                            <th>
                                구매자명</th>
                            <td>
                                <p>${noticeVO.username }</p>
                            </td>													
                        </tr>											
                        <tr>
                            <th>
                                상점아이디</th>
                            <td>
                                <p>${noticeVO.userid }</p>
                            </td>													
                        </tr>							
                        <tr class="editor">
                            <th>내용</th>
                            <td>
                                ${noticeVO.content }
                            </td>
                        </tr>
                        <tr class="comment">
                            <th>답변</th>
                            <td>
                                ${noticeVO.reply }
                            </td>
                        </tr>
                        <tr class="file_add">
                            <th>
                                첨부파일</th>
                            <td>
                                <c:set var="comma" value=","/>
                                <c:forEach var="result" items="${resultList}" varStatus="status">	
                                    <a href="/fileDownload.do?no=${result.file_num }"><label for="delete_check_${result.file_nm }">${result.file_nm }</a>
                                    <c:if test="${!status.last}">${comma}</c:if>
                                </c:forEach>
                            </td>								
                        </tr>
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="/notice/notice07.do?view_type=L" class="dark_line_btn">이전</a>
                    <a href="javascript:frmMod();" class="dark_line_btn">수정</a> 
                    <a href="/notice/notice07.do" class="gray_line_btn">목록</a>
                </div>
            </form>
            </div>
    </div>
	
	
