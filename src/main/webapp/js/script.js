function responsive(){

   var $wh = $(window).width();


   if ($wh <= 768)
   {
	  $("body").removeClass("web");
      $("body").addClass("mobile");
   }else{
      $("body").removeClass("mobile");
      $("body").addClass("web");
   }
}

$(function(){
    $( window ).load(function() {
        responsive();
    });
    $( window ).resize(function() {
        responsive();
    });

});


/*$(function(){
   $(".btn_gnbmenu").click(function(e){
      if($("body").hasClass("responsive")){
         $(this).toggleClass("on");
         $("#gnb").slideToggle("fast");
      }else{
         $(this).removeClass("on");
         $("#gnb").show();
      }
      e.preventDefault();
   });
});*/

//fullpage_js
//$(document).ready(function() {
	//$('#container.main').fullpage({
		//anchors: ['section_one', 'section_two', 'section_thr', 'section_fou', 'section_fiv','section_six','section_eig','section_nin','section_foo'],
		//verticalCentered: true,
		//menu: '.dot_page',
		//css3:false,
		//resize:true,
		//responsiveWidth:1200,
		//scrollingSpeed: 400
	//});
//});
//gnb
/*$(document).ready(function(){
	$("#gnb > ul > li").mouseenter(function(){
		 if($("body").hasClass("web")){
			$("#header").stop().animate({'height':402},1000,'easeOutExpo');
			$("#header").addClass("active");
		 }
	});
	$("#header").mouseleave(function(){
    var $wh = $(window).width();
		 if($("body").hasClass("web")){
			//$("#header").stop().animate({'height':113},1000,'easeOutExpo');
      if($wh <1200){
        //$("#header").stop().animate({'height':170},1000,'easeOutExpo');
        $("#header").stop().animate({'height':170},1000,'easeOutExpo');
      }else if($wh >=1200){
        $("#header").stop().animate({'height':113},1000,'easeOutExpo');
      }
			$("#header").removeClass("active");
		 }

	});
});*/

//주 메뉴 스크립트
$(document).ready(function(){
$('#gnb > ul > li > .depth02 li .depth03').slideUp();
  $(".gnb_list > li > a").click(function(e){
    //쇼핑몰 링크 메뉴체크
    var shop_check =$(this).attr("title");

    if($("body").hasClass("mobile")){
      if(shop_check =="shop_url"){ //쇼핑몰 링크
        location.href("https://www.bontoshop.com/main/main.php");
      }
			var $con = $(this).next(".depth02");
			if($con.is(":visible")) {
				$con.slideUp();
				$('#gnb > ul > li > .depth02 li .depth03').slideUp();
				$(".gnb_list > li > a").removeClass("active");
			} else {
				$(".gnb_list > li .depth02:visible").slideUp();
				$(".gnb_list > li > a").removeClass("active");
				$(this).addClass("active");
				$con.slideDown();
				$('#gnb > ul > li > .depth02 li .depth03').slideUp();
			}
				e.preventDefault();
		}
	});
	$('#gnb > ul > li > .depth02 li  a').click(function(){
		if($('#gnb > ul > li > .depth02 li  a').hasClass('active')){
			$(this).removeClass('active');
			$('#gnb > ul > li > .depth02 li .depth03').slideUp();
		}else{
			$(this).addClass('active');
			$('#gnb > ul > li > .depth02 li .depth03').slideUp();
			$($(this).next('div')).slideDown();
		}
	});

	var toggle=0;
	$(".gnb_menu").click(function(e){
		if($("body").hasClass("mobile")){
			if(toggle == 0){
				/*$("#gnb").slideDown();*/
				$(".layer_bg").show();
				$(".performance_btn .join_btn").css("display","none");
				$(".gnb_menu, #gnb").addClass("on");
				e.preventDefault();
				return toggle=1;
			}else if(toggle == 1){
				/*$("#gnb").slideUp();*/
				$(".gnb_menu, #gnb").removeClass("on");
				$(".layer_bg").hide();
				$(".performance_btn .join_btn").css("display","block");
				return toggle=0;
			}
		}
	});
	$(".layer_bg").click(function(){
		if(toggle==1){
			$("#gnb").slideUp();
			$(".gnb_menu").removeClass("on");
			$(".layer_bg").hide();
			return toggle=0;
		}
	});

})

//서브상단 메뉴 및 active효과
$(document).ready(function(){


	$(".loc_nav > li > a").click(function(e){
		$(this).next(".dep02").slideToggle();
		$(this).toggleClass("on");
		e.preventDefault();
	});

	/*var slider = $('.main_visual_slide').bxSlider({
			mode:"fade",
			auto:true,
			speed: 1000,
			controls:true,
			autoplay:true,
				pager:true
		});*/

	

	/*$('.pause').on('click', function() {
		$('.main_visual_slide').slick('slickPause');
	});*/

	//모바일 서브 탭메뉴 슬라이드
	$(".st_menu_mo .stm_tit").click(function(){
		$(this).toggleClass("active");
		$(this).next("ul").slideToggle(200);
	});
	$(".my_menu_mo .my_stm_tit").click(function(){
		$(this).toggleClass("active");
		$(this).next("ul").slideToggle(200);
	});
	//서브위치active스크립트
	var $smenu=$('#gnb .depth02 li');
	var $stmenu=$('.st_menu li');
	var $locTxt=$('.sub_content .sc_top .sc_tit').text();
	for (var i=0; i<$smenu.length; i++){
		var menutxt=$.trim($smenu.eq(i).find('>a').text());
		var loctxt=$.trim($locTxt);
		if (menutxt == loctxt){
			$smenu.eq(i).addClass('active');
			$stmenu.eq(i).addClass('active');
		}
	}
	for (var i=0; i<$stmenu.length; i++){
		var menutxt=$.trim($stmenu.eq(i).find('>a').text());
		var loctxt=$.trim($locTxt);
		if (menutxt == loctxt){
			$stmenu.eq(i).addClass('active');
		}
	}
	$(".stm_tit").text($(".sub01_nav li:last-child a").text());

});

//유튜브 영상 팝업
$(document).ready(function(){
	var $v_link = $('.youtube_layer iframe')
	var videoURL = $v_link.prop('src');
		videoURL += "&autoplay=1";
	$(".btn_video").click(function(e){
		$v_link.prop('src',videoURL);
		$(".layer_bg").stop().fadeIn("fast");
		$(".youtube_layer").stop().fadeIn("fast");
		e.preventDefault();
		$(".youtube_layer .btn_close,.layer_bg").click(function(e){
			videoURL = videoURL.replace("&autoplay=1", "");
			$v_link.prop('src','');
			$v_link.prop('src',videoURL);
			$(".layer_bg").stop().hide();
			$(".youtube_layer").stop().hide();
			e.preventDefault();
		});
	});
});

$(document).ready(function(){
	$( 'iframe[src^="https://www.youtube.com/"]' ).wrap( '<div class="youtubeWrap"></div>' );
});

//모바일 테이블 화살표
$(function(){
	$(".ta_overwrap").scroll(function(){
		var sl = $(this).scrollLeft();
		if(sl > 5){
			$(this).find(".more_arrow").fadeOut("fast");
		}else{
			$(this).find(".more_arrow").fadeIn("fast");
		}
	});


});

function checkNumber(nums){
	//var objEv = event.srcElement;
	var numPattern = /([^0-9])/;
	numPattern = nums.match(numPattern);
	if(numPattern != null){
		alert("숫자만 입력해 주세요!");
		//objEv.value="";
		//objEv.focus();
		return false;
	}
}

//문자발송하기
function sms_send_model(ftel,totel,content){
  // 메시지 발송 부분.. (함수로 구현하여 클릭 시 발송 되도록 할 수도 있습니다. 재사용가능.)
	_mnq.push(['_send', {
		msg:content, // ex)메시지 ※ 수정
		phone:totel, // ex)01011112222 ※ 수정 (여러건 발송시 : 0100000000\r\n0110002222\r\n010...)
		callback:ftel, // ex)021112222 ※ 수정
		reservation:"", // 예약시간 (2013-05-05 13:03), 없으면 즉시발송
		encode:"", // 한글이 깨질경우 설정( ex. ISO-8859-1>UTF-8 )
		image:"" // 미사용..
	}]);

}

$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});

//빅조이 사용처 스크립트
$(function(){
	$(".usage_box").hide();
	$("#all").show();
	$(".usage_val li a").removeClass("on");
	$(".usage_val li:first-child a").addClass("on");

	$(".usage_val li a").click(function(){
		$(".usage_val li a").removeClass("on");
		$(this).addClass("on");
		
		$(".usage_box").hide();
		$($(this).attr("href")).show();
		return false;
	});

	
	$('#favorite').on('click', function(e) {
		var bookmarkURL = window.location.href;
		var bookmarkTitle = "함께하는 뮤지컬 - School of Musical";
		var triggerDefault = false;

		if (window.sidebar && window.sidebar.addPanel) {
			// Firefox version &lt; 23
			window.sidebar.addPanel(bookmarkTitle, bookmarkURL, '');
		} else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') < -1)) || (window.opera && window.print)) {
			// Firefox version &gt;= 23 and Opera Hotlist
			var $this = $(this);
			$this.attr('href', bookmarkURL);
			$this.attr('title', bookmarkTitle);
			$this.attr('rel', 'sidebar');
			$this.off(e);
			triggerDefault = true;
		} else if (window.external && ('AddFavorite' in window.external)) {
			// IE Favorite
			window.external.AddFavorite(bookmarkURL, bookmarkTitle);
		} else {
			// WebKit - Safari/Chrome
			alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 를 이용해 이 페이지를 즐겨찾기에 추가할 수 있습니다.');
		}

		return triggerDefault;
	});
});


function execDaumPostcode(frm_name, zip, addr1, addr2) {

	var of = document[frm_name];

	new daum.Postcode({
		oncomplete: function(data) {

			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
			   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
			// 주소 정보를 해당 필드에 넣는다.


			of[zip].value = data.zonecode;
			of[addr1].value = fullRoadAddr;
			of[addr2].focus();

			/*
			frm.zip.value = data.zonecode;
			frm.addr1.value = fullRoadAddr;
			//document.getElementById("addr2").value = data.jibunAddress;
			frm.addr2.focus();
			*/

			/*
			document.getElementById("sido").value = data.sido;;
			document.getElementById("gugun").value = data.sigungu;
			document.getElementById("dong").value = data.bname;;
			*/



		}
	}).open();
}

