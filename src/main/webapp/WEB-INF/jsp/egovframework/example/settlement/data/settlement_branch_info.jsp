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
                                    <dt>총결산금액</dt>
                                    <dd>40,000원</dd>
                                </dl>
                            </div>
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
                                    <th rowspan="2">No</th>
                                    <th rowspan="2">지급일자</th>
                                    <th rowspan="2">가맹점명</th>
                                    <th rowspan="2">상점ID</th>
                                    <th rowspan="2">결제수단</th>
                                    <th rowspan="2">정산주기</th>
                                    <th rowspan="2">정산기간</th>
                                    <th class="blue_bg" colspan="4">정산매출</th>
                                    <th class="red_bg" colspan="4">차감매출(정산후취소)</th>
                                    <th rowspan="2">정산금액</th>
                                    <th rowspan="2">수수료율</th>
                                    <th rowspan="2">수수료합계금액</th>
                                    <th rowspan="2">부가세</th>
                                    <th rowspan="2">지급액</th>
                                    <th rowspan="2">은행</th>
                                    <th rowspan="2">계좌번호</th>
                                    <th rowspan="2">예금주</th>
                                    <th rowspan="2">지급상태</th>
                                    <!-- <th>CPID</th>
                                    <th>매입구분</th>
                                    <th>승인일자</th>
                                    <th>주문번호</th>
                                    <th>구매자</th>
                                    <th>상품명</th>
                                    <th>거래금액</th>
                                    <th>수수료</th>
                                    <th>수수료원가</th>
                                    <th>영업대행</th>
                                    <th>대리점</th> -->
                                    <!-- th>상태</th-->
                                </tr>
                                <tr>
                                    <th class="blue_bg">건수</th>
                                    <th class="blue_bg">거래금액</th>
                                    <th class="blue_bg">수수료</th>
                                    <th class="blue_bg">정산금액</th>
                                    <th class="red_bg">건수</th>
                                    <th class="red_bg">취소금액</th>
                                    <th class="red_bg">수수료</th>
                                    <th class="red_bg">차감할금액</th>
                                </tr>
                            </thead>
                            <tbody class="">
                                <c:forEach var="result" items="${resultList}" varStatus="status">	
                                <tr>
                                    <td>1</td>
                                    <td><c:out value="${result.period_date}" /></td>
                                    <td class="point_link">장안가마솥</td>
                                    <td class="point_link"><c:out value="${result.store_id}" /></td>
                                    <td>신용카드</td>
                                    <td>매월10일</td>
                                    <td>20210725~20210730</td>
                                    <td class="blue_bg">200</td>
                                    <td class="blue_bg">10,000,000</td>
                                    <td class="blue_bg">2,400,000</td>
                                    <td class="blue_bg">27,600,000</td>
                                    <td class="red_bg">10</td>
                                    <td class="red_bg">1,000,000</td>
                                    <td class="red_bg">240,000</td>
                                    <td class="red_bg">2,780,000</td>
                                    <td>850,000</td>
                                    <td><c:out value="${result.commission}" />%</td>
                                    <td>80,000</td>
                                    <td></td>
                                    <td>5,120,000</td>
                                    <td><c:out value="${result.bank_nm}" /></td>
                                    <td>501-115-557741</td>
                                    <td>홍길동</td>
                                    <td>지급확인</td>
                                    <!-- <td><c:out value="${result.cpid}" /></td>
                                    <td>매입</td>
                                    <td><c:out value="${result.authdate}" /></td>
                                    <td><c:out value="${result.orderno}" /></td>
                                    <td><c:out value="${result.username}" /></td>
                                    <td><c:out value="${result.productname}" /></td>
                                    <td><c:out value="${result.amount}" />원</td>
                                    <td><c:out value="${result.franchisee_commission}" />원</td>
                                    <td><c:out value="${result.commission_cost}" />원</td>
                                    <td><c:out value="${result.vat}" />원</td>
                                    <td><c:out value="${result.settlement}" />원</td>
                                    <td><c:out value="${result.business_nm3}" /></td> -->
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
