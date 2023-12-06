/**
 * 
 */

$(document).ready(function() {
	
	let name = $("input[name='reviewId']").val();
	console.log("name : " + name);
	
	// 모달 버튼 클릭시 보이기
	const viewModal = document.getElementById("viewModal");
	const writeModal = document.getElementById("writeModal");
	
	let setname = 'btn-modal' + name;
	console.log("setname : " + setname);
	
	// 모달 창 안의 닫기 버튼 클릭시 닫기
	const closeView = viewModal.querySelector(".close-view");
	const closeWrite = writeModal.querySelector(".close-write");
	
	closeView.addEventListener("click", e => {
		viewModal.style.display = "none";
	});

	closeWrite.addEventListener("click", e => {
		writeModal.style.display = "none";
	});
	
	// 모달 창 켜진 상태에서 ESC 버튼 클릭 시 모달창 닫기
	window.addEventListener("keyup", e => {
	    if(viewModal.style.display === "flex" && e.key === "Escape") {
	    	viewModal.style.display = "none";
	    }
	    if(writeModal.style.display === "flex" && e.key === "Escape") {
	    	writeModal.style.display = "none";
	    }
	})
	
	// 모달창 밖 클릭시 모달 창 닫기
	viewModal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	    	viewModal.style.display = "none";
	    }
	});

	// 모달창 밖 클릭시 모달 창 닫기
	writeModal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	    	writeModal.style.display = "none";
	    }
	});
});

function showReview(order, odId){
	console.log("opId : " + order);
	console.log("odId : " + odId);
	
	// opId 데이터 분리
	let data = order.split(",");

	let reId = data.find(item => item.includes("reId="));
	if(reId != null){
		reId = reId.split("=")[1];
	}
	let reContent = data.find(item => item.includes("reContent="));
	if(reContent != null){
		reContent = reContent.split("=")[1];
	}
	let reStar = data.find(item => item.includes("reStar="));
	if(reStar != null){
		reStar = reStar.split("=")[1];
	}
	let reImageName = data.find(item => item.includes("reImageName="));
	if(reImageName != null){
		reImageName = reImageName.split("=")[1];
	}
	let reImageDir = data.find(item => item.includes("reImageDir="));
	if(reImageDir != null){
		reImageDir = reImageDir.split("=")[1];
	}
	let reDate = data.find(item => item.includes("reDate="));
	if(reDate != null){
		reDate = reDate.split("=")[1];
	}
	let clientId = data.find(item => item.includes("clientId="));
	if(clientId != null){
		clientId = clientId.split("=")[1];
	}
	let opId = data.find(item => item.includes("opId="));
	if(opId != null){
		opId = opId.split("=")[1];
	}
	let odStatus = data.find(item => item.includes("odStatus="));
	if(odStatus != null){
		odStatus = odStatus.split("=")[1];
	}
	let odPrice = data.find(item => item.includes("odPrice="));
	if(odPrice != null){
		odPrice = odPrice.split("=")[1];
	}
	let proId = data.find(item => item.includes("proId="));
	if(proId != null){
		proId = proId.split("=")[1];
	}
	let proName = data.find(item => item.includes("proName="));
	if(proName != null){
		proName = proName.split("=")[1];
	}
	let opColor = data.find(item => item.includes("opColor="));
	if(opColor != null){
		opColor = opColor.split("=")[1];
	}
	let opSize = data.find(item => item.includes("opSize="));
	if(opSize != null){
		opSize = opSize.split("=")[1];
	}
	let odProCnt = data.find(item => item.includes("odProCnt="));
	if(odProCnt != null){
		odProCnt = odProCnt.split("=")[1];
	}
	const viewModal = document.getElementById("viewModal");
	viewModal.style.display = "flex";
 	
    // span 태그 안에 값 출력
	$("#viorderId").html(odId);
	$("#viproName").html(proName);
	$("#viopColor").html(opColor);
	$("#viopSize").html(opSize);
	$("#virecontent").html(reContent);
	$("#vireviewTitle").html(proName);
	$("#reodProCnt").html(odProCnt);

	
	image = '';
	image += "<img src='";
	image += reImageDir + reImageName;
	image += "' style='width:250px; height:auto;'>";
	
	$("#vireImage").html(image);
	$("#vireDate").html(reDate);

	let starId = '';
	switch(reStar){
	case '0.5': starId = "vistarpoint_1"; break;
	case '1.0': starId = "vistarpoint_2"; break;
	case '1.5': starId = "vistarpoint_3"; break;
	case '2.0': starId = "vistarpoint_4"; break;
	case '2.5': starId = "vistarpoint_5"; break;
	case '3.0': starId = "vistarpoint_6"; break;
	case '3.5': starId = "vistarpoint_7"; break;
	case '4.0': starId = "vistarpoint_8"; break;
	case '4.5': starId = "vistarpoint_9"; break;
	case '5.0': starId = "vistarpoint_10"; break;
	default: starId = "starpoint_10"; break;
	}
   
	//console.log(starId);
 	// radio 버튼 선택
 	$("input[name='reStar'][id=" + starId + "]").prop("checked", true);
}


function writeReview(order, odId){
	console.log("odId : " + odId);
	
	// opId 데이터 분리
	let data = order.split(",");
	           
	let reId = data.find(item => item.includes("reId="));
	if(reId != null){
		reId = reId.split("=")[1];
	}
	let clientId = data.find(item => item.includes("clientId="));
	if(clientId != null){
		clientId = clientId.split("=")[1];
	}
	let opId = data.find(item => item.includes("opId="));
	if(opId != null){
		opId = opId.split("=")[1];
	}
	let odStatus = data.find(item => item.includes("odStatus="));
	if(odStatus != null){
		odStatus = odStatus.split("=")[1];
	}
	let odPrice = data.find(item => item.includes("odPrice="));
	if(odPrice != null){
		odPrice = odPrice.split("=")[1];
	}
	let proId = data.find(item => item.includes("proId="));
	if(proId != null){
		proId = proId.split("=")[1];
	}
	let proName = data.find(item => item.includes("proName="));
	if(proName != null){
		proName = proName.split("=")[1];
	}
	let opColor = data.find(item => item.includes("opColor="));
	if(opColor != null){
		opColor = opColor.split("=")[1];
	}
	let opSize = data.find(item => item.includes("opSize="));
	if(opSize != null){
		opSize = opSize.split("=")[1];
	}
	let odProCnt = data.find(item => item.includes("odProCnt="));
	if(odProCnt != null){
		odProCnt = odProCnt.split("=")[1];
	}
	                 
	const writeModal = document.getElementById("writeModal");
	writeModal.style.display = "flex";
 	// span 태그 안에 값 출력
 	
	$("#wrorderId").html(odId);
	$("#wrproName").html(proName);
	$("#wropColor").html(opColor);
	$("#wropSize").html(opSize);
	$("#wrodProCnt").html(odProCnt);
	$("#wrreviewTitle").html(proName);
	
	$("input[name='clientId']").val(clientId);
	$("input[name='odId']").val(odId);
	$("input[name='opId']").val(opId);
}