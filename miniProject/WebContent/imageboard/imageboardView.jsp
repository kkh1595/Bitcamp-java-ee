<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<style>
.zoom {
	cursor:pointer;
}

</style>
<img src="../image/zoom.jpg" class=zoom width=30 height=30 onclick="zoomImg()"></img>
<img src="../image/zoom.jpg" class=zoom width=30 height=30 id="zoomImg"></img>
<table border="1" cellspacing="0" cellpadding="3" width="500" style="table-layout:fixed;">
  <tr>
    <td rowspan="5" align="center">
      <img src="../storage/${imageboard.image1 }" width="200" height="120" id=image1>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function zoomImg(){
	let newWindow = window.open("","","width=500 height=500");
	let img = newWindow.document.createElement("img");
	img.setAttribute("src","http://localhost:8080/miniProject/storage/${imageboard.image1}");
	img.setAttribute("width","500");
	img.setAttribute("height","500");
	newWindow.document.body.appendChild(img);
}
$('#zoomImg').click(function(){
	let url = $('#image1').attr('src');
	window.open(url,'','height=500 width=500')
});
</script>
