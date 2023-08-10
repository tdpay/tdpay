<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/jquery.number.js"></script>
<script src="/js/manage_all.js"></script>
<script src="/js/table.js"></script>

<!-- container -->
<div class="inner">
    <div class="ttl_box">
        <h2>현금영수증 파일 요청(파일 업로드)</h2>
    </div>
    <div class="layout_wrap">
        <form action="">
            <table class="table_layout01">
                <colgroup>
                    <col style="width:160px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>상점ID</th>
                        <td>
                            <input class="w140" type="text" value="545654810" disabled>
                            <select class="w140" name="" id="">
                                <option value="">선택</option>
                            </select>
                            <button type="button" class="list_btn">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <div class="input_file">
                                <input type="file" id="fileAdd">
                                <label for="fileAdd" class="list_btn">파일등록하기</label>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn_box">
                <a href="#!" class="dark_full_btn">검색</a> 
                <a href="#!" class="gray_line_btn">파일확인</a>
            </div>
        </form>
    </div>
</div>
<!-- //container -->