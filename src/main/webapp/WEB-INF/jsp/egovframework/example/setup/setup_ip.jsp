<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="/js/setup_ip.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>접속 IP</h2>
        </div>
        <div class="layout_wrap">
            <form name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >
                <table class="table_layout01">
                    <colgroup>
                        <col style="width:160px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>검색조건</th>
                            <td>
                                <div class="radio_box">
                                    <input type="radio" name="check" value="1001" class="input_checkbox" id="s_1001" checked> <label for="s_1001">본사</label>
                                </div> 
                                <div class="radio_box"> 
                                    <input type="radio" name="check" value="1002" class="input_checkbox" id="s_1002"> <label for="s_1002">영업대행</label>
                                </div> 
                                <div class="radio_box"> 
                                    <input type="radio" name="check" value="1003" class="input_checkbox" id="s_1003"> <label for="s_1003">대리점</label>
                                </div> 
                                <div class="radio_box"> 
                                    <input type="radio" name="check" value="1004" class="input_checkbox" id="s_1004" > <label for="s_1004">가맹점</label>
                                </div>
                            </td>								
                        </tr>
                        <tr>
                            <th>검색어</th>
                            <td>
                                <input class="w370" type="text" name="searchKeyword" placeholder="" id="searchKeyword" value="${searchSetupVO.searchKeyword }" onkeyup="enterkey()">
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:setup_ip_data();" class="dark_full_btn">검색</a>
                </div>
            </form>
        </div>
            
        <div class="layout_wrap">
            <div class="list_ttl">
                <div class="view_box">
                    <button class="point_btn ip_pop_btn">등록</button>
                </div>
            </div>
            
            <div id="setup_ip_data"></div>
            
        </div>
    </div>
    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <form action="" name="frm3" id="frm3" method="post">
    <input type="hidden" name="ip" id="ip" value=""/>
    <input type="hidden" name="created_id" id="created_id" value="<c:out value="${sessionScope.login_id}" />">

    <div class="pop_wrap ip_pop pop680 pop_off">
        <div class="pop_cont">
            <div class="pop_top">
                <strong class="pop_ttl">접속 IP 추가</strong>
                <a class="btn_closed" href="javascript:void(0);"><img src="/img/btn/btn_closed.png" alt="닫기" /></a>
            </div>
            <div class="pop_body">
                <div class="pop_inner">
                    <table class="table_layout01">
                        <colgroup>
                            <col style="width:140px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>IP</th>
                                <td>
                                    <div class="ip_wrap">
                                        <input class="w50" type="text" name="ip1" id="ip1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                        <span>.</span>
                                        <input class="w50" type="text" name="ip2" id="ip2" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                        <span>.</span>
                                        <input class="w50" type="text" name="ip3" id="ip3" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                        <span>.</span>
                                        <input class="w50" type="text" name="ip4" id="ip4" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                        <button type="button" class="list_btn">접속 IP</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>메모</th>
                                <td>
                                    <input class="w_all" type="text" name="memo" id="memo" placeholder="메모" maxlength="300">
                                </td>
                            </tr>
                            <tr>
                                <th>선택</th>
                                <td>
                                    <div class="radio_box">
                                        <input type="radio" name="role_id" id="r1001" value="1001" checked> 
                                        <label for="r1001">본사</label>
                                    </div>
                                    <div class="radio_box">
                                        <input type="radio" name="role_id" id="r1002" value="1002"> 
                                        <label for="r1002">영업대행</label>
                                    </div>
                                    <div class="radio_box">
                                        <input type="radio" name="role_id" id="r1003" value="1003"> 
                                        <label for="r1003">대리점</label>
                                    </div>
                                    <div class="radio_box">
                                        <input type="radio" name="role_id" id="r1004" value="1004"> 
                                        <label for="r1004">가맹점</label>
                                    </div>
                                </td>
                            </tr>
                            <!-- tr>
                                <th>사용유무</th>
                                <td>
                                    <div class="radiobox">
                                        <div class="radio_box">
                                            <input type="radio" name="use_yn" id="use_y" checked value="Y"> 
                                            <label for="use_y">사용</label>
                                        </div>
                                        <div class="radio_box">
                                            <input type="radio" name="use_yn" id="use_n" value="N"> 
                                            <label for="use_n">사용안함</label>
                                        </div>
                                    </div>
                                </td>
                            </tr-->
                        </tbody>
                    </table>
                    <div class="btn_box">
                        <a href="javascript:frmAdd();" class="dark_full_btn">등록</a>
                    </div>					
                </div>		
            </div>
        </div>
        <div class="dim"></div>
    </div>
    </form>
    <!-- //로그인 정보 변경  -->

    <script>
        $(function(){
            // 팝업 오픈
            $('.ip_pop_btn, .img_set').on('click',function(){
                $('.ip_pop').show();
            });
        });
    </script>
