<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.imageboard td {
	text-align: center;
}

#currentPaging {
	text-decoration: underline;
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
	<form name="imageboardListForm" method="get" action="/miniProject/imageboard/imageboardDelete.do">
		<c:if test="${list !=null }">
			<table class="imageboard" frame="hsides" rules="rows">
				<tr>
					<th><input type="checkbox" id="checkAllb" onclick="checkAll()"> 번호</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>단가</th>
					<th>개수</th>
					<th>합계</th>
				</tr>
				<c:forEach var="imageboardDTO" items="${list }">
					<tr>
						<td width=100px align=left><input type="checkbox" id="cbx"
							name="cbx" value="${imageboardDTO.seq }">${imageboardDTO.seq }</td>
						<td width=100px><img src="../storage/${imageboardDTO.image1 }" style="width: 100px; cursor: pointer;"
							onclick="location.href='/miniProject/imageboard/imageboardView.do?seq=${imageboardDTO.seq }&pg=${imageboardPaging.currentPage }'">
						<td width=400px >${imageboardDTO.imageName }</td>
						<%-- 이 방법으로도 가능 
				<fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice }"/> --%>

						<td width=100px >${String.format("%,d", imageboardDTO.imagePrice) }
						</td>
						<td width=100px >${String.format("%,d",imageboardDTO.imageQty) }
						</td>
						<td width=100px >${String.format("%,d", imageboardDTO.imagePrice * imageboardDTO.imageQty)}원</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<div style="text-align: center;">${imageboardPaging.pagingHTML}</div>
		<c:if test="${memId eq 'admin' }">
		<div>
			<input type="button" value="선택 삭제" onclick="deleteImageboard()">
		</div>
		</c:if>
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
// 		function checkAll() {
// 			if( $("#checkAllb").is(':checked') ){
// 		        $("input[name=cbx]").prop("checked", true);
// 		      }else{
// 		        $("input[name=cbx]").prop("checked", false);
// 		      }
// 		} 제이쿼리 사용
 			var checkbox = document.querySelectorAll("#cbx");
//			name 속성은 중복될 수 있다. name=cbx 인 변수의 갯수를 가져온다. 
			var checkControl =document.getElementById("checkAllb");
		function checkAll() {
			if(checkControl.checked){
				for(var i=0; i<checkbox.length;i++){
					checkbox[i].checked = true;
				}
			}else {
				for(var i=0; i<checkbox.length;i++){
					checkbox[i].checked = false;
				}
			}
			
		}
// 		function deleteImageboard(){
// 			let checkid="";
// 			let selectbox = document.getElementsByName("cbx");
// 			let chk=false;
// 			let indexid=false;
// 			for(i=0; i<selectbox.length;i++){
// 				if(selectbox[i].cheked){
// 					if(indexid){
// 						userid=userid+'-';
// 					}
// 					userid = userid + selectbox[i].value;
// 				    indexid = true;
// 				}
// 			}
// 		}
		function deleteImageboard(){
		var sw = 0;
		var seq = [];
		checkbox.forEach(o=>{
			if(o.checked) {
				sw = 1;
				seq.push(o.value);
			}
		})
		if(sw == 0) alert("삭제할 항목을 선택하세요.");
		else {
			if(confirm("정말로 삭제하시겠습니까?")) location.href="/miniProject/imageboard/imageboardDelete.do?seq="+seq; //document.imageboardListForm.submit();
			
			else location.href="/miniProject/imageboard/imageboardList.do?pg=1";
			
		}
}
		
	</script>
</body>
</html>