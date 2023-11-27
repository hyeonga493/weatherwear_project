<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<title>mainIndex.jsp</title>
<!-- Style 태그는 head 태그 안에 있어야 합니다.-->
<script type="text/javascript">
//전화번호 통합 >>> 안되고있음
/**/
function madecNum(){
	var cNum_1 = document.getElementById("cNum_1").value;
	var cNum_2 = document.getElementById("cNum_2").value;
	var cNum_3 = document.getElementById("cNum_3").value;
	var clientNum = cNum_1 + "" + cNum_2 + "" + cNum_3;
	document.getElementById("clientNum").value = clientNum;
}
</script>
</head>
<body>
	<c:if test="${client == null}">
		<script>
			alert("잘못된 접근입니다. 다시 시도해주세요");
			location.href="/w2/clientMain.do";
		</script>
	</c:if>

	<%@ include file="./base/header.jsp"%>
	
	<c:if test="${client != null}">
		<h2>회원 정보 수정</h2>
		<div class="client_mypage_info">
			<fieldset id="client_mypage_info">
				<legend><b>개인 정보 수정</b></legend>
				<form name="client_join" action="clientUpdate.do" method="POST" onsubmit="madecNum()">
					<table class="client_update_table">
						<tr>
							<th class="client_update_title">아이디 : </th>
							<td class="client_update_data">
								${ client.clientId }
							</td>
						</tr>
						<tr>
							<th class="client_update_title">이름 :  </th>
							<td class="client_update_data">
								${ client.clientName }
							</td>
						</tr>
						<tr>
							<th class="client_update_title">닉네임 : </th>
							<td class="client_update_data">${ client.clientNickName }</td>
						</tr>
						<tr>
							<th class="client_update_title">전화번호 : </th>
							<td class="client_update_data">
								<input type="text" name="cNum_1" id="cNum_1" required="required" maxlength="3" size="3" onkeyup="checkL('cNum_1', 'cNum_2')" value="${ client.clientNum.substring(0,3) }"> - 
								<input type="text" name="cNum_2" id="cNum_2" required="required" maxlength="4" size="4" onkeyup="checkL('cNum_2', 'cNum_3')" value="${ client.clientNum.substring(3,7) }"> - 
								<input type="text" name="cNum_3" id="cNum_3" required="required" maxlength="4" size="4" value="${ client.clientNum.substring(7) }">
								<br><input type="hidden" name="clientNum" id="clientNum" required="required">
							</td>
						</tr>
						<tr>
							<th class="client_update_title">이메일 : </th>
							<td class="client_update_data">
								<input type="text" name="clientEmail" placeholder="weatherwear@naver.com" required="required" value="${ client.clientEmail }">
							</td>
						</tr>
						<tr>
							<th class="client_update_title">생년월일 : </th>
							<td class="client_update_data"><input type="date" name="clientBirth" required="required" value="${ client.clientBirth }"></td>
						</tr>
					</table>
					<div class="client_update_mkt">
						<p class="agree"></p>
						<span id="mkt_agree">
							"마케팅 수신 동의"
							<span class="agree4">(선택)</span>
						</span>
						<div class="">
							<font color="red">${ client.clientEmailCheck }</font>
							<c:if test="${ client.clientEmailCheck == Y }">
								<input type="radio" id="cEmailCheck_Y" name="clientEmailCheck" value="Y" checked="checked"><label for="cEmailCheck_Y">이메일 수신을 동의합니다.</label><br>
								<input type="radio" id="cEmailCheck_N" name="clientEmailCheck" value="N"><label for="cEmailCheck_N">이메일 수신을 동의하지 않습니다.</label>
							</c:if>
							<c:if test="${ client.clientEmailCheck == N }">
								<input type="radio" id="cEmailCheck_Y" name="clientEmailCheck" value="Y"><label for="cEmailCheck_Y">이메일 수신을 동의합니다.</label><br>
								<input type="radio" id="cEmailCheck_N" name="clientEmailCheck" value="N" checked="checked"><label for="cEmailCheck_N">이메일 수신을 동의하지 않습니다.</label>
							</c:if>
														<p>
								※ 본 동의 사항은 선택사항으로 거부 할 수 있으며, 거부하시더라도 서비스 이용에 제한은 없습니다.<br>
								단, 이벤트 정보, 신제품 출시 등 맞춤형 서비스를 제공 받으실 수 없습니다.
							 </p>
						</div>
					</div>
					
					
					<input type="button" value="비밀번호 변경하기" onclick="location.href='clientPassword.do'">
					<input type="submit" value="수정하기">
					<input type="button" value="취소하기" onclick="location.href='clientMypage.do'">
					<br><br>
				</form>
			</fieldset>
		</div>	
	</c:if>
<%@ include file="./base/footer.jsp" %>
</body>