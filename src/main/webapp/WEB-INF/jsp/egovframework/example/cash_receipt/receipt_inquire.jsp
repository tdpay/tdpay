<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/jquery.number.js"></script>
<script src="/js/manage_all.js"></script>
<script src="/js/table.js"></script>

<!-- container -->
<div class="inner">
    <div class="ttl_box">
        <h2>현금영수증조회</h2>
    </div>
    <div class="layout_wrap">
        <form action="">
            <table class="table_layout01">
                <colgroup>
                    <col style="width:160px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>상점ID</th>
                        <td>
                            <input class="w140" type="text" value="545654810" disabled>
                            <select class="w140" name="" id="">
                                <option value="">선택</option>
                            </select>
                            <button type="button" class="list_btn">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>거래일자</th>
                        <td>
                            <div class="input_date">
                                <div class="period_select">
                                    <button class="${searchManageVO.day_type eq 'day' ?'active':''}" type="button" id="day" onclick="today('day');">오늘</button>
                                    <button class="${searchManageVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                    <button class="${searchManageVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                    <button class="${searchManageVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month3');">3개월</button>
                                    <button class="${searchManageVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                    <button class="${searchManageVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
                                </div>
                                <div class="cal_select">
                                    <input type="text" id="start_datetime" name="start_datetime" class="w140 date_form ui-datepicker-trigger" placeholder="" value="${searchManageVO.start_datetime }">
                                    <span class="tilde">~</span>
                                    <input type="text" id="end_datetime" name="end_datetime" class="w140 date_form ui-datepicker-trigger"	placeholder="" value="${searchManageVO.end_datetime }">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>일자기준</th>
                        <td>
                            <select class="w180" name="" id="">
                                <option value="">전체</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>결제수단</th>
                        <td>
                            <select class="w180" name="" id="">
                                <option value="">전체</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>전송상태</th>
                        <td>
                            <select class="w180" name="" id="">
                                <option value="">전체</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>검색조건</th>
                        <td>
                            <select class="w180" name="" id="">
                                <option value="">전체</option>
                            </select>
                            <input class="w180" type="text">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn_box">
                <a href="#!" class="dark_full_btn">검색</a> 
                <a href="doExcelDownload();" class="excel_btn"><img src="../img/ico/ico_excel.png" alt="">엑셀다운로드</a>
            </div>
        </form>
    </div>
</div>
<!-- //container -->