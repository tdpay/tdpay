<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
<c:choose>
 <c:when test="${sessionScope.role_id eq '1001'}">
	getOption('#high_store_id', 'high_store_id2', 'N', '');
 </c:when>
 <c:when test="${sessionScope.role_id eq '1002'}">
	getOption2('#high_store_id', 'high_store_id2', '${sessionScope.login_id}', '', '');
</c:when> 
</c:choose>
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script src="/app/js/manage2_register.js"></script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>가맹점등록</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
			<form  name="frm" id="frm" method="post" action="" target="">
			<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
			<input type="hidden" name="passwd" id="passwd" value="1111" />
			<input type="hidden" name="role_id" id="role_id" value="1004" />
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                    <input type="text" name="store_id" placeholder="" id="store_id">
                                </td>
                            </tr>
                            <tr>
                                <th>상호명</th>
                                <td>
                                    <input type="text" name="business_nm" placeholder="" id="business_nm">
                                </td>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <td>
                                    <input type="text" name="ceo" placeholder="" id="ceo">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자등록번호</th>
                                <td>
                                    <input type="text" name="corp_regist_num" placeholder="000-00-00000" id="corp_regist_num" maxlength="12">
                                </td>
                            </tr>
                            <tr>
                                <th>대표자생년월일</th>
                                <td>
                                    <input type="text" name="ceo_birth" placeholder="yyyy-mm-dd" id="ceo_birth">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자구분</th>
                                <td>
									<select name="corp_type" placeholder="" id="corp_type">
											<option value="A">개인</option>
											<option value="">개인사업자</option>
											<option value="B">법인</option>
											<option value="">영리법인</option>
											<!-- <option value="C">비영리 법인</option> -->
									</select>									
									<input type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2">
									<input type="text" name="corp_regist_num_A" placeholder="주민등록번호" id="corp_regist_num_A">
                                </td>
                            </tr>                                                        
                            <tr>
                                <th>업태</th>
                                <td>
                                    <input type="text" name="business_cond" placeholder="" id="business_cond">
                                </td>
                            </tr>
                            <tr>
                                <th>업종</th>
                                <td>
                                    <input type="text" name="industry_type" placeholder="" id="industry_type">
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    <input type="tel" name="tel" id="tel" maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <th>FAX</th>
                                <td>
                                    <input type="tel" name="fax" id="fax" maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td>
                                    <input type="text" name="phone_num" placeholder="" id="phone_num" >
                                </td>
                            </tr>            
                            <tr>
                                <th>정산계좌번호</th>
                                <td>
									<select name="bank_code" placeholder="" id="bank_code">
									</select>									
									<input type="text" name="account_num" placeholder="" id="account_num">
                                </td>
                            </tr>                                             
                            <tr>
                                <th>Email 주소</th>
                                <td>
                                    <input type="email" name="email" placeholder="" id="email"  maxlength="50">
                                </td>
                            </tr>                            
                           <tr>
                                <th>계약일자</th>
                                <td>
                                    <input type="text" name="contract_date" placeholder="yyyy-mm-dd" id="contract_date"  maxlength="10">
                                </td>
                            </tr>
                            <tr>
                                <th>홈페이지주소</th>
                                <td>
                                    <input type="text" name="hompage" placeholder="" id="hompage"  maxlength="100">
                                </td>
                            </tr>
                            <tr class="biz_place">
                                <th>사업장주소</th>
                                <td>
                                    <input class="postcode" type="text" name="zip_code" placeholder="" id="zip_code" readonly="readonly">
                                    <button type="button" onclick="jsDaumPostcode();"></button>
                                    <input type="text" name="address" placeholder="" id="address"  >
                                    <input type="text" name="detail_address" placeholder="세부주소" id="detail_address" >
                                </td>
                            </tr>
                            <tr>
                                <th>계약담당자</th>
                                <td>
                                    <input type="text" name="person_nm1" placeholder="이름" id="person_nm1" >
                                    <input type="text" name="person_phone1" placeholder="연락처" id="person_phone1"  maxlength="13">
                                    <input type="text" name="person_email1" placeholder="이메일" id="person_email1"  maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>정산담당자</th>
                                <td>
                                    <input type="text" name="person_nm2" placeholder="이름" id="person_nm2" >
                                    <input type="text" name="person_phone2" placeholder="연락처" id="person_phone2"  maxlength="13">
                                    <input type="text" name="person_email2" placeholder="이메일" id="person_email2"  maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>기술담당자</th>
                                <td>
                                    <input type="text" name="person_nm3" placeholder="이름" id="person_nm3">
                                    <input type="text" name="person_phone3" placeholder="연락처" id="person_phone3"  maxlength="13">
                                    <input type="text" name="person_email3" placeholder="이메일" id="person_email3"  maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>터미널ID/단말기번호</th>
                                <td>
                                    <input type="text" name="terminal_id" placeholder="" id="terminal_id" >
                                    <input type="text" name="imei" placeholder="" id="imei" value="">
                                </td>
                            </tr>                          
                            <tr>
                                <th>CPID</th>
                                <td>
                                    <input type="text" name="cpid" placeholder="" id="cpid" >
                                </td>
                            </tr>                          
							<c:choose>
							 <c:when test="${sessionScope.role_id eq '1001' || sessionScope.role_id eq '1002'}">
                             <tr>
                                <th>대리점</th>
                                <td>							 
								<select class="width_s" name="high_store_id" placeholder="" id="high_store_id">
								</select>	
                                </td>
                             </tr>																
							 </c:when>
							 <c:when test="${sessionScope.role_id eq '1003'}">
							 	<input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.login_id}" />
							</c:when> 
							</c:choose>	               
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <input class="width_s" type="number" name="commission" placeholder="" id="commission">
                                </td>
                            </tr>   
                            <tr>
                                <th>세금계산서 발행</th>
                                <td>
									<select class="width_s bill_select"	name="tax" placeholder="" id="tax">
                                        <option value="">선택</option>
                                        <option value="Y">발행</option>
                                        <option value="N">미발행</option>
                                    </select>
                                </td>
                            </tr>                                                     
                            <tr>
                                <th>정산주기</th>
                                <td>
									<select class="width_s"	name="period" placeholder="" id="period">
                                        <option value="">선택</option>
                                        <c:forEach var="i" begin="0" end="29">
	                                        <option value="<c:out value="${i}" />">D+<c:out value="${i}" /></option>
										</c:forEach>
                                    </select>
                                </td>
                            </tr>                                                     
                            <tr>
                                <th>상태구분</th>
                                <td>
									<select name="state" placeholder="" id="state">
											<option value="Y">사용</option>
											<option value="N">중지</option>
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
                        <button class="btn-active" onclick="fnSubmit();" type="button">등록</button>
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

