let oEditors=[];

function smartEditor(){
	console.log("Naver SmartEditor");
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "noContent",
		sSkinURI: "resources/static/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
}

$(document).ready(function(){
	smartEditor();
})

function submitPost(){
	oEditors.getById["noContent"].exec("UPDATE_CONTENTS_FIELD", [])
	let content = document.getElementById("noContent").value
	
	if(content == ''){
		alert("내용을 입력하세요");
		oEditors.getById["noContent"].exec("FOCUS");
		return
	} else {
		console.log("content : " + content);
		$("#content").html(content);
	}
}