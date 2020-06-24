<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.dao.MemberDAO"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class="member.bean.MemberDTO" scope="session" /> 
<jsp:setProperty name="memberDTO" property="*" /> 
<%
MemberDAO dao = MemberDAO.getInstance();
dao.writeMember(memberDTO);
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("회원가입 완료");
	location.href="loginForm.jsp";
}
</script>
</html>