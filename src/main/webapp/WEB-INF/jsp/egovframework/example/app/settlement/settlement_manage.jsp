<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="nav">
    <div class="inner">
        <nav>
            <select onchange="window.open(value,'_self');" name="" id="">
                <option value="/app/settlement/calendar.do">정산승인달력</option>
                <option selected="" value="/app/settlement/settlement_all.do">통합정산조회</option>
                <option value="/app/settlement/settlement_manage.do" selected>영업대행별정산조회</option>
                <option value="/app/settlement/settlement_branch.do">대리점별정산조회</option>
                <option value="/app/settlement/settlement_store.do">가맹점별정산조회</option>
                <option value="/app/settlement/settlement_his.do">지급보류/해제/별도가감</option>
            </select>
        </nav>
    </div>
</div>

<section class="manage_basic basic_bg">
    <div class="inner">
        <div class="ttl">
            <h2 class="ttl_left">영업대행별정산조회</h2>
            <button onclick="location.href='settlement_manage_search.do'" class="ttl_right" type="button"><span>상세검색</span></button>
        </div>
        <div class="manage_list detail_list">
            <ul>
                <li>
                    <span class="list_left">기간별 거래처</span>
                    <span class="list_right">8개</span>
                </li>
                <li>
                    <span class="list_left">기간별 승인액</span>
                    <span class="list_right">97,219,000원</span>
                </li>
                <li>
                    <span class="list_left">기간별 거래건수</span>
                    <span class="list_right">89건</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">기간별 취소액</span>
                    <span class="list_right">-14,635,000원</span>
                </li>
                <li>
                    <span class="list_left">승인건수</span>
                    <span class="list_right">82건</span>
                </li>
                <li>
                    <span class="list_left">기간별 합계</span>
                    <span class="list_right">82,584,000원</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">취소건수</span>
                    <span class="list_right">7건</span>
                </li>
                <li>
                    <span class="list_left">총 입금액</span>
                    <span class="list_right">78,901,584원</span>
                </li>
                <li class="txt_red">
                    <span class="list_left">승인·취소 건수</span>
                    <span class="list_right">75건</span>
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
                            <span class="list_left">정산일</span>
                            <span class="list_right">2021.08.07</span>
                        </li>
                        <li>
                            <span class="list_left">영업대행명</span>
                            <span class="list_right">코리아마운트</span>
                        </li>
                        <li>
                            <span class="list_left">대리점명</span>
                            <span class="list_right">주식회사 코리아마운트</span>
                        </li>
                        <li>
                            <span class="list_left">가맹점명</span>
                            <span class="list_right">장안 가마솥</span>
                        </li>
                        <li>
                            <span class="list_left">결제금액</span>
                            <span class="list_right">415,000원</span>
                        </li>
                        <li>
                            <span class="list_left">결제 수수료</span>
                            <span class="list_right">14,525원</span>
                        </li>
                        <li>
                            <span class="list_left">부가세</span>
                            <span class="list_right">13,205원</span>
                        </li>
                        <li>
                            <span class="list_left">정산금액</span>
                            <span class="list_right">400,475원</span>
                        </li>
                    </ul>
                    <div class="manage_list_btn">
                        <button onclick="location.href='settlement_manage_detail.do'" type="button">정산정보 상세보기</button>
                    </div>
                </div>
            </div>
        </form>
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>