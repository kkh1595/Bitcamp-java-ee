<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String gender=request.getParameter("gender");
String email1=request.getParameter("email1");
String email2=request.getParameter("email2");
String tel1=request.getParameter("tel1");
String tel2=request.getParameter("tel2");
String tel3=request.getParameter("tel3");
String zipcode=request.getParameter("zipcode");
String addr1=request.getParameter("addr1");
String addr2=request.getParameter("addr2");
MemberDTO dto = new MemberDTO();
dto.setName(name);
dto.setId(id);
dto.setPwd(pwd);
dto.setGender(gender);
dto.setEmail1(email1);
dto.setEmail2(email2);
dto.setTel1(tel1);
dto.setTel2(tel2);
dto.setTel3(tel3);
dto.setZipcode(zipcode);
dto.setAddr1(addr1);
dto.setAddr2(addr2);
MemberDAO dao = MemberDAO.getInstance();
int su = dao.modifyMember(dto);

%>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("회원 정보 수정 완료");
	location.href="loginForm.jsp";
}
</script>
</html>