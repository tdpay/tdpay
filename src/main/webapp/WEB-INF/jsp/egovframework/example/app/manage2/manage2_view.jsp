<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script src="/app/js/manage2_view.js"></script>

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
                <fieldset>
                    <table>
                        <tbody>
                            <tr>
                                <th>상점ID</th>
                                <td>
                                    ${manage2Vo.store_id }
                                </td>
                            </tr>
                            <tr>
                                <th>상호명</th>
                                <td>
                                    ${manage2Vo.business_nm }
                                </td>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <td>
                                    ${manage2Vo.ceo }
                                </td>
                            </tr>
                            <tr>
                                <th>사업자등록번호</th>
                                <td>
                                    ${manage2Vo.corp_regist_num }
                                </td>
                            </tr>
                            <tr>
                                <th>대표자생년월일</th>
                                <td>
                                    ${manage2Vo.ceo_birth }
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
                                    ${manage2Vo.business_cond }
                                </td>
                            </tr>
                            <tr>
                                <th>업종</th>
                                <td>
                                    ${manage2Vo.industry_type }
                                </td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>
                                    ${manage2Vo.tel }
                                </td>
                            </tr>
                            <tr>
                                <th>FAX</th>
                                <td>
                                    ${manage2Vo.fax }
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td>
                                    ${manage2Vo.phone_num }
                                </td>
                            </tr>
                            <tr>
                                <th>정산계좌번호</th>
                                <td>
									${manage2Vo.bank_nm }									
									${manage2Vo.account_num }
                                </td>
                            </tr>                             
                            <tr>
                                <th>Email 주소</th>
                                <td>
                                    ${manage2Vo.email }
                                </td>
                            </tr>
                            <tr>
                                <th>계약일자</th>
                                <td>
                                    ${manage2Vo.contract_date }
                                </td>
                            </tr>
                            <tr>
                                <th>홈페이지주소</th>
                                <td>
                                    ${manage2Vo.hompage }
                                </td>
                            </tr>
                            <tr>
                                <th>사업장세부주소</th>
                                <td>
                                    ${manage2Vo.zip_code }
                                    ${manage2Vo.address }
                                    ${manage2Vo.detail_address }
                                </td>
                            </tr>
                            <tr>
                                <th>계약담당자</th>
                                <td>
									${manage2Vo.person_nm1 }
									${manage2Vo.person_phone1 }
									${manage2Vo.person_email1 }
                                </td>
                            </tr>
                            <tr>
                                <th>정산담당자</th>
                                <td>
									${manage2Vo.person_nm2 }
									${manage2Vo.person_phone2 }
									${manage2Vo.person_email2 }
                                </td>
                            </tr>
                            <tr>
                                <th>기술담당자</th>
                                <td>
									${manage2Vo.person_nm3 }
									${manage2Vo.person_phone3 }
									${manage2Vo.person_email3 }
                                </td>
                            </tr>
                            <tr>
                                <th>터미널ID</th>
                                <td>
                                    ${manage2Vo.terminal_id }
                                </td>
                            </tr>                            
                            <tr>
                                <th>단말기번호</th>
                                <td>
                                    ${manage2Vo.imei }
                                </td>
                            </tr>                            
                            <tr>
                                <th>CPID</th>
                                <td>
                                    ${manage2Vo.cpid }
                                </td>
                            </tr>                            
                            <tr>
                                <th>대리점</th>
                                <td>
									${manage2Vo.high_business_nm }	
                                </td>
                            </tr>  
                            <tr>
                                <th>수수료</th>
                                <td>
									${manage2Vo.commission}%
                                </td>
                            </tr>  
                            <tr>
                                <th>세금계산서 발행</th>
                                <td>
									${manage2Vo.tax eq 'Y'?'발행':'미발행'}
                                </td>
                            </tr>  
                            <tr>
                                <th>정산주기</th>
                                <td>
									${manage2Vo.period eq '1'?'당':manage2Vo.period}일
                                </td>
                            </tr>                                                      
                            <tr>
                                <th>상태구분</th>
                                <td>
									${manage2Vo.state eq 'Y'?'사용':'중지'}
                                </td>
                            </tr>         
                            <tr>
                                <th>일거래 한도액</th>
                                <td>400,000</td>
                            </tr>                   
                            <tr>
                                <th>월거래 한도액</th>
                                <td>400,000</td>
                            </tr>                   
                            <tr>
                                <th>동일카드 일한도</th>
                                <td>400,000</td>
                            </tr>                   
                            <tr>
                                <th>거래건당 한도액</th>
                                <td>400,000</td>
                            </tr>                   
                            <tr>
                                <th>동일카드 일 승인횟수</th>
                                <td>30회</td>
                            </tr>                   
                            <tr>
                                <th>수기결제 할부개월수</th>
                                <td>5개월</td>
                            </tr>                   
                        </tbody>
                    </table>
                    <div class="send_btn">
                        <button class="btn-active" onclick="location.href='manage2.do'" type="button">목록</button>
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

