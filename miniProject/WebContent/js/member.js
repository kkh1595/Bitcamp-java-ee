/**
 * 
 */
$('#checkWriteForm').click(function(){
	$('#divName').empty();
	$('#divId').empty();
	$('#divPwd').empty();
	$('#divRepwd').empty();
	if(document.writeForm.name.value==""){
		$('#divName').text('이름을 입력하세요').css('color','red').css('font-size','8pt').css('font-weight','bold');
		$('#name').focus();
	}else if(document.writeForm.id.value==""){
		$('#divId').text('아이디를 입력하세요').css('color','red').css('font-size','8pt').css('font-weight','bold');
		$('#writeId').focus();
	}else if(document.writeForm.pwd.value==""){
		$('#divPwd').text('비밀번호를 입력하세요').css('color','red').css('font-size','8pt').css('font-weight','bold');
		$('#WritePwd').focus();
	}else if($('#WritePwd').val()!=$('#repwd').val()){
		$('#divRepwd').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','8pt').css('font-weight','bold');
		$('#repwd').focus();
	}else if($('#check').val()!=$('#writeId').val()){
		$('#divId').text('중복체크는 필수입니다').css('color','red').css('font-size','8pt').css('font-weight','bold');
	}else {
		$('form[name=writeForm]').submit();
	}
});
function checkModifyForm() { 
	//if(document.writeForm.name.vlaue == ""){
	if(document.getElementById("name").value==""){
		alert("이름을 입력하세요");
		document.modifyForm.name.focus();
	}else if(document.modifyForm.pwd.value==""){
		alert("비밀번호를 입력하세요");
		document.modifyForm.pwd.focus();
	}else if(document.modifyForm.pwd.value!=document.modifyForm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		document.modifyForm.repwd.focus();
	}else {
		document.modifyForm.submit();
	}
}
//==========제이쿼리 이용======================
$('#checkLoginForm').click(function(){
	$('#id').on('change keyup paste',function(){
	$('#loginCheck').empty();
	});
	$('#pwd').on('change keyup paste',function(){
		$('#loginCheck').empty();
	});
	if(document.loginForm.id.value==""){
		$('#loginCheck').text('아이디를 입력하세요').css('color','red').css('font-size','8pt');
		document.loginForm.id.focus();
	}else if(document.loginForm.pwd.value==""){
		$('#loginCheck').text('비밀번호를 입력하세요').css('color','red').css('font-size','8pt');
		document.loginForm.pwd.focus();
	}else{
		document.loginForm.submit();
	}
});
//==============onclick 이용===========
//function checkLoginForm() {
//	if(document.loginForm.id.value==""){
//		$('#loginCheck').text('아이디를 입력하세요').css("color","red").css('font-weight','8pt');
//		document.loginForm.id.focus();
//	}else if(document.loginForm.pwd.value==""){
//		$('#loginCheck').text('비밀번호를 입력하세요').css("color","red").css("font-weight",'8pt');
//		document.loginForm.pwd.focus();
//	}else{
//		document.loginForm.submit();
//	}
//}
function checkId() {
	let id = document.writeForm.id.value;
	let name = document.writeForm.name.value;
	if(id==""){
		alert("아이디를 입력해주세요");
	}else 
		window.open("/miniProject/member/checkId.do?id="+id,"","width=300 height=100 location")
}
function checkIdClose(id) {
	opener.writeForm.check.value = id
	opener.writeForm.id.value = id
	window.close()
	opener.writeForm.pwd.focus()
}
function checkPost(){
	window.open("/miniProject/member/checkPost.do","","width=500 height=500 scrollbars=yes")
}
function checkPostClose(zipcode,address){
	opener.document.forms[0].zipcode.value=zipcode;
	opener.document.forms[0].addr1.value=address;
	window.close()
	opener.document.forms[0].addr2.focus()
}



	
		

		
	
