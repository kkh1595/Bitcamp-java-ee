<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
MemberDAO dao = MemberDAO.getInstance();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로긴</title>
</head>
<body>
 <form name="loginForm" method="post" action="login.jsp">
 <table border="2" cellspacing=0 cellpadding=5>
		<tr>
			<td align=center>아이디</td>
			<td><input type=text name="id"  placeholder="아이디입력"></td>
		</tr>
		<tr>
			<td align=center>비밀번호</td>
			<td><input type=password name="pwd" placeholder="비밀번호 입력"></td>
		</tr>
		<tr>
			<td align=center colspan=2><input type=button value=로그인 onclick="checkLoginForm()">
			 <input type=button value=회원가입 onclick="location.href='writeForm.jsp'"></td>
		</tr>
	</table>	
	</form>
</body>
<script type="text/javascript" src="../js/member.js"></script>
</html>