<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/jquery.number.js"></script>
<!-- <script src="/js/limitchange_all.js"></script> -->
<!-- <script src="/js/table.js"></script> -->
<script src="/js/limitchange.js"></script>

<!-- container -->
<div class="inner">
    <div class="ttl_box">
        <h2>월한도 지급변경</h2>
        <a href="/limitchange/limitchange.do" class="link_reg" ${sessionScope.role_id eq '1001' ?'style="display:none;"':''}>지급변경 신청</a>
    </div>
    <div class="layout_wrap">
        <form name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >
        <input type="hidden" name="store_id" id="store_id" value="${sessionScope.role_id eq '1001'? '':sessionScope.login_id}">
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
                                <input type="radio" name="searchType" value="searchType01" class="" id="searchType01"> <label for="searchType01">전체</label>
                            </div> 
                            <div class="radio_box">
                                <input type="radio" name="searchType" value="searchType02" class="" id="searchType02"> <label for="searchType02">사업자번호</label>
                            </div> 
                            <div class="radio_box">
                                <input type="radio" name="searchType" value="searchType03" class="" id="searchType03"> <label for="searchType03">상점ID</label>
                            </div> 
                            <div class="radio_box">
                                <input type="radio" name="searchType" value="searchType04" class="" id="searchType04"> <label for="searchType04">변경사유</label>
                            </div> 
                        </td>
                    </tr>
                    <tr>
                        <th>검색어</th>
                        <td>
                            <input class="w370" type="text" name="searchKeyword" placeholder="" id="searchKeyword" value="">
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="btn_box">
                <a href="javascript:searchList();" class="dark_full_btn">검색</a>
            </div>
        </form>
    </div>

    <div class="layout_wrap" id="limitchange_data"></div>
    
</div>
<!-- //container -->