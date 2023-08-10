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
                        <th>PG사</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
	                <c:if test="${!empty resultList}">											
	                    <c:forEach var="result" items="${resultList}" varStatus="status">	
	                    <tr>
	                        <td class="cardname" ><c:out value="${result.pgname}" /></td>
	                        <td>
	                            <div class="setting_btn_wrap">
	                            	<!-- a href="javascript:frmMod('${result.pgname}');" class="img_set"></a> &nbsp; -->
	                            	
	                            	<!--   <button onclick="javascript:location.href='/limitchange/limitchange_reply.do?no=${result.no}'" class="img_set" type="button"></button>&nbsp; -->
	                                <button onclick="location.href='/setup/setup_pg_list.do?pgname=${result.pgname}'; "    class="img_set" type="button"></button>&nbsp;
	                                <a href="javascript:frmDel('${result.pgname}');" class="img_del"></a>
	                            </div>
	                        </td>
	                    </tr>
	                    </c:forEach>
	                </c:if>
	                <c:if test="${empty resultList}">
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
        





