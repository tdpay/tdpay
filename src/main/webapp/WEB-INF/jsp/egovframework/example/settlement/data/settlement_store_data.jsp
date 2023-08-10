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
            
            $("#dataCnt").text('총 <c:out value="${cnt}" />개 / 결과 금액 합계 :<c:out value="${amount}" />원');
            
            $("#amount_sum").text('<c:out value="${amount}" />원');
            $("#total_cnt").text('<c:out value="${cnt}" />건');
            $("#total_approval").text('<c:out value="${settlementVO.total_approval}" />원');
            $("#total_cancel_sum").text('<c:out value="${settlementVO.total_cancel_sum}" />원');
            $("#total_approval_cnt").text('<c:out value="${settlementVO.total_approval_cnt}" />건');
            $("#total_cancel_store_cnt").text('<c:out value="${settlementVO.total_cancel_store_cnt}" />건');
            $("#total_cancel_cnt").text('<c:out value="${settlementVO.total_cancel_cnt}" />건');
            $("#total_settlement").text('<c:out value="${settlementVO.total_settlement}" />원');
            $("#total_settlement2").text('<c:out value="${settlementVO.total_settlement2}" />원');
            $("#total_settlement3").text('<c:out value="${settlementVO.total_settlement3}" />원');
            $("#total_vat").text('<c:out value="${settlementVO.total_vat}" />원');
            $("#total_vat2").text('<c:out value="${settlementVO.total_vat2}" />원');
            $("#total_vat3").text('<c:out value="${settlementVO.total_vat3}" />원');
            $("#total_amount").text('<c:out value="${settlementVO.total_amount}" />원');
            $("#total_amount2").text('<c:out value="${settlementVO.total_amount2}" />원');
            $("#total_amount3").text('<c:out value="${settlementVO.total_amount3}" />원');

            $("#total_settlement_commission").text('<c:out value="${settlementVO.total_settlement_commission}" />원');		/* 수수료 공급가액 */
            $("#total_vat_commission").text('<c:out value="${settlementVO.total_vat_commission}" />원');						/* 수수료 부가세 */
            $("#total_amount_commission").text('<c:out value="${settlementVO.total_amount_commission}" />원');				/* 수수료 합계 */
        });

    </script>	

    <form class="table_layout02_wrap" name="frm2" id="frm2" action="" method="post">
        <input type="hidden" name="arr_check_id" id="arr_check_id" value="">
        <input type="hidden" name="no" id="no" value="">
        <input type="hidden" name="daoutrx" id="daoutrx" value="">
        <input type="hidden" name="cpid" id="cpid" value="">
        <input type="hidden" name="pageIndex" id="pageIndex" value="1">	
        <input type="hidden" name="role_id" value="1004">	
        <input type="hidden" name="start_datetime" value="">	
        <input type="hidden" name="end_datetime" value="">	
        <table class="table_layout02">
            <caption>영업대행별정산조회</caption>
            <thead>
                <tr>
                    <th class="num" rowspan="2">
                        <div class="check_box">
                            <input type="checkbox" id="check_all">
                            <label for="check_all">No</label>
                        </div>
                    </th>
                    <th rowspan="2"><button type="button" id="btn_business_nm" onclick="frmOrder('business_nm');"
                    <c:if test="${searchSettlementVO.order_id eq 'business_nm' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                    <c:if test="${searchSettlementVO.order_id eq 'business_nm' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                    >가맹점명</button></th>
                    <th rowspan="2"><button type="button" id="btn_store_id" onclick="frmOrder('store_id');"
                    <c:if test="${searchSettlementVO.order_id eq 'store_id' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                    <c:if test="${searchSettlementVO.order_id eq 'store_id' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                    >가맹점ID</button></th>
                    <th rowspan="2"><button type="button">정산주기</button></th>
                    <th class="blue_bg" colspan="4">정상매출</th>
                    <th class="red_bg" colspan="4">차감매출(정산후취소)</th>
                    <th rowspan="2">정산 공급가액</th>
                    <th rowspan="2">정산 부가세</th>
                    <th rowspan="2"><button type="button">정산 지급액</button></th>
                    <th rowspan="2">수수료 공급가액</th>
                    <th rowspan="2">수수료 부가세</th>
                    <th rowspan="2"><button type="button">수수료 합계</button></th>
                    <th rowspan="2">상세내역</th>
                    <th rowspan="2"><button type="button">은행</button></th>
                    <th rowspan="2"><button type="button">계좌번호</button></th>
                    <th rowspan="2"><button type="button">예금주</button></th>
                </tr>
                <tr>
                    <th class="blue_bg"><button type="button">건수</button></th>
                    <th class="blue_bg"><button type="button" id="btn_amount" onclick="frmOrder('amount');"
                    <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                    <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                                      
                    >결제금액</button></th>
                    <th class="blue_bg"><button type="button">수수료</button></th>
                    <th class="blue_bg"><button type="button">정산금액</button></th>
                    <th class="red_bg"><button type="button">건수</button></th>
                    <th class="red_bg"><button type="button">취소금액</button></th>
                    <th class="red_bg"><button type="button">수수료</button></th>
                    <th class="red_bg"><button type="button">차감할금액</button></th>
                </tr>
            </thead>
            <tbody>  
            <c:choose>
                <c:when test="${!empty resultList}">							
                    <c:forEach var="result" items="${resultList}" varStatus="status">	                        
                    <tr>
                        <td class="num">
                            <div class="check_box">
                                <input type="checkbox" id="check_id_${status.count}" name="check_id" key="${result.no_cpid}">
                                <label for="check_id_${status.count}"><c:out value="${result.rownum}" /></label>
                            </div>
                        </td>
                        <td class="points point_link"><span><c:out value="${result.business_nm}" /></span></td>	<!-- 가맹점 명 -->
                        <td class="points point_link"><span><c:out value="${result.store_id}" /></span></td>	<!-- 가맹점ID -->
                        <td><span>D+<c:out value="${result.period}" /></span></td>								<!-- 정산주기 -->
                        <td class="blue_bg"><span>${result.amount_cnt}</span></td>								<!-- 매출 건수 -->
                        <td class="blue_bg"><span><c:out value="${result.amount}" /></span></td>				<!-- 결제금액 -->
                        <td class="blue_bg"><span><c:out value="${result.amount_commission}" /></span></td>	<!-- 결제 수수료 -->
                        <td class="blue_bg"><span><c:out value="${result.settlement_amount }" /></span></td>						<!-- 정산금액 -->
                        <td class="red_bg"><span><c:out value="${result.cancel_cnt}" /></span></td>								<!-- 취소 건수 -->
                        <td class="red_bg"><span><c:out value="${result.cancel_amount}" /></span></td>			<!-- 취소금액 -->
                        <td class="red_bg"><span><c:out value="${result.cencel_amount_commission}" /></span></td>		<!-- 취소 수수료 -->
                        <td class="red_bg"><span><c:out value="${result.cencel_settlement_amount }" /></span></td>				<!-- 차감할 금액 -->
                        <td><span>${result.supply_commission }</span></td>													<!-- 정산 공급가액 -->
                        <td><span>${result.vat }</span></td>													<!-- 정산 부가세 -->
                        <td><span>${result.settlement }</span></td>											<!-- 정산 지급액 -->
                        <td><span>${result.cancel_supply_commission }</span></td>													<!-- 수수료 공급가액 -->
                        <td><span>${result.cancel_vat }</span></td>													<!-- 수수료 부가세 -->
                        <td><span>${result.cancel_settlement }</span></td>											<!-- 수수료 합계 -->
                        <td><button type="button" class="detail_btn pop_detail_btn" onclick="detail('<c:out value="${searchSettlementVO.start_datetime}" />', '<c:out value="${searchSettlementVO.end_datetime}" />','<c:out value="${result.store_id}" />');">상세보기</button></td>
                        <td><span>${result.bank_nm}</span></td>
                        <td><span>${result.account_num}</span></td>
                        <td><span>${result.accounter}</span></td>
                    </tr>             
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8">조회 내역이 없습니다</td>
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
    
 