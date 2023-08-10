<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/setup_pg_fee.js"></script>	
	
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>PG수수료</h2>
            <button class="link_reg modify_btn">수정</button>
        </div>
            
        <div class="layout_wrap">
            <form name="frm3" id="frm3" action="" method="post">
                <div id="">
                    <table class="table_layout01">
                        <colgroup>
                            <col style="width:130px;">
                            <col style="width:auto;">
                            <col style="width:130px;">
                            <col style="width:auto;">
                            <col style="width:130px;">
                            <col style="width:auto;">
                            <col style="width:130px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>신용카드</th>
                                <td>
                                    <input type="text" class="w80" name=creditcard_RT id="creditcard_RT" value="${resultList.creditcard_RT}" disabled="">
                                </td>
                                <th>신용카드K</th>
                                <td>
                                    <input type="text" class="w80" name="creditcardK_RT" id="creditcardK_RT" value="${resultList.creditcardK_RT}" disabled="">
                                </td>
                                <th>휴대폰</th>
                                <td>
                                    <input type="text" class="w80" name="cellphone_RT" id="cellphone_RT" value="${resultList.cellphone_RT}" disabled="">
                                </td>
                                <th>휴대폰원천사선</th>
                                <td>
                                    <input type="text" class="w80" name="cellphonePay_RT" id="cellphonePay_RT" value="${resultList.cellphonePay_RT}" disabled="">
                                </td>
                            </tr>
                            <tr>
                                <th>ARS700</th>
                                <td>
                                    <input type="text" class="w80" name="ARS700_RT" id="ARS700_RT" value="${resultList.ARS700_RT}" disabled="">
                                </td>
                                <th>폰빌</th>
                                <td>
                                    <input type="text" class="w80" name="phonebill_RT" id="phonebill_RT" value="${resultList.phonebill_RT}" disabled="">
                                </td>
                                <th>계좌이체</th>
                                <td>
                                    <input type="text" class="w80" name="accountTRF_RT" id="accountTRF_RT" value="${resultList.accountTRF_RT}" disabled="">
                                </td>
                                <th>가상계좌</th>
                                <td>
                                    <input type="text" class="w80" name="vaccountTRF_RT" id="vaccountTRF_RT" value="${resultList.vaccountTRF_RT}" disabled="">
                                </td>
                            </tr>
                            <tr>
                                <th>CMS</th>
                                <td>
                                    <input type="text" class="w80" name="CMS_RT" id="CMS_RT" value="${resultList.CMS_RT}" disabled="">
                                </td>
                                <th>문화상품권</th>
                                <td>
                                    <input type="text" class="w80" name="giftvoucher_RT" id="giftvoucher_RT" value="${resultList.giftvoucher_RT}" disabled="">
                                </td>
                                <th>스마트문상</th>
                                <td>
                                    <input type="text" class="w80" name="sgiftvoucher_RT" id="sgiftvoucher_RT" value="${resultList.sgiftvoucher_RT}" disabled="">
                                </td>
                                <th>도서문화상품권</th>
                                <td>
                                    <input type="text" class="w80" name="bgiftvoucher_RT" id="bgiftvoucher_RT" value="${resultList.bgiftvoucher_RT}" disabled="">
                                </td>
                            </tr>
                            <tr>
                                <th>해피머니상품권</th>
                                <td>
                                    <input type="text" class="w80" name="hgiftvoucher_RT" id="hgiftvoucher_RT" value="${resultList.hgiftvoucher_RT}" disabled="">
                                </td>
                                <th>에그머니</th>
                                <td>
                                    <input type="text" class="w80" name="eggmony_RT" id="eggmony_RT" value="${resultList.eggmony_RT}" disabled="">
                                </td>
                                <th>틴캐시</th>
                                <td>
                                    <input type="text" class="w80" name="teencash_RT" id="teencash_RT" value="${resultList.teencash_RT}" disabled="">
                                </td>
                                <th>티머니</th>
                                <td>
                                    <input type="text" class="w80" name="tmoney_RT" id="tmoney_RT" value="${resultList.tmoney_RT}" disabled="">
                                </td>
                            </tr>
                            <tr>
                                <th>모바일팝</th>
                                <td>
                                    <input type="text" class="w80" name="mobilepop_RT" id="mobilepop_RT" value="${resultList.mobilepop_RT}" disabled="">
                                </td>
                                <th>알리페이</th>
                                <td>
                                    <input type="text" class="w80" name="alipay_RT" id="alipay_RT" value="${resultList.alipay_RT}" disabled="">
                                </td>
                                <th>카카오페이</th>
                                <td>
                                    <input type="text" class="w80" name="kakaopay_RT" id="kakaopay_RT" value="${resultList.kakaopay_RT}" disabled="">
                                </td>
                                <th>단말기</th>
                                <td>
                                    <input type="text" class="w80" name="terminal_RT" id="terminal_RT" value="${resultList.terminal_RT}" disabled="">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="pgname" id="pgname" value="${resultList.pgname}">
                    <div class="btn_box">
                        <a href="setup_pg_fee.do" class="dark_full_btn">목록으로</a> 
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- //container -->

    <script>
        $(function(){

            // 팝업 오픈
            $('.modify_btn').on('click',function(){
                if(!$(this).hasClass('on')){
                    $(this).addClass('on');
                    $('.table_layout01 input').attr('disabled',false);
                } else {
                    $(this).removeClass('on');
                    $('.table_layout01 input').attr('disabled',true);
                    frmMod();
                }
            });
            
        });
    </script>
	  



