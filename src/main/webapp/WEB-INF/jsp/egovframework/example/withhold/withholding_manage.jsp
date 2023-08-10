<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

    <script src="/js/withholding_manage.js"></script>
    <script src="/js/table.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>원천사관리</h2>
        </div>
        <div class="layout_wrap">
            <form name="" id="" method="get" action="" target="">
                <input type="hidden" name="roleStore" id="roleStore" value="${sessionScope.role_id eq '1004'? sessionScope.login_id:''}">
                <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">
                <input type="hidden" name="day_type" id="day_type" value="">
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>조회기간</th>
                            <td>
                                <div class="input_date">
                                    <div class="period_select">
                                        <button class="${searchWithholdVO.day_type eq 'day' ?'active':(searchWithholdVO.day_type eq ''?'active':'')}" type="button" id="day" onclick="today('day');">오늘</button>
                                        <button class="${searchWithholdVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                        <button class="${searchWithholdVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                        <button class="${searchWithholdVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month1');">3개월</button>
                                        <button class="${searchWithholdVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                        <button class="${searchWithholdVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
                                    </div>
                                    <div class="cal_select">
                                        <input type="text" id="start_datetime" name="start_datetime" class="w140 date_form ui-datepicker-trigger" placeholder="" value="${searchWithholdVO.start_datetime}">
                                        <span class="tilde">~</span>
                                        <input type="text" id="end_datetime" name="end_datetime" class="w140 date_form ui-datepicker-trigger" placeholder="" value="${searchWithholdVO.end_datetime}">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="javascript:withhold_manage_data();" class="dark_full_btn">내역조회</a> 
                    <a href="javascript:withhold_manage_init();" class="gray_line_btn">초기화</a>
                </div>
            </form>
        </div>
        <div class="layout_wrap">
            <div id="withhold_manage_data"></div>
        </div>
    </div>
                            
    <div id="dim"></div>


