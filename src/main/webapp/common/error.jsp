<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR PAGE</title>
</head>
<body>
    <center><h1>That's an error.</h1></center>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
        <center><p>400 That's an error.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 403}">
        <center><p>403 That's an error.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
        <center><p>404 That's an error.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
        <center><p>405 That's an error.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
        <center><p>500 That's an error.</p></center>
    </c:if>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
        <center><p>503 That's an error.</p></center>
    </c:if>
</body>
</html>
