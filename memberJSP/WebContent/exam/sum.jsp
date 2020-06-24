<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session" /> 
<jsp:setProperty name="dataDTO" property="x" /> 
<jsp:setProperty name="dataDTO" property="y" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합</title>
</head>
<body>
<form action="mul.jsp">
<jsp:getProperty property="x" name="dataDTO"/>+
<jsp:getProperty property="y" name="dataDTO"/>=
<%=dataDTO.getX() + dataDTO.getY()%><br>
<br>
<input type=button value=곱구하기 onclick="location.href='mul.jsp'">
<input type=submit value=곱구하기>
</form>
</body>
</html>




