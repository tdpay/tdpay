<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/app/js/settlement_his_search.js"></script>

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
                            <tr>
                                <th>상점</th>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>
                            <tr class="join_date">
                                <th>조회기간</th>
                                <td>
                                    <div class="select_date">
                                        <div class="input_box">
                                            <input readonly class="date_form" type="text" id="start_datetime" name="start_datetime">
                                            <span>~</span>
                                            <input readonly class="date_form" type="text" id="end_datetime" name="end_datetime">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- tr>
                                <th>지불수단</th>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>결과보기</th>
                                <td>
                                    <div class="radio_box">
                                        <div>
                                            <input id="result_all" type="radio" name="result_see" checked>
                                            <label for="result_all">전체</label>
                                        </div>
                                        <div>
                                            <input id="result_pay" type="radio" name="result_see">
                                            <label for="result_pay">통합지불수단</label>
                                        </div>
                                    </div>
                                </td>
                            </tr-->
                            <tr>
                                <th>터미널 ID</th>
                                <td>
                                    <input type="text" name="terminalid" id="terminalid">
                                </td>
                            </tr>
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <input type="text" name="commission" id="commission">
                                </td>
                            </tr>
                            <tr>
                                <th>부가세</th>
                                <td>
                                    <select class="tax_select" name="tax" id="tax">
                                        <option value="">선택</option>
                                        <option value="Y">발행</option>
                                        <option value="N">미발행</option>
                                    </select>
                                    <select class="tax_ok" name="tex2"  id="tex2" style="display:none;">
                                        <option value="">선택</option>
										<option value="N">발행대기</option>
										<option value="Y">발행완료</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active" type="button" onclick="settlement_his_data();">내역조회</button>
                        <button class="btn-default" type="reset" onclick="settlement_his_init();">초기화</button>
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
