<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

    <script src="/js/settlement_store.js"></script>
    <script src="/js/table.js"></script>


        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">수수료율관리</strong>
            </div>
    
            <div class="col col_top">
                <strong class="sub_cont_ttl">업체별 수수료율</strong>			
                <div id="">
                    <form action="" class="table_layout">
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th><button type="button">기준회사</button></th>
                                    <th><button type="button">영업대행명</button></th>
                                    <th><button type="button">대리점명</button></th>
                                    <th><button type="button">가맹점명</button></th>
                                    <th><button type="button">기준점(100%)</button></th>
                                    <th><button type="button">영업대행수수료율</button></th>
                                    <th><button type="button">대리점수수료율</button></th>
                                    <th><button type="button">가맹점수수료율</button></th>
                                    <th><button type="button">지급수수료율</button></th>
                                    <th><button type="button">수정하기</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span>1</span></td>
                                    <td><span>지엠지</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>이안케어</span></td>
                                    <td><span>장안가마솥</span></td>
                                    <td><span class="red">3.63%</span></td>
                                    <td><span>3.63%</span></td>
                                    <td><span>5.5%</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>91.2%</span></td>
                                    <td class="management">
                                        <button class="img_set" type="button"></button>
                                        <button class="img_del" type="button"></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span>2</span></td>
                                    <td><span>지엠지</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>이안케어</span></td>
                                    <td><span>머리하는날</span></td>
                                    <td><span class="red">3.5%</span></td>
                                    <td><span>3.5%</span></td>
                                    <td><span>3.5%</span></td>
                                    <td><span>5.5%</span></td>
                                    <td><span>94.5%</span></td>
                                    <td class="management">
                                        <button class="img_set" type="button"></button>
                                        <button class="img_del" type="button"></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span>3</span></td>
                                    <td><span>지엠지</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>이안케어</span></td>
                                    <td><span>장안가마솥</span></td>
                                    <td><span class="red">3.63%</span></td>
                                    <td><span>3.63%</span></td>
                                    <td><span>5.5%</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>91.2%</span></td>
                                    <td class="management">
                                        <button class="img_set" type="button"></button>
                                        <button class="img_del" type="button"></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span>4</span></td>
                                    <td><span>지엠지</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>이안케어</span></td>
                                    <td><span>장안가마솥</span></td>
                                    <td><span class="red">3.63%</span></td>
                                    <td><span>3.63%</span></td>
                                    <td><span>5.5%</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>91.2%</span></td>
                                    <td class="management">
                                        <button class="img_set" type="button"></button>
                                        <button class="img_del" type="button"></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span>5</span></td>
                                    <td><span>지엠지</span></td>
                                    <td><span>코리아마운트</span></td>
                                    <td><span>이안케어</span></td>
                                    <td><span>장안가마솥</span></td>
                                    <td><span class="red">3.63%</span></td>
                                    <td><span>3.63%</span></td>
                                    <td><span>5.5%</span></td>
                                    <td><span>8.8%</span></td>
                                    <td><span>91.2%</span></td>
                                    <td class="management">
                                        <button class="img_set" type="button"></button>
                                        <button class="img_del" type="button"></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- pager -->
                    <div class="paging">
                        <ul class="pager_btn">
                            <li class="first"><a href="javascript:fn_link_page(1)"></a></li>
                            <li class="prev"><a href="javascript:fn_link_page(1)" title="Go to prev page"></a></li>
                            <li class="on"><a href="javascript:1">1</a></li>
                            <li><a href="javascript:fn_link_page(2)" title="Go to page 2">2</a></li>
                            <li><a href="javascript:fn_link_page(3)" title="Go to page 2">3</a></li>
                            <li><a href="javascript:fn_link_page(4)" title="Go to page 2">4</a></li>
                            <li class="next"><a href="javascript:fn_link_page(11)" title="Go to next page"></a></li>
                            <li class="last"><a href="javascript:fn_link_page(12)" title="Go to last page"></a></li>
                        </ul>
                    </div>
                    <!-- //pager -->
                </div>
            </div>
            
            <div class="col_top">
                <div class="form_info">
                    <ul>
                        <li>1. 100%에서 기준점 수수료를 뺀 금액이 원가입니다.</li>
                        <li>2. 영업대행 수수료 계산은 <span class="color01">대리점 수수료율 - 영업대행 수수료율</span>
                            <ul>
                                <li>예)1번 항목 코리아 마운트(영업대행) 이안케어(대리점)</li>
                                <li><span class="color02">5.5% - 3.63% = 1.87%</span></li>
                                <li>이 금액이 영업대행 정산시 적용되야 합니다.</li>
                            </ul>
                        </li>
                        <li>3. 대리점 수수료 계산은 <span class="color01">가맹점 수수료율 - 영업대행 수수료율</span>
                            <ul>
                                <li>예)2번 항목 이안케어(대리점) 머리하는날(가맹점)</li>
                                <li><span class="color02">5.5% - 3.5% = 2.0%</span></li>
                                <li>이 금액이 대리점 정산시 적용되야 합니다.</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
                                
        <div id="dim"></div>


        <script>
            $("#check_all").on('click',function(){
                //만약 전체 선택 체크박스가 체크된상태일경우
                if($("#check_all").prop("checked")) {
                    $("input[type=checkbox]").prop("checked",true);
                } else {
                    $("input[type=checkbox]").prop("checked",false);
                }
            });
            $('td.num input').on('change',function(){
                var checkCount = $('td.num input:checked').length;
                var checkTotal = $('td.num input').length;
                if (checkCount >= 0) {
                    $('#check_all').prop('checked',false);
                } 
                if (checkCount == checkTotal) {
                    $('#check_all').prop('checked',true);
                }
            });

            // 테이블 정렬 js
            $('.contents_wrap .table_layout th button').on('click',function(){
                if($(this).hasClass('up')){
                    $(this).removeClass('up');
                    $(this).addClass('down');
                } else if ($(this).hasClass('down')){
                    $(this).removeClass('down');
                    $(this).addClass('up');
                } else {
                    $('.contents_wrap .table_layout th button').removeClass('up down');
                    $(this).addClass('up');
                }
            });
        </script>	
