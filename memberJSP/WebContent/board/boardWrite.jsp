<%@page import="member.bean.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//데이터
request.setCharacterEncoding("UTF-8");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String id= (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");
MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");

Map<String,String> map = new HashMap<String,String>();
map.put("id",id);
map.put("name",name);
map.put("email",email);
map.put("subject",subject);
map.put("content",content);
//DB
BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.makeBoard(map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성완료</title>
</head>
<body>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("작성하신 글을 저장하였습니다");
	location.href = "../main/index.jsp"
}
</script>
</html>