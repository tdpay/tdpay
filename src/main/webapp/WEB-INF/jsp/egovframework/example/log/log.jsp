<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <script src="/js/log.js"></script>
    
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>로그관리</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>검색일자</th>
                            <td>
                                <div class="input_date">
                                    <div class="period_select">
                                        <button type="button" id="day" onclick="today();">오늘</button>
                                        <button type="button" id="week" onclick="prevDay('7');">1주일</button>
                                        <button type="button" id="month1" onclick="prevMonth('1');">1개월</button>
                                        <button type="button" id="month3" onclick="prevMonth('3');">3개월</button>
                                        <button type="button" id="month6" onclick="prevMonth('6');">6개월</button>
                                        <button type="button" id="year" onclick="prevMonth('12');">1년</button> 
                                    </div>
                                    <div class="cal_select">
                                        <input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value=""> <span class="tilde">~</span>
                                        <input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger"	placeholder="" value="">
                                    </div>
                                </div>
                            </td>
                        </tr>							
                        <tr>
                            <th>검색조건</th>
                            <td>
                                <div class="radio_box">
                                    <input type="radio" name="check" value="login_id" class="input_checkbox" id="login_id"  checked> <label for="login_id">상점ID</label>
                                </div> 
                                <div class="radio_box">
                                    <input type="radio" name="check" value="ip" class="input_checkbox" id="ip">
                                    <label for="ip">IP</label>
                                </div> 
                                <div class="radio_box">
                                    <input type="radio" name="check" value="action" class="input_checkbox" id="action">
                                    <label for="action">기능</label>
                                </div>
                                <div class="radio_box">
                                    <input type="radio" name="check" value="url" class="input_checkbox" id="url">
                                    <label for="url">URL</label>
                                </div>
                                <div class="radio_box">
                                    <input type="radio" name="check" value="login" class="input_checkbox" id="login">
                                    <label for="login">로그인</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>검색어</th>
                            <td>
                                <input class="w370" type="text" name="searchKeyword" placeholder="" id="searchKeyword" onkeyup="enterkey()">
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:log_data();" class="dark_full_btn">검색</a>
                </div>
            </form>
        </div>

        <div class="layout_wrap" id="log_data"></div>
        
    </div>




