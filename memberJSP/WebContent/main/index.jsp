<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String)session.getAttribute("memName");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<h3>***메인화면***</h3>
<% if(session.getAttribute("memId")==null){ %>
<a href="../member/loginForm.jsp">로그인</a><br>
<a href="http://localhost:8080/memberJSP/member/writeForm.jsp">회원가입</a><br>
<a href="../board/boardList.jsp?pg=1">목록</a><br>
<%} else {  %>
<%=name %>님 접속중<br>
<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
<a href="../board/boardList.jsp?pg=1">목록</a><br>
<a href="../member/modifyForm.jsp">회원정보수정</a><br>
<a href="../member/logout.jsp">로그아웃</a><br>
 <%} %>
</body>
</html>