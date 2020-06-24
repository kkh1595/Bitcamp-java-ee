<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 align=center><a href="/miniProject/main/index.do"><img alt="홈" src="../image/nike.PNG" width=100 height=50></a>MVC기반 미니프로젝트</h1>
<c:if test="${sessionScope.memId==null}">
<!-- <a href="/miniProject/member/loginForm.do">로그인</a>  -->
<!-- <a href="/miniProject/member/writeForm.do">회원가입</a>  -->
<a href="/miniProject/board/boardList.do?pg=1">자유게시판</a> 
</c:if>
<c:if test="${sessionScope.memId!=null}">
<!-- <a href="/miniProject/board/boardWriteForm.do">글쓰기</a>  -->
<a href="/miniProject/board/boardList.do?pg=1">자유게시판</a> 
<!-- <a href="/miniProject/member/logout.do">로그아웃</a>  -->
<!-- <a href="/miniProject/member/modifyForm.do">회원정보수정</a>  -->
</c:if>