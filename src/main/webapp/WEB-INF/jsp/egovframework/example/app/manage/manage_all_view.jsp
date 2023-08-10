<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
<script>
	var store_id = '<c:out value="${manageVo.store_id}" />';
</script>   
<script src="/app/js/manage_all_view.js"></script>

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
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                    ${manageVo.store_id }
                                </td>
                            </tr>
                            <tr>
                                <th>상호명</th>
                                <td>
                                    ${manageVo.business_nm }
                                </td>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <td>
                                    ${manageVo.ceo }
                                </td>
                            </tr>
                            <tr>
                                <th>사업자등록번호</th>
                                <td>
                                    ${manageVo.corp_regist_num }
                                </td>
                            </tr>
                            <tr>
                                <th>대표자생년월일</th>
                                <td>
                                    ${manageVo.ceo_birth }
                                </td>
                            </tr>
                            <tr>
                                <th>사업자구분</th>
                                <td>
									${manageVo.corp_type eq 'A' ?'개인':(manageVo.corp_type eq 'B'? '법인':'비영리 법인')}	
									<c:if test="${!empty manageVo.corp_regist_num2}">							
									${manageVo.corp_regist_num2 }
									</c:if>
                                </td>
                            </tr>                            
                            <tr>
                                <th>업태</th>
                                <td>
                                    ${manageVo.business_cond }
                                </td>
                            </tr>
                            <tr>
                                <th>업종</th>
                                <td>
                                    ${manageVo.industry_type }
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    ${manageVo.tel }
                                </td>
                            </tr>
                            <tr>
                                <th>FAX</th>
                                <td>
                                    ${manageVo.fax }
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td>
                                    ${manageVo.phone_num }
                                </td>
                            </tr>
                            <tr>
                                <th>정산계좌번호</th>
                                <td>
									${manageVo.bank_nm }									
									${manageVo.account_num }
                                </td>
                            </tr>                             
                            <tr>
                                <th>Email 주소</th>
                                <td>
                                    ${manageVo.email }
                                </td>
                            </tr>
                            <tr>
                                <th>계약일자</th>
                                <td>
                                    ${manageVo.contract_date }
                                </td>
                            </tr>
                            <tr>
                                <th>홈페이지주소</th>
                                <td>
                                    ${manageVo.hompage }
                                </td>
                            </tr>
                            <tr>
                                <th>사업장주소</th>
                                <td>
                                    ${manageVo.zip_code }
                                    ${manageVo.address }
                                </td>
                            </tr>
                            <tr>
                                <th>사업장세부주소</th>
                                <td>
                                    ${manageVo.detail_address }
                                </td>
                            </tr>
                            <tr>
                                <th>계약담당자</th>
                                <td>
									${manageVo.person_nm1 } 
									${manageVo.person_phone1 }
									${manageVo.person_email1 }
                                </td>
                            </tr>
                            <tr>
                                <th>정산담당자</th>
                                <td>
									${manageVo.person_nm2 }
									${manageVo.person_phone2 }
									${manageVo.person_email2 }
                                </td>
                            </tr>
                            <tr>
                                <th>기술담당자</th>
                                <td>
									${manageVo.person_nm3 }
									${manageVo.person_phone3 }
									${manageVo.person_email3 }
                                </td>
                            </tr>
                            <tr>
                                <th>터미널ID</th>
                                <td>
                                    ${manageVo.terminal_id }
                                </td>
                            </tr>                            
                            <tr>
                                <th>수수료</th>
                                <td>
                                    ${manageVo.commission }%
                                </td>
                            </tr>                            
                            <tr>
                                <th>지급상태</th>
                                <td>
                        		    ${manageVo.tax eq 'Y'? '세금계산서':'원천징수' }
                                </td>
                            </tr>                            
                            <tr>
                                <th>상태</th>
                                <td>
                                    ${manageVo.state eq 'Y'? '사용':'중지' }
                                </td>
                            </tr>      
                            <tr>
                                <th>대리점 / 가맹점</th>
                                <td>
                                    <select name="roleStore" id="roleStore">
                                         <option value="">선택</option>
                                    </select>
                                    <select name="roleStore2" id="roleStore2">
                                     	<option value="">선택</option>
                                    </select>                                
                                </td>
                            </tr>       
                            <tr>
                                <th>정산방식</th>
                                <td>
                                   ${manageVo.settlement_type eq 'G'?'일반정산':'직접정산'}
                                </td>
                            </tr>              
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active btn-all" onclick="location.href='manage_all.do'" type="button">목록</button>
                    </div>
                </fieldset>
            </form>
        </div>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

<script>
    function goBack() {
        window.history.back();
    }
</script>


