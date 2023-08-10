<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	 <script>
	 	var view_type_s = '<c:out value="${view_type}" />';
	 	
/*	 	
	    getOption('#roleStore', 'high_store_id', '', '');
	    $('#roleStore').click(function(){
	    	getOption2('#roleStore2', 'high_store_list', $('#roleStore').val(),'N', '');
	   	});
*/	    
	 </script>	
    <script src="/js/jquery.number.js"></script>
    <script src="/js/manage_all.js"></script>
    <script src="/js/table.js"></script>

	
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>영업대행관리</h2>
            <c:if test="${sessionScope.role_id eq '1001'}">
            <a href="/manage/manage_all_register.do" class="link_reg">영업대행등록</a>
            </c:if>
        </div>
        <div class="layout_wrap">
            <form name="frm1" id="frm1"  method="post" action="" target="">
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
                                        <button class="${searchManageVO.day_type eq 'day' ?'active':''}" type="button" id="day" onclick="today('day');">오늘</button>
                                        <button class="${searchManageVO.day_type eq 'week' ?'active':''}" type="button" id="week" onclick="prevDay('7','week');">1주일</button>
                                        <button class="${searchManageVO.day_type eq 'month1' ?'active':''}" type="button" id="month1" onclick="prevMonth('1','month1');">1개월</button>
                                        <button class="${searchManageVO.day_type eq 'month3' ?'active':''}" type="button" id="month3" onclick="prevMonth('3','month3');">3개월</button>
                                        <button class="${searchManageVO.day_type eq 'month6' ?'active':''}" type="button" id="month6" onclick="prevMonth('6','month6');">6개월</button>
                                        <button class="${searchManageVO.day_type eq 'year' ?'active':''}" type="button" id="year" onclick="prevMonth('12','year');">1년</button> 
                                    </div>
                                    <div class="cal_select">
                                        <input type="text" id="start_datetime" name="start_datetime" class="w140 date_form ui-datepicker-trigger" placeholder="" value="${searchManageVO.start_datetime }">
                                        <span class="tilde">~</span>
                                        <input type="text" id="end_datetime" name="end_datetime" class="w140 date_form ui-datepicker-trigger"	placeholder="" value="${searchManageVO.end_datetime }">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>상점명</th>
                            <td>
                                <input class="w200" type="text" name="business_nm" placeholder="" id="business_nm" value="${searchManageVO.business_nm }">
                            </td>
                            <th>이메일</th>
                            <td>
                                <select class="w110" name="searchKeyword1" placeholder="" id="searchKeyword1">
                                    <option value="total" ${searchManageVO.searchKeyword1 eq 'total' ?'selected':''}>전체</option>
                                    <option value="email" ${searchManageVO.searchKeyword1 eq 'email' ?'selected':''}>대표</option>
                                    <option value="person_email1" ${searchManageVO.searchKeyword1 eq 'person_email1' ?'selected':''}>계약담당자</option>
                                    <option value="person_email2" ${searchManageVO.searchKeyword1 eq 'person_email2' ?'selected':''}>정산담당자</option>
                                    <option value="person_email3" ${searchManageVO.searchKeyword1 eq 'person_email3' ?'selected':''}>기술담당자</option>
                                </select>										
                                <input class="w200" type="email" name="email" placeholder="" id="email" value="${searchManageVO.email }">
                            </td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>
                                <input class="w200" type="tel" name="tel" placeholder="" id="tel" value="${searchManageVO.tel }">
                            </td>
                            <th>휴대폰</th>
                            <td>
                                <select class="w110" name="searchKeyword2" placeholder="" id="searchKeyword2">
                                    <option value="total" ${searchManageVO.searchKeyword2 eq 'total' ?'selected':''}>전체</option>
                                    <option value="phone_num" ${searchManageVO.searchKeyword2 eq 'phone_num' ?'selected':''}>대표</option>
                                    <option value="person_phone1" ${searchManageVO.searchKeyword2 eq 'person_phone1' ?'selected':''}>계약담당자</option>
                                    <option value="person_phone2" ${searchManageVO.searchKeyword2 eq 'person_phone2' ?'selected':''}>정산담당자</option>
                                    <option value="person_phone3" ${searchManageVO.searchKeyword2 eq 'person_phone3' ?'selected':''}>기술담당자</option>
                                </select>										
                                <input class="w140" type="tel" name="phone_num" placeholder="" id="phone_num" value="${searchManageVO.phone_num }">
                            </td>
                        </tr>
                        <tr>
                            <!-- <td>대리점
                            </td>
                            <td class="input_desc">
                            <select class="width_ss" name="roleStore" placeholder="" id="roleStore">
                            </select> 
                            <select class="width_ss" name="roleStore2" placeholder="" id="roleStore2">
                                <option>선택</option>
                            </select> 
                            </td> -->
                            <th>이름</th>
                            <td>
                                <select class="w110" name="searchKeyword" placeholder="" id="searchKeyword">
                                    <option value="">선택</option>
                                    <option value="ceo" ${searchManageVO.searchKeyword eq 'ceo' ?'selected':''}>대표</option>
                                    <option value="person_nm" ${searchManageVO.searchKeyword eq 'person_nm' ?'selected':''}>담당자</option>
                                </select> 
                                <input class="w140" name="person_nm" placeholder="" id="person_nm" value="${searchManageVO.person_nm }">
                            </td>
                            <th>상태</th>
                            <td>
                                <select class="w110"	name="state" placeholder="" id="state">
                                    <option value="">선택</option>
                                    <option value="Y" ${searchManageVO.state eq 'Y' ?'selected':''}>사용</option>
                                    <option value="N" ${searchManageVO.state eq 'N' ?'selected':''}>미사용</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>상점ID</th>
                            <td colspan="3">
                                <input class="w200" type=text name="store_id" placeholder="" id="store_id" value="${searchManageVO.store_id }">
                            </td>
                            <!-- <th>수수료</th>
                            <td>
                                <input class="w200" type="tel" name="commission" placeholder="" id="commission" value="${searchManageVO.commission }">
                                <span class="unit">%</span>
                            </td> -->
                        </tr>							
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:manage_all_data();" class="dark_full_btn">내역조회</a> 
                    <a href="javascript:manage_all_init();" class="gray_line_btn">초기화</a>
                </div>

                <input type="hidden" name="role_id" id="role_id" value="1002" /> 
                <input type="hidden" name="day_type" id="day_type" value="" /> 
                <input type="hidden" name="order_id" id=order_id value=""/>				
                <input type="hidden" name="order_no" id=order_no value=""/>		
            </form>
        </div>

        <div class="layout_wrap" >
            <div class="list_ttl">
                <span class="total"><strong id="dataCnt"></strong></span>
                <div class="view_box">
                    <button class="excel_btn" onclick="doExcelDownload();">
                        <img src="../img/ico/ico_excel.png" alt="" >엑셀다운로드
                    </button>
                    <select class="w180" name="pageUnit" id="pageUnit">
                        <option value="200" ${searchManageVO.pageUnit eq '200' ?'selected':''}>200개씩보기</option>
                        <option value="100" ${searchManageVO.pageUnit eq '100' ?'selected':''}>100개씩보기</option>
                        <option value="50"  ${searchManageVO.pageUnit eq '50' ?'selected':''}>50개씩보기</option>
                        <option value="20"  ${searchManageVO.pageUnit eq '20' ?'selected':''}>20개씩보기</option>
                        <option value="10"  ${searchManageVO.pageUnit eq '10' ?'selected':''}>10개씩보기</option>
                    </select>
                </div>					
            </div>
            <div id="manage_all_data"></div>
        </div>
    </div>