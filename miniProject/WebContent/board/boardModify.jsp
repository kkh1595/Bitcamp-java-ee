<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
	alert("수정완료");
	location.href="boardList.do?pg=${pg}";
}
</script>
</body>
</html>