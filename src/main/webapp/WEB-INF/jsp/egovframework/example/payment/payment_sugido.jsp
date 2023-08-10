<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>신용카드 - 수기 API 결제 페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">

<script type="text/javascript">
var pf;



function fnSubmit() {
	var fileName;
	fileName = "/payment/cardSugido.do";		
	
	pf = document.frmConfirm;
	pf.action = fileName;
	pf.method = "post";
	pf.submit();
}

</script>

</head>
<BODY>

<form name="frmConfirm"> 
<input type="hidden" name="NO">
상점ID:	<input type="text" name="CPID" value="CTS16741"><br>
주문번호:<input type="text" name="ORDERNO" value="20210222110820"><br>
상품구분(디지털1,실물2):<input type="text" name="PRODUCTTYPE" value="1"><br>
과금유형:<input type="text" name="BILLTYPE" value="13"><br>
13:카드번호+유효기간+비밀번호+생년월일, 18: 카드번호+유효기간<br>
과세비과세:<input type="text" name="TAXFREECD" value="00"><br>
00:과세, 01:비과세<br>
상품금액:<input type="text" name="AMOUNT" value="100"><br>
카드번호:<input type="text" name="CARDNO" value="4364200753594207"><br>
유효기간(YYYYMM):<input type="text" name="EXPIRATIONDATE" value="202504"><br>
할부개월(00~12):<input type="text" name="QUOTA" value="00"><br>

<br>=========과금유형이 14인경우 사용=========<br>
카드비밀번호(앞2자리):<input type="text" name="CARDPASSWORD" value="76"><br>
생년월일:<input type="text" name="CARDAUTH" value="811209"><br>
개인:생년월일, 법인: 사업자번호10자리<br>

<br>=========아래 값은 선택항목 입니다=========<br>
상품명:<input type="text" name="PRODUCTNAME" value="테스트상품"><br>
고객이메일:<input type="text" name="EMAIL" value="dyddl1709@gmail.com"><br>
IP주소:<input type="text" name="IPADDRESS" value=""><br>
사용자아이디:<input type="text" name="USERID" value="a1234"><br>
사용자명:<input type="text" name="USERNAME" value="조덕용"><br>
상품코드:<input type="text" name="PRODUCTCODE" value="A001"><br>
예약항목:<input type="text" name="RESERVEDINDEX1" value=""><br>
예약항목:<input type="text" name="RESERVEDINDEX2" value=""><br>
예약항목:<input type="text" name="RESERVEDSTRING" value=""><br>
<input name="btnSubmit" type="button" value="Batch" onclick="fnSubmit()" ><br>
</form>
</body>
</html>


