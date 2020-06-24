<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 request.setCharacterEncoding("UTF-8");
 int seq = Integer.parseInt(request.getParameter("seq"));
 int pg = Integer.parseInt(request.getParameter("pg"));
 String id = (String)session.getAttribute("memId");
 BoardDAO dao = BoardDAO.getInstance();
 BoardDTO dto = dao.getBoard(seq); 
 String boardId = dto.getId();
 System.out.println(boardId);
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<table border=1 cellpadding=2 frame=hsides rules=rows width=400 >
<tr>
<td style=color:green;width:50px align=center><%=seq %></td>
<td colspan=3><%=dto.getSubject()%></td>
</tr>
<tr >
<td colspan=2>작성자</td>
<td><%=dto.getName()%></td>
<td >조회수 <%=dto.getHit()%></td>
</tr>
<tr>
<td colspan=4 height=200 valign=top style=white-space:pre-wrap><%=dto.getContent() %></td>
</tr>
</table>
<input type=button value=목록 onclick="location.href='boardList.jsp?pg=<%=pg %>'">
<%if(id.equals(boardId)){ %>
<input type=button value=글수정 onclick="location.href='boardModifyForm.jsp?seq=<%=seq%>&pg=<%=pg%>'">
<input type=button value=삭제 onclick="">
<%} %>










</body>
</html>