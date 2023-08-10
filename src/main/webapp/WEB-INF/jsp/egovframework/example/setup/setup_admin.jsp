<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	 <script>
	 	var view_type_s = '<c:out value="${view_type}" />';
	 </script>
	<script src="/js/setup_admin.js"></script>
    
    <!-- container -->
    <div class="inner">
        <div class="ttl_box">
            <h2>운영자 계정관리</h2>
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
                            <th>운영자 이름</th>
                            <td>
                                <input class="w370" type="text" name="ceo" placeholder="" id="ceo" value="${searchSetupVO.ceo }" onkeyup="enterkey()">
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="btn_box">
                    <a href="javascript:setup_admin_data();" class="dark_full_btn">검색</a>
                </div>
            </form>
        </div>
            
            <div class="col" id="setup_admin_data">
        </div>
    </div>
	
