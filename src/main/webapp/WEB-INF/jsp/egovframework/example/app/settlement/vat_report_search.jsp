<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no, address=no, email=no" />
        <meta content="gngpayment" name="Title" />
        <meta content="gngpayment" name="Description" />
        <meta content="gngpayment" name="Keyword" />
        <meta property="og:title" content="gngpayment"  />
        <meta property="og:description" content="gngpayment"  />
        <meta property="og:url" content="http://gmgadmin.cafe24.com/">
        <link rel="shortcut icon" href="/img/favicon.ico">
        <meta property="og:image" content="/img/kakaotalk_img.png">
        
        <link href="/app/css/reset.css" rel="stylesheet" type="text/css"/>
        <link href="/app/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="/app/css/style.css" rel="stylesheet" type="text/css"/>
        
        <script src="/app/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="/app/vendor/jquery-ui.min.js" type="text/javascript"></script>
        <script src="/js/jquery.validate.min.js"></script>
        <script src="/js/messages_ko.min.js"></script>
        <script src="/app/js/script.js" type="text/javascript"></script>
        <script src="/js/selectBox.js"></script>
        
        <title>gmgpayment</title>
    </head>
    <body>
    <div id="wrap">
            
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
                                <tr>
                                    <th>사업자번호</th>
                                    <td>
                                        <input type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th>거래형태</th>
                                    <td>
                                        <div class="radio_box">
                                            <ul>
                                                <li>
                                                    <input type="radio" name="transaction" value="" class="input_checkbox" id="sales">
                                                    <label for="sales">매출</label>
                                                </li>
                                                <li>
                                                    <input type="radio" name="transaction" value="" class="input_checkbox" id="purchase">
                                                    <label for="purchase">매입</label>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="join_date">
                                    <th>조회기간</th>
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
                            </tbody>
                        </table>
                        <div class="send_btn">
                            <button class="btn-active" type="button" onclick="settlement_all_data();">내역조회</button>
                            <button class="btn-default" type="reset" onclick="settlement_all_init();">초기화</button>
                        </div>
                    </fieldset>
                </form>
            </div>
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
    
    
            
        </div>
    </body>
</html>

