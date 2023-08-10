<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   

<script>
 <c:if test="${sessionScope.role_id eq '1001'}">
	getOption('#high_store_id', 'high_store_id', 'N', '');
 </c:if>
</script>
<script src="/js/manage_branch_register.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>대리점정보</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" enctype="multipart/form-data">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="passwd" id="passwd" value="1111" />
                <input type="hidden" name="role_id" id="role_id" value="1003" />
                <input type="hidden" name="no" id="no" value="" />
                <!--  <input type="hidden" name="period" id="period" value="30" /> -->
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
                            <td>
                                <input class="w180" type="text" name="store_id" placeholder="" id="store_id" value="${sessionScope.sessionLoginAction.id_firstset1 }">
                            </td>
                            <th>상호명</th>
                            <td>
                                <input class="w180" type="text" name="business_nm" placeholder="" id="business_nm">
                            </td>
                        </tr>
                        <tr>
                            <th>대표자</th>
                            <td>
                                <input class="w180" type="text" name="ceo" placeholder="" id="ceo">
                            </td>
                            <th>사업자등록번호</th>
                            <td>
                                <input class="w180" type="text" name="corp_regist_num" placeholder="000-00-00000" id="corp_regist_num" maxlength="12">
                            </td>
                        </tr>
                        <tr>
                            <th>대표자생년월일</th>
                            <td>
                                <input class="w180" type="text" name="ceo_birth" id="ceo_birth" placeholder="yyyy-mm-dd" maxlength="10">
                            </td>
                            <th>사업자구분</th>
                            <td>
                                <select class="w110" name="corp_type" placeholder="" id="corp_type">
                                        <option value="A">개인</option>
                                        <option value="B">법인</option>
                                        <option value="C">비영리 법인</option>
                                </select>									
                                <input class="w180" type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2">
                            </td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td>
                                <input class="w180" type="text" name="business_cond" placeholder="" id="business_cond">
                            </td>
                            <th>업종</th>
                            <td>
                                <input class="w180" type="text" name="industry_type" placeholder="" id="industry_type">
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>
                                <input class="w180" type="tel" name="tel" id="tel" maxlength="20">
                            </td>
                            <th>FAX</th>
                            <td>
                                <input class="w180" type="tel" name="fax" id="fax" maxlength="20">
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>
                                <input class="w180" type="text" name="phone_num" id="phone_num" maxlength="13">
                            </td>
                            <th>정산계좌번호</th>
                            <td>
                                <select class="w180" name="bank_code" placeholder="" id="bank_code">
                                </select>									
                                <input class="w180" type="text" name="account_num" placeholder="계좌번호" id="account_num">
                                <input class="w180" type="text" name="accounter" placeholder="예금주" id="accounter">
                            </td>
                        </tr>
                        <tr>
                            <th>Email 주소</th>
                            <td>
                                <input class="w180" type="email" name="email" id="email" maxlength="50">
                            </td>
                            <th>계약담당자</th>
                            <td>
                                <input class="w110" type="text" placeholder="이름" name="person_nm1" id="person_nm1"> 
                                <input class="w180" type="tel" placeholder="연락처" name="person_phone1" id="person_phone1" maxlength="13"> 
                                <input class="w180" type="text" placeholder="이메일" name="person_email1" id="person_email1" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <th>홈페이지 주소</th>
                            <td>
                                <input class="w380" type="text" name="hompage" placeholder="" id="hompage" maxlength="100" value="http://">
                            </td>
                            <th>정산담당자</th>
                            <td>
                                <input class="w110" type="text" placeholder="이름" name="person_nm2" id="person_nm2"> 
                                <input class="w180" type="tel" placeholder="연락처" name="person_phone2" id="person_phone2" maxlength="13"> 
                                <input class="w180" type="text" placeholder="이메일" name="person_email2" id="person_email2" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <th>계약일자</th>
                            <td>
                                <input class="w180" type="text" name="contract_date" placeholder="yyyy-mm-dd" id="contract_date" maxlength="10">
                            </td>
                            <th>기술담당자</th>
                            <td>
                                <input class="w110" type="text" placeholder="이름" name="person_nm3" id="person_nm3"> 
                                <input class="w180" type="tel" placeholder="연락처" name="person_phone3" id="person_phone3" maxlength="13"> 
                                <input class="w180" type="text" placeholder="이메일" name="person_email3" id="person_email3" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <th>사업장 주소</th>
                            <td>
                                <div class="input_address">
                                    <input class="w80" type="text" name="zip_code" placeholder="" id="zip_code" readonly="readonly">
                                    <button class="search_btn" type="button" onclick="jsDaumPostcode();"></button> 
                                    <input class="w240" type="text" name="address" placeholder="" id="address" >
                                </div>
                            </td>
                            <th>사업장 세부주소</th>
                            <td>
                                <input class="w380" type="text" name="detail_address" placeholder="" id="detail_address">
                            </td>
                        </tr>
                        <tr>
                            <!-- <th>터미널ID</th>
                            <td>
                                <input class="w180" type="text" name="terminal_id" placeholder="" id="terminal_id" >
                            </td> -->
                            <th>${sessionScope.role_id eq '1001'?'영업대행':''}</th>
                            <td colspan="3">
                            <c:choose>
                                <c:when test="${sessionScope.role_id eq '1001'}">
                                <select class="w180" name="high_store_id" placeholder="" id="high_store_id">
                                </select>									
                                </c:when>
                                <c:otherwise>
                                    <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.login_id}" />
                                </c:otherwise>
                            </c:choose>									
                            </td>									
                            <!-- <th>수수료</th>
                            <td>
                                <input class="w180" type="number" name="commission" id="commission">
                                <span class="unit">%</span>
                            </td> -->
                        </tr>
                        <tr>
                            <th>신용카드K 수수료</th>
                            <td class="fees_input">
                                <div class="fees_text fees01">
                                    <input class="w80" type="number" name="credit_card_k" id="credit_card_k" value="${sessionScope.PgFeeList.creditcardK_RT }">
                                    <span class="unit">%</span>
                                </div>
                            </td>
                            <th>단말기 수수료</th>
                            <td class="fees_input">
                                <div class="fees_text fees03">
                                    <input class="w80" type="number" name="terminal" id="terminal" value="${sessionScope.PgFeeList.terminal_RT }">
                                    <span class="unit">%</span>
                                </div>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th>신용카드 수수료</th>
                            <td colspan="3">
                                <div class="fees_input">
                                    <div class="fees_text fees02">
					                                        신용카드 <input class="w80" name="credit_card" id="credit_card" type="number" value="${sessionScope.PgFeeList.creditcard_RT }"><span class="unit">%</span> <span>/</span>
					                                        계좌이체 <input class="w80" name="account_transfer" id="account_transfer" type="number" value="${sessionScope.PgFeeList.accountTRF_RT }"><span class="unit">%</span> <span>/</span>   
					                                        가상계좌 <input class="w80" name="virtual_account" id="virtual_account" type="number" value="${sessionScope.PgFeeList.vaccountTRF_RT }"><span class="unit">%</span> <span>/</span>                                                                             
					                                        문화상품권 <input class="w80" name="gift_voucher" id="gift_voucher" type="number" value="${sessionScope.PgFeeList.giftvoucher_RT }"><span class="unit">%</span> <span>/</span>
					                                        스마트문상 <input class="w80" name="smart_gift_voucher" id="smart_gift_voucher" type="number" value="${sessionScope.PgFeeList.sgiftvoucher_RT }"><span class="unit">%</span> <span>/</span>
					                                        도서문화상품권 <input class="w80" name="book_gift_voucher" id="book_gift_voucher" type="number" value="${sessionScope.PgFeeList.bgiftvoucher_RT }"><span class="unit">%</span>
                                    </div>
                                </div>
                            </td>										
                        </tr> -->
                        <tr>
                            <th>지급상태</th>
                            <td>
                                <select class="w180" name="tax" id="tax">
                                    <!-- <option value="Y">세금계산서</option> -->
                                    <option value="">매출세금계산서</option>
                                    <option value="">매입세금계산서</option>
                                    <option value="N">원천징수</option>
                                </select>
                            </td>									
                            <th>상태구분</th>
                            <td>
                                <select class="w110" name="state" placeholder="" id="state">
                                        <option value="Y">사용</option>
                                        <option value="N">중지</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="">정산방식</th>
                            <td>
                                <select name="settlement_type" id="settlement_type" class="w180">
                                    <option value="G">일반정산</option>
                                    <option value="D">직접정산</option>
                                </select>
                            </td>								
                            <th>정산주기</th>
                            <td>
                                <select class="w180" name="period" placeholder="" id="period">
                                    <option value="">선택</option>
                                    <c:forEach var="i" begin="0" end="30">
                                        <option value="<c:out value="${i}" />">D+<c:out value="${i}" /></option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>	
                        <tr>
                            <th>보증금(보증보험)</th>
                            <td>
                                <input type="number" class="w140" name="deposit" placeholder="" id="deposit" >
                            </td>
                            <th>통합한도설정</th>
                            <td>
                                <input type="number" class="w140" name="itg_limitset" placeholder="" id="itg_limitset">
                            </td>
                        </tr>		
                        <tr>
                            <th>첨부파일</th>
                            <td class="file_add" colspan="3">
                                <div class="file_add_wrap_box">
                                    <div class="file_add_wrap file_add_default">
                                        <div class="file_add_btn">
                                            <input type="text" class="w180" name="file_nm" id="file_nm" value="" readonly>
                                            <input type="file" id="file_add_1" name="file" >
                                            <label for="file_add_1"><span class="file_select">파일선택</span></label>
                                            <!-- <button type="button" class="file_plus_btn">파일추가</button>
                                            <button type="button" class="file_minus_btn">파일삭제</button> -->
                                        </div>
                                    </div>                             
                                    <div class="file_add_wrap file_add_default">
                                        <div class="file_add_btn">
                                            <input type="text" class="w180" name="file_nm" id="file_nm" value="" readonly>
                                            <input type="file" id="file_add_2" name="file" >
                                            <label for="file_add_2"><span class="file_select">파일선택</span></label>
                                            <!-- <button type="button" class="file_plus_btn">파일추가</button>
                                            <button type="button" class="file_minus_btn">파일삭제</button> -->
                                        </div>
                                    </div>                             
                                    <div class="file_add_wrap file_add_default">
                                        <div class="file_add_btn">
                                            <input type="text" class="w180" name="file_nm" id="file_nm" value="" readonly>
                                            <input type="file" id="file_add_3" name="file" >
                                            <label for="file_add_3"><span class="file_select">파일선택</span></label>
                                            <!-- <button type="button" class="file_plus_btn">파일추가</button>
                                            <button type="button" class="file_minus_btn">파일삭제</button> -->
                                        </div>
                                    </div>                             
                                </div>
                                <div class="file_add_wrap_box">
                                    <div class="file_add_wrap file_add_default">
                                        <div class="file_add_btn">
                                            <input type="text" class="w180" name="file_nm" id="file_nm" value="" readonly>
                                            <input type="file" id="file_add_4" name="file" >
                                            <label for="file_add_4"><span class="file_select">파일선택</span></label>
                                            <!-- <button type="button" class="file_plus_btn">파일추가</button>
                                            <button type="button" class="file_minus_btn">파일삭제</button> -->
                                        </div>
                                    </div>                             
                                    <div class="file_add_wrap file_add_default">
                                        <div class="file_add_btn">
                                            <input type="text" class="w180" name="file_nm" id="file_nm" value="" readonly>
                                            <input type="file" id="file_add_5" name="file" >
                                            <label for="file_add_5"><span class="file_select">파일선택</span></label>
                                            <!-- <button type="button" class="file_plus_btn">파일추가</button>
                                            <button type="button" class="file_minus_btn">파일삭제</button> -->
                                        </div>
                                    </div>                             
                                    <div class="file_add_wrap file_add_default">
                                        <div class="file_add_btn">
                                            <input type="text" class="w180" name="file_nm" id="file_nm" value="" readonly>
                                            <input type="file" id="file_add_6" name="file" >
                                            <label for="file_add_6"><span class="file_select">파일선택</span></label>
                                            <!-- <button type="button" class="file_plus_btn">파일추가</button>
                                            <button type="button" class="file_minus_btn">파일삭제</button> -->
                                        </div>
                                    </div>                             
                                </div>
                            </td>	
                        </tr>				
                    </tbody>
                </table>
                <div class="btn_box">
                    <a href="/manage/manage_branch.do?view_type=L" class="dark_line_btn">이전</a>
                    <a href="javascript:fnSubmit();" id="frmAdd" class="dark_full_btn">등록하기</a>
                    <a href="/manage/manage_branch.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>
	<!-- //wrap -->
    
    <script>

        $(function(){
            
            $.fn.outerHTML = function() {
                var el = $(this);
                if( !el[0] ) return "";
            
                if (el[0].outerHTML) {
                    return el[0].outerHTML;
                } else {
                    var content = el.wrap('<p/>').parent().html();
                    el.unwrap();
                    return content;
                }
            }
            
    
            var fileHtml = $('.file_add_default').outerHTML();
            var fileCont = 0;
            
            $(document).on('click','.file_add .file_plus_btn',function(){
                if(fileCont < 9){
                    $('td.file_add').append(fileHtml);
                    fileCont++;
                } else {
                    alert('첨부파일은 10개까지만 추가 가능합니다.');
                }
            });
            $(document).on('click','.file_add .file_minus_btn',function(){
                $(this).parents('.file_add_default').remove();
                fileCont--;
            });
            
            $( "#file_add" ).change(function() {
        		var file_add = $( "#file_add" ).val();
        		$("#file_nm").val(file_add);
        	});	
        	
        	// 파일선택 버튼 클릭
        	$('input[name="file"]').change(function(){
        		var file_add = $(this).val();
        		$(this).prev("#file_nm").val(file_add);
        	});
    
        });
    
    </script>


