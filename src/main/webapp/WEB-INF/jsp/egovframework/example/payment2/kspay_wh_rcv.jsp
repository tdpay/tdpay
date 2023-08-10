<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KSPay</title>
<script>
<c:choose>
	<c:when test="${rcncntype eq '1'}">
		if(opener == null){
			parent.mcancel();
			return;
		}else{
			opener.mcancel();
			setTimeout("self.close()",2000);
			return;
		}
	</c:when>
	<c:otherwise>
		if(opener == null)
		{
			parent.eparamSet("<c:out value='${rcid}' />","<c:out value='${rctype}' />","<c:out value='${rhash}' />");
			parent.goResult();
		}else{
			opener.eparamSet("<c:out value='${rcid}' />","<c:out value='${rctype}' />","<c:out value='${rhash}' />");
			opener.goResult();
			setTimeout("self.close()",2000);
		}
	</c:otherwise>
</c:choose>
</script>
</head>
<body>
 	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
        <td valign="middle" align="center"><table width="280" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/img/progress_resouce.jpg" width="280" height="201"></td>
          </tr>
        </table>		
		</td>
      </tr>
  </table>
</body>
</html>