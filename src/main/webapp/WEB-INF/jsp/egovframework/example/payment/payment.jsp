<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="/js/payment.js"></script>
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>수기결제(페이조아)</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm" id="frm" method="post" action="/payment/cardSugido.do" target="">
                <input type="hidden" name="TAXFREECD" id="TAXFREECD" value="00">
                <input type="hidden" name="PRODUCTTYPE" id="PRODUCTTYPE" value="2">
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <!-- 필수값 -->
                            <th>상점ID</th>						   
                            <td>
                                <input class="w500" type="text" name="USERID" placeholder="" id="USERID" value="">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>주문번호</th>						   
                            <td>
                                <input class="w500" type="text" name="ORDERNO" placeholder="주문번호 상세 입력" id="ORDERNO" value="">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <!-- tr>
                            <th>상품구분</th>						   
                            <td>
                                <select class="w500" name="PRODUCTTYPE" id="PRODUCTTYPE">
                                    <option value="1" >디지털</option>
                                    <option value="2" selected>실물</option>
                                </select>
                            </td>
                        </tr-->
                        <!-- tr>
                            <th>과세</th>						   
                            <td>
                                <select class="w500" name="TAXFREECD" id="TAXFREECD">
                                    <option value="00" selected>과세</option>
                                    <option value="01">비과세</option>
                                </select>
                            </td>
                        </tr-->
                        <tr>
                            <!-- 필수값 -->
                            <th>결제금액</th>						   
                            <td>
                                <input class="w500" type="text" name="AMOUNT" placeholder="숫자만 입력" id="AMOUNT" value="" onKeyUp="chk_Number(this);">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>							
                        <tr>
                            <!-- 필수값 -->
                            <th>카드번호</th>						   
                            <td>
                                <input class="w500" type="text" name="CARDNO" placeholder="- 제외 입력해주세요." id="CARDNO" value="" onKeyUp="chk_Number(this);">
                            </td>
                        </tr>						
                        <tr>
                            <!-- 필수값 -->
                            <th>카드유효기간</th>						   
                            <td>
                                <input class="w500" type="text" name="EXPIRATIONDATE" placeholder="YYYYMM" id="EXPIRATIONDATE" value="" onKeyUp="chk_Number(this);">
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>할부 개월</th>						   
                            <td>
                                <select class="w180" name="QUOTA" placeholder="" id="QUOTA">
                                    <c:forEach var="i" begin="0" end="12">
                                        <c:choose>
                                            <c:when test="${i == 0}">
                                                <option value="00">일시불</option>
                                            </c:when>
                                            <c:when test="${i < 10 && i > 1}">
                                                <option value="0<c:out value="${i}" />">0<c:out value="${i}" /></option>
                                            </c:when>
                                            <c:when test="${i >= 10}">
                                                <option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>											
                                </select>									 
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>과금 유형</th>						   
                            <td>
                                <div class="radio_box">
                                    <input type="radio" name="BILLTYPE" value="13" class="input_checkbox" id="BILLTYPE01" checked onclick="jsBillType('13');">
                                    <label for="BILLTYPE01">수기일반</label>
                                </div>
                                <div class="radio_box">
                                    <input type="radio" name="BILLTYPE" value="18" class="input_checkbox" id="BILLTYPE02" onclick="jsBillType('18');">
                                    <label for="BILLTYPE02">수기비인증</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>SMS 할부 개월</th>						   
                            <td>
                                <div class="radio_box">
                                    <input type="radio" name="SMS_QUOTA" value="6" class="input_checkbox" id="SMS_QUOTA01" checked>
                                    <label for="SMS_QUOTA01">6개월</label>
                                </div>
                                <div class="radio_box">
                                    <input type="radio" name="SMS_QUOTA" value="12" class="input_checkbox" id="SMS_QUOTA02" >
                                    <label for="SMS_QUOTA02">12개월</label>
                                </div>
                            </td>
                        </tr>
                        <tr id="TR_CARDAUTH">
                            <!-- 필수값 -->
                            <th>카드명의자</th>						   
                            <td>
                                <input class="w500" type="text" name="CARDAUTH" placeholder="카드명의자 주민 앞6자리/사업자번호 입력(000-00-00000)" id="CARDAUTH" value="" onKeyUp="chk_Number(this);">
                            </td>
                        </tr>
                        <tr id="TR_CARDPASSWORD">
                            <!-- 필수값 -->
                            <th>카드명의자</th>						   
                            <td>
                                <input class="w500" type="password" name="CARDPASSWORD" placeholder="카드명의자 비밀번호 입력" id="CARDPASSWORD" value="" onKeyUp="chk_Number(this);">
                            </td>
                        </tr>
                        <!-- tr>
                            <th>상품코드</th>						   
                            <td>
                                <input class="w500" type="text" name="PRODUCTCODE" placeholder="상품코드 입력" id="PRODUCTCODE" value="테스트상품">
                            </td>
                        </tr-->
                        <tr>
                            <!-- 필수값 -->
                            <th>상품명</th>						   
                            <td>
                                <input class="w500" type="text" name="PRODUCTNAME" placeholder="구매 상품명 상세 입력" id="PRODUCTNAME" value="">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>고객이름</th>						   
                            <td>
                                <input class="w500" type="text" name="USERNAME" placeholder="" id="USERNAME" value="">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <!-- 필수값 -->
                            <th>고객전화번호</th>						   
                            <td>
                                <input class="w500" type="text" name="USERPHONE" placeholder="" id="USERPHONE" value="" onKeyUp="chk_Number(this);">
                                <span class="pay_ess">* sms 전송 내역</span>
                            </td>
                        </tr>
                        <tr>
                            <th>고객이메일</th>						   
                            <td>
                                <input class="w500" type="text" name="EMAIL" placeholder="" id="EMAIL" value="" >
                            </td>
                        </tr>
                        <!-- tr>
                            <th>링크유효시간label></th>						   
                            <td>
                                <select class="w500" name="VALIDHOUR" id="VALIDHOUR">
                                    <option value="">02 시간</option>
                                </select>
                            </td>
                        </tr-->
                    </tbody>
                </table>
                <!--<c:if test="${sessionScope.role_id eq '1001'}">-->
                <div class="btn_box">
                    <button type="reset" onclick="fnReset();" class="gray_line_btn">입력 초기화</button>
                    <a href="javascript:fnSubmit();" class="dark_full_btn">관리자 키인결제</a>
                    <!-- <a href="javascript:fnLinkSubmit();" class="dark_line_btn">결제 링크전송(SMS)</a> -->
                </div>
                <!--</c:if>-->
            </form>
        </div>
    </div>
	<!-- //container -->

