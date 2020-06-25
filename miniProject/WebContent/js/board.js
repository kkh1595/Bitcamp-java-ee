/**
 * 
 */
function checkBoardWriteForm() {
	if(document.boardWriteForm.subject.value==""){
		alert("제목을 입력해주세요");
		document.boardWriteForm.subject.focus();
	}else if(document.boardWriteForm.content.value==""){
		alert("내용을 입력해주세요");
		document.boardWriteForm.content.focus();
	}else{
		document.boardWriteForm.submit();
	}
}
function checkModify(){
	if(document.boardModifyForm.subject.value==""){
		alert("제목을 입력해주세요");
		document.boardModifyForm.subject.focus();
	}else if(document.boardModifyForm.content.value==""){
		alert("내용을 입력해주세요");
		document.boardModifyForm.content.focus();
	}else{
		document.boardModifyForm.submit();
	}
}
function checkBoard(){
	if(document.getElementById("subject").value=="") {
		alert("제목을 입력해주세요.");
	}
	else if(document.getElementById("content").value=="") {
		alert("내용을 입력해주세요.");
	}
	else {
		document.forms[0].submit();
	}
}