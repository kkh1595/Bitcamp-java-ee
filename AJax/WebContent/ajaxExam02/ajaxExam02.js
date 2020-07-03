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
			let trTag = "";
			let tdTag = "";
			
			//버튼을 눌러도 추가되지 않도록하기 위해 테이블을 먼저 지운다.
			let resultDisplay = document.getElementById("resultDisplay");
			while(resultDisplay.hasChildNodes()){ 
				resultDisplay.removeChild(resultDisplay.firstChild); //firstChild -> <tr>
			}
			
			let subjectList = xmlDoc.getElementsByTagName("subject");
			let rd = document.getElementById("resultDisplay");
			let message = "";
			for(i=0;i<subjectList.length;i++){
				let trTag = document.createElement("tr");
				let childList = subjectList[i].childNodes;
				
				for(j=0; j<childList.length; j++){
					if(childList[j].firstChild != null){
						 tdTag = document.createElement("td");
						 tdTag.appendChild(childList[j].firstChild);
						 trTag.appendChild(tdTag);
					}//if
				}//for j
				rd.appendChild(trTag);
//				let codeNumber = subject.getElementsByTagName("codeNumber").item(0).firstChild.nodeValue;
//				let titleName = subject.getElementsByTagName("titleName").item(0).firstChild.nodeValue;
//				let roomNumber = subject.getElementsByTagName("roomNumber").item(0).firstChild.nodeValue;
//				message += "<tr><td>"+codeNumber+"</td><td>"+titleName+"</td><td>"+roomNumber+"</td></tr>";
//				message +=trTag;
			}
		}
	}
}
