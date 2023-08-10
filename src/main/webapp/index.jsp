<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String mobileCheck = request.getServerName();
//	mobileCheck = mobileCheck.substring(0, 1);
%>
<script>
	var isMobile = false;
	var arrMobileKeyWord = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson','Windows Phone');
	for (var word in arrMobileKeyWord){
		if (navigator.userAgent.match(arrMobileKeyWord[word]) != null){
			isMobile = true;
			break;
		}
	}

	//alert(isMobile);

	if(isMobile) {
		location.href='/app/user/login.do';	
	 } else {
		location.href='/user/login.do';	
	 }
</script>