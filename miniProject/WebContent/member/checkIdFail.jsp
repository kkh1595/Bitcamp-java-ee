<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form method=post action="/miniProject/member/checkId.do">
[${requestScope.id }]는 사용중인 아이디 입니다.
<br>
아이디<input type=text name=id>
<input type=submit value=검색>
</form>
