<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <section class="manage_basic basic_bg">
        <div class="inner">
            <div class="ttl">
                <h2 class="ttl_left">부가세신고자료</h2>
                <button onclick="location.href='vat_report_search.do'" class="ttl_right" type="button"><span>상세검색</span></button>
            </div>
            <div class="manage_list_wrap">
                <div class="list_ttl_wrap">
                    <span class="list_ttl">* 부가세 신고 명세서</span>
                </div>
                <div class="manage_list detail_list">
                    <ul>
                        <li>
                            <span class="list_left">CPID</span>
                            <span class="list_right">4568410</span>
                        </li>
                        <li>
                            <span class="list_left">사업자명</span>
                            <span class="list_right">김길동</span>
                        </li>
                        <li>
                            <span class="list_left">사업자번호</span>
                            <span class="list_right">5128801567</span>
                        </li>
                        <li>
                            <span class="list_left">매출기간</span>
                            <span class="list_right">2021.07.01~2021.07.31</span>
                        </li>
                    </ul>
                </div>
            </div>
            <form name="frm2" id="frm2" action="" method="post">
            <input type="hidden" name="high_store_id" id="high_store_id" value="">
            <input type="hidden" name="high_store_id2" id="high_store_id2" value="">        
            <input type="hidden" name="no" id="no" value="">
            <input type="hidden" name="daoutrx" id="daoutrx" value="">        
            <input type="hidden" name="cpid" id="cpid" value="">        
            <div class="manage_list_wrap">
                <div class="list_info">
                    <span class="list_total">총 <strong> 0</strong>개/결과 금액 합계 :0 원</span>
                    <!-- span class="excel_down">※ 엑셀 다운로드는 PC에서만 가능합니다.</span-->
                </div>
                
            </div>
            </form>
            
    
        <%@ include file="/WEB-INF/jsp/egovframework/example/app/layout/app_footer.jsp" %>
    </div>
</section>

    
