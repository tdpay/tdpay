<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="nav">
    <div class="inner">
        <nav>
            <select onchange="window.open(value,'_self');" name="" id="">
                <option value="/app/settlement/calendar.do">정산승인달력</option>
                <option selected="" value="/app/settlement/settlement_all.do">통합정산조회</option>
                <option value="/app/settlement/settlement_manage.do">영업대행별정산조회</option>
                <option value="/app/settlement/settlement_branch.do">대리점별정산조회</option>
                <option value="/app/settlement/settlement_store.do" selected>가맹점별정산조회</option>
                <option value="/app/settlement/settlement_his.do">지급보류/해제/별도가감</option>
            </select>
        </nav>
    </div>
</div>

<section class="manage_basic basic_bg">
    <div class="inner">
        <div class="ttl">
            <h2 class="ttl_left">가맹점별정산조회</h2>
        </div>
        <div class="manage_list detail_list">
            <ul>
                <li>
                    <span class="list_left">총결제금액</span>
                    <span class="list_right">458,451,000원</span>
                </li>
                <li>
                    <span class="list_left">승인건</span>
                    <span class="list_right">78건</span>
                </li>
                <li>
                    <span class="list_left">취소금액</span>
                    <span class="list_right">8,451,000원</span>
                </li>
                <li>
                    <span class="list_left">취소건</span>
                    <span class="list_right">70건</span>
                </li>
            </ul>
        </div>
		<form class="table_layout" name="" id="" action="" method="">
            <div class="manage_list_wrap">
                <div class="manage_list">
                    <ul onclick="location.href='settlement_store_detail_view.do'">
                        <li class="store_id">
                            <span class="list_left">상점아이디</span>
                            <span class="list_right">GP21031201</span>
                        </li>
                        <li>
                            <span class="list_left">터미널 ID</span>
                            <span class="list_right">87000108</span>
                        </li>
                        <li>
                            <span class="list_left">매입구분</span>
                            <span class="list_right">매입</span>
                        </li>
                        <li>
                            <span class="list_left">지급일자</span>
                            <span class="list_right">2021.07.05</span>
                        </li>
                        <li>
                            <span class="list_left">승인일자</span>
                            <span class="list_right">2021.07.10</span>
                        </li>
                        <li>
                            <span class="list_left">거래금액</span>
                            <span class="list_right">55,000원</span>
                        </li>
                    </ul>
                </div>
            </div>
        </form>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

