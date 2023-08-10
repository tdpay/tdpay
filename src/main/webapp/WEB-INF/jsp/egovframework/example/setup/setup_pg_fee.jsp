<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/setup_pg_fee.js"></script>	
	
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>PG수수료</h2>
            <button class="link_reg pg_add_btn"> 등록</button>
        </div>
        <div class="layout_wrap" id="setup_pg_fee_data"></div> 
    </div>

    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <div class="pop_wrap pg_pop pop440 pop_off">
        <div class="pop_cont">
            <div class="pop_top">
                <strong class="pop_ttl">PG수수료 추가</strong>
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
                                <!-- tr>
                                    <th>코드명</th>
                                    <td>
                                        <input class="w_all" type="text" name="" id="">
                                    </td>
                                </tr-->
                                <tr>
                                    <th>PG명</th>
                                    <td>
                                        <input class="w_all" type="text" name="pgname" id="pgname">
                                    </td>
                                </tr>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn_box">
                            <!--  a href="javascript:frmAdd();" class="dark_full_btn">등록</a> -->
                            <button onclick="javascript:frmAdd();" class="dark_full_btn" type="button">등록</button>
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
            $('.pg_add_btn').on('click',function(){
                $('.pg_pop').show();
            });

            $("#myGnb").height($('#wrap').height() - 55);
            
        });
    </script>
	  



