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
                        <th>번호</th>
                        <th>카드사</th>
                        <th>수수료율</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
	                <c:if test="${!empty resultList}">											
	                    <c:forEach var="result" items="${resultList}" varStatus="status">	
	                    <tr>
	                        <td class="no" ><c:out value="${result.rownum}" /></td>
	                        <td class="cardname" ><c:out value="${result.cardname}" /></td>
	                        <td class="rate" style="width:340px;"><input type="text" name="rate" value="${result.rate}" style="width:150px;"/><input type="hidden" name="cardcode" value="${result.cardcode}" style="width:150px;"/></td>
	                        <td>
	                            <div class="setting_btn_wrap">
	                            	<a href="javascript:frmDel(${result.no});" class="img_del"></a>
	                                <!--   <button onclick="javascript:location.href='/setup/setup_card_fee_Del.do?no=${result.no}'; " class="img_del" type="button"></button>  -->
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
        





