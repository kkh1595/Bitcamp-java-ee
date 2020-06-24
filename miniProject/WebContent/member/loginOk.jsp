<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<center><a href="#" onclick="location.href='/miniProject/member/modifyForm.do'" >
<img src="../image/smile.png" width=50 height=50/></a></center>
<%-- ${sessionScope.memName } --%> <center>[${memName}]님 접속중</center> <br>
<center>
<input type=button value=로그아웃 onclick="location.href='/miniProject/member/logout.do'"> 
<input type=button value=회원정보수정  onclick="location.href='/miniProject/member/modifyForm.do'">
</center>