<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

    <script src="/js/settlement_store.js"></script>
    <script src="/js/table.js"></script>
    <script>
        $("#check_all").on('click',function(){
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
    </script>	

    <div class="inner">
        <div class="ttl_box">
            <h2>가맹점정산조회</h2>
        </div>
        <div class="layout_wrap">
            <form name="" id="" method="get" action="" target="">
                <input type="hidden" name="roleStore" id="roleStore" value="${sessionScope.role_id eq '1004'? sessionScope.login_id:''}">
                <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1003' or sessionScope.role_id eq '1002' ? sessionScope.login_id:''}">					
                <input type="hidden" name="day_type" id="day_type" value=""> 		
                <input type="hidden" name="order_id" id="order_id" value="">				
                <input type="hidden" name="order_no" id="order_no" value="1">
                <input type="hidden" name="role_id" id="role_id" value="${sessionScope.role_id}">
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
                            <th>ID검색/상점명</th>
                            <td>
                                <select class="w110" name="search_id" placeholder="" id="search_id">
                                    <option value="store_id">상점아이디</option>
                                    <option value="business_nm">상점명</option>
                                    <option value="cpid">CPID</option>
                                    <option value="terminal_id">터미널ID</option>
                                </select> 
                                <input class="w240" type="text" id="search_nm" name="search_nm">
                            </td>					
                            <th>정산주기</th>
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
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="javascript:settlement_store_data();" class="dark_full_btn">내역조회</a> 
                    <a href="javascript:settlement_store_init();" class="gray_line_btn">초기화</a>
                </div>
            </form>
        </div>
            

        <div class="layout_wrap">
            <div class="list_layout01">
                <div class="list_box_wrap">
                    <div class="list_box">
                        <dl>
                            <dt>기간별 승인거래처</dt>
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
                            <dt>기간별 취소거래처</dt>
                            <dd><span id="total_cancel_store_cnt"></dd>
                        </dl>
                    </div>
                    <div class="list_box">
                        <dl class="cancel">
                            <dt>기간별 취소건수</dt>
                            <dd><span id="total_cancel_cnt"></dd>
                        </dl>
                    </div>
                    <div class="list_box">
                        <dl class="cancel">
                            <dt>기간별 취소금액</dt>
                            <dd><span id="total_cancel_sum"></dd>
                        </dl>
                    </div>
                </div>
                <div class="list_box_wrap">
                    <div class="list_box">
                        <dl>
                            <dt>정산 공급가액</dt>
                            <dd><span id="total_settlement"></dd>
                        </dl>
                    </div>
                    <div class="list_box">
                        <dl>
                            <dt>정산 부가세</dt>
                            <dd><span id="total_vat"></dd>
                        </dl>
                    </div>
                    <div class="list_box">
                        <dl>
                            <dt>정산 지급액</dt>
                            <dd><span id="total_amount"></dd>
                        </dl>
                    </div>
                </div>
                <div class="list_box_wrap">
                    <div class="list_box">
                        <dl>
                            <dt>수수료 공급가액</dt>
                            <dd><span id="total_settlement_commission"></dd>
                        </dl>
                    </div>
                    <div class="list_box">
                        <dl>
                            <dt>수수료 부가세</dt>
                            <dd><span id="total_vat_commission"></dd>
                        </dl>
                    </div>
                    <div class="list_box">
                        <dl>
                            <dt>수수료 합계</dt>
                            <dd><span id="total_amount_commission"></dd>
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
            
            <div id="settlement_store_data"></div>
        </div>
    </div>
                            
    <div id="dim"></div>

