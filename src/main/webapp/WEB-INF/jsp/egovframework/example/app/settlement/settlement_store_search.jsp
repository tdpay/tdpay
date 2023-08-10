<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<script src="/app/js/settlement_all_search.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>상세검색</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
            <form name="frm" id="frm" action="" method="post">
                <fieldset>
                    <table>
                        <tbody>
                            <tr class="join_date">
                                <th>거래일자</th>
                                <td>
                                    <div class="select_date">
                                        <ul>
                                            <li id="day" onclick="today();">오늘</li>
                                            <li id="week" onclick="prevDay('7');">1주일</li>
                                            <li id="month1" onclick="prevMonth('1');">1개월</li>
                                            <li id="month3" onclick="prevMonth('3');">3개월</li>
                                            <li id="month6" onclick="prevMonth('6');">6개월</li>
                                            <li id="year" onclick="prevMonth('12');">1년</li>
                                        </ul>
                                        <div class="input_box">
                                            <input id="start_datetime" name="start_datetime" class="date_form ui-datepicker-trigger" type="text">
                                            <span>~</span>
                                            <input id="end_datetime" name="end_datetime" class="date_form ui-datepicker-trigger" type="text">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>ID검색/상점명</th>
                                <td>
                                    <select name="" id="">
                                        <option value="">선택</option>
                                        <option value="">상점아이디</option>
                                        <option value="">상점명</option>
                                        <option value="">CPID</option>
                                        <option value="">터미널ID</option>
                                    </select>
                                    <input type="text">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active" type="button" onclick="settlement_all_data();">내역조회</button>
                        <button class="btn-default" type="reset" onclick="settlement_all_init();">초기화</button>
                    </div>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

<script>
    function goBack() {
        window.history.back();
    }

    $(function() {
        $( ".date_form" ).datepicker({
            showOn: "both",
            dateFormat: 'yy-mm-dd',
            buttonImageOnly: false,
            dayNames: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
            dayNamesMin: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
        });

        // 부가세 발행 유무
        $('.tax_select').on('change',function(){
            if(this.value == 'Y') {
                $('.tax_ok').show();
            } else {
                $('.tax_ok').hide();
            }
        });
        
    });

</script>

