/**
 * 
 */
let httpRequest = null;
function startMethod() {
	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = resultProcess;
	httpRequest.open("GET","ajaxExam02.xml",true);
	httpRequest.send(null);
}
function resultProcess(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			let xmlDoc = httpRequest.responseXML;
			var subjectList = xmlDoc.getElementsByTagName("subject");
			console.log(subjectList.length+"개 있음");
			var rd = document.getElementById("resultDisplay");
			var message = "";
			for(i=0;i<subjectList.length;i++){
				let subject = subjectList.item(i);
				let codeNumber = subject.getElementsByTagName("codeNumber").item(0).firstChild.nodeValue;
				let titleName = subject.getElementsByTagName("titleName").item(0).firstChild.nodeValue;
				let roomNumber = subject.getElementsByTagName("roomNumber").item(0).firstChild.nodeValue;
				message += "<tr><td>"+codeNumber+"</td><td>"+titleName+"</td><td>"+roomNumber+"</td></tr>";
			}
			rd.innerHTML = message;
		}
	}
}
