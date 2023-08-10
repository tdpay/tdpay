<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="format-detection" content="telephone=no, address=no, email=no" />
		<meta content="(주)티디페이먼" name="Title" />
		<meta content="(주)티디페이먼" name="Description" />
		<meta content="(주)티디페이먼" name="Keyword" />
		<meta property="og:title" content="(주)티디페이먼"  />
		<meta property="og:description" content="(주)티디페이먼"  />
		<meta property="og:url" content="http://tdpaypg.co.kr/">
		<link rel="shortcut icon" href="/img/favicon.ico">
		<meta property="og:image" content="/img/kakaotalk_img.png">

        <!-- 이 영역에 공통으로 사용할 css, js library를 선언한다. -->
        <link rel="stylesheet" href="/css/reset.css" >
        <link rel="stylesheet" href="/css/common.css" >
        <link rel="stylesheet" href="/css/style.css" >
        <link rel="stylesheet" href="/css/jquery.mCustomScrollbar.css" >
        
        <script src="/js/jquery-1.11.1.min.js"></script>
        <script src="/js/jquery-ui.min.js"></script>
        <script src="/js/jquery.validate.min.js"></script>
        <script src="/js/additional-methods.min.js"></script>
        <script src="/js/messages_ko.min.js"></script>
        <script src="/js/slick.min.js"></script>
        <script src="/js/script.js"></script>
        <script src="/js/common.js"></script>
        <script src="/js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="/js/selectBox.js"></script>
		<title>(주)티디페이먼츠</title>
	</head>
	<body>
		<div id="wrap">	
		<tiles:insertAttribute name="header" />
			<section id="container" class="container">
			<div class="contents_wrap">		
				<tiles:insertAttribute name="body" />
				<tiles:insertAttribute name="footer" />
			</div>
			</section>			
		</div>        
    </body>

</html>