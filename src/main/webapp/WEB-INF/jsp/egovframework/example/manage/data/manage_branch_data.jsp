<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<script>

$(function() {
	$("#check_all").click(function(){
	    //만약 전체 선택 체크박스가 체크된상태일경우
	    if($("#check_all").prop("checked")) {
	        $("input[type=checkbox]").prop("checked",true);
	    } else {
	        $("input[type=checkbox]").prop("checked",false);
	    }
    });
    $('td.num input').on('change',function(){
        var checkCount = $('td.num input:checked').length;
        var checkTotal = $('td.num input').length;
        if (checkCount >= 0) {
            $('#check_all').prop('checked',false);
        } 
        if (checkCount == checkTotal) {
            $('#check_all').prop('checked',true);
        }
    });

    // 테이블 정렬 js
    $('.contents_wrap .table_layout th button').on('click',function(){
        if($(this).hasClass('up')){
            $(this).removeClass('up');
            $(this).addClass('down');
        } else if ($(this).hasClass('down')){
            $(this).removeClass('down');
            $(this).addClass('up');
        } else {
            $('.contents_wrap .table_layout th button').removeClass('up down');
            $(this).addClass('up');
        }
    });
	
//	$("#pageUnit").val("${pageUnit}").prop("selected", true);
	$("#myGnb").height($('#wrap').height() - 55);
	
	$("#dataCnt").text('총 <c:out value="${cnt}" />개');
});

</script>	


    <form class="table_layout02_wrap" name="frm2" id="frm2" action="" method="post">
        <input type="hidden" name="role_id" id="role_id" value="1003" />
        <input type="hidden" name="arr_check_id" id="arr_check_id" value="" />
        <input type="hidden" name="store_id" id="store_id" value="">
        <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>	
        <table class="table_layout02">
            <caption>영업대행/대리점관리</caption>
            <thead>
                <tr>
                    <th class="num">
                        <div class="check_box">
                            <input type="checkbox" id="check_all">
                            <label for="check_all">No</label>
                        </div>
                    </th>
                    <th class="status"><button type="button" id="btn_state" onclick="frmOrder('state');"
                        <c:if test="${searchManageVO.order_id eq 'state' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'state' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >상태</button></th>
                    <th class="management"><button type="button">관리</button></th>
                    <th class="id"><button type="button" id="btn_store_id" onclick="frmOrder('store_id');"
                        <c:if test="${searchManageVO.order_id eq 'store_id' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'store_id' and searchManageVO.order_no eq '2'}">class="down"</c:if>
                    >상점아이디</button></th>
                    <th class="title"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
                        <c:if test="${searchManageVO.order_id eq 'business_nm' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'business_nm' and searchManageVO.order_no eq '2'}">class="down"</c:if>
                    >회사명</button></th>
                    <th class="date"><button type="button" id="btn_created_datetime" onclick="frmOrder('created_datetime');"
                        <c:if test="${searchManageVO.order_id eq 'created_datetime' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'created_datetime' and searchManageVO.order_no eq '2'}">class="down"</c:if>
                    >가입일자</button></th>
                    <th class="code01"><button type="button" id="btn_corp_regist_num" onclick="frmOrder('corp_regist_num');"
                        <c:if test="${searchManageVO.order_id eq 'corp_regist_num' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'corp_regist_num' and searchManageVO.order_no eq '2'}">class="down"</c:if>
                    >사업자번호</button></th>
                    <!-- <th class="terminal_id"><button type="button" id="btn_terminal_id" onclick="frmOrder('terminal_id');"
                        <c:if test="${searchManageVO.order_id eq 'terminal_id' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'terminal_id' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >터미널ID</button></th> -->
                    <th><button type="button">통합한도설정</button></th>
                    <th><button type="button">사용한도</button></th>
                    <th><button type="button">남은한도</button></th>
                    <th><button type="button">보증금(보증보험)</button></th>
                    <th><button type="button">신용카드K 수수료</button></th>
                    <th><button type="button">신용카드 수수료</button></th>
                    <th><button type="button">단말기 수수료</button></th>
                    <!-- <th><button type="button">수수료</button></th>
                    <th><button type="button">영업수수료</button></th> -->
                    <th class="buy"><button type="button">매입구분</button></th>
                    <th class="code02"><button type="button" id="btn_tel" onclick="frmOrder('tel');"
                        <c:if test="${searchManageVO.order_id eq 'tel' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'tel' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >회사번호</button></th>
                    <th class="manager"><button type="button" id="btn_person_nm1" onclick="frmOrder('person_nm1');"
                        <c:if test="${searchManageVO.order_id eq 'person_nm1' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'person_nm1' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >담당자</button></th>
                    <th class="email"><button type="button" id="btn_person_email1" onclick="frmOrder('person_email1');"
                        <c:if test="${searchManageVO.order_id eq 'person_email1' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'person_email1' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >이메일</button></th>
                    <th class="mob"><button type="button" id="btn_person_phone1" onclick="frmOrder('person_phone1');"
                        <c:if test="${searchManageVO.order_id eq 'person_phone1' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'person_phone1' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >휴대폰</button></th>
                    <th class="branch02"><button type="button" id="btn_business_nm3" onclick="frmOrder('business_nm3');"
                        <c:if test="${searchManageVO.order_id eq 'business_nm3' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'business_nm3' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >영업대행</button></th>
                    <!-- th><button type="button">직접정산</button></th-->
                    <th class="pay_state"><button type="button" id="btn_tax" onclick="frmOrder('tax');"
                        <c:if test="${searchManageVO.order_id eq 'tax' and searchManageVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchManageVO.order_id eq 'tax' and searchManageVO.order_no eq '2'}">class="down"</c:if>                                    
                    >지급상태</button></th>
                </tr>                      
            </thead>
            <tbody class="scrollbar">
            <c:choose>
                <c:when test="${!empty resultList}">								
                    <c:forEach var="result" items="${resultList}" varStatus="status">	
                    <tr>
                        <td class="num">
                            <div class="check_box">
                                <input type="checkbox" id="check_id_${status.count}" name="check_id" key="<c:out value="${result.store_id}" />">
                                <label for="check_id_${status.count}"><c:out value="${result.rownum}" /></label>
                            </div>
                        </td>
                        <c:choose>
                       		<c:when test="${result.state eq 'Y'}">
                       		<td class="status">사용</td>
                        	</c:when>
                        	<c:otherwise>
                        	<td class="status" class="red_txt">미사용</td>
                        	</c:otherwise>
                        </c:choose>
                        <td class="management">
                            <div class="setting_btn_wrap">
                                <button onclick="frmInfo('<c:out value="${result.store_id}" />')"class="img_set" type="button"></button>
                                <button onclick="frmDel('<c:out value="${result.store_id}" />')" class="img_del" type="button"></button>									
                            </div>
                        </td>
                        <td class="id point_link" onclick="frmView('<c:out value="${result.store_id}" />')"><span><c:out value="${result.store_id}" /></span></td>
                        <td class="title"><span><c:out value="${result.business_nm}" /></span></td>
                        <td class="date"><span><c:out value="${result.created_datetime}" /></span></td>
                        <td class="code01"><span><c:out value="${result.corp_regist_num}" /></span></td>
                        <!-- <td class="terminal_id"><span><c:out value="${result.terminal_id}" /></span></td> -->
                        <td class="deposit"><c:out value="${result.itg_limitset}" /></td>
                        <td class="deposit"><c:out value="${result.use_amount}" /></td>
                   		<td class="deposit"><c:out value="${result.itg_limitset - result.use_amount}" /></td>
                        <td class="deposit"><c:out value="${result.deposit}" /></td>
                        <td class="commission"><c:out value="${result.credit_card_k}" /></td>
                        <td class="commission"><c:out value="${result.credit_card}" /></td>
                        <td class="commission"><c:out value="${result.terminal}" /></td>
                        <%-- <td class="commission"><c:out value="${result.account_transfer}" /></td>
                        <td class="commission"><c:out value="${result.virtual_account}" /></td> --%>
                        <%-- <td class="main_commission" id="main_commission"><c:out value=" ${result.main_commission} " /></td> --%>
                        <td class="buy"><span>매입</span></td>
                        <td class="code02"><span><c:out value="${result.tel}" /></span></td>
                        <td class="manager"><span><c:out value="${result.person_nm1}" /></span></td>
                        <td class="email"><span><c:out value="${result.person_email1}" /></span></td>
                        <td class="mob"><span><c:out value="${result.person_phone1}" /></span></td>
                        <td class="branch02"><span><c:out value="${result.business_nm3}" /></span></td>
                        <!-- td>
                            <img src="/img/ico/ico_directpay.png" alt="직접정산">
                        </td-->
                        <td class="pay_state"><span><c:out value="${result.tax eq 'Y'?'세금계산서':'원천징수'}" /></span></td>									
                    </tr>	
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="16">조회 내역이 없습니다</td>
                    </tr>
                </c:otherwise>
            </c:choose>									
            </tbody>
        </table>
    </form>

    <!-- pager -->
    <div class="paging">
        <ul class="pager_btn">
            <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"/>
        </ul>
    </div>
    <!-- //pager -->	
			                    



