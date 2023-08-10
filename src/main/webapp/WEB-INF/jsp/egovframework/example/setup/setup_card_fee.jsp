<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/setup_card_fee.js"></script>	
	
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>카드수수료</h2>
            <button class="link_reg card_mod_btn"> 수정</button>
            <button class="link_reg card_add_btn"> 등록</button>
        </div>
        <div class="layout_wrap" id="setup_card_fee_data"></div>       

    </div>

    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <div class="pop_wrap card_pop pop440 pop_off">
        <div class="pop_cont">
            <div class="pop_top">
                <strong class="pop_ttl">카드수수료 추가</strong>
                <a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
            </div>
            <div class="pop_body">
                <div class="pop_inner">
                    <form name="" id="">
                        <table class="table_layout01">
                            <colgroup>
                                <col style="width:140px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                                <!--tr>
                                    <th>코드명</th>
                                    <td>
                                        <input class="w_all" type="text" name="cardcode" id="cardcode" value="temp">
                                    </td>
                                </tr-->
                                <tr>
                                    <th>카드사</th>
                                    <td>
                                        <input type="text" class="w_all" name="cardname" id="cardname">
                                    </td>
                                </tr>
                                <th>수수료</th>
                                <td>
                                    <input class="w_all" type="text" name="rate" id="rate">
                                    <input class="w_all" type="hidden" name="created_id" id="created_id" value="gmgMaster1">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn_box">
                            <a href="javascript:frmAdd();" class="dark_full_btn">등록</a>
                        </div>					
                    </form>
                </div>		
            </div>
        </div>
    	<div class="dim"></div>
    </div>
    <!-- //로그인 정보 변경  -->

    <script>
        $(function(){

            // 팝업 오픈
            $('.card_add_btn').on('click',function(){
                $('.card_pop').show();
            });

            $("#myGnb").height($('#wrap').height() - 55);
            
            $('.card_mod_btn').on('click', function() {
            	frmMod();
            });
            
        });
    </script>
	  



