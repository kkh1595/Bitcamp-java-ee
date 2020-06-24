<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("memId");
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));
BoardDAO dao = BoardDAO.getInstance();
BoardDTO dto = dao.getBoard(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<form name=boardModifyForm method=post action="boardModify.jsp">
<input type=hidden name=seq value=<%=seq %>>
<input type=hidden name=pg value=<%=pg %>>
<table border=1 cellpadding=2 frame=hsides rules=rows width=400 >
<tr>
<td style=color:green;width:50px align=center><%=seq %></td>
<td colspan=3><input type=text name=subject id=subject value=<%=dto.getSubject()%>></td>
</tr>
<tr >
<td colspan=2>작성자</td>
<td><%=dto.getName()%></td>
<td >조회수 <%=dto.getHit()%></td>
</tr>
<tr>
<td colspan=4 height=200 valign=top style=white-space:pre-wrap><textarea name=content style=width:400px;height:300px>
<%=dto.getContent() %></textarea ></td>
</tr>
</table>
<input type=button value=수정 onclick="checkModify()">
</form>
<script type="text/javascript" src="../js/board.js">
</script>
</body>
</html>