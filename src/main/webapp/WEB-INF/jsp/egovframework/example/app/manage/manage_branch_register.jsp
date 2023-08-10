<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script src="/app/js/manage_branch_register.js"></script>

<script>
 <c:if test="${sessionScope.role_id eq '1001'}">
	getOption('#high_store_id', 'high_store_id', 'N', '');
 </c:if>
</script>

<section class="manage_table_basic">
    <div class="header">
        <div class="inner">
            <p>대리점등록</p>
            <button onclick="goBack()" class="close_btn" type="button"></button>
        </div>
    </div>
    <div class="manage_table_cont">
        <div class="inner">
				<form name="frm" id="frm" method="post" action="" target="">
				<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
				<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
				<input type="hidden" name="passwd" id="passwd" value="1111" />
				<input type="hidden" name="role_id" id="role_id" value="1003" />
				<input type="hidden" name="period" id="period" value="30" />
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
											<option value="B">법인</option>
											<option value="C">비영리 법인</option>
									</select>									
									<input type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2">
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
                                </td>
                            </tr>
                            <tr>
                                <th>사업장세부주소</th>
                                <td>
                                    <input type="text" name="detail_address" placeholder="" id="detail_address" >
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
                            <!-- <tr>
                                <th>터미널ID</th>
                                <td>
                                    <input type="text" name="terminal_id" placeholder="" id="terminal_id" >
                                </td>
                            </tr> -->
							<c:choose>
							 <c:when test="${sessionScope.role_id eq '1001'}">
	                            <tr>
	                                <th>영업대행</th>
	                                <td>
										<select name="high_store_id" placeholder="" id="high_store_id">
										</select>	
	                                </td>
	                            </tr>
							 </c:when>
							 <c:otherwise>
								  <input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.login_id}" />
							 </c:otherwise>
							</c:choose>	      
                            <tr>
                                <th>수수료</th>
                                <td>
                                    <input type="number" name="commission" id="commission">
                                </td>
                            </tr>      
                            <tr>
                                <th>지급상태</th>
                                <td>
									<select name="tax" id="tax">
                                        <!-- <option value="Y">세금계산서</option> -->
                                        <option value="">매출세금계산서</option>
                                        <option value="">매입세금계산서</option>
                                        <option value="N">원천징수</option>
									</select>
                                </td>
                            </tr> 
                            <tr>
                                <th>상태구분</th>
                                <td>
									<select name="state" id="state">
											<option value="Y">사용</option>
											<option value="N">미사용</option>
									</select>
                                </td>
                            </tr>     
                            <tr>
                                <th>정산방식</th>
                                <td>
                                    <select name="settlement_type" id="settlement_type">
                                        <option value="G">일반정산</option>
                                        <option value="D">직접정산</option>
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
                        <button class="btn-active" onclick="location.href='manage_branch.do'" type="button">목록</button>
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

