<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("id");
%>
 로그인실패 
<br>
<input type=button value=회원가입 onclick="location.href='writeForm.jsp'">
<input type=button value=재시도 onclick="location.href='loginForm.jsp'">