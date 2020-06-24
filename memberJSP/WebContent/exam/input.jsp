<%@page import="exam.bean.DataDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값구하기</title>
</head>
<body>
<form action="sum.jsp"> 
<table border=1>
<tr>
<td>x</td>
<td><input type=text id=x name=x></td>
</tr>
<tr>
<td>y</td>
<td><input type=text id=y name=y></td>
</tr>
<tr>
<td colspan=2><input type=submit value=합구하기 ><input type=reset value=취소></td>
</tr>
</table>
</form>
</body>
</html>