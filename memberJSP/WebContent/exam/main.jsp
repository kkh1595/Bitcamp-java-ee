<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>**include directive**</h3> <%--합쳐서 컴파일 --%>
<%@ include file="today.jsp" %> 
<h3>**include JSP tag**</h3>
<jsp:include page="image.jsp"/>  <%--각각의 파일을 컴파일 후 결합하기 떄문에 변수중복의 오류가 없다 --%>

<%
String name = "홍길동"; 
%><br> --%>
main.jsp name = <%=name %>

<%response.setHeader("Refresh","3;url=input.jsp"); %>

</body>
</html>