<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <script>
    $(function() {	
    <c:choose>
	    <c:when test="${sessionScope.role_id eq '1001'}">
		    getOption('#roleStore', 'high_store_id', '', '');
		    $('#roleStore').click(function(){
		    	getOption2('#roleStore2', 'high_store_list', $('#roleStore').val(),'N', '');
		   	});
	    </c:when>
	    <c:when test="${sessionScope.role_id eq '1002'}">
	    	getOption2('#roleStore2', 'high_store_list', '${sessionScope.login_id}','N', '');
	    </c:when>
	    <c:when test="${sessionScope.role_id eq '1003'}">
	    	getOption2('#roleStore3', 'high_store_id3', '${sessionScope.login_id}','N', '');
	    </c:when>
	    <c:otherwise>
	    </c:otherwise>
    </c:choose>
    });    
    </script>
<script src="/app/js/history_all_search.js"></script>

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
                                <th>거래금액</th>
                                <td>
                                    <div class="input_box_pay">
                                        <input type="text" name="amount1" id="amount1">
                                        <span>~</span>
                                        <input type="text" name="amount2" id="amount2">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>카드종류</th>
                                <td>
									<select name="cardcode"  id="cardcode">
										<option value="">전체</option>
									</select>                                
                                </td>
                            </tr>
                            <tr>
                                <th>카드번호</th>
                                <td>
                                    <input type="text" name="cardno" id="cardno">
                                </td>
                            </tr>
                            <tr>
                                <th>거래상태</th>
                                <td>
                                    <select name="dealing_yn" id="dealing_yn">
                                        <option value="">전체</option>
                                        <option value="Y">결제취소</option>
                                        <option value="N">결제완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>구매자명</th>
                                <td>
                                    <input type="text" name="username" id="username">
                                </td>
                            </tr>
                            <tr>
                                <th>할부구분</th>
                                <td>
									<select name="quota" id="quota">
										<option value="">전체</option>
                                           <c:forEach var="i" begin="0" end="12">
											<c:choose>
												<c:when test="${i == 0}">
													<option value="00">일시불</option>
												</c:when>
												<c:when test="${i < 10 && i > 1}">
													<option value="0<c:out value="${i}" />">0<c:out value="${i}" /></option>
												</c:when>
												<c:when test="${i >= 10}">
													<option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
												</c:when>
											</c:choose>
										</c:forEach>											
									</select>
                                </td>
                            </tr>
                            <tr>
							    <c:choose>
								    <c:when test="${sessionScope.role_id eq '1001'}">
		                                <th>영업대행/대리점</th>
		                                <td>
											<select name="roleStore" id="roleStore">
												<option value="">전체</option>
											</select> 
											<select name="roleStore2" id="roleStore2">
												<option value="">선택</option>
											</select> 
		                                </td>								    
								    </c:when>
								    <c:when test="${sessionScope.role_id eq '1002'}">
		                                <th>대리점</th>
		                                <td>
											<select name="roleStore2" id="roleStore2">
												<option value="">선택</option>
											</select> 
		                                </td>
								    </c:when>
								    <c:when test="${sessionScope.role_id eq '1003'}">
		                                <th>가맹점</th>
		                                <td>
											<select name="roleStore3" id="roleStore3">
												<option value="">선택</option>
											</select> 
		                                </td>
								    </c:when>
								    <c:otherwise>
		                                <input type="hidden" name="roleStore3" id="roleStore3" value="${sessionScope.login_id}">						    
								    </c:otherwise>
							    </c:choose>		
                            </tr>
                            <tr>
                                <th>상점주문번호</th>
                                <td>
                                    <input type="text" name="orderno" id="orderno">
                                </td>
                            </tr>
                            <tr>
                                <th>ID검색/상점명</th>
                                <td>
                                    <select name="search_id" id="search_id">
										<option value="">선택</option>
										<option value="store_id">상점아이디</option>
										<option value="business_nm">상점명</option>
										<option value="cpid">CPID</option>
										<option value="terminal_id">터미널ID</option>
										<option value="imei">단말기번호</option>
									</select>
                                    <input type="text" name="search_nm" id="search_nm">
                                </td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td>
									<select name="state" id="state">
										<option value="">선택</option>
										<option value="Y">사용</option>
										<option value="N">중지</option>
									</select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active" onclick="history_all_data();" type="button">내역조회</button>
                        <button class="btn-default" onclick="history_all_init();" type="reset">초기화</button>
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
    });

</script>

