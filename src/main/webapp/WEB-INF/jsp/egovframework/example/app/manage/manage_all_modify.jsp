<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
<script src="/app/js/manage_all_modify.js"></script>
<script>
	getOption('#bank_code', 'bank', 'N', '${manageVo.bank_code }');
</script>
<section class="manage_table_basic manage_main">
    <div class="header">
        <div class="inner">
            <p>영업대행정보</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
            <form name="frm" id="frm" method="post">
			<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="store_id" id="store_id" value="${manageVo.store_id }" />
			<input type="hidden" name="role_id" id="role_id" value="1002" />	            
			<input type="hidden" name="period" id="period" value="30" />	            
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                    <input type="text" value="${manageVo.store_id }" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>상호명</th>
                                <td>
                                    <input type="text" name="business_nm" placeholder="유월커뮤니케이션" id="business_nm" value="${manageVo.business_nm }" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <td>
                                    <input type="text" name="ceo" placeholder="김평진" id="ceo" value="${manageVo.ceo }">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자등록번호</th>
                                <td>
                                    <input type="text" name="corp_regist_num" placeholder="107-87-86839" id="corp_regist_num" value="${manageVo.corp_regist_num }" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>대표자생년월일</th>
                                <td>
                                    <input type="text" name="ceo_birth" placeholder="1981.12.09" id="ceo_birth" value="${manageVo.ceo_birth }">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자구분</th>
                                <td>
									<select name="corp_type" id="corp_type" disabled>
											<option value="A" ${manageVo.corp_type eq 'A' ?'selected':''}>개인</option>
											<option value="B" ${manageVo.corp_type eq 'B' ?'selected':''}>법인</option>
											<option value="C" ${manageVo.corp_type eq 'C' ?'selected':''}>비영리 법인</option>
									</select>		
									<c:if test="${!empty manageVo.corp_regist_num2}">							
									<input type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2" value="${manageVo.corp_regist_num2 }" disabled>
									</c:if>
                                </td>
                            </tr>                            
                            <tr>
                                <th>업태</th>
                                <td>
                                    <input type="text" name="business_cond" placeholder="서비스" id="business_cond" value="${manageVo.business_cond }">
                                </td>
                            </tr>
                            <tr>
                                <th>업종</th>
                                <td>
                                    <input type="text" name="industry_type" placeholder="온라인정보제공업" id="industry_type" value="${manageVo.industry_type }">
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    <input type="tel" name="tel" placeholder="02-0000-0000" id="tel" value="${manageVo.tel }" maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <th>FAX</th>
                                <td>
                                    <input type="tel" name="fax" placeholder="02-0000-0000" id="fax" value="${manageVo.fax }" maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td>
                                    <input type="text" name="phone_num" placeholder="010-0000-0000" id="phone_num" value="${manageVo.phone_num }">
                                </td>
                            </tr>
                            <tr>
                                <th>정산계좌번호</th>
                                <td>
									<select name="bank_code" id="bank_code" ${sessionScope.role_id eq '1001'?'':'disabled' }>
									</select>	
									<input type="text" name="account_num" placeholder="000-000-000000" id="account_num" value="${manageVo.account_num }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                </td>
                            </tr>                              
                            <tr>
                                <th>Email 주소</th>
                                <td>
                                    <input type="email" name="email" placeholder="text@test.com" id="email" value="${manageVo.email }" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>계약일자</th>
                                <td>
                                    <input type="text" name="contract_date" placeholder="2020.10.05" id="contract_date" value="${manageVo.contract_date }" disabled maxlength="10">
                                </td>
                            </tr>
                            <tr>
                                <th>홈페이지주소</th>
                                <td>
                                    <input type="text" name="hompage" placeholder="" id="hompage" value="${manageVo.hompage }" maxlength="100">
                                </td>
                            </tr>
                            <tr class="biz_place">
                                <th>사업장주소</th>
                                <td>
                                    <input class="postcode" type="text" name="zip_code" placeholder="" id="zip_code" value="${manageVo.zip_code }" readonly="readonly">
                                    <button type="button" onclick="jsDaumPostcode();"></button>
                                    <input type="text" name="address" placeholder="" id="address" value="${manageVo.address }" >
                                </td>
                            </tr>
                            <tr>
                                <th>사업장세부주소</th>
                                <td>
                                    <input type="text" name="detail_address" placeholder="" id="detail_address" value="${manageVo.detail_address }">
                                </td>
                            </tr>
                            <tr>
                                <th>계약담당자</th>
                                <td>
                                    <input type="text" name="person_nm1" placeholder="홍길동" id="person_nm1" value="${manageVo.person_nm1 }">
                                    <input type="text" name="person_phone1" placeholder="010-0000-0000" id="person_phone1" value="${manageVo.person_phone1 }" maxlength="13">
                                    <input type="text" name="person_email1" placeholder="test@test.com" id="person_email1" value="${manageVo.person_email1 }" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>정산담당자</th>
                                <td>
                                    <input type="text" name="person_nm2" placeholder="홍길동" id="person_nm2" value="${manageVo.person_nm2 }">
                                    <input type="text" name="person_phone2" placeholder="010-0000-0000" id="person_phone2" value="${manageVo.person_phone2 }" maxlength="13">
                                    <input type="text" name="person_email2" placeholder="test@test.com" id="person_email2" value="${manageVo.person_email2 }" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>기술담당자</th>
                                <td>
                                    <input type="text" name="person_nm3" placeholder="홍길동" id="person_nm3" value="${manageVo.person_nm3 }">
                                    <input type="text" name="person_phone3" placeholder="010-0000-0000" id="person_phone3" value="${manageVo.person_phone3 }" maxlength="13">
                                    <input type="text" name="person_email3" placeholder="test@test.com" id="person_email3" value="${manageVo.person_email3 }" maxlength="50">
                                </td>
                            </tr>
                            <!-- <tr>
                                <th>터미널ID</th>
                                <td>
                                    <input type="text" name="terminal_id" placeholder="" id="terminal_id" value="${manageVo.terminal_id }">
                                </td>
                            </tr>       -->
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <input type="number" name="commission"  id="commission" value="${manageVo.commission }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                </td>
                            </tr>      
                            <tr>
                                <th>지급상태</th>
                                <td>
									<select name="tax"  id="tax" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                        <!-- <option value="Y" ${manageVo.tax eq 'Y'?'selected':''}>세금계산서</option> -->
                                        <option value="">매출세금계산서</option>
                                        <option value="">매입세금계산서</option>
                                        <option value="N" ${manageVo.tax eq 'N'?'selected':''}>원천징수</option>
									</select>
                                </td>
                            </tr>                              
                            <tr>
                                <th>상태구분</th>
                                <td>
									<select  name="state" id="state" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                            <option value="Y" ${manageVo.state eq 'Y'?'selected':''}>사용</option>
											<option value="N" ${manageVo.state eq 'N'?'selected':''}>중지</option>
									</select>
                                </td>
                            </tr>      
                            <tr>
                                <th>정산방식</th>
                                <td>
                                    <select name="settlement_type" id="settlement_type">
                                        <option value="G" ${manageVo.settlement_type eq 'G'?'selected':''}>일반정산</option>
                                        <option value="D" ${manageVo.settlement_type eq 'D'?'selected':''}>직접정산</option>
                                    </select>
                                </td>
                            </tr>   
                            <tr>
                                <th>정산주기</th>
                                <td>
									<select name="" placeholder="" id="">
                                        <option value="">선택</option>
                                        <c:forEach var="i" begin="0" end="30">
	                                        <option value="">D+<c:out value="${i}" /></option>
										</c:forEach>
                                    </select>
                                </td>
                            </tr>	                                         
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active" onclick="fnSubmit();" id="frmMod" type="button">정보수정</button>
                        <button class="btn-default" onclick="location.href='manage_all.do'" type="button">목록</button>
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


