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
            <strong class="pop_ttl">정산정보</strong>
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
                                    <dd><c:out value="${historyVO.d_amount}" />원</dd>
                                </dl>
                            </div>
                            <div class="list_box">
                                <dl>
                                    <dt>승인건</dt>
                                    <dd><c:out value="${historyVO.d_approval_cnt}" />건</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="list_box_wrap">
                            <div class="list_box">
                                <dl class="cancel">
                                    <dt>취소금액</dt>
                                    <dd><c:out value="${historyVO.d_cancel_sum}" />원</dd>
                                </dl>
                            </div>
                            <div class="list_box">
                                <dl class="cancel">
                                    <dt>취소건</dt>
                                    <dd><c:out value="${historyVO.d_cancel_cnt}" />건</dd>
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
                                    <th>상점ID</th>
                                    <th>요청금액</th>
                                    <th>승인일자</th>
                                    <th>취소일자</th>
                                    <th>구매자</th>
                                    <th>신용카드금액(원)</th>
                                    <th>수수료</th>
                                    <th>수수료 제외 금액</th>
                                    <th>카드계열</th>
                                    <th>승인번호</th>
                                    <th>할부개월수</th>
                                    <th>주문번호</th>
                                    <th>터미널ID</th>
                                    <th>매출전표</th>
                                    <th>고객이름</th>
                                    <th>고객전화번호</th>
                                    <th>영업대행</th>
                                    <th>대리점</th>
                                    <th>가맹점</th>
                                    <th>취소금액</th>
                                    <th>지급일</th>
                                </tr>
                            </thead>
                            <tbody class="">
                                <c:forEach var="result" items="${resultList}" varStatus="status">	
                                <tr class="<c:out value="${result.seqno eq '0'?'red_bg':''}" />">
                                    <td><c:out value="${result.store_id}" /></td>
                                    <td><c:out value="${result.amount}" />원</td>
                                    <td><c:out value="${result.authdate}" /></td>
                                    <td><c:out value="${result.cancel_datetime}" /></td>
                                    <td><c:out value="${result.username}" /></td>
                                    <td><c:out value="${result.amount}" />원</td>
                                    <td><c:out value="${result.commission}" />%</td>
                                    <td><c:out value="${result.franchisee_commission}" />원</td>
                                    <td><c:out value="${result.cardname}" /></td>
                                    <td><c:out value="${result.authno}" /></td>
                                    <td><c:out value="${result.quota}" /></td>
                                    <td><c:out value="${result.orderno}" /></td>
                                    <td><c:out value="${result.terminal_id}" /></td>
                                    <td><c:out value="${result.tax_state eq '2' ? 'Y':'N'}" /></td>
                                    <td><c:out value="${result.username}" /></td>
                                    <td><c:out value="${result.userphone}" /></td>
                                    <td><c:out value="${result.business_nm2}" /></td>
                                    <td><c:out value="${result.business_nm3}" /></td>
                                    <td><c:out value="${result.business_nm}" /></td>
                                    <td><c:out value="${result.cancel_amount}" />원</td>
                                    <td>D+<c:out value="${result.period}" /></td>
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