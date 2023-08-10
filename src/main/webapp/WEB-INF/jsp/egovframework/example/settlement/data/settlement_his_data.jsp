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
        
    });

</script>	


    <form class="table_layout02_wrap" name="frm2" id="frm2" action="" method="post">
        <input type="hidden" name="arr_check_id" id="arr_check_id" value="" />
        <input type="hidden" name="no" id="no" value="">
        <input type="hidden" name="cpid" id="cpid" value="">
        <input type="hidden" name="daoutrx" id="daoutrx" value="">
        <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>	
        <table class="table_layout02">
            <caption>지급/보류/해제별도가감</caption>
            <thead>
                <tr>
                    <th class="num">
                        <div class="check_box">
                            <input type="checkbox" id="check_all">
                            <label for="check_all">No</label>
                        </div>
                    </th>
                    <th class="cp_type">결제</th>
                    <th class="id"><button type="button" id="btn_store_id" onclick="frmOrder('userid');"
                        <c:if test="${searchSettlementVO.order_id eq 'userid' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'userid' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >상점아이디</button></th>
                    <th class="terminal_id"><button type="button" id="btn_cp_id" onclick="frmOrder('cpid');"
                        <c:if test="${searchSettlementVO.order_id eq 'cpid' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'cpid' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >CPID</button></th>
                    <th class="terminal_id"><button type="button" id="btn_terminalid" onclick="frmOrder('terminalid');"
                        <c:if test="${searchSettlementVO.order_id eq 'terminalid' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'terminalid' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >터미널ID</button></th>
                    <th><button type="button">단말기번호</button></th>
                    <th class="buy"><button type="button" >매입구분</button></th>
                    <th class="pay_date"><button type="button" id="btn_period" onclick="frmOrder('period');"
                        <c:if test="${searchSettlementVO.order_id eq 'period' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'period' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >지급일자</button></th>
                    <th class="okay_date"><button type="button" id="btn_authdate" onclick="frmOrder('authdate');"
                        <c:if test="${searchSettlementVO.order_id eq 'authdate' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'authdate' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >승인일자</button></th>
                    <th class="cancel_date"><button type="button" id="btn_canceldate" onclick="frmOrder('canceldate');"
                        <c:if test="${searchSettlementVO.order_id eq 'canceldate' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'canceldate' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >취소일자</button></th>
                    <th class="bank"><button type="button" id="btn_bank_nm" onclick="frmOrder('bank_nm');"
                        <c:if test="${searchSettlementVO.order_id eq 'bank_nm' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'bank_nm' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >은행</button></th>
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
                    <th class="price"><button type="button" id="btn_amount" onclick="frmOrder('amount');"
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'amount' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >거래금액</button></th>
                    <th class="vat"><button type="button" id="btn_commission" onclick="frmOrder('commission');"
                        <c:if test="${searchSettlementVO.order_id eq 'commission' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'commission' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >수수료</button></th>
                    <th class="tax"><button type="button" id="btn_vat" onclick="frmOrder('vat');"
                        <c:if test="${searchSettlementVO.order_id eq 'vat' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'vat' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >부가세</button></th>
                    <th class="pay"><button type="button" id="btn_commission_total" onclick="frmOrder('commission_total');"
                        <c:if test="${searchSettlementVO.order_id eq 'commission_total' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'commission_total' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>                        
                    >지급액</button></th>
                    <th class="branch01"><button type="button" id="btn_business_nm3" onclick="frmOrder('business_nm3');"
                        <c:if test="${searchSettlementVO.order_id eq 'business_nm3' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'business_nm3' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>
                    >영업대행</button></th>
                    <th class="branch02"><button type="button" id="btn_business_nm2" onclick="frmOrder('business_nm2');"
                        <c:if test="${searchSettlementVO.order_id eq 'business_nm2' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'business_nm2' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>
                    >대리점</button></th>
                    <th class="status"><button type="button" id="btn_state" onclick="frmOrder('state');"
                        <c:if test="${searchSettlementVO.order_id eq 'state' and searchSettlementVO.order_no eq '1'}">class="up"</c:if>
                        <c:if test="${searchSettlementVO.order_id eq 'state' and searchSettlementVO.order_no eq '2'}">class="down"</c:if>
                    >상태</button></th>
                </tr>
            </thead>
            <tbody class="scrollbar">
            <c:choose>
                <c:when test="${!empty resultList}">					
                <c:forEach var="result" items="${resultList}" varStatus="status">
                <tr>
                    <td class="num">
                        <div class="check_box">
                            <input type="checkbox" id="check_id_${status.count}" name="check_id" key="<c:out value="${result.no_cpid}" />">
                            <label for="check_id_${status.count}"><c:out value="${result.rownum}" /></label>
                        </div>
                    </td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="id"><span><c:out value="${result.cp_type eq '2'?'케이에스넷':'페이조아'}" /></span></td>
                    <td class="point_link" onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="id"><span><c:out value="${result.userid}" /></span></td>
                    <td class="point_link" onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="cpid"><span><c:out value="${result.cpid}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="terminal_id"><span><c:out value="${result.terminalid}" /></span></td>
                    <td><span>4568450</span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="buy"><span>매입</span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="pay_date"><span><c:out value="${result.period}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="okay_date"><span><c:out value="${result.authdate}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="cancel_date"><span><c:out value="${result.canceldate}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="bank"><span><c:out value="${result.bank_nm}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="order_num"><span><c:out value="${result.orderno}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="buyer"><span><c:out value="${result.username}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="item_name"><span><c:out value="${result.productname}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="price"><span><c:out value="${result.amount}" />원</span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="vat"><span><c:out value="${result.commission}" />%</span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="tax"><span><c:out value="${result.vat}" />원</span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="pay"><span><c:out value="${result.commission_total}" />원</span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="branch01"><span><c:out value="${result.business_nm3}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="branch02"><span><c:out value="${result.business_nm2}" /></span></td>
                    <td onclick="frmView('<c:out value="${result.no}" />','<c:out value="${result.daoutrx}" />','<c:out value="${result.cpid}" />')"class="status"><span><c:out value="${result.state}" /></span></td>
                </tr>
                </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="18">조회 내역이 없습니다</td>
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
