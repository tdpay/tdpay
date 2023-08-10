<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/setup_bank.js"></script>	
	
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>은행 관리</h2>
            <button class="link_reg bank_add_btn"> 등록</button>
        </div>
            
        <div class="layout_wrap">
            <form class="table_layout02_wrap" name="frm" id="frm" action="" method="post">
                <div id="setup_bank_data"></div>
            </form>
        </div>
    </div>

    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <div class="pop_wrap bank_pop pop440 pop_off">
        <div class="pop_cont">
            <div class="pop_top">
                <strong class="pop_ttl">은행정보 추가</strong>
                <a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
            </div>
            <div class="pop_body">
                <div class="pop_inner">
                    <form name="frm2" id="frm2">
                        <table class="table_layout01">
                            <colgroup>
                                <col style="width:140px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>코드명</th>
                                    <td>
                                        <input class="w_all" type="text" name="bank_code" id="bank_code">
                                    </td>
                                </tr>
                                <tr>
                                    <th>은행명</th>
                                    <td>
                                        <input class="w_all" type="text" name="bank_nm" id="bank_nm">
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
            $('.bank_add_btn').on('click',function(){
                $('.bank_pop').show();
            });
            
        });
    </script>
	  



