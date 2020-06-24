<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<table border=1 cellspacing=0 cellpadding=5 width=90% align=center>
<tr>
<td colspan=2 >
<jsp:include page="../top/top.jsp"/>
</td>
</tr>
<tr>
<c:if test="${memId eq null }">
<td height=400 width=180 valign=top><jsp:include page="../member/loginForm.jsp"/></td>
</c:if>
<c:if test="${memId ne null }">
<td height=400 width=180 valign=top><jsp:include page="../member/loginOk.jsp"/></td>
</c:if>
<td valign=top><jsp:include page="${display }"/></td>
</tr>
<tr>
<td colspan=2><jsp:include page="../top/bottom.jsp"/></td>
</tr>
</table>
</body>
</html>