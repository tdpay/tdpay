<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="/js/payment_cancel.js"></script>
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">수기결제취소</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="">
					<input type="hidden" name="CREATED_ID" id="CREATED_ID" value="${sessionScope.login_id}">
					<input type="hidden" name="RETURN_URL" id="RETURN_URL" value="/payment/payment_cancel.do">
						<table>
							<tbody>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">다우거래번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="DAOUTRX" placeholder="다우거래번호 상세 입력" id="DAOUTRX" value="">
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">취소금액</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="AMOUNT" placeholder="숫자만 입력" id="AMOUNT" value="">
									</td>
								</tr>							
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">취소 사유</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="CANCELMEMO" placeholder="취소 사유 입력" id="CANCELMEMO" value="">
									</td>
								</tr>						
							</tbody>
						</table>

						<div class="btn_box">
							<button type="reset" onclick="fnReset();" class="a_btn a_btn_default">입력 초기화</button>
							<a href="javascript:fnSubmit();" class="a_btn a_btn_blue">취소</a>
						</div>
					</form>
				</div>
			</div>


	<!-- //container -->

