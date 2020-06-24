<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// String id = (String)request.getSession().getAttribute("id");
request.setCharacterEncoding("UTF-8");
String name = null;
String id = null;
//쿠키꺼내오기
// Cookie[] ar = request.getCookies();
// if(ar != null){ //login.jsp에서 쿠키는 3초동안만 가지고 있으라 설정했다. 
// 	for(int i=0;i<ar.length;i++){
// 		String cookieName = ar[i].getName(); //쿠키명
// 		String cookieValue = ar[i].getValue();
// 		System.out.println("쿠키명= "+cookieName+"\t 값 : "+cookieValue);
		
// 		if(ar[i].getName().equals("memName")) name = ar[i].getValue();
// 		else if(ar[i].getName().equals("memId")) id = ar[i].getValue();
// 	}
// }
//세션
name = (String)session.getAttribute("memName");
id = (String)session.getAttribute("memId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<a href="#" onclick="location.href='../main/index.jsp'"><img src="../image/main.PNG" width=50 height=50/></a>
<br>
<%=name %>님 로그인성공 <br>
<input type=button value=로그아웃 onclick="location.href='logout.jsp'"> 
<input type=button value=회원정보수정  onclick="location.href='modifyForm.jsp'">
</body>
</html>