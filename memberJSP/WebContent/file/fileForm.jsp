<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method=post enctype=multipart/form-data action="fileUpload.jsp">
<table border=2 cellpadding=0>
<tr>
<td>제목</td>
<td><input type=text name=subject placeholder="제목을 입력해주세요" size=30></td>
</tr>
<tr>
<td>내용</td>
<td><textarea name=content style=width:300px;height:200px;resize:none></textarea></td>
</tr>

<tr>
<td colspan=2><input type=file name=upload1 size=50></td>
</tr>
<tr>
<td colspan=2><input type=file name=upload2 size=50></td>
</tr>

<tr>
<td colspan=2 align=center><input type=submit value=파일업로드></td>
</tr>
</table>
</form>
</body>
</html>