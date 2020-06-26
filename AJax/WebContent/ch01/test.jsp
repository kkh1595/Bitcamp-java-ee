<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String[] birth = request.getParameter("birth").split("/");

int year = Calendar.getInstance().get(Calendar.YEAR);
int age= year -Integer.parseInt(birth[0])-1;
%>
<%=name %> 님의 생년월일은... <%=birth[0]%>년 <%=birth[1]%>월 <%=birth[2]%>일
<%=age %>살 이시네유 ㅎㅎ
