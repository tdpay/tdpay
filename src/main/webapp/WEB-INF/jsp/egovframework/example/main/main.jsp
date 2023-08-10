<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<script src="/js/main.js"></script>
    <script src="/js/jquery.number.js"></script>
    
	<!-- container -->
    <div class="box_wrap clearfix">
        <div class="col_box col01">
            <div class="row_box" id="WM_5002">
                <div class="sales_box">
                    <h2>매출 현황</h2>
                    <ul>
                        <li>
                            <p class="sales_ttl">오늘 누적</p>
                            <p class="sales_amount"><span class="point">${sett_tocnt1}</span>건</p>
                            <p class="sales_money"><span class="point">${sett_amount1}</span>원</p>
                        </li>
                        <li>
                            <p class="sales_ttl">당월 누적</p>
                            <p class="sales_amount"><span class="point">${sett_tocnt2}</span>건</p>
                            <p class="sales_money"><span class="point">${sett_amount2}</span>원</p>
                        </li>
                        <li>
                            <p class="sales_ttl">전월 총</p>
                            <p class="sales_amount"><span class="point">${sett_tocnt3}</span>건</p>
                            <p class="sales_money"><span class="point">${sett_amount3}</span>원</p>
                        </li>
                        <li>
                            <p class="sales_ttl">올해 누적</p>
                            <p class="sales_amount"><span class="point">${sett_tocnt4}</span>건</p>
                            <p class="sales_money"><span class="point">${sett_amount4}</span>원</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row_box clearfix">
                <div class="history_box" id="W_5003">
                    <a href="/settlement/settlement_his.do">
                        <div class="txt_box">
                            <strong>${tocnt1}</strong>
                            <span>지급보류</span>
                        </div>
                    </a>
                </div>
                <div class="history_box" id="W_4002">
                    <a href="/history/history_fail.do">
                        <div class="txt_box">
                            <strong>${tocnt2}</strong>
                            <span>승인실패</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col_box col02">
            <a href="/history/history_all.do" class="inq_btn" id="W_4001">
                <div class="txt_box">
                    <span>통합승인내역조회</span>
                </div>
            </a>
            <a href="/settlement/settlement_all.do" class="inq_btn" id="W_5002">
                <div class="txt_box">
                    <span>통합정산조회</span>
                </div>
            </a>
            <c:if test="${sessionScope.role_id eq '1001' || sessionScope.role_id eq '1002' || sessionScope.role_id eq '1003'}">
            <a href="/payment/payment.do" class="inq_btn inq_btn02" id="7000_pay">
                <div class="txt_box">
                    <img src="/img/main/main_payment_ico.png" alt="수기결제아이콘">
                    <span>수기결제</span>
                </div>
            </a>
            </c:if>
        </div>
        <div class="col_box col03" >
            <div class="row_box" id="W_5001">
                <a href="/settlement/calendar.do">
                    <img src="/img/main/main_calendar_spring.png" alt="">
                    <h2>정산승인 ${mm}월</h2>
                    <table>
                        <colgroup>
                            <col style="width:14.2%;">
                            <col style="width:14.2%;">
                            <col style="width:14.2%;">
                            <col style="width:14.2%;">
                            <col style="width:14.2%;">
                            <col style="width:14.2%;">
                            <col style="width:14.2%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>일</th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                                <th>토</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="result" items="${selectCalendarList}" varStatus="status">	
                            <tr>
                                <td class="holiday">
                                    <strong class="date"><c:out value="${result.sun}" /></strong>
                                </td>
                                <td ${!empty result.mon && result.mon eq mainVO.period?'class=calc_have':''} >
                                    <strong class="date"><c:out value="${result.mon}" /></strong>
                                    <c:if test="${!empty result.mon && result.mon eq mainVO.period}">
                                        <span class="calc_txt">
                                                                            통합정산<br>
                                            <em>${mainVO.commission_total}(원)</em>
                                        </span>
                                    </c:if>                                                
                                </td>
                                <td ${!empty result.tue && result.tue eq mainVO.period?'class=calc_have':''}>
                                    <strong class="date"><c:out value="${result.tue}" /></strong>
                                    <c:if test="${!empty result.tue && result.tue eq mainVO.period}">
                                        <span class="calc_txt">
                                                                            통합정산<br>
                                            <em>${mainVO.commission_total}(원)</em>
                                        </span>
                                    </c:if>                                                   
                                </td>
                                <td ${!empty result.wed && result.wed eq mainVO.period?'class=calc_have':''}>
                                    <strong class="date"><c:out value="${result.wed}" /></strong>
                                    <c:if test="${!empty result.wed && result.wed eq mainVO.period}">
                                        <span class="calc_txt">
                                                                            통합정산<br>
                                            <em>${mainVO.commission_total}(원)</em>
                                        </span>
                                    </c:if>                                                  
                                </td>
                                <td ${!empty result.thu && result.thu eq mainVO.period?'class=calc_have':''}>
                                    <strong class="date"><c:out value="${result.thu}" /></strong>
                                    <c:if test="${!empty result.thu && result.thu eq mainVO.period}">
                                        <span class="calc_txt">
                                                                            통합정산<br>
                                            <em>${mainVO.commission_total}(원)</em>
                                        </span>
                                    </c:if> 
                                </td>
                                <td ${!empty result.fri && result.fri eq mainVO.period?'class=calc_have':''}>
                                    <strong class="date"><c:out value="${result.fri}" /></strong>
                                    <c:if test="${!empty result.fri && result.fri eq mainVO.period}">
                                        <span class="calc_txt">
                                                                            통합정산<br>
                                            <em>${mainVO.commission_total}(원)</em>
                                        </span>
                                    </c:if>                                                 
                                </td>
                                <td class="holiday">
                                    <strong class="date"><c:out value="${result.sat}" /></strong>
                                    <c:if test="${!empty result.sat && result.sat eq mainVO.period}">
                                        <span class="calc_txt">
                                                                            통합정산<br>
                                            <em>${mainVO.commission_total}(원)</em>
                                        </span>
                                    </c:if>                                                 
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </a>
            </div>
        </div>
    </div>
    <div class="box_wrap clearfix">
        <div class="list_box" id="W_6002">
            <h2>공지사항</h2>
            <ul>
                <c:forEach var="notice01" items="${selectMainNotice01List}" varStatus="status">	
                <li>
                    <a href="/notice/notice01.do">
                        <p><c:out value="${notice01.title}" /></p>
                        <span><c:out value="${notice01.created_datetime}" /></span>
                    </a>
                </li>
                </c:forEach>                        
            </ul>
        </div>
        <div class="list_box" id="W_6003">
            <h2>자료실</h2>
            <ul>
                <c:forEach var="notice02" items="${selectMainNotice02List}" varStatus="status">	
                <li>
                    <a href="/notice/notice02.do">
                        <p><c:out value="${notice02.title}" /></p>
                        <span><c:out value="${notice02.created_datetime}" /></span>
                    </a>
                </li>
                </c:forEach>                        
            </ul>
        </div>
        <div class="list_box" id="W_6004">
            <h2>자주 묻는 질문</h2>
            <ul>
                <c:forEach var="notice03" items="${selectMainNotice03List}" varStatus="status">	
                <li>
                    <a href="/notice/notice03.do">
                        <p><c:out value="${notice03.title}" /></p>
                        <span><c:out value="${notice03.created_datetime}" /></span>
                    </a>
                </li>
                </c:forEach>                        
            </ul>
        </div>
        <div class="list_box">
            <div class="link_box">
                <a href="tel:02-6914-6161" class="call_btn">02-6914-6161</a>
            </div>
        </div>
    </div>		
	<!-- //container -->

    <script>
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
    <c:forEach var="result" items="${sessionScope.SUBMENU}" varStatus="status">
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
            $("#7000_pay").attr("href", "/payment/payment.do")
        </c:if>
        <c:if test="${empty menu_7001 and !empty menu_7002}">
            $("#7000_pay").attr("href", "/payment2/payment.do")
        </c:if>
    
    </c:if>
    
    </script>