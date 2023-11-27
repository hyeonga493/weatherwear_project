/**
 * 
 */
 // 아이디 중복 확인
	function idCheck(){
		
		console.log("$ : " + $("#clientId").val());
		
		let clientId = $("#clientId").val();
		if(clientId==''){
			alert("아이디를 입력해주세요");
			return;
		}

		$.ajax({
			url: "/w2/checkId.do?clientId="+clientId,
			type: "POST",
			async: true,
			dataType: "text",
			data: JSON.stringify({clientId : clientId}),
			contentType : "application/json",
			// contentType : "text/plain",
			success: function(result){
				//alert("result : " + result);
				if (result == 1){
					$("#checkId").html("<font color='red' size='1'><b>이미 사용중인 아이디입니다.</b></font>");
					$('#clientId').val('');
				} else {
					$("#checkId").html("<font color='green' size='1'><b><b>사용 가능한 아이디입니다.</b></font>");
				}
			},
			error : function(error){
				alert("Error");
				$('#clientId').val('');
			}
		})	
	}
 
  // 닉네임 중복 확인
	function nickCheck(){
		
		console.log("$ : " + $("#clientNickName").val());
		
		let clientNickName = $("#clientNickName").val();
		if(clientNickName==''){
			alert("아이디를 입력해주세요");
			return;
		}

		$.ajax({
			url: "/w2/checkNick.do?clientNickName="+clientNickName,
			type: "POST",
			async: true,
			dataType: "text",
			data: JSON.stringify({clientNickName : clientNickName}),
			contentType : "application/json",
			// contentType : "text/plain",
			success: function(result){
				//alert("result : " + result);
				if (result == 1){
					$("#checkNickName").html("<font color='red' size='1'><b>이미 사용중인 닉네임입니다.</b></font>");
					$('#clientNickName').val('');
				} else {
					$("#checkNickName").html("<font color='green' size='1'><b><b>사용 가능한 닉네임입니다.</b></font>");
				}
			},
			error : function(error){
				alert("Error");
				$('#clientNickName').val('');
			}
		})	
	}
 
 
 // 비밀번호 일치 확인
function checkPwd(data){
	// this 입력하면 값을 받아주지 않는다.
	console.log(data)
	const clientPwd = document.getElementById("clientPwd");
	// 값이 변하면 안되므로 const로 지정하는 것이 좋다.
	const check = document.getElementById("checkPw");
	
	if(data.value == clientPwd.value){	// pwd와 pwd2에서 onchange로 받아온 값이 같으면
		check.innerHTML = "<font color='green' size='1'><b>비밀번호가 일치합니다.</b></font>";
	}else{	// 값이 다르면
		check.innerHTML="<font color='red' size='1'><b>비밀번호가 일치하지 않습니다.</b></font>";
	}
}
	
// 전화번호 자리 자동 이동
function checkL(id, next) {
	var cNum = document.getElementById(id);
	if (cNum.value.length == cNum.maxLength) {
		document.getElementById(next).focus();
	}
}

// 전화번호 통합 >>> 안되고있음
/**/
function madecNum(){
	var cNum_1 = document.getElementById("cNum_1").value;
	var cNum_2 = document.getElementById("cNum_2").value;
	var cNum_3 = document.getElementById("cNum_3").value;
	var clientNum = cNum_1 + "" + cNum_2 + "" + cNum_3;
	document.getElementById("clientNum").value = clientNum;
}
