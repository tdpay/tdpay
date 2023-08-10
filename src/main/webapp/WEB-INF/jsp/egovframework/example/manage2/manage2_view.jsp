<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script src="/js/manage2_view.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>가맹점정보</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="store_id" id="store_id" value="${manage2Vo.store_id }" />
                <input type="hidden" name="role_id" id="role_id" value="1004" />
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:165px;">
                        <col style="width:auto;">
                        <col style="width:165px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>상점ID</th>
                            <td>${manage2Vo.store_id }</td>
                            <th>상호명</th>
                            <td>${manage2Vo.business_nm }</td>
                        </tr>
                        <tr>
                            <th>대표자</th>
                            <td>${manage2Vo.ceo }</td>
                            <th>사업자등록번호</th>
                            <td>${manage2Vo.corp_regist_num }</td>
                        </tr>
                        <tr>
                            <th>대표자생년월일</th>
                            <td>${manage2Vo.ceo_birth }</td>
                            <th>사업자구분</th>
                            <td>
                                ${manage2Vo.corp_type eq 'A'?'비사업':(manage2Vo.corp_type eq 'B'?'법인':'비영리 법인') }									
                                ${manage2Vo.corp_regist_num2 }
                            </td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td>${manage2Vo.business_cond }</td>
                            <th>업종</th>
                            <td>${manage2Vo.industry_type }</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>${manage2Vo.tel }</td>
                            <th>FAX</th>
                            <td>${manage2Vo.fax }</td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>${manage2Vo.phone_num }</td>
                            <th>정산계좌번호</th>
                            <td>
                                ${manage2Vo.bank_nm }	
                                ${manage2Vo.accounter } 							
                                ${manage2Vo.account_num }
                            </td>
                        </tr>
                        <tr>
                            <th>Email 주소</th>
                            <td>${manage2Vo.email }</td>
                            <th>계약담당자</th>
                            <td>
                                ${manage2Vo.person_nm1 }
                                ${manage2Vo.person_phone1 }
                                ${manage2Vo.person_email1 }
                            </td>
                        </tr>
                        <tr>
                            <th>홈페이지 주소</th>
                            <td>${manage2Vo.hompage }</td>
                            <th>정산담당자</th>
                            <td>
                                ${manage2Vo.person_nm2 }
                                ${manage2Vo.person_phone2 }
                                ${manage2Vo.person_email2 }
                            </td>
                        </tr>
                        <tr>
                            <th>계약일자</th>
                            <td>${manage2Vo.contract_date }
                            </td>
                            <th>기술담당자</th>
                            <td>
                                ${manage2Vo.person_nm3 }
                                ${manage2Vo.person_phone3 }
                                ${manage2Vo.person_email3 }
                            </td>
                        </tr>
                        <tr>
                            <th>CPID</th>
                            <td>${manage2Vo.cpid }</td>
                            <th>사업장 주소</th>
                            <td>
                                ${manage2Vo.zip_code }
                                ${manage2Vo.address }
                                ${manage2Vo.detail_address }
                            </td>
                        </tr>
                        <tr>
                            <th>터미널ID/단말기번호</th>
                            <td>${manage2Vo.terminal_id } / ${manage2Vo.imei }
                            </td>
                            <th>대리점</th>
                            <td>${manage2Vo.high_business_nm }</td>										
                        </tr>
                        <tr>
                            <th>신용카드K 수수료</th>
                            <td>
                                ${manage2Vo.credit_card_k }<span class="unit">%</span> 
                            </td>
                            <th>단말기 수수료</th>
                            <td>
                                ${manage2Vo.terminal }<span class="unit">%</span>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th>신용카드 수수료</th>
                            <td colspan="3">
                                신용카드 ${manage2Vo.credit_card }<span class="unit">%</span> <span>/</span>
                                계좌이체 ${manage2Vo.account_transfer }<span class="unit">%</span> <span>/</span>
                                가상계좌 ${manage2Vo.virtual_account }<span class="unit">%</span> <span>/</span>
                                문화상품권 ${manage2Vo.gift_voucher }<span class="unit">%</span> <span>/</span>
                                스마트문상 ${manage2Vo.smart_gift_voucher }<span class="unit">%</span> <span>/</span>
                                도서문화상품권 ${manage2Vo.book_gift_voucher }<span class="unit">%</span>
                            </td>								
                        </tr> -->
                        <tr>
                            <th>세금계산서 발행
                            </th>
                            <td>${manage2Vo.tax eq 'Y'?'발행':'미발행'}</td>
                            <th>단말기 구분</th>
                            <td>
                            	<c:choose>
		                    	<c:when test="${manage2Vo.payment_device eq 'T' }">단말기</c:when>
		                    	<c:when test="${manage2Vo.payment_device eq 'K' }">신용카드K</c:when>
		                    	<c:when test="${manage2Vo.payment_device eq 'C' }">일반카드</c:when>
		                    	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>정산방식</th>
                            <td>
                                ${manage2Vo.settlement_type eq 'G'?'일반정산':'직접정산'}
                            </td>
                            <th>정산주기</th>
                            <td>
                                D+${manage2Vo.period}
                            </td>
                        </tr>															
                        <tr>
                            <th>상태구분</th>
                            <td>
                                ${manage2Vo.state eq 'Y'?'사용':'중지'}
                            </td>
                            <th>일거래 한도액</th>
                            <td>
                                ${manage2Vo.daily_transaction_limit}
                            </td>
                        </tr>															
                        <tr>
                            <th>월거래 한도액</th>
                            <td>
                                ${manage2Vo.monthly_transaction_limit}
                            </td>
                            <th>동일카드 일한도</th>
                            <td>
                                ${manage2Vo.samecard_daily_limit}
                            </td>
                        </tr>															
                        <tr>
                            <th>거래건당 한도액</th>
                            <td>
                                ${manage2Vo.transaction_limit}
                            </td>
                            <th>동일카드 일 승인횟수</th>
                            <td>
                                ${manage2Vo.samecard_daily_approvals}
                            </td>
                        </tr>															
                        <tr>
                            <th>수기결제 할부개월수</th>
                            <td>
                            	${manage2Vo.installment_months eq '0'?'일시불':manage2Vo.installment_months}
                            </td>
                            <th>보증금(보증보험)</th>
                            <td>${manage2Vo.deposit }</td>
                        </tr>	
                        <tr>
                            <th>통합한도설정</th>
                            <td colspan="3">${manage2Vo.itg_limitset }</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td class="file_list" colspan="3">
                            	<c:set var="comma" value=","/>
                                <c:forEach var="result" items="${fileList}" varStatus="status">	
                                    <a href="/fileDownload.do?no=${result.file_num }"><label for="delete_check_${result.file_nm }">${result.file_nm }</a>
                                    <c:if test="${!status.last}">${comma}</c:if>
                                </c:forEach>
                            </td>
                        </tr>									
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="/manage2/manage2.do?view_type=L" class="dark_line_btn">이전</a>
                    <a href="/manage2/manage2.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>



	<script>
	document.getElementById('go_back').addEventListener('click', () => {
	  window.history.back();
	});

	</script>



