<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/app/js/main.js"></script>

<section class="main_m">
    <div class="inner">
        <div class="sales_box" id="WM_5002">
            <h2>매출 현황</h2>
            <ul>
                <li>
                    <div class="sales_ttl">
                        <p>오늘 누적</p>
                    </div>
                    <div class="sales_result">
                        <p><strong>${sett_tocnt1}</strong>건</p>
                        <p><strong>${sett_amount1}</strong>원</p>
                    </div>
                </li>
                <li>
                    <div class="sales_ttl">
                        <p>당월 누적</p>
                    </div>
                    <div class="sales_result">
                        <p><strong>${sett_tocnt2}</strong>건</p>
                        <p><strong>${sett_amount2}</strong>원</p>
                    </div>
                </li>
                <li>
                    <div class="sales_ttl">
                        <p>전월 총</p>
                    </div>
                    <div class="sales_result">
                        <p><strong>${sett_tocnt3}</strong>건</p>
                        <p><strong>${sett_amount3}</strong>원</p>
                    </div>
                </li>
                <li>
                    <div class="sales_ttl">
                        <p>올해 누적</p>
                    </div>
                    <div class="sales_result">
                        <p><strong>${sett_tocnt4}</strong>건</p>
                        <p><strong>${sett_amount4}</strong>원</p>
                    </div>
                </li>
            </ul>
        </div>
        <div class="inq_box">
            <a href="/app/history/history_all.do" class="inq_btn01" id="W_4001">통합승인내역조회</a>
            <a href="/app/settlement/settlement_all.do" class="inq_btn02" id="W_5002">통합정산조회</a>
			<c:if test="${sessionScope.role_id eq '1001' || sessionScope.role_id eq '1002' || sessionScope.role_id eq '1003'}">
            <a href="/app/payment/payment.do" class="inq_btn03" id="7000_pay"><span>수기결제</span></a>
			</c:if>            
        </div>
        <div class="calc_box" id="W_5001">
            <h2>정상승인${mm}월</h2>
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
                    <c:forEach var="result" items="${selectCalendarList}" varStatus="status">	
                    <div class="week">
                        <div class="day sun ${!empty result.sun && result.sun eq mainVO.period ? 'stl_show':''}">
						<c:choose>
							<c:when test="${!empty result.sun && result.sun eq mainVO.period}">
								<span onclick="amountCheck('<c:out value="${mainVO.start_end_date}" />','<c:out value="${mainVO.commission_total}" />');"><c:out value="${result.sun}" /></span>
							</c:when>
							<c:otherwise>
								<span><c:out value="${result.sun}" /></span>
							</c:otherwise>
						</c:choose>
                        </div>
                        <div class="day ${!empty result.mon && result.mon eq mainVO.period ? 'stl_show':''}">
						<c:choose>
							<c:when test="${!empty result.mon && result.mon eq mainVO.period}">
								<span onclick="amountCheck('<c:out value="${mainVO.start_end_date}" />','<c:out value="${mainVO.commission_total}" />');"><c:out value="${result.mon}" /></span>
							</c:when>
							<c:otherwise>
								<span><c:out value="${result.mon}" /></span>
							</c:otherwise>
						</c:choose>
                        </div>
                        <div class="day ${!empty result.tue && result.tue eq mainVO.period ? 'stl_show':''}">
						<c:choose>
							<c:when test="${!empty result.tue && result.tue eq mainVO.period}">
								<span onclick="amountCheck('<c:out value="${mainVO.start_end_date}" />','<c:out value="${mainVO.commission_total}" />');"><c:out value="${result.tue}" /></span>
							</c:when>
							<c:otherwise>
								<span><c:out value="${result.tue}" /></span>
							</c:otherwise>
						</c:choose>                        
                        </div>
                        <div class="day ${!empty result.wed && result.wed eq mainVO.period ? 'stl_show':''}">
						<c:choose>
							<c:when test="${!empty result.wed && result.wed eq mainVO.period}">
								<span onclick="amountCheck('<c:out value="${mainVO.start_end_date}" />','<c:out value="${mainVO.commission_total}" />');"><c:out value="${result.wed}" /></span>
							</c:when>
							<c:otherwise>
								<span><c:out value="${result.wed}" /></span>
							</c:otherwise>
						</c:choose>                          
                        </div>
                        <div class="day ${!empty result.thu && result.thu eq mainVO.period ? 'stl_show':''}">
						<c:choose>
							<c:when test="${!empty result.thu && result.thu eq mainVO.period}">
								<span onclick="amountCheck('<c:out value="${mainVO.start_end_date}" />','<c:out value="${mainVO.commission_total}" />');"><c:out value="${result.thu}" /></span>
							</c:when>
							<c:otherwise>
								<span><c:out value="${result.thu}" /></span>
							</c:otherwise>
						</c:choose>
                        </div>
                        <div class="day ${!empty result.fri && result.fri eq mainVO.period ? 'stl_show':''}">
						<c:choose>
							<c:when test="${!empty result.fri && result.fri eq mainVO.period}">
								<span onclick="amountCheck('<c:out value="${mainVO.start_end_date}" />','<c:out value="${mainVO.commission_total}" />');"><c:out value="${result.fri}" /></span>
							</c:when>
							<c:otherwise>
								<span><c:out value="${result.fri}" /></span>
							</c:otherwise>
						</c:choose>                         
                        </div>
                        <div class="day sat ${!empty result.sat && result.sat eq mainVO.period ? 'stl_show':''}">
						<c:choose>
							<c:when test="${!empty result.sat && result.sat eq mainVO.period}">
								<span onclick="amountCheck('<c:out value="${mainVO.start_end_date}" />','<c:out value="${mainVO.commission_total}" />');"><c:out value="${result.sat}" /></span>
							</c:when>
							<c:otherwise>
								<span><c:out value="${result.sat}" /></span>
							</c:otherwise>
						</c:choose>                           
                        </div>
                    </div>
					</c:forEach>                       
                    
                </div>
            </div>
        </div>
        <div class="history_box">
            <a href="/app/settlement/settlement_his.do" id="W_5003">
                <strong>${tocnt1}</strong>
                <span>지급보류</span>
            </a>
            <a href="/app/history/history_fail.do" id="W_4002">
                <strong>${tocnt2}</strong>
                <span>승인실패</span>
            </a>
        </div>
        <div class="list_box">
            <div class="box_wrap" id="W_6002">
                <h2>공지사항</h2>
                <ul>
                	<c:forEach var="notice01" items="${selectMainNotice01List}" varStatus="status">	
                    <li>
                        <a href="/app/notice/notice01.do">
                            <p class="ttl"><c:out value="${notice01.title}" /></p>
                            <span class="date"><c:out value="${notice01.created_datetime}" /></span>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="box_wrap" id="W_6003">
                <h2>자료실</h2>
                <ul>
                	<c:forEach var="notice02" items="${selectMainNotice02List}" varStatus="status">	
                    <li>
                        <a href="/app/notice/notice02.do">
                            <p class="ttl"><c:out value="${notice02.title}" /></p>
                            <span class="date"><c:out value="${notice02.created_datetime}" /></span>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="box_wrap" id="W_6004">
                <h2>자주 묻는 질문</h2>
                <ul>
                	<c:forEach var="notice03" items="${selectMainNotice03List}" varStatus="status">	
                    <li>
                        <a href="/app/notice/notice03.do">
                            <p class="ttl"><c:out value="${notice03.title}" /></p>
                            <span class="date"><c:out value="${notice03.created_datetime}" /></span>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="call_box">
            <a href="tel:1670-3216">
                <span>1670-3216</span>
            </a>
        </div>
    </div>
</section>

<section class="popup calc_pop_wrap">
    <div class="calc_popup">
        <div class="header">
            <div class="inner">
                <p>정산내역</p>
                <button onclick="#" class="close_btn" type="button"></button>
            </div>
        </div>
        <div class="calc_pop_cont">
            <div class="inner">
                <div class="calc_all_money">
                    <p class="ttl">통합정산 지급내역</p>
                    <p class="money"><span id="commission_total"></span>(원)</p>
                    <p class="date"><span id="sett_date"></span></p>
                </div>
                <div class="calc_btn">
                    <button class="btn-default close_btn" type="button">닫기</button>
                    <button onclick="location.href='/app/settlement/calendar.do'" class="btn-active" type="button">정산승인달력</button>
                </div>
            </div>
        </div>
    </div>
</section>
	<!-- //container -->
    <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
	  
<script>
    $(function(){
        $('.calc_box .day').on('click',function(){
            $('.calc_pop_wrap').show();
        });
        $('.calc_pop_wrap .close_btn').on('click',function(){
            $('.calc_pop_wrap').hide();
        });
    });
    
    var amountCheck = function(val, val2){
    	$("#sett_date").empty();
    	$("#commission_total").empty();
    	
    	$("#sett_date").text("정산일:"+val);
    	$("#commission_total").html("<strong>"+val2+"</strong>");
    }
    
	<c:if test="${sessionScope.SUB_ADMIN eq 'Y'}">
	<c:set var="menu_4001" value="" />
	<c:set var="menu_4002" value="" />
	<c:set var="menu_5001" value="" />
	<c:set var="menu_5002" value="" />
	<c:set var="menu_5003" value="" />
	<c:set var="menu_6002" value="" />
	<c:set var="menu_6003" value="" />
	<c:set var="menu_6004" value="" />
	<c:set var="menu_7001" value="" />
	<c:set var="menu_7002" value="" />
	<c:forEach var="result" items="${sessionScope.SUBMENU3}" varStatus="status">
			<c:if test="${result.menu_id eq '4001'}">
				<c:set var="menu_4001" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '4002'}">
				<c:set var="menu_4002" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '5001'}">
				<c:set var="menu_5001" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '5002'}">
				<c:set var="menu_5002" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '5003'}">
				<c:set var="menu_5003" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '6002'}">
				<c:set var="menu_6002" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '6003'}">
				<c:set var="menu_6003" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '6004'}">
				<c:set var="menu_6004" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '7001'}">
				<c:set var="menu_7001" value="${result.menu_id}" />
			</c:if>
			<c:if test="${result.menu_id eq '7002'}">
				<c:set var="menu_7002" value="${result.menu_id}" />
			</c:if>
	</c:forEach>
	
		<c:if test="${empty menu_4001}">
			$("#W_4001").remove();
		</c:if>
		<c:if test="${empty menu_4002}">
			$("#W_4002").remove();
		</c:if>
		<c:if test="${empty menu_5001}">
			$("#W_5001").remove();
		</c:if>
		<c:if test="${empty menu_5002}">
			$("#WM_5002").remove();
			$("#W_5002").remove();
		</c:if>
		<c:if test="${empty menu_5003}">
			$("#W_5003").remove();
		</c:if>
		<c:if test="${empty menu_6002}">
			$("#W_6002").remove();
		</c:if>
		<c:if test="${empty menu_6003}">
			$("#W_6003").remove();
		</c:if>
		<c:if test="${empty menu_6004}">
			$("#W_6004").remove();
		</c:if>
		<c:if test="${empty menu_7001 and empty menu_7002}">
			$("#W_7000").remove();
		</c:if>
		<c:if test="${!empty menu_7001 and empty menu_7002}">
			$("#7000_pay").attr("href", "/app/payment/payment.do")
		</c:if>
		<c:if test="${empty menu_7001 and !empty menu_7002}">
			$("#7000_pay").attr("href", "/app/payment2/payment.do")
		</c:if>
	
	</c:if>    
</script>	  
	  
