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
            <button onclick="location.href='settlement_store_search.do'" class="ttl_right" type="button"><span>상세검색</span></button>
        </div>
        <div class="manage_list detail_list">
            <ul>
                <li>
                    <span class="list_left">기간별 거래처</span>
                    <span class="list_right">1건</span>
                </li>
                <li>
                    <span class="list_left">기간별 승인건수</span>
                    <span class="list_right">12건</span>
                </li>
                <li>
                    <span class="list_left">기간별 승인액</span>
                    <span class="list_right">97,219,000원</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">기간별 취소건</span>
                    <span class="list_right">7건</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">기간별 취소금액</span>
                    <span class="list_right">-14,635,000원</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">총 합계금액</span>
                    <span class="list_right">-82,584,000원</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">부가세</span>
                    <span class="list_right">-1,500,000</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">정산금액</span>
                    <span class="list_right">-19,610,000원</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">총 정산금액</span>
                    <span class="list_right">-16,910,000</span>
                </li>
            </ul>
        </div>
		<form class="table_layout" name="" id="" action="" method="">
            <div class="manage_list_wrap">
                <div class="list_info">
                    <span class="list_total">총 <strong>70</strong>개/결과 금액 합계 : 475,000원</span>
                </div>
                <div class="manage_list">
                    <ul>
                        <li>
                            <span class="list_left">지급예정일</span>
                            <span class="list_right">2021.08.07</span>
                        </li>
                        <li class="store_id">
                            <span class="list_left">가맹점명</span>
                            <span class="list_right">장안 가마솥</span>
                        </li>
                        <li class="store_id">
                            <span class="list_left">상점명</span>
                            <span class="list_right">장안 상점</span>
                        </li>
                        <li>
                            <span class="list_left">정산금액</span>
                            <span class="list_right">300,000원</span>
                        </li>
                        <li>
                            <span class="list_left">차감매출 취소금액</span>
                            <span class="list_right">415,000원</span>
                        </li>
                        <li>
                            <span class="list_left">차감매출 차감할금액</span>
                            <span class="list_right">14,525원</span>
                        </li>
                        <li>
                            <span class="list_left">지급상태</span>
                            <span class="list_right">지급완료</span>
                        </li>
                    </ul>
                    <div class="manage_list_btn">
                        <button onclick="location.href='settlement_store_detail.do'" type="button">정산정보 상세보기</button>
                    </div>
                </div>
            </div>
        </form>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>