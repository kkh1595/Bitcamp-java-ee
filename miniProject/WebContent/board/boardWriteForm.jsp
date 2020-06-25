<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<form name="boardWriteForm" method=post action="/miniProject/board/boardWrite.do">
<table border=1 cellpadding=2 frame=hsides rules=rows>
<tr>
<td>제목</td>
<td><input type=text name=subject placeholder="제목을 입력해주세요" size=58></td>
</tr>
<tr>
<td>내용</td>
<td><textarea name=content style=width:400px;height:280px;resize:none></textarea></td>
</tr>
<tr>
<td colspan=2 align=center>
<c:if test="${id ne 'jpcnani'}">
<input type=button value=글쓰기 onclick="checkBoardWriteForm()">
</c:if>
<c:if test="${id eq 'jpcnani'}">
<input type=button value=이동 onclick="location.href='http://192.168.0.18:8080/miniProject/main/index.do'">
</c:if>
<input type=reset value=다시작성>
<input type=button value=나가기 onclick="location.href='/miniProject/board/boardList.do?pg=1'">
</td>
</tr>
</table>
</form>
<script type="text/javascript" src="../js/board.js?ver=1"></script>
</body>
</html>