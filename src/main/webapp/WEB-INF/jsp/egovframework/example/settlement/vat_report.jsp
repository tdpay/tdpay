<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<script src="/js/vat_report.js"></script>
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
</script>	

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
	<c:set var="sysMm"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
    <div class="inner">
        <div class="ttl_box">
            <h2>부가세신고자료</h2>
        </div>
        <div class="layout_wrap">
            <form name="" id="" method="get" action="" target="">
            <input type="hidden" id="pageUnit" name="pageUnit" value="20">
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <!-- <tr>
                            <th>사업자번호</th>
                            <td>
                                <input class="w240" type="text" id="corp_regist_num" name="corp_regist_num">
                            </td>								
                        </tr> -->
                        <tr>
                            <th>조회년도/월</th>
                            <td>
                                <select class="w110" name="yyyy" placeholder="" id="yyyy">
                                    <c:forEach var="i" begin="2021" end="${sysYear}">
                                        <option value="<c:out value="${i}" />" <c:out value="${i eq sysYear ?'selected':''}" />><c:out value="${i}" /></option>
                                    </c:forEach>											
                                </select>
                                <select class="w180" name="mm" placeholder="" id="mm">
                                    <c:forEach var="i" begin="0" end="12">
                                        <c:choose>
                                            <c:when test="${i < 10 && i > 0}">
                                                <option value="0<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />>0<c:out value="${i}" /></option>
                                            </c:when>
                                            <c:when test="${i >= 10}">
                                                <option value="<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />><c:out value="${i}" /></option>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>											
                                </select>										
                            </td>								
                        </tr>
                        <!-- <tr>
                            <th>조회기간</th>
                            <td>
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
                                        <input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.start_datetime}">
                                        <span class="tilde">~</span>
                                        <input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchSettlementVO.end_datetime}">
                                    </div>
                                </div>
                            </td>
                        </tr> -->
                    </tbody>
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                </table>
                <div class="btn_box">
                    <a href="javascript:vat_report_data();" class="dark_full_btn">내역조회</a> 
                    <a href="javascript:vat_report_init();" class="gray_line_btn">초기화</a>
                </div>
            </form>
        </div>
        
        <div class="layout_wrap">
            <div class="form_info">
                <ul>
                    <li>* 제공하는 부가세 신고자료는 지엠지페이먼트 결제시스템 이용내역 기준으로 작성 된 자료이며, 참고자료로 이용 부탁드립니다.</li>
                    <li>* 국세청 홈택스(www.hometax.go.kr) 사이트에서 별도로 추가 확인하여, 세무서 신고 시 매입/매출 내역이 누락되지 않도록 주의하시기 바랍니다.</li>
                    <li>* 집계기준
                        <ul>
                            <li>- 신용카드, 계좌이체, 상품권, 휴대폰, 폰빌결제 : 승인일(거래일)기준</li>
                            <li>- 가상계좌 : 입금일 기준</li>
                            <li>- 현금영수증 : 발행일 기준</li>
                        </ul>
                    </li>
                    <li>* 모든 내역은 [승인-취소] 기준으로 제공되며, 부분취소의 경우 금액만 마이너스 계산 됩니다.</li>
                </ul>
            </div>
        </div>
        
        <div class="layout_wrap">
            <div class="list_ttl">
                <h3>* 신용카드 <span>(가맹점 매출 세금계산서)</span></h3>
                <div class="view_box">
                    <button class="excel_btn" onclick="doExcelDownload1();">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                </div>					
            </div>
            <div id="vat_report1_data"></div>
        </div>

        <div class="layout_wrap">
            <div class="list_ttl">
                <h3>* 신용카드 <span>(대리점 매입 세금계산서)</span></h3>
                <div class="view_box">
                    <button class="excel_btn" onclick="doExcelDownload2();">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                </div>
            </div>
            <div id="vat_report2_data"></div>
        </div>

        <div class="layout_wrap">
            <div class="list_ttl">
                <h3>* 신용카드 <span>(영업대행 매입 세금계산서)</span></h3>
                <div class="view_box">
                    <button class="excel_btn" onclick="doExcelDownload3();">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                </div>
            </div>
            <div id="vat_report3_data"></div>
        </div>
    </div>
                            


