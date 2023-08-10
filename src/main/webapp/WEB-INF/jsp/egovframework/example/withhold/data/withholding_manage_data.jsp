<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
    $("#check_all").on('click',function(){
        //만약 전체 선택 체크박스가 체크된상태일경우
        if($("#check_all").prop("checked")) {
            $("input[type=checkbox]").prop("checked",true);
        } else {
            $("input[type=checkbox]").prop("checked",false);
        }
    });
    $('td.num input').on('change',function(){
        var checkCount = $('td.num input:checked').length;
        var checkTotal = $('td.num input').length;
        if (checkCount >= 0) {
            $('#check_all').prop('checked',false);
        } 
        if (checkCount == checkTotal) {
            $('#check_all').prop('checked',true);
        }
    });

    // 테이블 정렬 js
    $('.contents_wrap .table_layout th button').on('click',function(){
        if($(this).hasClass('up')){
            $(this).removeClass('up');
            $(this).addClass('down');
        } else if ($(this).hasClass('down')){
            $(this).removeClass('down');
            $(this).addClass('up');
        } else {
            $('.contents_wrap .table_layout th button').removeClass('up down');
            $(this).addClass('up');
        }
    });
</script>	

<form action="" class="table_layout02_wrap">
                    <table class="table_layout02">
                        <thead>
                            <tr>
                                <th>원천사</th>
                                <c:forEach var="cardResult" items="${resultCardList}" varStatus="status">
                                <th><c:out value="${cardResult.cardname}" /></th>
                                </c:forEach>
                                <th>가상계좌</th>
                                <th>상품권</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span>수수료금액</span></td>
                                <c:forEach var="result" items="${resultList}" varStatus="status">
                                <c:set var="total_amount" value="${result.amount - result.cancle_amount}" />
                                <c:set var="rate" value="${result.rate}" />
                                <td><span><fmt:formatNumber value="${(total_amount*rate)/100}" pattern="#,###"/></span></td>
                                </c:forEach>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr>
                                <td><span>수수료율</span></td>
                                <c:forEach var="result" items="${resultCardList}" varStatus="status">
                                <td><span>${result.rate}</span></td>
                                </c:forEach>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr class="total_list">
                                <td><span>결제금액</span></td>
                                <c:forEach var="result" items="${resultList}" varStatus="status">
                                <c:if test="${result.dealing_yn eq 'N'}">
                                <td><span><fmt:formatNumber value="${result.amount}" pattern="#,###" /></span></td>
                                </c:if>
                                </c:forEach>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr class="total_list">
                                <td><span class="red_txt">취소금액</span></td>
                                <c:forEach var="result" items="${resultList}" varStatus="status">
								<c:if test="${result.cancle_yn eq 'Y'}">
                                <td><span><fmt:formatNumber value="${result.cancle_amount}" pattern="#,###" /></span></td>
                                </c:if>
                                </c:forEach>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr class="total_list">
                                <td><span class="blue_txt">합계금액</span></td>
                                <c:forEach var="result" items="${resultList}" varStatus="status">
                                <td><span><fmt:formatNumber value="${result.amount - result.cancle_amount}" pattern="#,###" /></span></td>
                                </c:forEach>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                        </tbody>
                    </table>
                </form>