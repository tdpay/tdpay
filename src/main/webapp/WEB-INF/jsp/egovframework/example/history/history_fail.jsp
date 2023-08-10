<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <script>
    var view_type_s = '<c:out value="${view_type}" />';
    
    $(function() {	
    <c:choose>
	    <c:when test="${sessionScope.role_id eq '1001'}">
		    getOption('#roleStore', 'high_store_id', '', '');
		    $('#roleStore').click(function(){
		    	getOption2('#roleStore2', 'high_store_list', $('#roleStore').val(),'N', '');
		   	});
	    </c:when>
	    <c:when test="${sessionScope.role_id eq '1002'}">
	    	getOption2('#roleStore2', 'high_store_list', '${sessionScope.login_id}','N', '${searchHistoryVO.roleStore2}');
	    </c:when>
	    <c:when test="${sessionScope.role_id eq '1003'}">
	    	getOption2('#roleStore2', 'high_store_id3', '${sessionScope.login_id}','N', '${searchHistoryVO.roleStore2}');
	    </c:when>
	    <c:otherwise>
	    </c:otherwise>
    </c:choose>
	});    
    </script>
    
    <script src="/js/jquery.number.js"></script>
    <script src="/js/history_fail.js"></script>
    <script src="/js/table.js"></script>
    

	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>승인실패조회(단말기 제외)</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm1" id="frm1"  method="post" action="" target="">
                <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
                <input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">			
                <input type="hidden" name="day_type" id="day_type" value="" /> 	
                <input type="hidden" name="order_id" id="order_id" value=""/>				
                <input type="hidden" name="order_no" id="order_no" value="1"/>							
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
                                        <button class="${searchHistoryVO.day_type eq 'day' ?'active':''}" type="button" id="day" onclick="today('day');">오늘</button>
                                        <button class="${searchHistoryVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                        <button class="${searchHistoryVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                        <button class="${searchHistoryVO.day_type eq 'month3' ?'active':''}" type="button" id="month1" onclick="prevMonth('3','month3');">3개월</button>
                                        <button class="${searchHistoryVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                        <button class="${searchHistoryVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button>
                                    </div>
                                    <div class="cal_select">
                                        <input type="text" id="start_datetime" name="start_datetime" class="w140 date_form ui-datepicker-trigger" placeholder="" value="${searchHistoryVO.start_datetime}"> 
                                        <span class="tilde">~</span>
                                        <input type="text" id="end_datetime" name="end_datetime" class="w140 date_form ui-datepicker-trigger"	placeholder="" value="${searchHistoryVO.end_datetime}">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th>거래금액</th>
                            <td>
                                <input class="w180" type="text" name="amount1" placeholder="" id="amount1" value="${searchHistoryVO.amount1}">
                                <span class="tilde">~</span>
                                <input class="w180" type="text" name="amount2" placeholder="" id="amount2" value="${searchHistoryVO.amount2}">
                            </td>
                        </tr> -->
                        <tr>
                            <th>카드번호</th>
                            <td>
                                <input class="w180" type="text" name="cardno" placeholder="" id="cardno" value="${searchHistoryVO.cardno}">
                            </td>
                            <th>할부구분</th>
                            <td>
                                <select class="w180" name="quota" placeholder="" id="quota">
                                    <option value="">전체</option>
                                    <c:forEach var="i" begin="0" end="12">
                                        <c:choose>
                                            <c:when test="${i == 0}">
                                                <option value="00">일시불</option>
                                            </c:when>
                                            <c:when test="${i < 10 && i > 1}">
                                                <option value="0<c:out value="${i}" />" ${searchHistoryVO.quota eq i ? 'selected':''}>0<c:out value="${i}" /></option>
                                            </c:when>
                                            <c:when test="${i >= 10}">
                                                <option value="<c:out value="${i}" />" ${searchHistoryVO.quota eq i ? 'selected':''}><c:out value="${i}" /></option>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </td>								
                        </tr>
                        <tr>
                            <th>구매자명</th>
                            <td>
                                <input class="w180" type="text" name="username" placeholder="" id="username" value="${searchHistoryVO.username}">
                            </td>
                            <th>상점주문번호</th>
                            <td>
                                <input class="w180" type="text" name="orderno" placeholder="" id="orderno" value="${searchHistoryVO.orderno}">
                            </td>								
                        </tr>
                        <tr>
                        
                        <c:choose>
                            <c:when test="${sessionScope.role_id eq '1001'}">
                                <th>영업대행/대리점</th>
                                <td>
                                    <select class="w110" name="roleStore" placeholder="" id="roleStore">
                                        <option value="">전체</option>
                                    </select> 
                                    <select class="w110" name="roleStore2" placeholder="" id="roleStore2">
                                        <option>선택</option>
                                    </select> 
                                </td>
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1002'}">
                                <th>대리점</th>
                                <td>
                                    <select class="w110" name="roleStore2" placeholder="" id="roleStore2">
                                        <option>선택</option>
                                    </select> 
                                </td>
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1003'}">
                                <th>가맹점</th>
                                <td>
                                    <select class="w110" name="roleStore3" placeholder="" id="roleStore3">
                                        <option>선택</option>
                                    </select> 
                                </td>
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="roleStore3" id="roleStore3" value="<c:out value="${sessionScope.login_id}" />">
                            </c:otherwise>
                        </c:choose>		
                            <th>상태</th>
                            <td>
                                <select class="w180" name="state" placeholder="" id="state">
                                    <option value="">선택</option>
                                    <option value="Y" value="${searchHistoryVO.state eq 'Y'? 'selected':''}">사용</option>
                                    <option value="N" value="${searchHistoryVO.state eq 'Y'? 'selected':''}">중지</option>
                                </select>
                            </td>									
                        </tr>
                        <tr>
                            <th>결제종류</th>
                            <td>
                                <select class="w180" name="cp_type" placeholder="" id="cp_type">
                                    <option value="1" ${searchHistoryVO.cp_type eq '1' ?'selected':''}>페이조아</option>
                                    <option value="2" ${searchHistoryVO.cp_type eq '2' ?'selected':''}>케이에스넷</option>
                                </select>
                            </td>							
                        </tr>								
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:history_fail_data();" class="dark_full_btn">내역조회</a> 
                    <a href="javascript:history_fail_init();" class="gray_line_btn">초기화</a>							
            </div>
            </form>
        </div>
        
        <div class="layout_wrap">
            <div class="list_ttl">
                <span class="total"><strong id="dataCnt"></strong></span>
                <div class="view_box">
                        <!-- button type="button" class="all_cancel_btn">전체취소</button>
                        <button type="button" class="part_cancel_btn">부분취소</button-->
                    <button class="excel_btn" onclick="doExcelDownload();">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                    <select class="w180" name="pageUnit" id="pageUnit">
                        <option value="200" ${searchHistoryVO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
                        <option value="100" ${searchHistoryVO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
                        <option value="50"  ${searchHistoryVO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
                        <option value="20"  ${searchHistoryVO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
                        <option value="10"  ${searchHistoryVO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
                    </select>
                </div>				 
            </div>
            
            <div id="history_fail_data"></div>
        </div>
    </div>

    <div class="popup_wrap">
        <div class="popup popup_detail">
            <div class="popup_head">
                <strong class="popup_ttl">정산정보</strong>
                <a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기"></a>
            </div>
            <div class="popup_body">
                <div class="popup_inner">
                    <div class="inner_bottom">
                        <div class="form_layout detail_layout">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>
                                            <label for="">총결제금액
    </th>
                                        <td>805,000원</td>
                                        <th>
                                            <label for="">승인건
    </th>
                                        <td>89건</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label for="">취소금액
    </th>
                                        <td>-14,635,000원</td>
                                        <th>
                                            <label for="">취소건
    </th>
                                        <td>80건</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="table_layout">
                            <table>
                                <caption>지엠지페이먼트</caption>
                                <thead>
                                    <tr>
                                        <th>상점ID</th>
                                        <th>요청금액</th>
                                        <th>승인일자</th>
                                        <th>취소일자</th>
                                        <th>구매자</th>
                                        <th>신용카드금액(원)</th>
                                        <th>수수료</th>
                                        <th>수수료 제외 금액</th>
                                        <th>카드계열</th>
                                        <th>승인번호</th>
                                        <th>할부개월수</th>
                                        <th>주문번호</th>
                                        <th>터미널ID</th>
                                        <th>매출전표</th>
                                        <th>고객이름</th>
                                        <th>고객전화번호</th>
                                        <th>영업대행</th>
                                        <th>대리점</th>
                                        <th>가맹점</th>
                                        <th>취소금액</th>
                                        <th>지급일</th>
                                    </tr>
                                </thead>
                                <tbody class="">
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                            
                                    <tr>
                                        <td>GP21062901</td>
                                        <td>55,000원</td>
                                        <td>2021.07.05</td>
                                        <td>2021.07.10</td>
                                        <td>김제</td>
                                        <td>55,000원</td>
                                        <td>3.50%</td>
                                        <td>1925원</td>
                                        <td>하나카드</td>
                                        <td>6429501</td>
                                        <td>03</td>
                                        <td>20210705155226</td>
                                        <td></td>
                                        <td>Y</td>
                                        <td>김제</td>
                                        <td>01075842350</td>
                                        <td>지엠지페이먼트</td>
                                        <td>지엠지페이먼트</td>
                                        <td>주식회사 채널</td>
                                        <td>55,000원</td>
                                        <td>D+5</td>
                                    </tr>                       
                                </tbody>
                            </table>
                        </div>
                        <div class="paging">
                            <ul class="pager_btn">
                                <li class="on"><a href="javascript:1">1</a></li>
                                <li><a href="#!" title="Go to page 2">2</a></li>
                                <li><a href="#!" title="Go to page 3">3</a></li>
                                <li><a href="#!" title="Go to page 4">4</a></li>                   
                            </ul>
                        </div>
                        <div class="btn_box">
                            <a href="#!" class="a_btn a_btn_blue pop_close_btn">확인</a>
                        </div>					
                    </div>				
                </div>
            </div>
        </div>
        <div class="dim"></div>
    </div>
    <!-- //container -->


