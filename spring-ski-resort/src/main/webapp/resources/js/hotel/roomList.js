

if(modisus=="y"){
    alert("수정되었습니다");
}else if(modisus=="n"){
	alert("수정실패");
}


if(susdel=="y"){
    alert("삭제되었습니다");
}else if(susdel=="n"){
	alert("삭제실패");
}

function modiroom(roomnum){
 if(document.getElementById("room"+roomnum).style.display == "none"){

	document.getElementById("room"+roomnum).style.display = "block"
	}else{
	document.getElementById("room"+roomnum).style.display = "none"
}
}

