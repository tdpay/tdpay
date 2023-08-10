<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <script>
    var view_type_s = '<c:out value="${view_type}" />';
    
    $(function() {	
    <c:choose>
	    <c:when test="${sessionScope.role_id eq '1001'}">
		    getOption('#roleStore', 'high_store_id', '', '');
		    $('#roleStore').click(function(){
		    	getOption2('#roleStore2', 'high_store_list', $('#roleStore').val(),'N', '');
		   	});
	    </c:when>
	    <c:when test="${sessionScope.role_id eq '1002'}">
	    	getOption2('#roleStore2', 'high_store_list', '${sessionScope.login_id}','N', '${searchSettlementVO.roleStore2}');
	    </c:when>
	    <c:when test="${sessionScope.role_id eq '1003'}">
	    	getOption2('#roleStore3', 'high_store_id3', '${sessionScope.login_id}','N', '${searchSettlementVO.roleStore3}');
	    </c:when>
	    <c:otherwise>
	    </c:otherwise>
    </c:choose>
    });    
    
    getOption('#cardcode', 'cardcode', '', '${searchSettlementVO.cardcode}');
    
    </script>
        
        <!-- index.html 고유 스크립트 추가 -->
        <script src="/js/jquery.number.js"></script>
        <script src="/js/settlement_all02.js"></script>
        <script src="/js/table.js"></script>

		<!-- container -->
        <div class="inner">
            <div class="ttl_box">
                <h2>단말기 정산조회</h2>
            </div>
            <div class="layout_wrap">
                <form name="" id="" method="get" action=""	target="">
                    <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
                    <input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">						
                    <input type="hidden" name="day_type" id="day_type" value="" /> 		
                    <input type="hidden" name="order_id" id=order_id value="authdate"/>				
                    <input type="hidden" name="order_no" id=order_no value="2"/>
                    <input type="hidden" name="paymenttype" id="paymenttype" value="3"/>
                    		<!-- 단말기 정산: 3, 그외:수기 정산 -->
                    <table class="table_layout01">
                        <colgroup>
                            <col style="width:160px;">
                            <col style="width:auto;">
                            <col style="width:160px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>거래일자</th>
                                <td colspan="3">
                                    <div class="input_date">
                                        <div class="period_select">
                                            <button class="${searchSettlementVO.day_type eq 'day' ?'active':(searchSettlementVO.day_type eq ''?'active':'')}" type="button" id="day" onclick="today('day');">오늘</button>
                                            <button class="${searchSettlementVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                            <button class="${searchSettlementVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                            <button class="${searchSettlementVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month1');">3개월</button>
                                            <button class="${searchSettlementVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                            <button class="${searchSettlementVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
                                        </div>
                                        <div class="cal_select">
                                            <input type="text" id="start_datetime" name="start_datetime" class="w140 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.start_datetime}">
                                            <span class="tilde">~</span>
                                            <input type="text" id="end_datetime" name="end_datetime" class="w140 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.end_datetime}">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>거래금액</th>
                                <td colspan="3">
                                    <input class="w180" type="text" name="amount1" placeholder="" id="amount1" value="${searchSettlementVO.amount1}">
                                    <span class="tilde">~</span>
                                    <input class="w180" type="text" name="amount2" placeholder="" id="amount2" value="${searchSettlementVO.amount2}">
                                </td>
                            </tr>
                            <tr>
                                <th>카드종류</th>
                                <td>
                                    <select class="w110" name="cardcode" placeholder="" id="cardcode">
                                        <option value="">전체</option>
                                    </select>										
                                </td>
                                <th>카드번호</th>
                                <td><input class="w180" type="text" name="cardno" placeholder="" id="cardno" value="${searchSettlementVO.cardno}"></td>
                            </tr>
                            <tr>
                                <th>할부구분</th>
                                <td>
                                    <select class="w180" name="quota" placeholder="" id="quota">
                                        <option value="">전체</option>
                                        <c:forEach var="i" begin="0" end="12">
                                            <c:choose>
                                                <c:when test="${i == 0}">
                                                    <option value="00">일시불</option>
                                                </c:when>
                                                <c:when test="${i < 10 && i > 1}">
                                                    <option value="0<c:out value="${i}" />" ${searchSettlementVO.quota eq i ? 'selected':''}>0<c:out value="${i}" /></option>
                                                </c:when>
                                                <c:when test="${i >= 10}">
                                                    <option value="<c:out value="${i}" />" ${searchSettlementVO.quota eq i ? 'selected':''}><c:out value="${i}" /></option>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>											
                                    </select>
                                </td>
                                <th>구매자명</th>
                                <td>
                                    <input class="w180" type="text" name="username" placeholder="" id="username" value="${searchSettlementVO.username}">
                                </td>
                            </tr>
                            <tr>
                        <c:choose>
                            <c:when test="${sessionScope.role_id eq '1001'}">
                                <th>영업대행</th>
                                <td>
                                    <select class="w110" name="roleStore" placeholder="" id="roleStore">
                                        <option value="">전체</option>
                                    </select> 
                                    <select class="w110" name="roleStore2" placeholder="" id="roleStore2">
                                        <option>선택</option>
                                    </select> 
                                </td>
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1002'}">
                                <th>대리점</th>
                                <td>
                                    <select class="w110" name="roleStore2" placeholder="" id="roleStore2">
                                        <option>선택</option>
                                    </select> 
                                </td>
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1003'}">
                                <th>가맹점</th>
                                <td>
                                    <select class="w110" name="roleStore3" placeholder="" id="roleStore3">
                                        <option>선택</option>
                                    </select> 
                                </td>
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="roleStore3" id="roleStore3" value="<c:out value="${sessionScope.login_id}" />">
                            </c:otherwise>
                        </c:choose>		
                                <th>상점주문번호</th>
                                <td>
                                    <input class="w180" type="text" name="orderno" placeholder="" id="orderno" value="${searchSettlementVO.orderno}">
                                </td>										
                            </tr>
                            <tr>
                                <th>ID검색/상점명</th>
                                <td>
                                    <select class="w110" name="search_id" placeholder="" id="search_id">
                                        <option value="">선택</option>
                                        <option value="store_id" ${searchSettlementVO.search_id eq 'store_id' ?'selected':''}>상점ID</option>
                                        <option value="business_nm" ${searchSettlementVO.search_id eq 'business_nm' ?'selected':''}>상점명</option>
                                        <option value="cpid" ${searchSettlementVO.search_id eq 'cpid' ?'selected':''}>CPID</option>
                                        <option value="terminal_id" ${searchSettlementVO.search_id eq 'terminal_id' ?'selected':''}>터미널ID</option>
                                        <option value="imei" ${searchSettlementVO.search_id eq 'imei' ?'selected':''}>단말기번호</option>
                                    </select>
                                    <input class="w180" type="tel" name="search_nm" placeholder="" id="search_nm" value="${searchSettlementVO.search_nm}">
                                </td>
                                <th>상태</th>
                                <td>
                                    <select class="w180" name="state" placeholder="" id="state">
                                        <option value="">선택</option>
                                        <option value="Y" ${searchSettlementVO.state eq 'Y' ?'selected':''}>사용</option>
                                        <option value="N" ${searchSettlementVO.state eq 'N' ?'selected':''}>중지</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>가맹점</th>
                                <td>
                                    <input class="w180" type="text" name="commission" placeholder="" id="commission" value="${searchSettlementVO.commission}">
                                    <span class="unit">%</span>
                                </td>
                                <th>부가세</th>
                                <td>
                                    <select class="w180 tax_select" name="tax_state" placeholder="" id="tax_state">
                                        <option value="">선택</option>
                                        <option value="Y" ${searchSettlementVO.tax_state eq 'Y' ?'selected':''}>발행</option>
                                        <option value="N" ${searchSettlementVO.tax_state eq 'N' ?'selected':''}>미발행</option>
                                    </select>
                                    <select class="w180 tax_ok" name="tax_state2" placeholder="" id="tax_state2" style="display:none;">
                                        <option value="0" ${searchSettlementVO.tax_state2 eq '0' ?'selected':''}>발행대기</option>
                                        <option value="1" ${searchSettlementVO.tax_state2 eq '1' ?'selected':''}>발행완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <!-- <th><label for="">정산방식</th>
                                <td>
                                    <select class="w180" name="" id="">
                                        <option value="">선택</option>
                                        <option value="">일반정산</option>
                                        <option value="">직접정산</option>
                                    </select>
                                </td> -->
                                <th><label for="">결제상태</th>
                                <td>
                                    <select class="w180" name="seqno" id="seqno">
                                        <option value="" ${searchSettlementVO.seqno eq '' ?'selected':''}>전체</option>
                                        <option value="1" ${searchSettlementVO.seqno eq '1' ?'selected':''}>정산완료</option>
                                        <option value="0" ${searchSettlementVO.seqno eq '0' ?'selected':''}>취소</option>
                                    </select>
                                </td>
                                <th><label for="">정산주기</th>
                                <td>
                                    <select class="w180" name="" placeholder="" id="">
                                        <option value="">선택</option>
                                        <option value="">D+0</option>
                                        <option value="">D+1</option>
                                        <option value="">D+2</option>
                                        <option value="">D+3</option>
                                        <option value="">D+4</option>
                                        <option value="">D+5</option>
                                        <option value="">D+6</option>
                                        <option value="">D+7</option>
                                        <option value="">D+8</option>
                                        <option value="">D+9</option>
                                        <option value="">D+10</option>
                                        <option value="">D+11</option>
                                        <option value="">D+12</option>
                                        <option value="">D+13</option>
                                        <option value="">D+14</option>
                                        <option value="">D+15</option>
                                        <option value="">D+16</option>
                                        <option value="">D+17</option>
                                        <option value="">D+18</option>
                                        <option value="">D+19</option>
                                        <option value="">D+20</option>
                                        <option value="">D+21</option>
                                        <option value="">D+22</option>
                                        <option value="">D+23</option>
                                        <option value="">D+24</option>
                                        <option value="">D+25</option>
                                        <option value="">D+26</option>
                                        <option value="">D+27</option>
                                        <option value="">D+28</option>
                                        <option value="">D+29</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>결제종류</th>
                                <td colspan="3">
                                    <select class="w180" name="cp_type" placeholder="" id="cp_type">
                                        <option value="1" ${searchSettlementVO.cp_type eq '1' ?'selected':''}>페이조아</option>
                                        <option value="2" ${searchSettlementVO.cp_type eq '2' ?'selected':''}>케이에스넷</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="btn_box">
                        <a href="javascript:settlement_all_data();" class="dark_full_btn">내역조회</a> 
                        <a href="javascript:settlement_all_init();" class="gray_line_btn">초기화</a>
                    </div>
                </form>
            </div>
            

            <div class="layout_wrap">
                <div class="list_layout01">
                    <div class="list_box_wrap">
                        <div class="list_box">
                            <dl>
                                <dt>기간별 거래처</dt>
                                <dd><span id="total_cnt"></dd>
                            </dl>
                        </div>
                        <div class="list_box">
                            <dl>
                                <dt>기간별 승인건수</dt>
                                <dd><span id="total_approval_cnt"></dd>
                            </dl>
                        </div>
                        <div class="list_box">
                            <dl>
                                <dt>기간별 승인액</dt>
                                <dd><span id="total_approval"></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="list_box_wrap">
                        <div class="list_box">
                            <dl class="cancel">
                                <dt>기간별취소건</dt>
                                <dd><span id="total_cancel_cnt"></dd>
                            </dl>
                        </div>
                        <div class="list_box">
                            <dl class="cancel">
                                <dt>기간별취소금액</dt>
                                <dd><span id="total_cancel_sum"></dd>
                            </dl>
                        </div>
                        <div class="list_box">
                            <dl>
                                <dt>총합계금액</dt>
                                <dd><span id="total_amount"></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="list_box_wrap">
                        <div class="list_box">
                            <dl>
                                <dt>부가세</dt>
                                <dd><span id="total_vat"></dd>
                            </dl>
                        </div>
                        <div class="list_box">
                            <dl>
                                <dt>정산금액</dt>
                                <dd><span id="total_settlement"></dd>
                            </dl>
                        </div>
                        <div class="list_box">
                            <dl>
                                <dt>총 정산금액</dt>
                                <dd><span id="total_settlement_sum"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>      

            <div class="layout_wrap">
                <div class="list_ttl">
                    <span class="total"><strong id="dataCnt"></strong></span>
                    <div class="view_box">
                        <button class="excel_btn" onclick="doExcelDownload();">
                            <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                        </button>
                        <select class="w180" name="pageUnit" id="pageUnit">
                            <option value="200" ${searchSettlementVO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
                            <option value="100" ${searchSettlementVO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
                            <option value="50"  ${searchSettlementVO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
                            <option value="20"  ${searchSettlementVO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
                            <option value="10"  ${searchSettlementVO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
                        </select>
                    </div>					
                </div>
                
                <div id="settlement_all_data"></div>

            </div>
        </div>

        <div id="dim"></div>
	
		<script>
        // 부가세 발행 유무
        $('.tax_select').on('change',function(){
            if(this.value == 'Y') {
                $('.tax_ok').show();
            } else {
                $('.tax_ok').hide();
            }
        });
        
        <c:if test="${searchSettlementVO.tax_state eq 'Y'}">
      	  $('.tax_ok').show();
        </c:if>
	
	</script>
	


