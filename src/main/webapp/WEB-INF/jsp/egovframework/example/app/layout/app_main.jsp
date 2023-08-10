<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
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
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>