<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
<%
String name = request.getParameter("name");
String[] birth = request.getParameter("birth").split("/");

int year = Calendar.getInstance().get(Calendar.YEAR);
int age = year - Integer.parseInt(birth[0]) + 1;
%>

<%=name%>님의 생일은 <%=birth[0]%>년 <%=birth[1]%>월 <%=birth[2]%>일 이므로 나이는 <%=age%>살 입니다
 --%>

<c:set var="birth" value="${fn:split(param.birth, '/') }" />

<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate var="year" value="${today }" pattern="yyyy"/>

<c:set var="age" value="${year - birth[0] + 1}" />

${param.name }님의 생일은 ${birth[0]}년 ${birth[1]}월 ${birth[2]}일 이므로 나이는 ${age}살 입니다