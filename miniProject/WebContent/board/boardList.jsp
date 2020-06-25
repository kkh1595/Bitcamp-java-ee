<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
#subject:hover{color:blue;text-decoration:underline}
#subject:{color:black; cursor:pointer}
#subject {text-decoration:none;}
#currentPage {color:red; cursor:pointer}
#paging {color:black; cursor:pointer}
#endPage {color:black; cursor:pointer;}
#nextPage {cursor:pointer}
</style>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<a href="boardList.do?pg=1" align=center style=text-decoration:none;color:black><h3>자유게시판</h3></a>
<body>
<form name=search method=post action="/miniProject/board/boardSearch.do">
<table border=3 cellpadding=2 frame="hsides" rules=rows align=center >
	<tr>
	<td width=70 align=center colspan=5>글번호</td>
	<td width=250 align=center>제목 ${on }</td>
	<td width=80 align=center>작성자</td>
	<td width=100 align=center>작성일</td>
	<td width=50 align=center>조회수</td>	
	</tr>
<c:if test="${list!=null }">
	<c:forEach var="board" items="${list }">
	<tr>
	<td colspan=5 align=center>${board.seq }</td>
	<td>
	<a href="#" id=subject onclick="checkLogin('${id}',${board.seq},${pg})">
	<c:if test="${board.lev ne 0 }">
	<c:forEach begin="0" end="${board.lev-1}">
	<img alt="답글사진" src="../image/reply.gif">
	</c:forEach>
	</c:if>
	${board.subject}</a>
	</td>
	<td align=center>${board.name}</td>
	<td align=center>
	 <c:if test="${today eq board.logtime}">
	  <fmt:formatDate value="${board.logtime }" pattern="HH:mm:ss"/>
	 </c:if>
     <c:if test="${today ne board.logtime}">
      <fmt:formatDate value="${board.logtime }" pattern="yy.MM.dd"/>
     </c:if>
	</td>
	<td align=center>${board.hit }</td>
	</tr>
	</c:forEach>
	</c:if>
	</table>
<div align=center>${boardPaging.pagingHTML} 
<c:if test="${id ne null && id ne 'jpcnani' && id ne '123' && id ne '1231'}">
&emsp;<input type=button value=글작성 onclick="location.href='boardWriteForm.do'">
</c:if>
<c:if test="${id eq 'jpcnani' || id eq '1231' || id eq '123' }">
<input type=button value=이동 onclick="location.href='http://192.168.0.18:8080/miniProject/main/index.do'">
</c:if>
</div>
<br>
<input type=hidden name=pg value=1> <!--포스트방식으로 pg값을 숨겨서 보내자  -->
<div align=center ><select name=searchOption  style="height:22px">
<option  value="subject">제목</option> 
<option  value="name">작성자</option> 
</select> 
<input type=search name=keyword style="height:21px" value="${keyword }"> 
<input type=submit value=검색> 
</div>
</form>
<script type="text/javascript">
function checkLogin(id,seq,pg) {
	if(id==''){ //따옴표를 치고 들어왔기 때문에 null값도 null이란 문자로 들어왔다.
		alert("로그인 후 이용해주세요");
		location.href="/miniProject/member/loginForm.do"
	}else{
		location.href="/miniProject/board/boardView.do?seq="+seq+"&pg="+pg;
	}
}
function boardPaging(pg){
	location.href="boardList.do?pg="+pg;
}
function searchPaging(pg){
	location.href="boardSearch.do?pg="+pg+"&searchOption=${searchOption}&keyword="+encodeURI("${keyword}");
}
window.onload=function (){
	if(${searchOption!=null}){
		document.search.searchOption.value="${searchOption}";
	}
}
</script>
</body>
</html>