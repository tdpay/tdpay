<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script src="/js/manage2_modify.js"></script>
	<script>
		 getOption('#bank_code', 'bank', 'N', '${manage2Vo.bank_code }');
		 getOption('#high_store_id', 'high_store_id2', 'N', '${manage2Vo.high_store_id }');
    </script>
        
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>가맹점정보</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="" enctype="multipart/form-data">
                <input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
                <input type="hidden" name="store_id" id="store_id" value="${manage2Vo.store_id }" />
                <input type="hidden" name="role_id" id="role_id" value="1004" />
                <input type="hidden" name="no" id="no" value=${manage2Vo.no } />
                <input type="hidden" name="arrChk" id="arrChk"/>
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
                                <input class="w180" type="text" name="" placeholder="uwal" id="" value="${manage2Vo.store_id }" disabled>
                            </td>
                            <th>상호명</th>
                            <td>
                                <input class="w180" type="text" name="business_nm" placeholder="유월커뮤니케이션" id="business_nm" value="${manage2Vo.business_nm }" disabled>
                            </td>
                        </tr>
                        <tr>
                            <th>대표자</th>
                            <td>
                                <input class="w180" type="text" name="ceo" placeholder="김평진" id="ceo" value="${manage2Vo.ceo }">
                            </td>
                            <th>사업자등록번호</th>
                            <td>
                                <input class="w180" type="text" name="corp_regist_num" placeholder="107-87-86839" id="corp_regist_num" value="${manage2Vo.corp_regist_num }" disabled>
                            </td>
                        </tr>
                        <tr>
                            <th>대표자생년월일</th>
                            <td>
                                <input class="w180" type="text" name="ceo_birth" placeholder="1981.12.09" id="ceo_birth" value="${manage2Vo.ceo_birth }">
                            </td>
                            <th>사업자구분</th>
                            <td>
                                <select class="w110" name="corp_type" placeholder="" id="corp_type">
                                    <option value="D" ${manage2Vo.corp_type eq 'D' ?'selected':''}>개인사업자</option>
                                    <option value="B" ${manage2Vo.corp_type eq 'B' ?'selected':''}>법인</option>
                                    <option value="E" ${manage2Vo.corp_type eq 'E' ?'selected':''}>영리법인</option>
                                    <option value="A" ${manage2Vo.corp_type eq 'A' ?'selected':''}>비사업</option>
                                    <!-- <option value="C" ${manage2Vo.corp_type eq 'C' ?'selected':''}>비영리 법인</option> -->
                                </select>				
                                <c:if test="${manage2Vo.corp_type eq 'A' or manage2Vo.corp_type eq 'B'}">
                                <input class="w180" type="text" name="corp_regist_num2" placeholder="" id="corp_regist_num2" value="${manage2Vo.corp_regist_num2 }">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td>
                                <input class="w180" type="text" name="business_cond" placeholder="서비스" id="business_cond" value="${manage2Vo.business_cond }">
                            </td>
                            <th>업종</th>
                            <td>
                                <input class="w180" type="text" name="industry_type" placeholder="온라인정보제공업" id="industry_type" value="${manage2Vo.industry_type }">
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>
                                <input class="w180" type="tel" name="tel" placeholder="02-0000-0000" id="tel" value="${manage2Vo.tel }">
                            </td>
                            <th>FAX</th>
                            <td>
                                <input class="w180" type="tel" name="fax" placeholder="02-0000-0000" id="fax" value="${manage2Vo.fax }">
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>
                                <input class="w180" type="text" name="phone_num" placeholder="010-0000-0000" id="phone_num" value="${manage2Vo.phone_num }">
                            </td>
                            <th>정산계좌번호</th>
                            <td>
                                <select class="w180" name="bank_code" placeholder="" id="bank_code" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                </select>									
                                <input class="w180" type="text" name="account_num" placeholder="000-000-000000" id="account_num" value="${manage2Vo.account_num }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                <input class="w180" type="text" name="accounter" placeholder="예금주" id="accounter" value="${manage2Vo.accounter }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                            </td>
                        </tr>
                        <tr>
                            <th>Email 주소</th>
                            <td>
                                <input class="w180" type="email" name="email" placeholder="text@test.com" id="email" value="${manage2Vo.email }">
                            </td>
                            <th>계약담당자</th>
                            <td>
                                <input class="w110" type="text" name="person_nm1" placeholder="홍길동" id="person_nm1" value="${manage2Vo.person_nm1 }"> 
                                <input class="w180" type="tel" name="person_phone1" placeholder="010-0000-0000" id="person_phone1" value="${manage2Vo.person_phone1 }"> 
                                <input class="w180" type="text" name="person_email1" placeholder="test@test.com" id="person_email1" value="${manage2Vo.person_email1 }">
                            </td>
                        </tr>
                        <tr>
                            <th>홈페이지 주소</th>
                            <td>
                                <input class="width_380" type="text" name="hompage" placeholder="" id="hompage" value="${manage2Vo.hompage }">
                            </td>
                            <th>정산담당자</th>
                            <td>
                                <input class="w110" type="text" name="person_nm2" placeholder="홍길동" id="person_nm2" value="${manage2Vo.person_nm2 }"> 
                                <input class="w180" type="tel" name="person_phone2" placeholder="010-0000-0000" id="person_phone2" value="${manage2Vo.person_phone2 }"> 
                                <input class="w180" type="text" name="person_email2" placeholder="test@test.com" id="person_email2" value="${manage2Vo.person_email2 }">
                            </td>
                        </tr>
                        <tr>
                            <th>계약일자</th>
                            <td>
                                <input class="w180" type="text" name="contract_date" placeholder="2020.10.05" id="contract_date" value="${manage2Vo.contract_date }" disabled>
                            </td>
                            <th>기술담당자</th>
                            <td>
                                <input class="w110" type="text" name="person_nm3" placeholder="홍길동" id="person_nm3" value="${manage2Vo.person_nm3 }"> 
                                <input class="w180" type="tel" name="person_phone3" placeholder="010-0000-0000" id="person_phone3" value="${manage2Vo.person_phone3 }"> 
                                <input class="w180" type="text" name="person_email3" placeholder="test@test.com" id="person_email3" value="${manage2Vo.person_email3 }">
                            </td>
                        </tr>
                        <tr>
                            <th>CPID</th>
                            <td>
                                <input class="w180" type="text" name="cpid" placeholder="" id="cpid" value="${manage2Vo.cpid }" >
                            </td>
                            <th>사업장 주소
                            </th>
                            <td>
                                <div class="input_address">
                                    <input class="w80" type="text" name="zip_code" placeholder="" id="zip_code" value="${manage2Vo.zip_code }" readonly="readonly">
                                    <button class="search_btn" type="button" onclick="jsDaumPostcode();"></button> 
                                    <input class="w240" type="text" name="address" placeholder="" id="address" value="${manage2Vo.address }" >
                                    <input class="w180" type="text" name="detail_address" placeholder="" id="detail_address" value="${manage2Vo.detail_address }">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>터미널ID/단말기번호</th>
                            <td>
                                <input class="w110" type="text" name="terminal_id" placeholder="" id="terminal_id" value="${manage2Vo.terminal_id }">
                                <input class="w110" type="text" name="imei" placeholder="" id="imei" value="${manage2Vo.imei }">
                            </td>
                            <th>대리점</th>
                            <td>
                                <select class="w180" name="high_store_id" placeholder="" id="high_store_id" disabled>
                                </select>									
                            </td>										
                        </tr>
                        <tr>
                            <th>신용카드K 수수료</th>
                            <td class="fees_input">
                                <div class="fees_text fees01">
                                    <input class="w80" type="number" name="credit_card_k" id="credit_card_k" value="${manage2Vo.credit_card_k }">
                                    <span class="unit">%</span>
                                </div>
                            </td>
                            <th>단말기 수수료</th>
                            <td class="fees_input">
                                <div class="fees_text fees03">
                                    <input class="w80" type="number" name="terminal" id="terminal" value="${manage2Vo.terminal }">
                                    <span class="unit">%</span>
                                </div>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th>신용카드 수수료</th>
                            <td colspan="3">
                                <div class="fees_input">
                                    <div class="fees_text fees02">
					                                        신용카드 <input class="w80" name="credit_card" id="credit_card" type="number" value="${manage2Vo.credit_card }"><span class="unit">%</span> <span>/</span>
					                                        계좌이체 <input class="w80" name="account_transfer" id="account_transfer" type="number" value="${manage2Vo.account_transfer }"><span class="unit">%</span> <span>/</span>   
					                                        가상계좌 <input class="w80" name="virtual_account" id="virtual_account" type="number" value="${manage2Vo.virtual_account }"><span class="unit">%</span> <span>/</span>                                                                             
					                                        문화상품권 <input class="w80" name="gift_voucher" id="gift_voucher" type="number" value="${manage2Vo.gift_voucher }"><span class="unit">%</span> <span>/</span>
					                                        스마트문상 <input class="w80" name="smart_gift_voucher" id="smart_gift_voucher" type="number" value="${manage2Vo.smart_gift_voucher }"><span class="unit">%</span> <span>/</span>
					                                        도서문화상품권 <input class="w80" name="book_gift_voucher" id="book_gift_voucher" type="number" value="${manage2Vo.book_gift_voucher }"><span class="unit">%</span>
                                    </div>
                                </div>
                            </td>										
                        </tr> -->
                        <tr>
                            <th>세금계산서 발행</th>
                            <td>
                                <select class="w180"	name="tax" placeholder="" id="tax" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                    <option value="">선택</option>
                                    <option value="Y" ${manage2Vo.tax eq 'Y' ?'selected':'' }>발행</option>
                                    <option value="N" ${manage2Vo.tax eq 'N' ?'selected':'' }>미발행</option>
                                </select>
                            </td>
                            <th>단말기 구분</th>
                            <td>
                                <select name="payment_device" id="payment_device" class="w180">
                                	<option value="">선택</option>
                                    <option value="T" ${manage2Vo.payment_device eq 'T'?'selected':''}>단말기</option>
                                    <option value="K" ${manage2Vo.payment_device eq 'K'?'selected':''}>신용카드K</option>
                                    <option value="C" ${manage2Vo.payment_device eq 'C'?'selected':''}>일반카드</option>
                                </select>                                        
                            </td>
                        </tr>
                        <tr>
                            <th>정산방식</th>
                            <td>
                                <select name="settlement_type" id="settlement_type" class="w180">
                                    <option value="G" ${manage2Vo.settlement_type eq 'G'?'selected':''}>일반정산</option>
                                    <option value="D" ${manage2Vo.settlement_type eq 'D'?'selected':''}>직접정산</option>
                                </select>                                        
                            </td>
                            <th>정산주기</th>
                            <td>
                                <select class="w180" name="period" placeholder="" id="period" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                    <option value="">선택</option>
                                    <c:forEach var="i" begin="0" end="29">
                                        <option value="<c:out value="${i}"/>" ${manage2Vo.period == i ?'selected':'' }>D+<c:out value="${i}" /></option>
                                    </c:forEach>
                                </select>
                            </td> 
                        </tr>	 
                        <tr>        
                            <th>상태구분</th>
                            <td>
                                <select class="w110" name="state" placeholder="" id="state">
                                        <option value="Y" ${manage2Vo.state eq 'Y'?'selected':''}>사용</option>
                                        <option value="N" ${manage2Vo.state eq 'N'?'selected':''}>중지</option>
                                </select>
                            </td>      
                            <th>일거래 한도액</th>
                            <td>
                                <input class="w180" type="number" name="daily_transaction_limit" placeholder="" id="daily_transaction_limit" value="${manage2Vo.daily_transaction_limit }">
                            </td>                         
                        </tr>	
                        <tr>
                            <th>월거래한도액</th>
                            <td>
                                <input class="w180" type="number" name="monthly_transaction_limit" placeholder="" id="monthly_transaction_limit" value="${manage2Vo.monthly_transaction_limit }">
                            </td>        
                            <th>동일카드 일한도</th>
                            <td>
                                <input class="w180" type="number" name="samecard_daily_limit" placeholder="" id="samecard_daily_limit" value="${manage2Vo.samecard_daily_limit }">
                            </td>        
                        </tr>														
                        <tr>
                            <th>거래건당 한도액</th>
                            <td>
                                <input class="w180" type="number" name="transaction_limit" placeholder="" id="transaction_limit" value="${manage2Vo.transaction_limit }">
                            </td>        
                            <th>동일카드 일 승인횟수</th>
                            <td>
                                <!-- <select class="w180" name="" id="">
                                    <option value="">선택</option>
                                </select> -->
                                <input class="w180" type="number" name="samecard_daily_approvals" placeholder="" id="samecard_daily_approvals" value="${manage2Vo.samecard_daily_approvals }">
                            </td>        
                        </tr>														
                        <tr>
                            <th>수기결제 할부개월수</th>
                            <td>
                                <select class="w180" name="installment_months" placeholder="" id="installment_months">
                                    <c:forEach var="i" begin="0" end="12">
                                    	<fmt:formatNumber var="no" minIntegerDigits="2" value="${i}" type="number"/>
                                   		<option value="<c:out value="${i }" />" ${manage2Vo.installment_months eq i ?'selected':''} >
                                   			<c:if test="${i eq '0'}">일시불</c:if>
                                   			<c:if test="${i ne '0'}"><c:out value="${no }" /></c:if>
                                   		</option>
                                    </c:forEach>
                                </select>
                            </td>  
                            <th>보증금(보증보험)</th>
                            <td>
                                <input type="number" class="w140" name="deposit" id="deposit" value="${manage2Vo.deposit }">
                            </td>      
                        </tr>		
                        <tr>		
                            <th>통합한도설정</th>
                            <td>
                                <input type="number" class="w140" name="itg_limitset" id="itg_limitset" value="${manage2Vo.itg_limitset }">
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
                        <tr>
                            <th>첨부파일 내용 </th>
                            <td colspan="3">
                                <div>
                                	<c:forEach var="result" items="${fileList}" varStatus="status">
                                    <div class="file_delete">
                                        <!-- <input id="delete_check_${result.file_num }" class="check_new" type="checkbox" name="chk" key="${result.file_num }"> -->
                                        <a href="/fileDownload.do?no=${result.file_num }"><label for="delete_check_${result.file_num }">${result.file_nm }</a>
                                        <button type="button" class="file_del" data-fileno="${result.file_num }">파일삭제</button>
                                    </div>
                                    </c:forEach>
                                </div>
                            </td>	
                        </tr>
                        <tr>
                            <th>패스워드 수정</th>
                            <td colspan="3">
                                <!-- <a href="#!" class="point_btn">패스워드 리셋</a>
                                <span class="info_txt">버튼을 누르시면 임시패스워드가 계약 담당자에게 발송됩니다.</span> -->
                                <span>패스워드</span>
                                <input class="w150" type="password" name="passwd" placeholder="" id="passwd" value="">
                                <span>/</span>
                                <span>패스워드 확인</span>
                                <input class="w150" type="password" name="repasswd" placeholder="" id="repasswd" value="">
                            </td>
                        </tr>						
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="/manage2/manage2.do?view_type=L" class="dark_line_btn">이전</a>
                    <a href="javascript:fnSubmit();" id="frmMod" class="dark_full_btn">정보수정</a>
                    <a href="/manage2/manage2.do" class="gray_line_btn">목록</a>
                </div>
            </form>
        </div>
    </div>

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
        	
        	$('.file_del').on('click', function(){
        		var no = $(this).attr('data-fileno');
				var obj = $(this).parent();
        		var data = {
        			"fileChks":	no
        		};

        		$.ajax({
        		    url:  '/manage/manageFileDel.do',
        		    type: 'POST',
        		    data: data,
        		    success: function(data){
        		    	if(data == "success") {
        		    		alert("첨부파일이 삭제 되었습니다.");
        		    		$(obj).remove();
        		    		return;
        		    	}
        		    },
        		    error: function(e){
        		        alert(e.reponseText);
        		    },
        			complete: function() {
        			}
        		});
        	});
        });
    
    </script>







