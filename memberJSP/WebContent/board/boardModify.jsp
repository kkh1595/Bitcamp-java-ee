<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//데이터
request.setCharacterEncoding("UTF-8");
int seq = Integer.parseInt(request.getParameter("seq"));
String subject = request.getParameter("subject");
String content = request.getParameter("content");
System.out.println(subject);
System.out.println(content);
System.out.println(seq);
BoardDTO dto = new BoardDTO();
dto.setSubject(subject);
dto.setContent(content);
BoardDAO dao = BoardDAO.getInstance();
dao.modifyBoard(dto,seq);
%>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
	alert("수정완료");
	location.href="boardList.jsp?pg=1";
}
</script>
</body>
</html>