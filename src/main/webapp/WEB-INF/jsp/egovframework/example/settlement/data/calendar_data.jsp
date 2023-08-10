<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
    $(function() {
        $("#myGnb").height($('#wrap').height() - 55);
    });
</script>

<div class="calendar_box_wrap">
<c:set var="now2" value="<%=new java.util.Date()%>" />
<c:set var="sysYear2"><fmt:formatDate value="${now2}" pattern="yyyy" /></c:set> 	                    
    <button class="num_ttl txt_blue" onclick="jsCalendar('<c:out value="${pre}" />');">< <c:out value="${pre}" />월</button>
    <select class="date_box date_box_l width_ss" name="yyyy2" placeholder="" id="yyyy2">
        <c:forEach var="i" begin="2021" end="${sysYear2}">
            <option value="<c:out value="${i}" />" <c:out value="${i eq yyyy ?'selected':''}" />><c:out value="${i}" /></option>
        </c:forEach>	
    </select>
    <select class="date_box date_box_r width_ss" name="mm2" placeholder="" id="mm2" onchange="jsCalendar(this.value);">
        <c:forEach var="i" begin="0" end="12">
            <c:choose>
                <c:when test="${i < 10 && i > 0}">
                    <option value="0<c:out value="${i}" />" <c:out value="${i eq now ?'selected':''}" />>0<c:out value="${i}" /></option>
                </c:when>
                <c:when test="${i >= 10}">
                    <option value="<c:out value="${i}" />" <c:out value="${i eq now ?'selected':''}" />><c:out value="${i}" /></option>
                </c:when>
            </c:choose>
        </c:forEach>	
    </select>
    <button class="num_ttl txt_blue" onclick="jsCalendar('<c:out value="${afe}" />');"><c:out value="${afe}" />월 ></button>
</div>


<form class="calendar_layout" action="" method="get">
    <table class="table_layout02">
        <caption>정산승인달력</caption>
        <colgroup>
            <col style="width:14%;">
            <col style="width:14%;">
            <col style="width:14%;">
            <col style="width:14%;">
            <col style="width:14%;">
            <col style="width:14%;">
            <col style="width:14%;">
        </colgroup>
        <thead>
            <tr>
                <th class="sun">일</th>
                <th class="mon">월</th>
                <th class="tues">화</th>
                <th class="wed">수</th>
                <th class="thur">목</th>
                <th class="fri">금</th>
                <th class="sat">토</th>
            </tr>                      
        </thead>
        <tbody>
            <c:forEach var="result" items="${resultList}" varStatus="status">	
            <tr>
                <td class="col_date">
                    <span class="num_date"><c:out value="${result.sun}" /></span>
                    <c:choose>
                        <c:when test="${!empty result.sun}">
                            <c:forEach var="settlementVo" items="${settlementVo}" varStatus="status">	
                                <c:if test="${result.sun eq settlementVo.period_date}">
                                <div class="desc">
                                    <div class="desc_txt">
                                        <em>통합정산</em>
                                        <span><c:out value="${settlementVo.settlement}" />(원)</span>
                                    </div>
                                    <i class="ico_info" onclick="amountCheck('<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.commission}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.settlement}" />');"><img src="../img/ico/ico_question.png" alt=""></i>
                                </div>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="desc">
                                <em></em>
                                <em></em>
                                <em></em>		
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="col_date">
                    <span class="num_date"><c:out value="${result.mon}" /></span>
                    <c:choose>
                        <c:when test="${!empty result.mon}">
                            <c:forEach var="settlementVo" items="${settlementVo}" varStatus="status">	
                                <c:if test="${result.mon eq settlementVo.period_date}">
                                <div class="desc">
                                    <div class="desc_txt">
                                        <em>통합정산</em>
                                        <span><c:out value="${settlementVo.settlement}" />(원)</span>
                                    </div>
                                    <i class="ico_info" onclick="amountCheck('<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.commission}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.settlement}" />');"><img src="../img/ico/ico_question.png" alt=""></i>
                                </div>
                                </c:if>
                            </c:forEach>
                        </c:when>										
                        <c:otherwise>
                            <div class="desc">
                                <em></em>
                                <em></em>
                                <em></em>		
                            </div>
                        </c:otherwise>
                    </c:choose>							
                </td>
                <td class="col_date">
                    <span class="num_date"><c:out value="${result.tue}" /></span>
                    <c:choose>
                        <c:when test="${!empty result.tue}">
                            <c:forEach var="settlementVo" items="${settlementVo}" varStatus="status">	
                                <c:if test="${result.tue eq settlementVo.period_date}">
                                <div class="desc">
                                    <div class="desc_txt">
                                        <em>통합정산</em>
                                        <span><c:out value="${settlementVo.settlement}" />(원)</span>
                                    </div>
                                    <i class="ico_info" onclick="amountCheck('<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.commission}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.settlement}" />');"><img src="../img/ico/ico_question.png" alt=""></i>
                                </div>
                                </c:if>
                            </c:forEach>
                        </c:when>											
                        <c:otherwise>
                            <div class="desc">
                                <em></em>
                                <em></em>
                                <em></em>		
                            </div>
                        </c:otherwise>
                    </c:choose>								
                </td>
                <td class="col_date">
                    <span class="num_date"><c:out value="${result.wed}" /></span>
                    <c:choose>
                        <c:when test="${!empty result.wed}">
                            <c:forEach var="settlementVo" items="${settlementVo}" varStatus="status">	
                                <c:if test="${result.wed eq settlementVo.period_date}">
                                <div class="desc">
                                    <div class="desc_txt">
                                        <em>통합정산</em>
                                        <span><c:out value="${settlementVo.settlement}" />(원)</span>
                                    </div>
                                    <i class="ico_info" onclick="amountCheck('<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.commission}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.settlement}" />');"><img src="../img/ico/ico_question.png" alt=""></i>
                                </div>
                                </c:if>
                            </c:forEach>
                        </c:when>	
                        <c:otherwise>
                            <div class="desc">
                                <em></em>
                                <em></em>
                                <em></em>		
                            </div>
                        </c:otherwise>
                    </c:choose>							
                </td>
                <td class="col_date">
                    <span class="num_date"><c:out value="${result.thu}" /></span>
                    <c:choose>
                        <c:when test="${!empty result.thu}">
                            <c:forEach var="settlementVo" items="${settlementVo}" varStatus="status">	
                                <c:if test="${result.thu eq settlementVo.period_date}">
                                <div class="desc">
                                    <div class="desc_txt">
                                        <em>통합정산</em>
                                        <span><c:out value="${settlementVo.settlement}" />(원)</span>
                                    </div>
                                    <i class="ico_info" onclick="amountCheck('<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.commission}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.settlement}" />');"><img src="../img/ico/ico_question.png" alt=""></i>
                                </div>
                                </c:if>
                            </c:forEach>
                        </c:when>										
                        <c:otherwise>
                            <div class="desc">
                                <em></em>
                                <em></em>
                                <em></em>		
                            </div>
                        </c:otherwise>
                    </c:choose>								
                </td>
                <td class="col_date">
                    <span class="num_date"><c:out value="${result.fri}" /></span>
                    <c:choose>
                        <c:when test="${!empty result.fri}">
                            <c:forEach var="settlementVo" items="${settlementVo}" varStatus="status">	
                                <c:if test="${result.fri eq settlementVo.period_date}">
                                <div class="desc">
                                    <div class="desc_txt">
                                        <em>통합정산</em>
                                        <span><c:out value="${settlementVo.settlement}" />(원)</span>
                                    </div>
                                    <i class="ico_info" onclick="amountCheck('<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.commission}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.settlement}" />');"><img src="../img/ico/ico_question.png" alt=""></i>
                                </div>
                                </c:if>
                            </c:forEach>
                        </c:when>											
                        <c:otherwise>
                            <div class="desc">
                                <em></em>
                                <em></em>
                                <em></em>		
                            </div>
                        </c:otherwise>
                    </c:choose>								
                </td>
                <td class="col_date">
                    <span class="num_date"><c:out value="${result.sat}" /></span>
                    <c:choose>
                        <c:when test="${!empty result.sat}">
                            <c:forEach var="settlementVo" items="${settlementVo}" varStatus="status">	
                                <c:if test="${result.sat eq settlementVo.period_date}">
                                <div class="desc">
                                    <div class="desc_txt">
                                        <em>통합정산</em>
                                        <span><c:out value="${settlementVo.settlement}" />(원)</span>
                                    </div>
                                    <i class="ico_info" onclick="amountCheck('<c:out value="${settlementVo.amount}" />','<c:out value="${settlementVo.commission}" />','<c:out value="${settlementVo.vat}" />','<c:out value="${settlementVo.settlement}" />');"><img src="../img/ico/ico_question.png" alt=""></i>
                                </div>
                                </c:if>
                            </c:forEach>
                        </c:when>		
                        <c:otherwise>
                            <div class="desc">
                                <em></em>
                                <em></em>
                                <em></em>		
                            </div>
                        </c:otherwise>
                    </c:choose>								
                </td>
            </tr>	
            </c:forEach>
        </tbody>
    </table>
</form>
    
<div class="pop_wrap cal_pop pop440 pop_off">
    <div class="pop_cont">
        <div class="pop_top">
            <strong class="pop_ttl">정산내역</strong>
            <a class="btn_closed" href="#!"><img src="../img/btn/btn_closed_w.png" alt="닫기" /></a>
        </div>
        <div class="pop_body">
            <div class="pop_inner">
                <div class="layout_wrap">
                    <table class="table_layout01">
                        <colgroup>
                            <col style="width:160px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tr>
                            <th>결제금액</th>
                            <td>
                                <input type="text" placeholder="0" id="amount" readonly>
                                <span class="unit" >원</span>
                            </td>
                        </tr>
                        <tr>
                            <th>결제 수수료</td>
                            <td>
                                <input type="text" placeholder="0" id="commission" readonly>
                                <span class="unit">원</span>
                            </td>
                        </tr>
                        <tr>
                            <th>부가세</th>
                            <td>
                                <input type="text" placeholder="0" id="vat" readonly>
                                <span class="unit" >원</span>
                            </td>
                        </tr>
                        <!-- tr>
                            <th>지급보류</th>
                            <td><input type="text" placeholder="0" id="hold" readonly><span class="won" >원</span></td>
                        </tr-->
                        <tr>
                            <th>정산금액</th>
                            <td>
                                <input type="text" placeholder="0" id="settlement" readonly>
                                <span class="unit">원</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="dim"></div>
</div>		

<script type="text/javascript">

    $('.btn_closed').on('click', function(){
        $('.cal_pop').hide();
    });
    
    var amountCheck = function(amount, commission, vat, settlement){
    
        $("#amount").empty();
        $("#commission").empty();
        $("#vat").empty();
        $("#settlement").empty();
        
        $("#amount").val(amount);
        $("#commission").val(commission);
        $("#vat").val(vat);
        $("#settlement").val(settlement);
        
        $('.cal_pop').show();
    }
</script> 	