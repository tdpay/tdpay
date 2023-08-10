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
	    	getOption2('#roleStore2', 'high_store_list', '${sessionScope.login_id}','N', '${searchManage2VO.roleStore2 }');
	    </c:when>
	    <c:when test="${sessionScope.role_id eq '1003'}">
	    	getOption2('#roleStore2', 'high_store_id3', '${sessionScope.login_id}','N', '${searchManage2VO.roleStore }');
	    </c:when>
	    <c:otherwise>
	    </c:otherwise>
    </c:choose>
	});    
    </script>	
    
    <script src="/js/jquery.number.js"></script>
    <script src="/js/manage2.js"></script>
    <script src="/js/table.js"></script>

	<script>
	</script>

	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>가맹점관리</h2>
            <c:if test="${sessionScope.role_id eq '1001'}">
            <a href="/manage2/manage2_register.do" class="link_reg">가맹점등록</a>
            </c:if>
        </div>
        <div class="layout_wrap">
            <form name="frm1" id="frm1"  method="post" action="" target="">
            <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.role_id eq '1002'? sessionScope.login_id:''}">
            <input type="hidden" name="high_store_id2" id="high_store_id2" value="${sessionScope.role_id eq '1003'? sessionScope.login_id:''}">
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>가입일자</th>
                            <td colspan="3">
                                <div class="input_date">
                                    <div class="period_select">
                                        <button class="${searchManage2VO.day_type eq 'day' ?'active':''}" type="button" id="day" onclick="today('day');">오늘</button>
                                        <button class="${searchManage2VO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                        <button class="${searchManage2VO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                        <button class="${searchManage2VO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month3');">3개월</button>
                                        <button class="${searchManage2VO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                        <button class="${searchManage2VO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
                                    </div>
                                    <div class="cal_select">
                                        <input type="text" id="start_datetime" name="start_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchManage2VO.start_datetime }">
                                        <span class="tilde">~</span>
                                        <input type="text" id="end_datetime" name="end_datetime" class="width_150 date_form ui-datepicker-trigger" placeholder="" value="${searchManage2VO.end_datetime }">                                        
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>상점ID</th>
                            <td>
                                <input class="w180" type="text" name="store_id" placeholder="" id="store_id" value="${searchManage2VO.store_id }">
                            </td>
                            <th>상점명</th>
                            <td>
                                <input class="w180" type="text" name="business_nm" placeholder="" id="business_nm" value="${searchManage2VO.business_nm }">
                            </td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>
                                <input class="w180" type="tel" name="tel" placeholder="" id="tel" value="${searchManage2VO.tel }">
                            </td>
                            <th>이메일</th>
                            <td>
                                <select class="w110" name="searchKeyword1" placeholder="" id="searchKeyword1">
                                    <option value="total" ${searchManage2VO.searchKeyword1 eq 'total' ?'selected':''}>전체</option>
                                    <option value="email" ${searchManage2VO.searchKeyword1 eq 'email' ?'selected':''}>대표</option>
                                    <option value="person_email1" ${searchManage2VO.searchKeyword1 eq 'person_email1' ?'selected':''}>계약담당자</option>
                                    <option value="person_email2" ${searchManage2VO.searchKeyword1 eq 'person_email2' ?'selected':''}>정산담당자</option>
                                    <option value="person_email3" ${searchManage2VO.searchKeyword1 eq 'person_email3' ?'selected':''}>기술담당자</option>
                                </select>								
                                <input class="w180" type="tel" name="email" placeholder="" id="email" value="${searchManage2VO.email }">
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td>
                                <select class="w110" name="searchKeyword2" placeholder="" id="searchKeyword2">
                                    <option value="total" ${searchManage2VO.searchKeyword2 eq 'total' ?'selected':''}>전체</option>
                                    <option value="phone_num" ${searchManage2VO.searchKeyword2 eq 'phone_num' ?'selected':''}>대표</option>
                                    <option value="person_phone1" ${searchManage2VO.searchKeyword2 eq 'person_phone1' ?'selected':''}>계약담당자</option>
                                    <option value="person_phone2" ${searchManage2VO.searchKeyword2 eq 'person_phone2' ?'selected':''}>정산담당자</option>
                                    <option value="person_phone3" ${searchManage2VO.searchKeyword2 eq 'person_phone3' ?'selected':''}>기술담당자</option>
                                </select>								
                                <input class="w180" type="text" name="phone_num" placeholder="" id="phone_num" value="${searchManage2VO.phone_num }">
                            </td>
                            <th>이름</th>
                            <td>
                                <select class="w110" name="searchKeyword" placeholder="" id="searchKeyword">
                                    <option value="">선택</option>
                                    <option value="ceo" ${searchManage2VO.searchKeyword eq 'ceo' ? 'selected':'' }>대표</option>
                                    <option value="person_nm" ${searchManage2VO.searchKeyword eq 'person_nm' ? 'selected':'' }>담당자</option>
                                </select> <input class="w180" type="tel" name="person_nm" placeholder="" id="person_nm" value="${searchManage2VO.person_nm }">
                            </td>
                        </tr>
                        <c:choose>
                            <c:when test="${sessionScope.role_id eq '1001'}">
                                <tr>
                                    <th>영업대행/대리점</th>
                                    <td colspan="3">
                                        <select class="w110" name="roleStore" placeholder="" id="roleStore">
                                            <option value="">전체</option>
                                        </select> 
                                        <select class="w110" name="roleStore2" placeholder="" id="roleStore2">
                                            <option>선택</option>
                                        </select> 
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${sessionScope.role_id eq '1002'}">
                                <tr>
                                    <th>대리점</th>
                                    <td colspan="3">
                                        <select class="w110" name="roleStore2" placeholder="" id="roleStore2">
                                            <option>선택</option>
                                        </select> 
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <th>가맹점</th>
                                    <td colspan="3">
                                        <select class="w110" name="roleStore2" placeholder="" id="roleStore2">
                                            <option>선택</option>
                                        </select> 
                                    </td>
                                </tr>								    
                            </c:otherwise>
                        </c:choose>	
                        <tr>
                            <th>ID검색</th>
                            <td>
                                <select class="w110" name="search_id" placeholder="" id="search_id">
                                    <option value="">선택</option>
                                    <option value="cpid" ${searchManage2VO.search_id eq 'cpid' ?'selected':''}>CPID</option>
                                    <option value="terminal_id" ${searchManage2VO.search_id eq 'terminal_id' ?'selected':''}>터미널ID</option>
                                    <option value="imei" ${searchManage2VO.search_id eq 'imei' ?'selected':''}>단말기번호</option>
                                </select>
                                <input class="w180" type="tel" name="search_nm" placeholder="" id="search_nm" value="${searchManage2VO.search_nm}">
                            </td>
                            <th>상태</th>
                            <td>
                                <select class="w180" name="state" placeholder="" id="state">
                                    <option value="">선택</option>
                                    <option value="Y" ${searchManage2VO.state eq 'Y' ?'selected':''}>사용</option>
                                    <option value="N" ${searchManage2VO.state eq 'N' ?'selected':''}>미사용</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>정산주기</th>
                            <td>
                                <select class="w180" name="period" placeholder="" id="period">
                                    <option value="" ${searchManage2VO.period eq '' ?'selected':''}>선택</option>
                                    <c:forEach var="i" begin="0" end="29">
                                        <option value="<c:out value="${i}" />" ${searchManage2VO.period ne '' && searchManage2VO.period eq i ?'selected':''}>D+<c:out value="${i}" /></option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th>세금계산서</th>
                            <td>
                                <select class="w180"	name="tax" placeholder="" id="tax">
                                    <option value="">선택</option>
                                    <option value="Y" ${searchManage2VO.tax eq 'Y' ?'selected':''}>발행</option>
                                    <option value="N" ${searchManage2VO.tax eq 'N' ?'selected':''}>미발행</option>
                                </select>
                            </td>
                        </tr>
                        <!--  tr>
                            <th>수수료</th>
                            <td>
                                <input class="w180" type="tel" name="commission" placeholder="" id="commission" value="${searchManage2VO.commission }">
                            </td>
                            <th>정산방식td>
                            <td="input_desc">
                                <select class="w180" name="" id="">
                                    <option value="">선택</option>
                                    <option value="">일반정산</option>
                                    <option value="">직접정산</option>
                                </select>
                            </td>
                        </tr -->								
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="javascript:manage2_data();" class="dark_full_btn">내역조회</a> 
                    <a href="javascript:manage2_init();" class="gray_line_btn">초기화</a>
                </div>
                <input type="hidden" name="role_id" id="role_id" value="1004" /> 		
                <input type="hidden" name="day_type" id="day_type" value="" /> 		
                <input type="hidden" name="order_id" id=order_id value=""/>				
                <input type="hidden" name="order_no" id=order_no value=""/>	
            </form>
        </div>

        <div class="layout_wrap">
            <div class="list_ttl">
                <span class="total"><strong id="dataCnt"></strong></span>
                <div class="view_box">
                    <button class="excel_btn" onclick="doExcelDownload();">
                        <img src="../img/ico/ico_excel.png" alt="">엑셀다운로드
                    </button>
                    <select class="w180" name="pageUnit" id="pageUnit">
                        <option value="200" ${searchManage2VO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
                        <option value="100" ${searchManage2VO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
                        <option value="50"  ${searchManage2VO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
                        <option value="20"  ${searchManage2VO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
                        <option value="10"  ${searchManage2VO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
                    </select>
                </div>				
            </div>
            <div id="manage2_data"></div>
        </div>
        
    </div>

