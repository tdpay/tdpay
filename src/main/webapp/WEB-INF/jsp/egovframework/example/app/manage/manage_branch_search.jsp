<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
    <c:choose>
	    <c:when test="${sessionScope.role_id eq '1001'}">
		    getOption('#roleStore', 'high_store_id2', '', '');
	    </c:when>
	    <c:otherwise>
		    getOption2('#roleStore', 'high_store_id2','${sessionScope.login_id}', '', '');
	    </c:otherwise>
    </c:choose>
</script>    
<script src="/app/js/manage_branch_search.js"></script>

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
			<input type="hidden" name="role_id" id="role_id" value="1003" />
			<input type="hidden" name="arr_check_id" id="arr_check_id" value="" />            
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
                                <th>영업대행</th>
                                <td>
                                    <select name="roleStore" id="roleStore">
                                    </select>
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
                                <th>상점ID</th>
                                <td>
                                    <input type="tel" name="store_id" placeholder="" id="store_id">
                                </td>
                            </tr>
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <input type="tel" name="commission" placeholder="" id="commission">
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
                        <button onclick="manage_branch_data();" class="btn-active" type="button">내역조회</button>
                        <button onclick="manage_branch_init();" class="btn-default" type="reset">초기화</button>
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

</script>

