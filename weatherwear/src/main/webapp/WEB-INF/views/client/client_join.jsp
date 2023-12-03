<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>client_login.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="resources/client/js/client_join.js"></script>
</head>
<body> 
	<%@ include file="./base/header.jsp"%>
	<div class="client_join">
		<h2>JoinUs</h2>
		
		<!-- 경고창 띄우기 -->
		<c:if test="${ msg != null }">
			<script>
				alert("${ msg }");
			</script>
		</c:if>
		<sub><font color="red"> * : 필수항목입니다.</font> </sub>
		<form name="client_join" action="clientJoin.do" method="POST" onsubmit="madecNum()">
			<input type="hidden" name="gradeId" value="S">
			<input type="hidden" name="clientPoint" value="2000">
			<table class="client_join_table">
				<tr>
					<th class="client_join_title"><font color="red">*</font>아이디 : </th>
					<td class="client_join_data">
						<input type="text" name="clientId" id="clientId" required="required" placeholder="아이디를 입력해주세요" value="admin" onchange="idCheck()">
						<span id="checkId"></span>
					</td>
				</tr>
				<tr>
					<th class="client_join_title"><font color="red">*</font>비밀번호 : </th>
					<td class="client_join_data">
						<input type="password" id="clientPwd" name="clientPwd" required="required" minlength="8" placeholder="영문/숫자 8자리이상">
					</td>
				</tr>
				<tr>
					<th class="client_join_title"><font color="red">*</font>비밀번호 확인 : </th>
					<td class="client_join_data">
						<input type="password" id="chPwd" name="chPwd" onchange="checkPwd(this)" required="required">
						<span id="checkPw"></span>
					</td>
				</tr>
				<tr>
					<th class="client_join_title"><font color="red">*</font>이름 :  </th>
					<td class="client_join_data">
						<input type="text" name="clientName" required="required" placeholder="홍길동">
					</td>
				</tr>
				<tr>
					<th class="client_join_title"><font color="red">*</font>전화번호 : </th>
					<td class="client_join_data">
						<input type="text" name="cNum_1" id="cNum_1" required="required" placeholder="010" maxlength="3" size="3" onkeyup="checkL('cNum_1', 'cNum_2')"> - 
						<input type="text" name="cNum_2" id="cNum_2" required="required" maxlength="4" size="4" onkeyup="checkL('cNum_2', 'cNum_3')"> - 
						<input type="text" name="cNum_3" id="cNum_3" required="required" maxlength="4" size="4">
						<br><input type="hidden" name="clientNum" id="clientNum" required="required">
					</td>
				</tr>
				<tr>
					<th class="client_join_title"><font color="red">*</font>이메일 : </th>
					<td class="client_join_data">
						<input type="text" id="clientEmail" name="clientEmail" placeholder="weatherwear@naver.com" required="required">
					</td>
				</tr>
				<tr>
					<th class="client_join_title"><font color="red">*</font>생년월일 : </th>
					<td class="client_join_data"><input type="date" name="clientBirth" required="required"></td>
				</tr>
				<tr>
					<th class="client_join_title"><font color="red">*</font>닉네임 : </th>
					<td class="client_join_data">
						<input type="text" id="clientNickName" name="clientNickName" placeholder="닉네임을 입력하세요" required="required" onchange="nickCheck()">
						<span id="checkNickName"></span>
					</td>
				</tr>
				<tr>
					<th class="client_join_title">추천인 아이디 : </th>
					<td class="client_join_data">
						<input type="text" name="clientRecId" placeholder="추천인 아이디">
					</td>
				</tr>
			</table>
			<div class="client_join_mkt">
				<p class="agree"></p>
				<span id="mkt_agree">
					"마케팅 수신 동의"
					<span class="agree4">(선택)</span>
				</span>
				<div class="">
					<input type="radio" id="cEmailCheck_Y" name="clientEmailCheck" value="Y"><label for="cEmailCheck_Y">이메일 수신을 동의합니다.</label><br>
					<input type="radio" id="cEmailCheck_N" name="clientEmailCheck" value="N"><label for="cEmailCheck_N">이메일 수신을 동의하지 않습니다.</label>
					<p>
						※ 본 동의 사항은 선택사항으로 거부 할 수 있으며, 거부하시더라도 서비스 이용에 제한은 없습니다.<br>
						단, 이벤트 정보, 신제품 출시 등 맞춤형 서비스를 제공 받으실 수 없습니다.
					 </p>
				</div>
			</div>
			
			<input type="submit" value="회원가입">
			
			
			<br><br>
		</form>
	</div>
	
	
	<%@ include file="./base/footer.jsp" %>
</body>
</html>