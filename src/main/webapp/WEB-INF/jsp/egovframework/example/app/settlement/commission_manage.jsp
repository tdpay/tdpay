<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no, address=no, email=no" />
        <meta content="gngpayment" name="Title" />
        <meta content="gngpayment" name="Description" />
        <meta content="gngpayment" name="Keyword" />
        <meta property="og:title" content="gngpayment"  />
        <meta property="og:description" content="gngpayment"  />
        <meta property="og:url" content="http://gmgadmin.cafe24.com/">
        <link rel="shortcut icon" href="/img/favicon.ico">
        <meta property="og:image" content="/img/kakaotalk_img.png">
        
        <link href="/app/css/reset.css" rel="stylesheet" type="text/css"/>
        <link href="/app/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="/app/css/style.css" rel="stylesheet" type="text/css"/>
        
        <script src="/app/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="/app/vendor/jquery-ui.min.js" type="text/javascript"></script>
        <script src="/js/jquery.validate.min.js"></script>
        <script src="/js/messages_ko.min.js"></script>
        <script src="/app/js/script.js" type="text/javascript"></script>
        <script src="/js/selectBox.js"></script>
        
        <title>gmgpayment</title>
    </head>
    <body>
        <div id="wrap">
            
    
    <header id="header">
        <div class="header_top">
            <div class="inner">
                <h1>
                    <a href="/app/main/main.do">
                        <img src="/app/img/main_logo.png" alt="지엠지페이먼트">
                    </a>
                </h1>
                <div class="logout_btn">
                    <button onclick="location.href='/app/user/mypage_info.do'" type="button">정보수정</button>
                    <button type="button" onclick="location.href='/app/logout.do'">로그아웃</button>
                </div>
            </div>
        </div>
        <div class="header_nav">
            <div class="inner">
                <ul>
                    <li><a href="/app/manage/manage_all.do">영업대행관리</a></li>
                    <li><a href="/app/manage/manage_branch.do">대리점관리</a></li>
                    <li><a href="/app/manage2/manage2.do">가맹점관리</a></li>
                    <li><a href="/app/history/history_all.do">거래승인내역</a></li>
                    <li><a href="/app/settlement/calendar.do">정산/세금계산서</a></li>
                    <li><a href="/app/notice/notice07.do">고객센터</a></li>
                    <li><a href="/app/payment/payment.do">수기결제(페이조아)</a></li>
                </ul>
            </div>
        </div>
    </header>

    <div id="nav">
        <div class="inner">
            <nav>
                <select onchange="window.open(value,'_self');" name="" id="">
                    <option selected value="/app/history/history_all.do">수수료율관리</option>
                    <option  value="/app/history/history_fail.do">승인실패조회</option>        
                </select>
            </nav>
        </div>
    </div>
    
    <script src="/app/js/history_all.js"></script>
    
    <section class="manage_basic basic_bg">
        <div class="inner">
            <div class="ttl">
                <h2 class="ttl_left">수수료율관리</h2>
            </div>
            <form name="frm2" id="frm2" action="" method="post">
            <input type="hidden" name="high_store_id" id="high_store_id" value="">
            <input type="hidden" name="high_store_id2" id="high_store_id2" value="">        
            <input type="hidden" name="no" id="no" value="">
            <input type="hidden" name="daoutrx" id="daoutrx" value="">        
            <input type="hidden" name="cpid" id="cpid" value="">        
            <div class="manage_list_wrap">
                <div class="list_ttl_wrap">
                    <span class="list_ttl">* 업체별 수수료율</span>
                </div>
                <div class="manage_list">
                    <ul>
                        <li>
                            <span class="list_left">기준회사</span>
                            <span class="list_right">지엠지</span>
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
                        <li class="txt_red">
                            <span class="list_left">기준점(100%)</span>
                            <span class="list_right">3.63%</span>
                        </li>
                        <li>
                            <span class="list_left">영업대행수수료율</span>
                            <span class="list_right">3.63%</span>
                        </li>
                        <li>
                            <span class="list_left">대리점수수료율</span>
                            <span class="list_right">5.5%</span>
                        </li>
                        <li>
                            <span class="list_left">가맹점수수료율</span>
                            <span class="list_right">8.8%</span>
                        </li>
                        <li>
                            <span class="list_left">지급수수료율</span>
                            <span class="list_right">91.2%</span>
                        </li>
                    </ul>
                </div>
            </div>
            </form>
            
    
    <!-- footer -->
    <footer class="footer">
        <div class="footer_info">
            <address>
                <div>
                    <span>상호명:(주)지엠지페이먼트</span>
                    <span>대표:임혜경</span>
                </div>
                <div>
                    <span>대표번호:1670-3216</span>
                    <span>대표이메일: <a href="mailto:gmgpay@naver.com">  gmgpay@naver.com</a></span>
                </div>
                <div>
                    <span>주소:광주광역시 북구 첨단과기로208번길 43-10(오룡동)</span>
                </div>
                <div>
                    <span>사업자번호:512-88-01567</span>
                    <span>개인정보처리담당자:정은영</span>    
                </div>
                <div>
                    <span>Copyright @지엠지페이먼트 All rights reserved.</span>
                </div>
            </address>
        </div>
    </footer>
        </div>
    </section>
    
    
            
        </div>
    </body>
</html>