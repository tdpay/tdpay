<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

    <script src="/js/settlement_store.js"></script>
    <script src="/js/table.js"></script>


        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">부가세신고자료</strong>
                <form class="form_layout" name="" id="" method="get" action="" target="">
                    <input type="hidden" name="roleStore" id="roleStore" value="${sessionScope.role_id eq '1004'? sessionScope.login_id:''}">
                    <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">					
                    <input type="hidden" name="day_type" id="day_type" value=""> 		
                    <input type="hidden" name="order_id" id="order_id" value="">				
                    <input type="hidden" name="order_no" id="order_no" value="1">
                    <table>
                        <tbody>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">사업자번호</label>
                                </td>
                                <td class="input_desc" colspan="7">
                                    <input class="width_240" type="text" id="search_nm" name="search_nm">
                                </td>								
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">조회기간</label></td>
                                <td class="input_desc period_search_wrap" colspan="7">
                                    <button class="btn_first btn_default ${searchSettlementVO.day_type eq 'day' ?'active':(searchSettlementVO.day_type eq ''?'active':'')}" type="button" id="day" onclick="today('day');">오늘</button>
                                    <button class="btn_default ${searchSettlementVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                    <button class="btn_default ${searchSettlementVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                    <button class="btn_default ${searchSettlementVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month1');">3개월</button>
                                    <button class="btn_default ${searchSettlementVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                    <button class="btn_default ${searchSettlementVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
                                    <input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.start_datetime}">
                                    <button type="button" class=""></button> <span class="hypen">~</span>
                                    <input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.end_datetime}">
                                    <button type="button" class=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn_box">
                        <a href="javascript:settlement_store_data();" class="a_btn a_btn_blue">내역조회</a> 
                        <a href="javascript:settlement_store_init();" class="a_btn a_btn_default">초기화</a>
                    </div>
                </form>
            </div>
            
            <strong class="sub_ttl">* 부가세 신고 명세서</strong>
            <div class="form_layout detail_layout">
                <table>
                    <tbody>
                        <tr class="input_box input_box_border">
                            <td class="input_ttl">
                                <label for="">CPID</label>
                            </td>
                            <td class="input_desc">4568410</td>                                    
                            <td class="input_ttl">
                                <label for="">사업자명</label>
                            </td>
                            <td class="input_desc">김길동</td>                                    
                        </tr>
                        <tr class="input_box input_box_border">
                            <td class="input_ttl">
                                <label for="">사업자번호</label>
                            </td>
                            <td class="input_desc">5128801567</td>                                    
                            <td class="input_ttl">
                                <label for="">매출기간</label>
                            </td>
                            <td class="input_desc">2021.07.01~2021.07.31</td>                                    
                        </tr>
                    </tbody>
                </table>
            </div>
    
            <div class="col">
                <strong class="num_ttl"><span id="dataCnt"></span></strong>
                <div class="view_box fr">
                    <button class="btn_excel" onclick="">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                    <select class="width_s" name="pageUnit" id="pageUnit">
                        <option value="200" ${searchSettlementVO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
                        <option value="100" ${searchSettlementVO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
                        <option value="50"  ${searchSettlementVO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
                        <option value="20"  ${searchSettlementVO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
                        <option value="10"  ${searchSettlementVO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
                    </select>
                </div>					
                
                <div id="">
                    <strong class="sub_ttl">* 신용카드 매출 <span>(세금계산서발행)</span></strong>
                    <form action="" class="table_layout">
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th><button type="button">업체명</button></th>
                                    <th><button type="button">사업자번호(주민등록번호)</button></th>
                                    <th><button type="button">승인건수</button></th>
                                    <th><button type="button">승인금액기간별(2021.07.07~2021.07.31)</button></th>
                                    <th><button type="button">취소건수</button></th>
                                    <th><button type="button">취소금액기간별(2021.07.01~2021.07.31)</button></th>
                                    <th><button type="button">합계금액</button></th>
                                    <th><button type="button">수수료율</button></th>
                                    <th><button type="button">수수료</button></th>
                                    <th><button type="button">부가세</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span>1</span></td>
                                    <td><span>장인가마솥</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>2</span></td>
                                    <td><span>머리하는날</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>3</span></td>
                                    <td><span>랜드마크건설</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr>
                                    <td><span>4</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>1018661717</span></td>
                                    <td><span>56</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>59</span></td>
                                    <td><span>8,113,000</span></td>
                                    <td><span>12,578,000</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>33,000</span></td>
                                    <td><span>88,133,000</span></td>
                                </tr>
                                <tr style="background-color:yellow">
                                    <td><span></span></td>
                                    <td><span>합계</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,643,110</span></td>
                                    <td><span>340</span></td>
                                    <td><span>61,640,000</span></td>
                                    <td><span></span></td>
                                    <td><span>340</span></td>
                                    <td><span></span></td>
                                    <td><span>61,643,110</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
                                
        <div id="dim"></div>


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
