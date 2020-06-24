<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//데이터 받아오기
String id = request.getParameter("id");
String name = request.getParameter("name");
//DB
MemberDAO memberDAO = MemberDAO.getInstance();
boolean exist = memberDAO.isExistId(id);
String check;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>
</head>
<body>
<form name=checkIdForm action="checkId.jsp">
<%if(exist){%>
	<% check ="사용중인 아이디입니다";%>
	[<%=id %>]는 <%=check%>
<input type=text name=id><input type=submit value=검색>
<%}else{%>
	<%check = "사용가능한 아이디입니다";%>	
	[<%=id %>]는 <%=check%>
	<input type=button value=사용하기 onclick="checkIdClose('<%=id %>')">		
<% }%>

</form>
<script type="text/javascript" src="../js/member.js">

</script>
</body>
</html>


