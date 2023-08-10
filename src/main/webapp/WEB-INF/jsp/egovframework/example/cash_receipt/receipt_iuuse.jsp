<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/jquery.number.js"></script>
<script src="/js/manage_all.js"></script>
<script src="/js/table.js"></script>

<!-- container -->
<div class="inner">
    <div class="ttl_box">
        <h2>현금영수증발급</h2>
    </div>
    <div class="layout_wrap">
        <form action="">
            <table class="table_layout01">
                <colgroup>
                    <col style="width:160px;">
                    <col style="width:auto;">
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
                        <th>거래번호</th>
                        <td>
                            <input class="w180" type="text">
                            <button type="button" class="list_btn">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>거래일자</th>
                        <td colspan="3">
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
                        <th>승인구분</th>
                        <td>
                            <select class="w180" name="" id="">
                                <option value="">전체</option>
                            </select>
                        </td>
                        <th>입금일자</th>
                        <td>
                            <input class="w140" type="text" placeholder="숫자만 입력">
                            <input class="w140" type="text" placeholder="숫자만 입력">
                        </td>
                    </tr>
                    <tr>
                        <th>발급대상 거래</th>
                        <td>
                            <select class="w180" name="" id="">
                                <option value="">일반발급</option>
                            </select>
                        </td>
                        <th>은행명</th>
                        <td>
                            <input class="w140" type="text" placeholder="숫자만 입력">
                        </td>
                    </tr>
                    <tr>
                        <th>발급정보 거래</th>
                        <td>
                            <select class="w180" name="" id="">
                                <option value="">휴대폰번호</option>
                            </select>
                        </td>
                        <th>가상계좌번호</th>
                        <td>
                            <input class="w140" type="text" placeholder="숫자만 입력">
                        </td>
                    </tr>
                    <tr>
                        <th>사용자 정보</th>
                        <td colspan="3">
                            <input class="w140" type="text" placeholder="숫자만 입력">
                        </td>
                    </tr>
                    <tr>
                        <th>공급가액</th>
                        <td colspan="3">
                            <input class="w140" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>세금</th>
                        <td colspan="3">
                            <input class="w140" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>봉사료</th>
                        <td colspan="3">
                            <input class="w140" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>총금액</th>
                        <td colspan="3">
                            <input class="w140" type="text" placeholder="자동계산">
                        </td>
                    </tr>
                    <tr>
                        <th>주문번호</th>
                        <td colspan="3">
                            <input class="w240" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>주문자명</th>
                        <td colspan="3">
                            <input class="w240" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td colspan="3">
                            <input class="w240" type="text">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn_box">
                <a href="#!" class="dark_full_btn">발급요청</a> 
                <a href="#!" class="gray_line_btn">초기화</a>
            </div>
        </form>
    </div>
</div>
<!-- //container -->