<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>   


                <form action="" class="table_layout02_wrap fixtable_wrap" name="frm3">
                	<input type="hidden" name="yyyy" value="">
        			<input type="hidden" name="ym" value=""/>
                    <table class="table_layout02">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th><button type="button">상</button></th>
                                <th><button type="button">상점명</button></th>
                                <th><button type="button">상점아이디</button></th>
                                <th><button type="button">사업자번호(주민등록번호)</button></th>
                                <th><button type="button">승인건수</button></th>
                                <th><button type="button">승인금액기간별(<c:out value="${searchSettlementVO.start_datetime}" />~<c:out value="${searchSettlementVO.end_datetime}" />)</button></th>
                                <th><button type="button">취소건수</button></th>
                                <th><button type="button">취소금액기간별(<c:out value="${searchSettlementVO.start_datetime}" />~<c:out value="${searchSettlementVO.end_datetime}" />)</button></th>
                                <th><button type="button">합계금액</button></th>
                                <th><button type="button">수수료율</button></th>
                                <th><button type="button">수수료</button></th>
                                <th><button type="button">공급가</button></th>
                                <th><button type="button">부가세</button></th>
                            </tr>
                        </thead>
                        <tbody>
				            <c:choose>
				                <c:when test="${!empty resultList}">							
				                    <c:forEach var="result" items="${resultList}" varStatus="status">	                        
		                            <tr>
		                                <td><span><c:out value="${result.rownum}" /></span></td>
		                                <td><span><c:out value="${result.tax_state eq '0' ? '미발행':'발행'}" /></span></td>
		                                <td><span><c:out value="${result.business_nm}" /></span></td>
		                                <td><span><c:out value="${result.store_id}" /></span></td>
		                                <td><span><c:out value="${result.corp_regist_num}" /></span></td>
		                                <td><span><c:out value="${result.approve_cnt}" /></span></td>
		                                <td><span><c:out value="${result.amount}" /></span></td>
		                                <td><span><c:out value="${result.cancel_cnt}" /></span></td>
		                                <td><span><c:out value="${result.cancel_amount}" /></span></td>
		                                <td><span><c:out value="${result.amount_sum}" /></span></td>
		                                <td><span><c:out value="${result.commission}" />%</span></td>
		                                <td><span><c:out value="${result.franchisee_commission}" /></span></td>
		                                <td><span><c:out value="${result.commission_cost}" /></span></td>
		                                <td><span><c:out value="${result.vat}" /></span></td>
		                            </tr>				                    
				                    </c:forEach>
		                            <tr class="total_list">
		                                <td><span></span></td>
		                                <td><span>합계</span></td>
		                                <td><span></span></td>
		                                <td><span></span></td>
		                                <td><span><c:out value="${settlementVO.approve_cnt}" /></span></td>
		                                <td><span><c:out value="${settlementVO.amount}" /></span></td>
		                                <td><span><c:out value="${settlementVO.cancel_cnt}" /></span></td>
		                                <td><span><c:out value="${settlementVO.cancel_amount}" /></span></td>
		                                <td><span></span></td>
		                                <td><span></span></td>
		                                <td><span><c:out value="${settlementVO.commission}" />%</span></td>
		                                <td><span></span></td>
		                                <td><span></span></td>
		                                <td><span><c:out value="${settlementVO.vat}" /></span></td>
		                            </tr> 				                    
				                </c:when>
				                <c:otherwise>
				                    <tr>
				                        <td colspan="13">조회 내역이 없습니다</td>
				                    </tr>
				                </c:otherwise>
				            </c:choose>	                          
                        </tbody>
                    </table>
                </form>
                <!-- pager -->
                <div class="paging">
                    <ul class="pager_btn">
                        <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page2"  />
                    </ul>
                </div>
                <!-- //pager -->



