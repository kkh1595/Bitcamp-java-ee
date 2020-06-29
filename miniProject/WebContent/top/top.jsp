<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 align=center><a href="/miniProject/main/index.do"><img alt="홈" src="../image/nike.PNG" width=100 height=50></a>MVC기반 미니프로젝트</h1>
<a href="/miniProject/board/boardList.do?pg=1">자유게시판</a>&emsp;
<a href="/miniProject/imageboard/imageboardList.do?pg=1">상품목록</a>&emsp;
<c:if test="${memId eq 'admin' }">
<a href="/miniProject/imageboard/imageboardWriteForm.do">상품등록</a>&emsp;
</c:if>