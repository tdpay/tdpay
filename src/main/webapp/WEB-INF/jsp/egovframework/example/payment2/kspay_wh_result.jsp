<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>*** KSNET WebHost 결과 [JSP] ***</title>
<link href="/css/pgstyle.css" rel="stylesheet" type="text/css"
	charset="utf-8">
</head>
<script language="javascript">
	// 신용카드 영수증 출력 스크립트
	function receiptView(tr_no) {
		receiptWin = "http://nims.ksnet.co.kr/pg_infoc/src/bill/credit_view.jsp?tr_no="
				+ tr_no;
		window.open(receiptWin, "", "scrollbars=no,width=434,height=700");
	}

	// 현금영수증 출력 스크립트
	function CashreceiptView(tr_no) {
		receiptWin = "http://nims.ksnet.co.kr/pg_infoc/src/bill/ps1.jsp?s_pg_deal_numb="
				+ tr_no;
		window.open(receiptWin, "", "scrollbars=no,width=434,height=580");
	}

	function kspayClose(){
		
		<c:choose>
			<c:when test="${!empty resultcd && resultcd eq '0000'}">
				alert('결제되었습니다.');
			</c:when>
			<c:otherwise>
				alert('결제실패되었습니다.');
			</c:otherwise>
		</c:choose>

		if(opener == null){
			parent.mcancel();
			return;
		}else{
			opener.mcancel();
			setTimeout("self.close()",2000);
			return;
		}
	}
	
	kspayClose();
	
</script>
