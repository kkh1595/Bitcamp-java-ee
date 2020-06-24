<%@page import="board.bean.BoardPaging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%
request.setCharacterEncoding("UTF-8");
//세션
String id=(String)session.getAttribute("memId");
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));
//db
int endNum = pg*5;
int startNum = endNum-4;
BoardDAO dao = BoardDAO.getInstance();
List<BoardDTO> list = dao.boardList(endNum,startNum);

//페이징처리
BoardPaging boardPaging = new BoardPaging(); 
int totalA = dao.getTotalA();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);
boardPaging.makePagingHTML();

%>
<!DOCTYPE html>
<html>
<head>
<style>
#subject:hover {
	color:blue	
}
#subject {text-decoration:none
}
</style>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<img alt="홈" src="../image/main.PNG" width=50 height=50 style=cursor:pointer onclick="location.href='../main/index.jsp'">
<a href="boardList.jsp?pg=1" style=text-decoration:none;color:black><h3>자유게시판</h3></a>
<body>
<table border=3 cellpadding=2 frame="hsides" rules=rows>
	<tr>
	<td colspan=5>글번호</td>
	<td width=250>제목</td>
	<td width=80>작성자</td>
	<td width=100>작성일</td>
	<td width=50>조회수</td>	
	</tr>
<%if(list!=null){ %>
	<%for(BoardDTO board :list) {%>
	<tr>
	<td colspan=5 align=center><%=board.getSeq()%></td>
	<td ><a href="#" id=subject onclick="checkLogin('<%=id%>',<%=board.getSeq()%>,<%=pg%>)"><%=board.getSubject()%></a></td>
	<td><%=board.getName()%></td>
	<td><%=board.getLogtime()%></td>
	<td><%=board.getHit()%></td>
	</tr>
	<%} %>
	<%} %>
	</table>
<%-- <% for(int i=1;i<=totalP; i++) { --%>
<%-- if(i==pg){%> --%>
<%-- <a id=currentPagingb href="boardList.jsp?pg=<%=i%>" style=text-decoration:none;> [<%=i%>]</a> --%>
<%-- <%}else {%> --%>
<%-- <a id=paging href="boardList.jsp?pg=<%=i%>" style=text-decoration:none;> [<%=i%>]</a> --%>
<%-- <% } --%>
<%-- } %> --%>
<!-- <br> -->
<%-- <% }%> --%>
<%-- <%if(pg>=2 && pg<=totalP){%> --%>
<%-- <input type=button value=이전 onclick="location.href='boardList.jsp?pg=<%=pg-1%>'"> --%>
<%-- <%} %> --%>
<%-- <%if(pg>=1 && pg<totalP) { %> --%>
<%-- <% System.out.print(pg);%> --%>
<%-- <input type=button value=다음 onclick="location.href='boardList.jsp?pg=<%=pg+1%>'"> --%>
<%-- <%} %> --%>
<div style="border:solid 1px red;width:700px"><%=boardPaging.getPagingHTML()%></div>
<input type=button value=글작성 onclick="location.href='boardWriteForm.jsp'">

<script type="text/javascript">
function checkLogin(id,seq,pg) {
	if(id=='null'){ //따옴표를 치고 들어왔기 때문에 null값도 null이란 문자로 들어왔다.
		alert("로그인 후 이용해주세요");
		location.href="../member/loginForm.jsp"
	}else{
		location.href="boardView.jsp?seq="+seq+"&pg="+pg;
	}
}
</script>
</body>
</html>