<%@page import="member.bean.ZipcodeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%     
String id = (String)session.getAttribute("memId");
MemberDAO dao = MemberDAO.getInstance();
MemberDTO memberDTO = new MemberDTO();
memberDTO = dao.getStatus(id);

String name = memberDTO.getName();
System.out.print(name);
String email1 = memberDTO.getEmail1();
String email2 = memberDTO.getEmail2();
String gender = memberDTO.getGender();
String tel1 = memberDTO.getTel1();
String tel2 = memberDTO.getTel2();
String tel3 = memberDTO.getTel3();
String zipcode = memberDTO.getZipcode();
String addr1 = memberDTO.getAddr1();
String addr2 = memberDTO.getAddr2();  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입2</title>
</head>
<body>
	<form name="modifyForm" method="post" action="modify.jsp">
	<table border="2" cellspacing=0 cellpadding=5>
		<tr>
			<td align=center>이름</td>
			<td><input type=text name="name" id="name" placeholder="이름입력" value="<%=name %>" ></td>
		</tr>
		<tr>
			<td align=center>아이디</td>
			<td><input type=text name="id" placeholder="아이디입력" value=<%=id %> readonly>
			</td>
		</tr>
		<tr>
			<td align=center>비밀번호</td>
			<td><input type=password name="pwd" id=pwd></td>
		</tr>
		<tr>
			<td align=center>재확인</td>
			<td><input type=password name="repwd"></td>
		</tr>
		<tr >
			<td align=center>성별</td>
			<td><input type="radio" name="gender" id="gender" value=0 checked>남
			 <input type="radio" name=gender id="gender"  value=1>여</td>
		</tr>
		<tr>
			<td align=center>이메일</td>
			<td><input type=text name="email1" id=email1 value=<%=email1 %>> @
			<input type=text name="email2" id="email2" list=defaultEmails placeholder="직접입력" size=15 value=<%=email2 %>>	
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
			<select  name="tel1" >
			 <option value="010">010</option>
			 <option value="019">019</option>
 			 <option value="017">017</option>
			 <option value="011">011</option>
			 </select>-
			 <%if(tel2!=null && tel3!=null){ %>
		 	 <input type=text  name=tel2 style="width:50px" value=<%="'"+tel2+"'" %>>-
			 <input type=text  name=tel3 style="width:50px" value=<%=tel3 %>>
			 <%} else {%>
			 <input type=text  name=tel2 style="width:50px" value="">-
			 <input type=text  name=tel3 style="width:50px" value="">
			 <%} %>
			</td>
		</tr>
		<tr >
			<td align=center >주소</td>
			<td><input type=text name=zipcode id=zipcode size=7 readonly value=<%=zipcode %>>&nbsp;
			<input type=button value=우편번호검색 onclick="checkPost()"><br>
			<input type=text name=addr1 id=addr1 placeholder="주소" size=40 readonly value=<%="'"+addr1+"'"%>><br>
			<input type=text name=addr2 id=addr2 placeholder="상세주소 입력" size=40 value=<%="'"+addr2+"'"%>><br></td>
		</tr>
		<tr align=center>
			<td colspan=2><input type=button value=회원정보수정 onclick="checkModifyForm()"> 
			<input type=reset value=다시작성></td>
		</tr>
	</table>
	</form>
<script type="text/javascript" src="../js/member.js?ver=1"></script>
<script type="text/javascript">
window.onload=function(){
	document.modifyForm.gender['<%=gender%>'].checked = true;
	document.modifyForm.email1.value='<%=email1%>'
	//document.getElementById('email1').value = 'email1';
	document.modifyForm.tel1.value = '<%=tel1%>'
} 
</script>
</body>
</html>