<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

<script>
$(function() {
	
/* 	$("#check_all").on('click',function(){
	    //만약 전체 선택 체크박스가 체크된상태일경우
	    if($("#check_all").prop("checked")) {
	        $("input[type=checkbox]").prop("checked",true);
	    } else {
	        $("input[type=checkbox]").prop("checked",false);
	    }
    }); */	
	//$("#myGnb").height($('#wrap').height() - 55);
});
</script>	

    <div class="layout_wrap">
        <form class="table_layout02_wrap" name="frm2" id="frm2" action="" method="post">
            <table class="table_layout02">
                <thead>
                    <tr>
                        <th>사업자번호</th>
                        <th>상점ID</th>
                        <th>변경정산한도</th>
                        <th>이름</th>
                        <th>Email주소</th>
                        <th>연락처</th>
                        <th>변경사유</th>
                        <th>상태</th>
                        <th>답변</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
	                <c:if test="${!empty searchLimitchangeVO}">											
	                    <c:forEach var="result" items="${searchLimitchangeVO}" varStatus="status">	
	                    <tr>
	                        <td class="corp_regist_num" ><c:out value="${result.corp_regist_num}" /></td>
	                        <td class="store_id" ><c:out value="${result.store_id}" /></td>
	                        <td class="limit_amt" ><c:out value="${result.limit_amt}" /></td>
	                        <td class="name" ><c:out value="${result.name}" /></td>
	                        <td class="email" ><c:out value="${result.email}" /></td>
	                        <td class="phone_num" ><c:out value="${result.phone_num}" /></td>
	                        <td class="reason" ><c:out value="${result.reason}" /></td>
	                        <td class="state" ><c:out value="${result.state}" /></td>
	                        <td class="reply" ><c:out value="${result.reply}" /></td>
	                        <td>
	                            <div class="setting_btn_wrap">
	                                <button onclick="location.href='/limitchange/limitchange_reply.do?no=${result.no}'" class="img_set" type="button"></button>&nbsp;
	                                <button onclick="location.href='/limitchange/limitchangeDel.do?no=${result.no}'" class="img_del" type="button"></button>
	                                <!--   <a href="javascript:frmDel();" class="img_del"></a>  -->
	                            </div>
	                        </td>
	                    </tr>
	                    </c:forEach>
	                </c:if>
	                <c:if test="${empty searchLimitchangeVO}">
	                    <tr>
	                        <td colspan="5">조회 내역이 없습니다</td>
	                    </tr>
	                </c:if>
                </tbody>
            </table>
        </form>
    </div>    
    <input type="hidden" name="no" id="no" value="">
    <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
        





