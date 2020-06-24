<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session" /> 
<html>
<head>
<meta charset="UTF-8">
<title>곱구하기</title>
</head>
<body>
<jsp:getProperty property="x" name="dataDTO"/>*
<jsp:getProperty property="y" name="dataDTO"/>=
<%=dataDTO.getX() * dataDTO.getY()%><br>
</body>
</html>