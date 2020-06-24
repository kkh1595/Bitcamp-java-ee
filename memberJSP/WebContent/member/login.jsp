<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPwd(pwd);
MemberDAO dao = MemberDAO.getInstance();
String name = dao.getName(dto);
dto = dao.getEmail(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form name="login" action="modifyForm.jsp">
<%if(name == null) {
session.setAttribute("id",id);
response.sendRedirect("loginFail.jsp");
}else {
/*쿠키 생성
Cookie cookie = new Cookie("memName",name); //쿠키생성
cookie.setMaxAge(30*60); //초단위로 저장
response.addCookie(cookie);//클라이언트에게 보내기

Cookie cookie2 = new Cookie("memId",id); 
cookie2.setMaxAge(30*60); //초단위로 저장
response.addCookie(cookie2);//클라이언트에게 보내기
*/
//세션 생성
//HttpSession session = request.getSession();
session.setAttribute("memName", dto.getName());
session.setAttribute("memId", id);
session.setAttribute("memEmail", dto.getEmail1()+"@"+dto.getEmail2());
session.setAttribute("memDTO", dto);

//페이지 이동
response.sendRedirect("loginOk.jsp");
// 쿠키 생성해서 주소창으로 넘겨줄필요 없어졌음
} %><br>
<script type="text/javascript" src="../js/member.js"></script>
</form>
</body>
</html>