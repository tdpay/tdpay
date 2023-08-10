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
	
	$("#dataCnt").text('총 <c:out value="${settlementVO.total_cnt}" />개 / 결과 금액 합계 :<c:out value="${settlementVO.total_approval}" />원');
	
	$("#total_cnt").text('<c:out value="${settlementVO.total_cnt}" />건');
	$("#total_approval_cnt").text('<c:out value="${settlementVO.total_approval_cnt}" />건');
	$("#total_store_cnt").text('<c:out value="${settlementVO.total_store_cnt}" />건');
	$("#total_approval").text('<c:out value="${settlementVO.total_approval}" />원');
	
	$("#total_cancel_sum").text('<c:out value="${settlementVO.total_cancel_sum}" />원');
	$("#total_cancel_cnt").text('<c:out value="${settlementVO.total_cancel_cnt}" />건');
	
	$("#total_amount").text('<c:out value="${settlementVO.total_amount}" />원');
	$("#total_vat").text('<c:out value="${settlementVO.total_vat}" />원');
	$("#total_settlement").text('<c:out value="${settlementVO.total_settlement}" />원');
	$("#total_settlement_sum").text('<c:out value="${settlementVO.total_settlement_sum}" />원');
});

</script>	



    <form class="table_layout02_wrap" name="frm2" id="frm2" action="" method="post">
        <input type="hidden" name="arr_check_id" id="arr_check_id" value="" />
        <input type="hidden" name="no" id="no" value="">
        <input type="hidden" name="daoutrx" id="daoutrx" value="">
        <input type="hidden" name="cpid" id="cpid" value="">
        <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>	
        <table class="table_layout02">
            <caption>통합정산조회</caption>
            <thead>
                <tr>
                    <th class="num">
                        <div class="check_box">
                            <input type="checkbox" id="check_all">
                            <label for="check_all">No</label>
                        </div>
                    </th>
                    <th class="cp_type">PG</th>
                    <th class="id"><button type="button" id="btn_cp_type" onclick="frmOrder('cp_type');"
                        <c:if test="${searchSettlementVO.order_id eq 'cp_type' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'cp_type' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>
                    >상점아이디</button></th>
                    <th class="cp_id"><button type="button" id="btn_store_id" onclick="frmOrder('store_id');"
                        <c:if test="${searchSettlementVO.order_id eq 'store_id' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'store_id' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >CPID</button></th>                            
                    <th class="terminal_id"><button type="button" id="btn_cpid" onclick="frmOrder('cpid');"
                        <c:if test="${searchSettlementVO.order_id eq 'cpid' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'cpid' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >터미널ID</button></th>
                    <!-- 수기정산 -->
                    <c:if test="${searchSettlementVO.paymenttype ne '3' && searchSettlementVO.paymenttype ne '4'}">
                    <th class="order_num"><button type="button" id="btn_orderno" onclick="frmOrder('orderno');"
                        <c:if test="${searchSettlementVO.order_id eq 'orderno' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'orderno' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >주문번호</button></th>
                    <th class="buyer"><button type="button" id="btn_username" onclick="frmOrder('username');"
                        <c:if test="${searchSettlementVO.order_id eq 'username' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'username' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >구매자</button></th>
                    <th class="item_name"><button type="button" id="btn_productname" onclick="frmOrder('productname');"
                        <c:if test="${searchSettlementVO.order_id eq 'productname' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'productname' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >상품명</button></th>
                    </c:if>
                    <th class="price"><button type="button" id="btn_amount" onclick="frmOrder('amount');"
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >승인금액</button></th>
                    <th class="price"><button type="button" id="btn_amount" onclick="frmOrder('amount');"
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >취소금액</button></th>
                    <th class="price"><button type="button" id="btn_amount" onclick="frmOrder('amount');"
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >거래금액</button></th>
                    <th class="vat"><button type="button" id="btn_commission" onclick="frmOrder('commission');"
                        <c:if test="${searchSettlementVO.order_id eq 'commission' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'commission' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >수수료율</button></th>                            
                    <th class="vat"><button type="button" id="btn_franchisee_commission" onclick="frmOrder('franchisee_commission');"
                        <c:if test="${searchSettlementVO.order_id eq 'franchisee_commission' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'franchisee_commission' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >가맹점 수수료</button></th>
                    <th class="all_vat"><button type="button" id="btn_commission_cost" onclick="frmOrder('commission_cost');"
                        <c:if test="${searchSettlementVO.order_id eq 'commission_cost' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'commission_cost' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >공급가액</button></th>
                    <th class="tax"><button type="button" id="btn_vat" onclick="frmOrder('vat');"
                        <c:if test="${searchSettlementVO.order_id eq 'vat' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'vat' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >부가세액</button></th>
                    <th class="pay"><button type="button" id="btn_settlement" onclick="frmOrder('settlement');"
                        <c:if test="${searchSettlementVO.order_id eq 'settlement' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'settlement' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >지급액</button></th>
                    <th class="buy"><button type="button" >매입구분</button></th>
                    <th class="pay_date"><button type="button" id="btn_terminal_id" onclick="frmOrder('terminal_id');"
                        <c:if test="${searchSettlementVO.order_id eq 'terminal_id' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'terminal_id' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >지급일자</button></th>
                    <th class="bank"><button type="button" id="btn_bank_nm" onclick="frmOrder('bank_nm');"
                        <c:if test="${searchSettlementVO.order_id eq 'bank_nm' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'bank_nm' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >은행</button></th>
                    <th><button type="button">상세보기</button></th>
                <c:choose>
                    <c:when test="${sessionScope.role_id eq '1001'}">
                    <th class="branch01"><button type="button" id="btn_business_nm3" onclick="frmOrder('business_nm3');"
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm3' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm3' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
                    >영업대행</button></th>
                    <th class="branch02"><button type="button" id="btn_business_nm2" onclick="frmOrder('business_nm2');"
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
                    >대리점</button></th>
                    <th class="branch03"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
                    >가맹점</button></th>
                    </c:when>
                    <c:when test="${sessionScope.role_id eq '1002'}">
                    <th class="branch02"><button type="button" id="btn_business_nm2" onclick="frmOrder('business_nm2');"
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm2' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
                    >대리점</button></th>
                    <th class="branch03"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>	                        
                    >가맹점</button></th>
                    </c:when>
                    <c:when test="${sessionScope.role_id eq '1003'}">
                    <th class="branch03"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchHistoryVO.order_id eq 'business_nm' and searchHistoryVO.order_no eq '2'}">class="down"</c:if>                    	    
                    >가맹점</button></th>
                    </c:when>
                </c:choose>    
                    <!-- th><button type="button">직접정산</button></th-->        
                    <th class="status"><button type="button" id="btn_state" onclick="frmOrder('state');"
                        <c:if test="${searchSettlementVO.order_id eq 'state' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'state' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                            
                    >상태</button></th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${!empty resultList}">							
                        <c:forEach var="result" items="${resultList}" varStatus="status">	
                        <tr class="<c:out value="${result.seqno eq '0'?'red_bg':''}" />">
                            <td class="num">
                                <div class="check_box">
                                    <input type="checkbox" id="check_id_${status.count}" name="check_id" key="<c:out value="${result.no_cpid}" />">
                                    <label for="check_id_${status.count}"><c:out value="${result.rownum}" /></label>
                                </div>
                            </td>
                            <td class="id"><span><c:out value="${result.cp_type eq '2'?'케이에스넷':'페이조아'}" /></span></td>
                            <td class="point_link" class="id" onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"><span><c:out value="${result.store_id}" /></span></td>
                            <td class="point_link" class="id" onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"><span><c:out value="${result.cpid}" /></span></td>
                            <td class="buy"><span><c:out value="${result.terminal_id}" /></span></td>
                            <!-- 수기정산 -->
                    		<c:if test="${searchSettlementVO.paymenttype ne '3' && searchSettlementVO.paymenttype ne '4'}">
                            <td class="order_num"><span><c:out value="${result.orderno}" /></span></td>
                            <td class="buyer"><span><c:out value="${result.username}" /></span></td>
                            <td class="item_name"><span><c:out value="${result.productname}" /></span></td>
                            </c:if>
                            <td class="price"><span><c:out value="${result.amount}" /></span></td>
                            <td class="price"><span><c:out value="${result.cancel_amount}" /></span></td>
                            <td class="price"><span><c:out value="${result.amount - result.cancel_amount}" /></span></td>
                            <td class="vat"><span><c:out value="${result.commission}" />%</span></td>
                            <td class="vat"><span><c:out value="${result.franchisee_commission}" /></span></td>
                            <td class="all_vat"><span><c:out value="${result.commission_cost}" /></span></td>
                            <td class="tax"><span><c:out value="${result.vat}" /></span></td>
                            <td class="pay"><span><c:out value="${result.settlement}" /></span></td>
                            <td class="buy"><span><c:out value="${result.seqno eq '0'?'매입':'매출'}" /></span></td>
                            <td class="pay_date"><span>D+<c:out value="${result.period}" /></span></td>
                            <td class="bank"><span><c:out value="${result.bank_nm}" /></span></td>
                            <td><button type="button" class="detail_btn pop_detail_btn" onclick="detail('<c:out value="${result.seqno}" />','<c:out value="${result.created_datetime}" />','<c:out value="${result.cpid}" />','<c:out value="${result.cp_type}" />');">상세보기</button></td>
                            <c:choose>
                                <c:when test="${sessionScope.role_id eq '1001'}">
                                <td class="branch01"><span><c:out value="${result.business_nm3}" /></span></td>
                                <td class="branch02"><span><c:out value="${result.business_nm2}" /></span></td>
                                <td class="branch03"><span><c:out value="${result.business_nm}" /></span></td>
                                </c:when>
                                <c:when test="${sessionScope.role_id eq '1002'}">
                                <td class="branch02"><span><c:out value="${result.business_nm2}" /></span></td>
                                <td class="branch03"><span><c:out value="${result.business_nm}" /></span></td>
                                </c:when>
                                <c:when test="${sessionScope.role_id eq '1003'}">
                                <td class="branch03"><span><c:out value="${result.business_nm}" /></span></td>
                                </c:when>
                            </c:choose>		
                            <!-- td>
                                <img src="/img/ico/ico_directpay.png" alt="직접정산">
                            </td-->
                            <td class="status"><span><c:out value="${result.state}" /></span></td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <c:choose>
                                <c:when test="${sessionScope.role_id eq '1001'}">
                            	     <td colspan="22">조회 내역이 없습니다</td>
                                </c:when>
                                <c:when test="${sessionScope.role_id eq '1002'}">
                           		     <td colspan="21">조회 내역이 없습니다</td>
                                </c:when>
                                <c:when test="${sessionScope.role_id eq '1003'}">
                               	     <td colspan="20">조회 내역이 없습니다</td>
                                </c:when>
                            </c:choose>	                        
                        </tr>
                    </c:otherwise>
                </c:choose>										
            </tbody>
        </table>
    </form>
                    
    <!-- pager -->
    <div class="paging">
        <ul class="pager_btn">
        
            <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page"  />
            
        </ul>
    </div>
    <!-- //pager -->

    <script>
        $('.pop_detail_btn').on('click',function(){
            $('.popup_wrap .dim').fadeIn();
            $('.popup_wrap .popup_detail').fadeIn();
        });
    </script>


