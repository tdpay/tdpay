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
                                <th>구분</th>
								<th><button type="button">단말기</button></th>
                                <th><button type="button">신용카드</button></th>
                                <th><button type="button">신용카드K(수기)</button></th>
                                <th><button type="button">휴대폰</button></th>
                                <th><button type="button">휴대폰원천사선</button></th>
                                <th><button type="button">ARS700</button></th>
                                <th><button type="button">폰빌</button></th>
                                <th><button type="button">계좌이체</button></th>
                                <th><button type="button">가상계좌</button></th>
                                <th><button type="button">CMS</button></th>
                                <th><button type="button">문화상품권</button></th>
                                <th><button type="button">스마트문상</button></th>
                                <th><button type="button">도서문화상품권</button></th>
                                <th><button type="button">해피머니상품권</button></th>
                                <th><button type="button">에그머니</button></th>
                                <th><button type="button">틴캐시</button></th>
                                <th><button type="button">티머니</button></th>
                                <th><button type="button">모바일팝</button></th>
                                <th><button type="button">알리페이</button></th>
                                <th><button type="button">카카오페이</button></th>
                                <th><button type="button">위챗페이</button></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span>수수료금액</span></td>
								<td>
                                	<c:set var="total_amount" value="${resultTerminal.total_approval - resultTerminal.total_cancel_sum}" />
                                	<c:set var="rate" value="${resultTerminal.rate}" />
                                	<span><fmt:formatNumber value="${(total_amount*rate)/100}" pattern="#,###"/></span>
                                </td>
                                <td><span>0</span></td>
                                <td>
                                	<c:set var="total_amount" value="${resultCreditcardK.total_approval - resultCreditcardK.total_cancel_sum}" />
                                	<c:set var="rate" value="${resultCreditcardK.rate}" />
                                	<span><fmt:formatNumber value="${(total_amount*rate)/100}" pattern="#,###"/></span>
                                </td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr>
                                <td><span>수수료율</span></td>
                                <td><span><c:out value="${resultTerminal.rate}" /></span></td>
                                <td><span>0</span></td>
                                <td><span><c:out value="${resultCreditcardK.rate}" /></span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr class="total_list">
                                <td><span>결제금액</span></td>
								<td><span><fmt:formatNumber value="${resultTerminal.total_approval}" pattern="#,###" /></span></td>
                                <td><span>0</span></td>
                                <td><span><fmt:formatNumber value="${resultCreditcardK.total_approval}" pattern="#,###" /></span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr class="total_list">
                                <td><span class="red_txt">취소금액</span></td>
								<td><span><fmt:formatNumber value="${resultTerminal.total_cancel_sum}" pattern="#,###" /></span></td>
                                <td><span>0</span></td>
                                <td><span><fmt:formatNumber value="${resultCreditcardK.total_cancel_sum}" pattern="#,###" /></span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                            <tr class="total_list">
                                <td><span class="blue_txt">합계금액</span></td>
								<td><span><fmt:formatNumber value="${resultTerminal.total_approval - resultTerminal.total_cancel_sum}" pattern="#,###"/></span></td>
                                <td><span>0</span></td>
                                <td><span><fmt:formatNumber value="${resultCreditcardK.total_approval - resultCreditcardK.total_cancel_sum}" pattern="#,###" /></span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                                <td><span>0</span></td>
                            </tr>
                        </tbody>
                    </table>
                </form>