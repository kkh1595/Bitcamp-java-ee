<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setAttribute("apple", "사과");

//페이지이동
response.sendRedirect("sendResult.jsp");
%>