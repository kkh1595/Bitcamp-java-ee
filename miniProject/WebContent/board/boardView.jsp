<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<table border=1 cellpadding=2 frame=hsides rules=rows width=400 >
<tr>
<td style=color:green;width:50px align=center>${seq }</td>
<td colspan=3>${boardDTO.subject }</td>
</tr>
<tr >
<td colspan=2>작성자</td>
<td>${boardDTO.name }</td>
<td >조회수 ${boardDTO.hit}</td>
</tr>
<tr>
<td colspan=4 height=200 valign=top style=white-space:pre-wrap>${boardDTO.content }</td>
</tr>
</table>
<input type=button value=목록 onclick="location.href='boardList.do?pg=${pg}'">
<c:if test="${id ne null }">
<c:if test="${id ne '123' }">
<input type=button value=답글 onclick="location.href='boardReplyForm.do?pseq=${boardDTO.seq}&pg=${pg }'">
</c:if>
<c:if test="${id eq '123'}">
<input type=button value=답글 onclick="check('${boardDTO.id}')">
</c:if>
</c:if>
<c:if test="${id==boardId }">
<input type=button value=글수정 onclick="location.href='boardModifyForm.do?seq=${seq }&pg=${pg }'">
<input type=button value=삭제 onclick="location.href='boardDelete.do?seq=${seq}'">
</c:if>
<script type="text/javascript">
function check(id){
	if(id=='123'){
		alert("차원이동");
		location.href="http://192.168.0.18:8080/miniProject/main/index.do";
	}
}
</script>
</body>
</html>