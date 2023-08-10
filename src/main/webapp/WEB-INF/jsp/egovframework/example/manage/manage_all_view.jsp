<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script>
		var store_id = '<c:out value="${manageVo.store_id}" />';
	</script>   	
    <script src="/js/manage_all_view.js"></script>

    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>영업대행정보</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="store_id" id="store_id" value="${manageVo.store_id }" />
                <input type="hidden" name="role_id" id="role_id" value="1002" />
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>상점ID</th>
                            <td>${manageVo.store_id }</td>
                            <th>상호명</th>
                            <td>${manageVo.business_nm }</td>
                        </tr>
                        <tr>
                            <th>대표자</th>
                            <td>${manageVo.ceo }</td>
                            <th>사업자등록번호</th>
                            <td>${manageVo.corp_regist_num }</td>
                        </tr>
                        <tr>
                            <th>대표자생년월일</th>
                            <td>${manageVo.ceo_birth }</td>
                            <th>사업자구분</th>
                            <td>
                                ${manageVo.corp_type eq 'A'?'비사업자':(manageVo.corp_type eq 'B'?'법인':'비영리 법인') }									
                                ${manageVo.corp_regist_num2 }
                            </td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td>${manageVo.business_cond }</td>
                            <th>업종</th>
                            <td>${manageVo.industry_type }</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>${manageVo.tel }</td>
                            <th>FAX</th>
                            <td>${manageVo.fax }</td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>${manageVo.phone_num }</td>
                            <th>정산계좌번호</th>
                            <td>
                                ${manageVo.bank_nm }									
                                ${manageVo.account_num }
                            </td>
                        </tr>
                        <tr>
                            <th>Email 주소</th>
                            <td>${manageVo.email }</td>
                            <th>계약담당자</th>
                            <td>
                                ${manageVo.person_nm1 } 
                                ${manageVo.person_phone1 }
                                ${manageVo.person_email1 }
                            </td>
                        </tr>
                        <tr>
                            <th>홈페이지 주소</th>
                            <td>${manageVo.hompage }</td>
                            <th>정산담당자</th>
                            <td>
                                ${manageVo.person_nm2 }
                                ${manageVo.person_phone2 }
                                ${manageVo.person_email2 }
                            </td>
                        </tr>
                        <tr>
                            <th>계약일자</th>
                            <td>${manageVo.contract_date }</td>
                            <th>기술담당자</th>
                            <td>
                                ${manageVo.person_nm3 }
                                ${manageVo.person_phone3 }
                                ${manageVo.person_email3 }
                            </td>
                        </tr>
                        <tr>
                            <th>사업장 주소</th>
                            <td>
                                ${manageVo.zip_code } 
                                ${manageVo.address }
                            </td>
                            <th>사업장 세부주소</th>
                            <td>${manageVo.detail_address }</td>
                        </tr>
                        <tr>
                            <th>신용카드K 수수료</th>
                            <td>
                                ${manageVo.credit_card_k }<span class="unit">%</span> 
                            </td>
                            <th>단말기 수수료</th>
                            <td>
                                ${manageVo.terminal }<span class="unit">%</span>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th>신용카드 수수료</th>
                            <td colspan="3">
                                신용카드 ${manageVo.credit_card }<span class="unit">%</span> <span>/</span>
                                계좌이체 ${manageVo.account_transfer }<span class="unit">%</span> <span>/</span>
                                가상계좌 ${manageVo.virtual_account }<span class="unit">%</span> <span>/</span>
                                문화상품권 ${manageVo.gift_voucher }<span class="unit">%</span> <span>/</span>
                                스마트문상 ${manageVo.smart_gift_voucher }<span class="unit">%</span> <span>/</span>
                                도서문화상품권 ${manageVo.book_gift_voucher }<span class="unit">%</span>
                            </td>								
                        </tr> -->
                        <tr>
                            <th>지급상태</th>
                            <td>${manageVo.tax eq 'Y'?'세금계산서':'원천징수'}</td>
                            <th>정산방식</th>	
                            <td>${manageVo.settlement_type eq 'G'?'일반정산':'직접정산'}</td>
                        </tr>
                        <%-- <tr>
                            <th>대리점 / 가맹점</th>
                            <td>
                                <select name="roleStore" id="roleStore" class="w180">
                                    <option value="">선택</option>
                                </select>
                                <select name="roleStore2" id="roleStore2" class="w180">
                                    <option value="">선택</option>
                                </select>
                            </td>		
                            <th>정산방식</th>	
                            <td>${manageVo.settlement_type eq 'G'?'일반정산':'직접정산'}</td>
                        </tr> --%>
                        <tr>
                            <th>상태구분</th>
                            <td>${manageVo.state eq 'Y'?'사용':'중지'}</td>
                            <th>정산주기</th>	
                            <td>D+${manageVo.period }</td>						
                        </tr>
                        <tr>
                            <th>보증금(보증보험)</th>
                            <td>${manageVo.deposit }</td>
                            <th>통합한도설정</th>
                            <td>${manageVo.itg_limitset }</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3" class="file_list">
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
                    <a href="/manage/manage_all.do?view_type=L" class="dark_line_btn">이전</a>
                    <a href="/manage/manage_all.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>


	<!-- //container -->

	<!-- //wrap -->


