/**
 * 
 */
function checkWriteForm() {
	//if(document.writeForm.name.vlaue == ""){
	if(document.getElementById("name").value==""){
		alert("이름을 입력하세요");
		document.writeForm.name.focus();
	}else if(document.writeForm.id.value==""){
		alert("아이디를 입력하세요");
		document.writeForm.id.focus();
	}else if(document.writeForm.pwd.value==""){
		alert("비밀번호를 입력하세요");
		document.writeForm.pwd.focus();
	}else if(document.writeForm.pwd.value!=document.writeForm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		document.writeForm.repwd.focus();
	}else if(document.writeForm.dup.value=="unchecked") {
		alert("중복체크를 진행해주세요");
	}else if(document.writeForm.dup.value!=document.writeForm.id.value){
		alert("중복체크를 다시 진행해주세요");
	}else {
		document.writeForm.submit();
	}
}
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
function checkLoginForm() {
	if(document.loginForm.id.value==""){
		alert("아이디 입력해주세요");
		document.loginForm.id.focus();
	}else if(document.loginForm.pwd.value==""){
		alert("비밀번호 입력하세요");
		document.loginForm.pwd.focus();
	}else{
		document.loginForm.submit();
	}
}
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
function checkWriteForm() {
	//if(document.writeForm.name.vlaue == ""){
	if(document.getElementById("name").value==""){
		alert("이름을 입력하세요");
		document.writeForm.name.focus();
	}else if(document.writeForm.id.value==""){
		alert("아이디를 입력하세요");
		document.writeForm.id.focus();
	}else if(document.writeForm.pwd.value==""){
		alert("비밀번호를 입력하세요");
		document.writeForm.pwd.focus();
	}else if(document.writeForm.pwd.value!=document.writeForm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		document.writeForm.repwd.focus();
	}else {
		document.writeForm.submit();
	}
}
function checkLoginForm() {
	if(document.loginForm.id.value==""){
		alert("아이디 입력해주세요");
		document.loginForm.id.focus();
	}else if(document.loginForm.pwd.value==""){
		alert("비밀번호 입력하세요");
		document.loginForm.pwd.focus();
	}else{
		document.loginForm.submit();
	}
}


	
		

		
	
