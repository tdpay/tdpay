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
   	getOption2('#roleStore2', 'high_store_id3', '${sessionScope.login_id}','N', '');
   </c:when>
   <c:otherwise>
   </c:otherwise>
  </c:choose>
});    
</script>	
<script src="/app/js/manage2_search.js"></script>
    
<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>상세검색</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
			<form name="frm1" id="frm1"  method="post" action="" target="">
			<input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
			<input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">  
                <fieldset>
                    <table>
                        <tbody>
                            <tr class="join_date">
                                <th>가입일자</th>
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
                                <th>상점ID</th>
                                <td>
                                    <input type="text" name="store_id" placeholder="" id="store_id">
                                </td>
                            </tr>
                            <tr>
                                <th>상점명</th>
                                <td>
                                    <input type="text" name="business_nm" placeholder="" id="business_nm">
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
	                                <select name="searchKeyword1" placeholder="" id="searchKeyword1">
										<option value="total">전체</option>
										<option value="email">대표</option>
										<option value="person_email1">계약담당자</option>
										<option value="person_email2">정산담당자</option>
										<option value="person_email3">기술담당자</option>
									</select>    
								<input type="email" name="email" placeholder="" id="email">	
                                </td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>
                                    <input type="tel" name="tel" placeholder="" id="tel">
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰</th>
                                <td>
									<select name="searchKeyword2" placeholder="" id="searchKeyword2">
										<option value="total">전체</option>
										<option value="phone_num">대표</option>
										<option value="person_phone1">계약담당자</option>
										<option value="person_phone2">정산담당자</option>
										<option value="person_phone3">기술담당자</option>
									</select>	                                
                                    <input type="tel" name="phone_num" placeholder="" id="phone_num">
                                </td>
                            </tr>
                            <tr>
                                <th>영업대행/대리점</th>
                                <td>
							    <c:choose>
								    <c:when test="${sessionScope.role_id eq '1001'}">
										<select name="roleStore" placeholder="" id="roleStore">
											<option value="">전체</option>
										</select> 
										<select name="roleStore2" placeholder="" id="roleStore2">
											<option>선택</option>
										</select> 
								    </c:when>
								    <c:when test="${sessionScope.role_id eq '1002'}">
										<select  name="roleStore2" placeholder="" id="roleStore2">
											<option>선택</option>
										</select> 
								    </c:when>
								    <c:otherwise>
										<select name="roleStore2" placeholder="" id="roleStore2">
											<option>선택</option>
										</select> 
								    </c:otherwise>
							    </c:choose>	         
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>
                                    <select name="searchKeyword" id="searchKeyword">
                                        <option value="">선택</option>
                                        <option value="ceo">대표</option>
                                        <option value="person_nm">담당자</option>
                                    </select>
                                    <input type="text" name="person_nm" placeholder="" id="person_nm">
                                </td>
                            </tr>
                            <tr>
                                <th>ID검색</th>
                                <td>
                                    <select name="search_id" id="search_id">
                                        <option value="">선택</option>
                                        <option value="cpid">CPID</option>
                                        <option value="terminal_id">터미널ID</option>
                                        <option value="imei">단말기번호</option>
                                    </select>
                                    <input type="text" name="search_nm" placeholder="" id="search_nm">
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
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <input type="tel" name="commission" placeholder="" id="commission">
                                </td>
                            </tr>                             
                            <tr>
                                <th>세금계산서 발행</th>
                                <td>
                                     <select name="tax" id="tax">
                                         <option value="">선택</option>
                                         <option value="Y">발행</option>
                                         <option value="N">미발행</option>
                                     </select>
                                </td>
                            </tr>                             
                            <tr>
                                <th>정산주기</th>
                                <td>
                                    <select name="period"  id="period">
                                        <option value="">선택</option>
                                        <c:forEach var="i" begin="0" end="29">
                                         <option value="<c:out value="${i}" />">D+<c:out value="${i}" /></option>
										</c:forEach>
                                    </select>
                                </td>
                            </tr>                             
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button onclick="manage2_data();" class="btn-active" type="button">내역조회</button>
                        <button onclick="manage2_init();" class="btn-default" type="reset">초기화</button>
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

