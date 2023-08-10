<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nowDate" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${nowDate}" pattern="yyyy" /></c:set> 
<c:set var="sysMm"><fmt:formatDate value="${nowDate}" pattern="MM" /></c:set> 


<script src="/app/js/calendar2.js"></script>

<div id="nav">
    <div class="inner">
        <nav>
            <select onchange="window.open(value,'_self');" name="" id="">
            <c:forEach var="result" items="${sessionScope.SUBMENU2}" varStatus="status">
				<c:if test="${result.high_menu_id eq '7000'}">
                	<option <c:out value="${result.menu_id eq '7001'?'selected':''}" /> value="<c:out value="${result.menu_url}" />"><c:out value="${result.menu_nm}" /></option>
				</c:if>            
            </c:forEach>
            </select>
        </nav>
    </div>
</div>

<section class="calendar_basic basic_bg">
    <div class="inner">
        <div class="ttl">
            <h2 class="ttl_left">정산승인달력</h2>
            <button onclick="" class="ttl_right search_open_btn" type="button"><span>상세검색</span></button>
        </div>
        <div class="calendar_list_wrap">
            <div class="list_info">
                <span class="excel_down">※ 엑셀 다운로드는 PC에서만 가능합니다.</span>
            </div>
            <div class="period_select">
                <button class="move_btn prev" onclick="jsCalendar('<c:out value="${pre}" />');"><strong><c:out value="${pre}" /></strong>월</button>
                <div class="select_box">
                    <select name="yyyy2" id="yyyy2">
	                    <c:forEach var="i" begin="2021" end="${sysYear}">
							<option value="<c:out value="${i}" />" <c:out value="${i eq yyyy ?'selected':''}" />><c:out value="${i}" /></option>
						</c:forEach>
                    </select>
                    <select name="mm2" id="mm2" onchange="jsCalendar(this.value);">
                         <c:forEach var="i" begin="0" end="12">
							<c:choose>
								<c:when test="${i < 10 && i > 0}">
									<option value="0<c:out value="${i}" />" <c:out value="${i eq now ?'selected':''}" />>0<c:out value="${i}" /></option>
								</c:when>
								<c:when test="${i > 10}">
									<option value="<c:out value="${i}" />" <c:out value="${i eq now ?'selected':''}" />><c:out value="${i}" /></option>
								</c:when>
							</c:choose>
						</c:forEach>
                    </select>
                </div>
                <button class="move_btn next" onclick="jsCalendar('<c:out value="${afe}" />');"><strong><c:out value="${afe}" /></strong>월</button>
            </div>
            <div class="calendar">
                <div class="calendar_wrap">
                    <div class="day_label">
                        <div class="day sun">
                            <span>일</span>
                        </div>
                        <div class="day">
                            <span>월</span>
                        </div>
                        <div class="day">
                            <span>화</span>
                        </div>
                        <div class="day">
                            <span>수</span>
                        </div>
                        <div class="day">
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>금</span>
                        </div>
                        <div class="day sat">
                            <span>토</span>
                        </div>
                    </div>
                    <c:forEach var="result" items="${resultList}" varStatus="status">	
                    <div class="week">
                        <div class="day sun">
                            <span><c:out value="${result.sun}" /></span>
							<c:if test="${!empty result.sun && result.sun eq settlementVo.period}">
                            <i class="more" onclick="amountCheck('<c:out value="${settlementVo.start_end_date}" />','<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.hold}" />','<c:out value="${settlementVo.commission_total}" />');"></i>
                            <p class="all">통합정산</p>
							</c:if>
                        </div>
                        <div class="day">
                            <span><c:out value="${result.mon}" /></span>
							<c:if test="${!empty result.mon && result.mon eq settlementVo.period}">
                            <i class="more" onclick="amountCheck('<c:out value="${settlementVo.start_end_date}" />','<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.hold}" />','<c:out value="${settlementVo.commission_total}" />');"></i>
                            <p class="all">통합정산</p>
							</c:if>                            
                        </div>
                        <div class="day">
                            <span><c:out value="${result.tue}" /></span>
							<c:if test="${!empty result.tue && result.tue eq settlementVo.period}">
                            <i class="more" onclick="amountCheck('<c:out value="${settlementVo.start_end_date}" />','<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.hold}" />','<c:out value="${settlementVo.commission_total}" />');"></i>
                            <p class="all">통합정산</p>
							</c:if>                            
                        </div>
                        <div class="day">
                            <span><c:out value="${result.wed}" /></span>
							<c:if test="${!empty result.wed && result.wed eq settlementVo.period}">
                            <i class="more" onclick="amountCheck('<c:out value="${settlementVo.start_end_date}" />','<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.hold}" />','<c:out value="${settlementVo.commission_total}" />');"></i>
                            <p class="all">통합정산</p>
							</c:if>                            
                        </div>
                        <div class="day">
                            <span><c:out value="${result.thu}" /></span>
							<c:if test="${!empty result.thu && result.thu eq settlementVo.period}">
                            <i class="more" onclick="amountCheck('<c:out value="${settlementVo.start_end_date}" />','<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.hold}" />','<c:out value="${settlementVo.commission_total}" />');"></i>
                            <p class="all">통합정산</p>
							</c:if>
                        </div>
                        <div class="day">
                            <span><c:out value="${result.fri}" /></span>
							<c:if test="${!empty result.fri && result.fri eq settlementVo.period}">
                            <i class="more" onclick="amountCheck('<c:out value="${settlementVo.start_end_date}" />','<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.hold}" />','<c:out value="${settlementVo.commission_total}" />');"></i>
                            <p class="all">통합정산</p>
							</c:if>                            
                        </div>
                        <div class="day sat">
                            <span><c:out value="${result.sat}" /></span>
							<c:if test="${!empty result.sat && result.sat eq settlementVo.period}">
                            <i class="more" onclick="amountCheck('<c:out value="${settlementVo.start_end_date}" />','<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.hold}" />','<c:out value="${settlementVo.commission_total}" />');"></i>
                            <p class="all">통합정산</p>
							</c:if>                            
                        </div>
                    </div>
					</c:forEach>                    
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

<section class="popup stl_list_popup">
    <div class="header">
        <div class="inner">
            <p>정산내역</p>
            <button  class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="stl_table_cont">
        <div class="inner">
            <div class="stl_all_money">
                <p class="ttl">통합정산 지급내역</p>
                <p class="money"><strong><span id="amount2"></span></strong>(원)</p>
                <p class="date">정산일:<span id="dates"></span></p>
            </div>
            <form name="frm" id="frm" action="" method="post">
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>거래금액</th>
                                <td>
                                    <input type="text" id="amount" readonly>
                                    <span>(원)</span>
                                </td>
                            </tr>
                            <!-- tr>
                                <th>수수료</th>
                                <td>
                                    <input type="text" id="commission" readonly>
                                    <span>(원)</span>
                                </td>
                            </tr-->
                            <tr>
                                <th>VAT</th>
                                <td>
                                    <input type="text" id="vat" readonly>
                                    <span>(원)</span>
                                </td>
                            </tr>
                            <tr>
                                <th>지급보류</th>
                                <td>
                                    <input type="text" id="hold" readonly>
                                    <span>(원)</span>
                                </td>
                            </tr>
                            <!-- tr>
                                <th>지급보류해제</th>
                                <td>
                                    <input type="text" id="" readonly>
                                    <span>(원)</span>
                                </td>
                            </tr>
                            <tr>
                                <th>별도가감</th>
                                <td>
                                    <input type="text" id="" readonly>
                                    <span>(원)</span>
                                </td>
                            </tr-->
                            <tr>
                                <th>지급금액</th>
                                <td>
                                    <input type="text" id="commission_total" readonly>
                                    <span>(원)</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>
<section class="popup notion_search_popup">
    <div class="header">
        <div class="inner">
            <p>상세검색</p>
            <button  class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="notion_table_cont">
        <div class="inner">
            <form name="frm2" id="frm2" action="" method="post">
            <input type="hidden" name="role_id" id="role_id" value="<c:out value='${sessionScope.role_id}' />">
            <input type="hidden" name="ym" id="ym">
                <fieldset>
                    <table>
                        <tbody>
						  <c:choose>
							    <c:when test="${sessionScope.role_id ne '1004'}">
		                            <tr>
		                                <th>상점 ID</th>
		                                <td class="check_settle">
		                                    <p><span id="storeIdNm"></span></p>
		                                    <input name="store_id" id="store_id" value="<c:out value='${store_id}' />">
		                                    <button type="button" onclick="jsStoreId();"></button>
		                                </td>
		                            </tr>
							    </c:when>
							    <c:otherwise>
								    <input type="hidden" name="store_id" id="store_id" value="<c:out value='${sessionScope.login_id}' />">
							    </c:otherwise>
						    </c:choose>	                        
                            <tr>
                                <th>지급월</th>
                                <td>
									<select name="yyyy" id="yyyy">
                                           <c:forEach var="i" begin="2021" end="${sysYear}">
											<option value="<c:out value="${i}" />" <c:out value="${i eq sysYear ?'selected':''}" />><c:out value="${i}" /></option>
										</c:forEach>											
									</select>
									<select name="mm" id="mm">
                                           <c:forEach var="i" begin="0" end="12">
											<c:choose>
												<c:when test="${i < 10 && i > 0}">
													<option value="0<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />>0<c:out value="${i}" /></option>
												</c:when>
												<c:when test="${i > 10}">
													<option value="<c:out value="${i}" />" <c:out value="${i eq sysMm ?'selected':''}" />><c:out value="${i}" /></option>
												</c:when>
											</c:choose>
										</c:forEach>											
									</select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="search_btn">
                        <button class="btn-active" type="button" onclick="calendar_data('1');">검색</button>
                    </div>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

<script>
/*
    $('.stl_show').on('click',function(){
        $('.stl_list_popup').show();
    });
*/    
	var amountCheck = function(dates, amount, vat, hold, commission_total){
		
		$("#amount2").empty();
		$("#dates").empty();
		$("#amount").empty();
		$("#vat").empty();
		$("#hold").empty();
		$("#commission_total").empty();
		
		$("#dates").val(dates);
		$("#amount2").val(commission_total);
		$("#amount").val(amount);
		$("#vat").val(vat);
		$("#hold").val(hold);
		$("#commission_total").val(commission_total);
		
		$('.stl_list_popup').show();
	}
	
    $('.search_open_btn').on('click',function(){
        $('.notion_search_popup').show();
    });
    $('.close_btn').on('click',function(){
        $(this).parents('.popup').hide();
    });
</script>

