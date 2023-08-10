<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script language="javascript" src="https://kspay.ksnet.to/store/KSPayWebV1.4/js/kspay_web.js"></script>
	<script src="/js/payment2.js"></script>
	
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">수기결제(케이에스넷)</strong>
					<form class="form_layout" name="frm" id="frm" method="post"  target="">
					<!-- 0. 공통 환경설정 -->
					<input type="hidden" name="loginId" id="loginId" value="<c:out value="${sessionScope.login_id}" />">
					<input type="hidden" name="sndPaymethod" id="sndPaymethod" value="1000000000">
					<input type="hidden" name="sndStoreid" 	 id="sndStoreid"   value="<c:out value='${CPID}' />">
					<input type="hidden"  name="sndReply" 	 id="sndReply" 		value="">
					<input type="hidden"  name="sndGoodType" id="sndGoodType"   value="1"> 	 <!-- 상품유형: 실물(1),디지털(2) -->
					<input type="hidden"  name="sndCharSet"  id="sndCharSet" 	value="utf-8"> <!-- 가맹점 charset 설정변수 (euc-kr / utf-8) -->
					
					<!-- 1. 신용카드 관련설정 -->
					
					<!-- 신용카드 결제방법  -->
					<!-- 일반적인 업체의 경우 ISP,안심결제만 사용하면 되며 다른 결제방법 추가시에는 사전에 협의이후 적용바랍니다 -->
					<input type="hidden"  name="sndShowcard" id="sndShowcard" value="C"> 
					
					<!-- 신용카드(해외카드) 통화코드: 해외카드결제시 달러결제를 사용할경우 변경 -->
					<input type="hidden"	name="sndCurrencytype" id="sndCurrencytype" value="WON"> <!-- 원화(WON), 달러(USD) -->
					
					<!-- 할부개월수 선택범위 -->
					<!--상점에서 적용할 할부개월수를 세팅합니다. 여기서 세팅하신 값은 결제창에서 고객이 스크롤하여 선택하게 됩니다 -->
					<!--아래의 예의경우 고객은 0~12개월의 할부거래를 선택할수있게 됩니다. -->
					<input type="hidden"	name="sndInstallmenttype" id="sndInstallmenttype" value="ALL(0:2:3:4:5:6:7:8:9:10:11:12)">
					
					<!-- 가맹점부담 무이자할부설정 -->
					<!-- 카드사 무이자행사만 이용하실경우  또는 무이자 할부를 적용하지 않는 업체는  "NONE"로 세팅  -->
					<!-- 예 : 전체카드사 및 전체 할부에대해서 무이자 적용할 때는 value="ALL" / 무이자 미적용할 때는 value="NONE" -->
					<!-- 예 : 전체카드사 3,4,5,6개월 무이자 적용할 때는 value="ALL(3:4:5:6)" -->
					<!-- 예 : 삼성카드(카드사코드:04) 2,3개월 무이자 적용할 때는 value="04(3:4:5:6)"-->
					<!-- <input type=hidden	name=sndInteresttype value="10(02:03),05(06)"> -->
					<input type="hidden"	name="sndInteresttype" id="sndInteresttype" value="NONE">
					
					<!-- 카카오페이 사용시 필수 세팅 값 -->
					<input type="hidden" name="sndStoreCeoName"   id="sndStoreCeoName"      value="">  <!--  카카오페이용 상점대표자명 --> 
					<input type="hidden" name="sndStorePhoneNo"   id="sndStorePhoneNo"      value="">  <!--  카카오페이 연락처 --> 
					<input type="hidden" name="sndStoreAddress"   id="sndStoreAddress"      value="">  <!--  카카오페이 주소 --> 
					
					<!-- 2. 온라인입금(가상계좌) 관련설정 -->
					<input type="hidden"	name="sndEscrow" 	id="sndEscrow" value="0"> 			        <!-- 에스크로사용여부 (0:사용안함, 1:사용) -->
					
					<!-- 3. 계좌이체 현금영수증발급여부 설정 -->
					<input type="hidden"  name="sndCashReceipt" id="sndCashReceipt" value="0">          <!--계좌이체시 현금영수증 발급여부 (0: 발급안함, 1:발급) -->					
					<!-- 결과데이타: 승인이후 자동으로 채워집니다. (*변수명을 변경하지 마세요) -->
					<input type="hidden" name="reWHCid" 		id="reWHCid" value="">
					<input type="hidden" name="reWHCtype" 		id="reWHCtype" value="">
					<input type="hidden" name="reWHHash" 		id="reWHHash" value="">
						<table>
							<tbody>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">상점ID</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="USERID" placeholder="" id="USERID" value="">
										 <span class="pay_ess">* sms 전송 내역</span>	
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">주문번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndOrdernumber" placeholder="주문번호 상세 입력" id="sndOrdernumber" value="">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">결제금액</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndAmount" placeholder="숫자만 입력" id="sndAmount" value="" onKeyUp="chk_Number(this);">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>							
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">카드번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndCardno" placeholder="- 제외 입력해주세요." id="sndCardno" value="" onKeyUp="chk_Number(this);">
									</td>
								</tr>										
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">상품명</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndGoodname" placeholder="구매 상품명 상세 입력" id="sndGoodname" value="">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">고객이름</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndOrdername" placeholder="" id="sndOrdername" value="">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">고객전화번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndMobile" placeholder="" id="sndMobile" value="" onKeyUp="chk_Number(this);">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl">
										<label class="" for="">고객이메일</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndEmail" placeholder="" id="sndEmail" value="" >
									</td>
								</tr>
							</tbody>
						</table>

						<div class="btn_box">
							<button type="reset" onclick="fnReset();" class="a_btn a_btn_default">입력 초기화</button>
							<a href="javascript:fnSubmit();" class="a_btn a_btn_blue">관리자 키인결제</a>
							<a href="javascript:fnLinkSubmit();" class="a_btn a_btn_blue_line">결제 링크전송(SMS)</a>
						</div>
					</form>
				</div>
			</div>


	<!-- //container -->

