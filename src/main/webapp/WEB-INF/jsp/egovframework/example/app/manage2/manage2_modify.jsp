<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script src="/app/js/manage2_modify.js"></script>
<script>
	 getOption('#bank_code', 'bank', 'N', '${manage2Vo.bank_code }');
	 getOption('#high_store_id', 'high_store_id2', 'N', '${manage2Vo.high_store_id }');
</script>    
<section class="manage_table_basic manage_main">
    <div class="header">
        <div class="inner">
            <p>가맹점정보</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div> 
    </div>
    <div class="manage_table_cont">
        <div class="inner">
			<form  name="frm" id="frm" method="post" action="" target="">
			<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="store_id" id="store_id" value="${manage2Vo.store_id }" />
			<input type="hidden" name="role_id" id="role_id" value="1004" />
			<input type="hidden" name="state" id="state" value="Y" />
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                    <input type="text" value="${manage2Vo.store_id }" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>상호명</th>
                                <td>
                                    <input type="text" name="business_nm" placeholder="유월커뮤니케이션" id="business_nm" value="${manage2Vo.business_nm }" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <td>
                                    <input type="text" name="ceo" placeholder="김평진" id="ceo" value="${manage2Vo.ceo }">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자등록번호</th>
                                <td>
                                    <input type="text" name="corp_regist_num" placeholder="107-87-86839" id="corp_regist_num" value="${manage2Vo.corp_regist_num }" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>대표자생년월일</th>
                                <td>
                                    <input type="text" name="ceo_birth" placeholder="1981.12.09" id="ceo_birth" value="${manage2Vo.ceo_birth }">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자구분</th>
                                <td>
									<select name="corp_type" placeholder="" id="corp_type" disabled>
											<option value="A" ${manage2Vo.corp_type eq 'A' ?'selected':''}>개인</option>
											<option value="">개인사업자</option>
											<option value="B" ${manage2Vo.corp_type eq 'B' ?'selected':''}>법인</option>
											<option value="">영리법인</option>
											<!-- <option value="C" ${manage2Vo.corp_type eq 'C' ?'selected':''}>비영리 법인</option> -->
									</select>		
									<c:if test="${!empty manage2Vo.corp_regist_num2}">							
									<input type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2" value="${manage2Vo.corp_regist_num2 }" disabled>
									</c:if>
                                </td>
                            </tr>                              
                            <tr>
                                <th>업태</th>
                                <td>
                                    <input type="text" name="business_cond" placeholder="서비스" id="business_cond" value="${manage2Vo.business_cond }">
                                </td>
                            </tr>
                            <tr>
                                <th>업종</th>
                                <td>
                                    <input type="text" name="industry_type" placeholder="온라인정보제공업" id="industry_type" value="${manage2Vo.industry_type }">
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    <input type="tel" name="tel" placeholder="02-0000-0000" id="tel" value="${manage2Vo.tel }" maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <th>FAX</th>
                                <td>
                                    <input type="tel" name="fax" placeholder="02-0000-0000" id="fax" value="${manage2Vo.fax }" maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td>
                                    <input type="text" name="phone_num" placeholder="010-0000-0000" id="phone_num" value="${manage2Vo.phone_num }">
                                </td>
                            </tr>
                            <tr>
                                <th>정산계좌번호</th>
                                <td>
									<select name="bank_code" id="bank_code" ${sessionScope.role_id eq '1001'?'':'disabled' }>
									</select>	
									<input type="text" name="account_num" placeholder="000-000-000000" id="account_num" value="${manage2Vo.account_num }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                </td>
                            </tr>                             
                            <tr>
                                <th>Email 주소</th>
                                <td>
                                    <input type="email" name="email" placeholder="text@test.com" id="email" value="${manage2Vo.email }" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>계약일자</th>
                                <td>
                                    <input type="text" name="contract_date" placeholder="2020.10.05" id="contract_date" value="${manage2Vo.contract_date }" disabled maxlength="10">
                                </td>
                            </tr>
                            <tr>
                                <th>홈페이지주소</th>
                                <td>
                                    <input type="text" name="hompage" placeholder="" id="hompage" value="${manage2Vo.hompage }" maxlength="100">
                                </td>
                            </tr>
                            <tr class="biz_place">
                                <th>사업장주소</th>
                                <td>
                                    <input class="postcode" type="text" name="zip_code" placeholder="" id="zip_code" value="${manage2Vo.zip_code }" readonly="readonly">
                                    <button type="button" onclick="jsDaumPostcode();"></button>
                                    <input type="text" name="address" placeholder="" id="address" value="${manage2Vo.address }" >
                                    <input type="text" name="detail_address" placeholder="" id="detail_address" value="${manage2Vo.detail_address }">
                                </td>
                            </tr>
                            <tr>
                                <th>계약담당자</th>
                                <td>
                                    <input type="text" name="person_nm1" placeholder="홍길동" id="person_nm1" value="${manage2Vo.person_nm1 }">
                                    <input type="text" name="person_phone1" placeholder="010-0000-0000" id="person_phone1" value="${manage2Vo.person_phone1 }" maxlength="13">
                                    <input type="text" name="person_email1" placeholder="test@test.com" id="person_email1" value="${manage2Vo.person_email1 }" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>정산담당자</th>
                                <td>
                                    <input type="text" name="person_nm2" placeholder="홍길동" id="person_nm2" value="${manage2Vo.person_nm2 }">
                                    <input type="text" name="person_phone2" placeholder="010-0000-0000" id="person_phone2" value="${manage2Vo.person_phone2 }" maxlength="13">
                                    <input type="text" name="person_email2" placeholder="test@test.com" id="person_email2" value="${manage2Vo.person_email2 }" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>기술담당자</th>
                                <td>
                                    <input type="text" name="person_nm3" placeholder="홍길동" id="person_nm3" value="${manage2Vo.person_nm3 }">
                                    <input type="text" name="person_phone3" placeholder="010-0000-0000" id="person_phone3" value="${manage2Vo.person_phone3 }" maxlength="13">
                                    <input type="text" name="person_email3" placeholder="test@test.com" id="person_email3" value="${manage2Vo.person_email3 }" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>터미널ID/단말기번호</th>
                                <td>
                                    <input type="text" name="terminal_id" placeholder="" id="terminal_id" value="${manage2Vo.terminal_id }">
                                    <input type="text" name="imei" placeholder="" id="imei" value="${manage2Vo.imei }">
                                </td>
                            </tr>                             
                            <tr>
                                <th>CPID</th>
                                <td>
                                    <input type="text" name="cpid" placeholder="" id="cpid" value="${manage2Vo.cpid }">
                                </td>
                            </tr>                             
                            <tr>
                                <th>대리점</th>
                                <td>
									<select name="high_store_id" placeholder="" id="high_store_id" disabled >
									</select>	
                                </td>
                            </tr>  
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <input class="width_s" name="commission" placeholder="" id="commission" value="${manage2Vo.commission }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                </td>
                            </tr>  
                            <tr>
                                <th>세금계산서 발행</th>
                                <td>
                                    <select class="width_s bill_select"	name="tax" placeholder="" id="tax" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                        <option value="">선택</option>
                                        <option value="Y" ${manage2Vo.tax eq 'Y' ?'selected':'' }>발행</option>
                                        <option value="N" ${manage2Vo.tax eq 'N' ?'selected':'' }>미발행</option>
                                    </select>                                
                                </td>
                            </tr>                              
                            <tr>
                                <th>정산주기</th>
                                <td>
									<select class="width_s"	name="period" placeholder="" id="period" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                            <c:forEach var="i" begin="0" end="29">
	                                            <option value="<c:out value="${i}"/>" ${manage2Vo.period == i ?'selected':'' }>D+<c:out value="${i}" /></option>
											</c:forEach>								
                                    </select>
                                </td>
                            </tr>                                                      
                            <tr>
                                <th>상태구분</th>
                                <td>
									<select name="state" placeholder="" id="state">
											<option value="Y" ${manage2Vo.state eq 'Y'?'selected':''}>사용</option>
											<option value="N" ${manage2Vo.state eq 'N'?'selected':''}>중지</option>
									</select>
                                </td>
                            </tr>             	
                            <tr>
                                <th>일거래 한도액</th>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>						             
                            <tr>
                                <th>월거래 한도액</th>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>						             
                            <tr>
                                <th>동일카드 일한도</th>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>						             
                            <tr>
                                <th>거래건당 한도액</th>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>					
                            <tr>
                                <th>동일카드 일 승인횟수</th>
                                <td>
                                    <select name="" id="">
                                        <option value="">선택</option>
                                    </select>
                                </td>
                            </tr>	             
                            <tr>
                                <th>수기결제 할부개월수</th>
                                <td>
                                    <select name="" id="">
                                        <option value="">일시불</option>
                                    </select>
                                </td>
                            </tr>	                         
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active" onclick="fnSubmit();" type="button">정보수정</button>
                        <button class="btn-default" onclick="location.href='manage2.do'" type="button">목록</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</section>

<script>
    function goBack() {
        window.history.back();
    }
</script>

