<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로긴</title>
</head>
<body>
 <form name="loginForm" method="post" action="/miniProject/member/login.do">
 <table border="2" cellspacing=0 cellpadding=5>
		<tr>
			<td align=center width=100><font size=2>ID</font></td>
			<td><input type=text name="id" id="id"  placeholder="아이디입력" width=100></td>
		</tr>
		<tr>
		<tr>
			<td align=center><font size=2>PW</font></td>
			<td><input type=password name="pwd" id="pwd" placeholder="비밀번호 입력"></td>
		</tr>
		<tr>
			<td align=center colspan=2><input type=button value=로그인 id="checkLoginForm">
			 <input type=button value=회원가입 onclick="location.href='/miniProject/member/writeForm.do'"></td>
		</tr>
	</table>
	<div align=center id="loginCheck"></div>	
	</form>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
</html>