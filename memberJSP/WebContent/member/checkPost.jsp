<%@page import="member.bean.ZipcodeDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String sido=request.getParameter("sido");
String sigungu=request.getParameter("sigungu");
String roadname=request.getParameter("roadname");
System.out.println(sido+sigungu+roadname);
	ZipcodeDTO dto = new ZipcodeDTO();
	List<ZipcodeDTO> list =null;
if(sido!=null && roadname!=null){
	MemberDAO memberDAO = MemberDAO.getInstance();
	list = memberDAO.getZipcodeList(sido,sigungu,roadname);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<form method="post" action="checkPost.jsp">
<table border=2 cellspacing=0 cellpadding=3 width=100%>
<tr align=center>
<th>시도</th>
<td><select name=sido style=width:100px>
<option value="">직접입력</option>
<option value="서울">서울</option>
<option value="인천">인천</option> 
<option value="대전">대전</option>
<option value="대구">대구</option>
<option value="울산">울산</option>
<option value="세종">세종</option>
<option value="광주">광주</option>
<option value="경기">경기</option>
<option value="강원">강원</option>
<option value="전남">전남</option>
<option value="전북">전북</option>
<option value="경남">경남</option>
<option value="경북">경북</option>
<option value="충남">충남</option>
<option value="충북">충북</option>
<option value="부산">부산</option>
<option value="제주">제주</option>
</select></td>
<th>시.군.구</th>
<td><input type=text name=sigungu style=width:200px></td>
</tr>
<tr>
<th>도로명</th>
<td colspan=3><input type=text name=roadname> <input type=submit value=검색></td>
</tr>
<tr>
<th>우편번호</th>
<td colspan=3 align=center>주소</td>
</tr>
<%if(list!=null){
	for(ZipcodeDTO data:list){
	String address=data.getSido()+" "+data.getSigungu()+" "+data.getYubmyundong()+" "+data.getRoadname()+" "+data.getBuildingname();
%><tr >
	<td align=center><%=data.getZipcode()%></td>
	<td colspan=3><a id="addressA" href="#" onclick="checkPostClose('<%=data.getZipcode()%>','<%=address%>')"><%=address%></a></td>
</tr>
	<%}//for%>
<%}//if}%>
</table>
</form>
<script type="text/javascript" src="../js/member.js?ver=2"></script>
</body>
</html>