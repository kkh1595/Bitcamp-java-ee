<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<table border="1" cellspacing="0" cellpadding="3" width="500" style="table-layout:fixed;">
  <tr>
    <td rowspan="5" align="center">
      <img src="../storage/${imageboard.image1 }" width="200" height="120">
    </td>
  </tr>
  <tr>
    <td width="100"><big><strong>상품명: ${imageboard.imageName }</strong></big></td>
  </tr>
  <tr>
     <td width="100">개당 가격: 
      <fmt:formatNumber value="${imageboard.imagePrice }" pattern="#,###,###원" />
    </td>
  </tr>
  <tr>
    <td width="100">재고수량: 
      <fmt:formatNumber value="${imageboard.imageQty }" pattern="#,###,###" />
    </td>
  </tr>
  <tr>   
    <td width="100">합계: 
      <fmt:formatNumber value="${imageboard.imagePrice * imageboard.imageQty }" pattern="#,###,###원" />
    </td>   
  </tr>
  <tr>
     <td colspan="2" style="text-align: left;">내용: ${imageboard.imageContent }</td>
  </tr>
</table>
<div><input type=button value=목록 onclick="backToList('${pg}')"></div>
<script src="../js/imageboard.js"></script>
