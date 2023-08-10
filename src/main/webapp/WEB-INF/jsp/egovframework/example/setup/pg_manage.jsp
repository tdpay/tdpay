<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/pg_manage.js"></script>	
	
	<!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>PG관리</h2>
            <button class="link_reg">등록</button>
        </div>
            
        <div class="layout_wrap">
            <form class="table_layout02_wrap" name="frm" id="frm" action="" method="post">
            
                <div id="pg_manage_data"></div>
            
            </form>
        </div>
    </div>
	
    <!-- //container -->
    
    <!-- PG 정보 추가 -->
    <div class="pop_wrap pg_setup pop440 pop_off">
        <div class="pop_cont">
            <div class="pop_top">
                <strong class="pop_ttl">PG관리 정보추가</strong>
                <a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
            </div>
            <div class="pop_body">
                <div class="pop_inner">
                    <form name="frm2" id="frm2">
                        <table class="table_layout01">
                            <colgroup>
                                <col style="width:180px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>코드명</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>PG명</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>일반PG 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>수기결제 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>단말기 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>가상계좌 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>실시간계좌이체 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>문화상품권 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="btn_box">
                        <a href="javascript:frmAdd();" class="dark_full_btn">등록</a>
                    </div>					
                </div>		
            </div>
        </div>
        <div class="dim"></div>
    </div>
    <!-- //로그인 정보 변경  -->

    <script>
        $(function(){

            // 팝업 오픈
            $('.link_reg').on('click',function(){
                $('.pg_setup').show();
            });
            
        });
    </script>
	  



