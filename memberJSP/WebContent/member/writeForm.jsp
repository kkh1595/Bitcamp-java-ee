<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입2</title>
</head>
<body>
	<form name="writeForm" method="post" action="write.jsp">
	<table border="2" cellspacing=0 cellpadding=5>
		<tr>
			<td align=center>이름</td>
			<td><input type=text name="name" id="name" placeholder="이름입력" ></td>
		</tr>
		<tr>
			<td align=center>아이디</td>
			<td><input type=text name="id" placeholder="아이디입력">
			<input type=button value=중복체크 onclick="checkId()"><input type=hidden name=dup value=unchecked>
			</td>
		</tr>
		<tr>
			<td align=center>비밀번호</td>
			<td><input type=password name="pwd"></td>
		</tr>
		<tr>
			<td align=center>재확인</td>
			<td><input type=password name="repwd"></td>
		</tr>
		<tr >
			<td align=center>성별</td>
			<td><input type="radio" name="gender" value=0 checked>남
			 <input type="radio" name=gender value=1>여</td>
		</tr>
		<tr>
			<td align=center>이메일</td>
			<td><input type=text name="email1"> @
			<input type=text name="email2" list=defaultEmails placeholder="직접입력" size=15>	
			<datalist id=defaultEmails>
			 <option value="naver.com"></option>
			 <option value="gmail.com"></option>
 			 <option value="hanmail.net"></option>
 			 </datalist>
			</td>
		</tr>
		<tr>
			<td align=center>휴대폰</td>
			<td colspan=3>
			<select name="tel1">
			 <option value="010">010</option>
			 <option value="019">019</option>
 			 <option value="017">017</option>
			 <option value="011">011</option>
			 </select>-
		 	 <input type=text  name=tel2 style="width:50px">-
			 <input type=text  name=tel3 style="width:50px">
			</td>
		</tr>
		<tr >
			<td align=center  >주소</td>
			<td><input type=text name="zipcode" id="zipcode" size=7 readonly>&nbsp;
			<input type=button value=우편번호검색 onclick="checkPost()"><br>
			<input type=text name=addr1 id="addr1" placeholder="주소" size=40 readonly><br>
			<input type=text name=addr2 id="addr2" placeholder="상세주소 입력" size=40><br></td>
		</tr>
		<tr align=center>
			<td colspan=2><input type=button value=회원가입 onclick="checkWriteForm()"> 
			<input type=reset value=다시작성></td>
		</tr>
	</table>
	</form>
<script type="text/javascript" src="../js/member.js?ver=1"></script>
</body>
</html>