<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

<script>
    var closePopup = function(){
        $('.pop_wrap').hide();
    }
</script>

<div class="pop_wrap">
    <div class="pop_cont">
        <div class="pop_top">
            <strong class="pop_ttl">상세보기</strong>
            <a class="btn_closed" href="javascript:closePopup();"><img src="../img/btn/btn_closed.png" alt="닫기"></a>
        </div>
        <div class="pop_body">
            <div class="pop_inner">
                <div class="layout_wrap">
                    <div class="list_layout01">
                        <div class="list_box_wrap">
                            <div class="list_box">
                                <dl>
                                    <dt>총결제금액</dt>
                                    <dd><c:out value="${settlementVO.d_amount}" />원</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="list_box_wrap">
                            <div class="list_box">
                                <dl>
                                    <dt>승인건</dt>
                                    <dd><c:out value="${settlementVO.d_approval_cnt}" />건</dd>
                                </dl>
                            </div>
                            <div class="list_box">
                                <dl class="cancel">
                                    <dt>취소금액</dt>
                                    <dd><c:out value="${settlementVO.d_cancel_sum}" />원</dd>
                                </dl>
                            </div>
                            <div class="list_box">
                                <dl class="cancel">
                                    <dt>취소건</dt>
                                    <dd><c:out value="${settlementVO.d_cancel_cnt}" />건</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layout_wrap">
                    <div class="table_layout02_wrap scrollable_table">
                        <table class="table_layout02">
                            <caption>지엠지페이먼트</caption>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>상점ID</th>
                                    <th>CPID</th>
                                    <th>매입구분</th>
                                    <th>지급일자</th>
                                    <th>승인일자</th>
                                    <th>취소일자</th>
                                    <!-- <th>은행</th> -->
                                    <th>주문번호</th>
                                    <th>구매자</th>
                                    <th>상품명</th>
                                    <th>거래금액</th>
                                    <th>수수료율</th>
                                    <th>수수료</th>
                                    <th>수수료원가</th>
                                    <th>수수료부가세</th>
                                    <th>지급액</th>
                                    <!-- th>상태</th-->
                                </tr>
                            </thead>
                            <tbody class="">
                                <c:forEach var="result" items="${resultList}" varStatus="status">	
                                <tr class="<c:out value="${result.seqno eq '0'?'red_bg':''}" />">
                                    <td class="point_link"><c:out value="${result.rownum}" /></td>
                                    <td class="point_link"><c:out value="${result.store_id}" /></td>
                                    <td><c:out value="${result.cpid}" /></td>
                                    <td><c:out value="${result.seqno eq '0'?'매출':'매입'}" /></td>
                                    <td><c:out value="${result.period_date}" /></td>
                                    <td><c:out value="${result.authdate}" /></td>
                                    <td><c:out value="${result.canceldate}" /></td>
                                    <!-- <td><c:out value="${result.bank_nm}" /></td> -->
                                    <td><c:out value="${result.orderno}" /></td>
                                    <td><c:out value="${result.username}" /></td>
                                    <td><c:out value="${result.productname}" /></td>
                                    <td><c:out value="${result.amount}" />원</td>
                                    <td><c:out value="${result.commission}" />%</td>
                                    <td><c:out value="${result.franchisee_commission}" />원</td>
                                    <td><c:out value="${result.commission_cost}" />원</td>
                                    <td><c:out value="${result.vat}" />원</td>
                                    <td><c:out value="${result.settlement}" />원</td>
                                    <!-- td>Y</td-->
                                </tr>     
                                </c:forEach>                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="paging">
                    <ul class="pager_btn">
                        <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page2"  />                 
                    </ul>
                </div>
                <div class="btn_box">
                    <a href="javascript:closePopup();" class="dark_full_btn">확인</a>
                </div>					
            </div>				
        </div>
    </div>
    <div class="dim"></div>
</div>
