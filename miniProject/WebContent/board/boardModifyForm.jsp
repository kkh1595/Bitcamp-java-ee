<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<form name=boardModifyForm method=post action="boardModify.do">
<input type=hidden name=seq value=${seq }>
<input type=hidden name=pg value=${pg }>
<table border=1 cellpadding=2 frame=hsides rules=rows width=400 >
<tr>
<td style=color:green;width:50px align=center>${seq }</td>
<td colspan=3><input type=text name=subject id=subject size=45 value=${boardDTO.subject }></td>
</tr>
<tr >
<td colspan=2>작성자</td>
<td>${boardDTO.name }</td>
<td >조회수 ${boardDTO.hit }</td>
</tr>
<tr>
<td colspan=4 height=200 valign=top style=white-space:pre-wrap><textarea name=content style=width:400px;height:280px;resize:none>
${boardDTO.content}</textarea ></td>
</tr>
</table>
<input type=button value=수정 onclick="checkModify()">
<input type=button value=취소 onclick="location.href='/miniProject/board/boardList.do?pg=1'">
</form>
<script type="text/javascript" src="../js/board.js">
</script>
</body>
</html>