let oEditors=[];

function smartEditor(){
	console.log("Naver SmartEditor");
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "qnaAnswer",
		sSkinURI: "resources/static/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
}

$(document).ready(function(){
	smartEditor();
})

function submitPost(){
	oEditors.getById["qnaAnswer"].exec("UPDATE_CONTENTS_FIELD", [])
	let content = document.getElementById("qnaAnswer").value
	
	if(content == ''){
		alert("내용을 입력하세요");
		oEditors.getById["qnaAnswer"].exec("FOCUS");
		return
	} else {
		console.log("content : " + content);
		$("#content").html(content);
	}
}