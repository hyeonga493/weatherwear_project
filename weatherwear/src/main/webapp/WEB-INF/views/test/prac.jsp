<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>prac</title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="resources/client/js/daum_post.js"></script>
	<script src="resources/client/js/client_join.js"></script>
</head>
<body>
	
	<h3>이미지 호출하기</h3>
	<form action="getImage.do" method="post" enctype="multipart/form-data">
		<input type="text" name="cmId" id="cmId" value="client01_01"> 
		<input type="submit" value="getImage.do">
	</form>
	<div id="image">
		<img alt="image" src="${ image.cmDir }${ image.cmName }"><br>
	</div>

	<h3>이미지 업로드하기</h3>
	<!-- 파일 업로드에서는 enctype(인코딩타입)을 multipart/form-data로 반드시 설정 -->
	<form action="uploadImage1.do" method="post" enctype="multipart/form-data">
		파일 선택 : <input type="file" name="file">
		<input type="submit" value="uploadImage1.do">
	</form>
	
	<br><hr><br>
	
	<!-- 파일 두개이상 붙히는거 -->
	<form action="uploadImage2.do" method="post" enctype="multipart/form-data">
		파일 선택 : <input type="file" multiple="multiple" name="files"> 
		<input type="submit" value="uploadImage2.do">
	</form>
	
	<h3>checkId.do</h3>
	<form action="checkId.do" method="post">
		<input type="text" name="clientId" value="client01">client01<br>
		<input type="submit" value="checkId.do">
	</form>
	<br>
	<br>

	<h3>getClient.do</h3>
	<form action="getClient.do" method="post">
		<input type="text" name="clientId" value="client01">client01<br>
		<input type="submit" value="getClient.do">
	</form>
	<br>
	<br>

	<h3>clientLogin.do</h3>
	<form action="clientLogin.do" method="post">
		<input type="text" name="clientId" value="client01">client01<br>
		<input type="text" name="clientPwd" value="123456789">123456789<br>
		<input type="submit" value="clientLogin.do">
	</form>
	<br>
	<br>

	<h3>passwordCheck.do</h3>
	<form action="passwordCheck.do" method="post">
		<input type="hidden" name="clientId" value="${ client.clientId }">client01<br>
		<input type="text" name="clientPwd" value="123456789">123456789<br>
		<input type="submit" value="passwordCheck.do">
	</form>
	<br>
	<br>

	<h3>clientUpdate.do</h3>
	<form name="client_join" action="clientUpdate.do" method="POST"	onsubmit="madecNum()">
		아이디 : <input type="text" name="clientId" id="clientId" required="required"	value="${ client.clientId }"> <br>
		이름 :${ client.clientName } <br>
		닉네임 :${ client.clientNickName } <br>
		전화번호 :
		<input type="text" name="cNum_1" id="cNum_1" required="required" maxlength="3" size="3"	onkeyup="checkL('cNum_1', 'cNum_2')" value="${ client.clientNum.substring(0,3) }"> - 
		<input type="text" name="cNum_2" id="cNum_2" required="required" maxlength="4" size="4" onkeyup="checkL('cNum_2', 'cNum_3')" value="${ client.clientNum.substring(3,7) }"> - 
		<input type="text" name="cNum_3" id="cNum_3" required="required" maxlength="4" size="4" value="${ client.clientNum.substring(7) }">
		<br>
		<input type="hidden" name="clientNum" id="clientNum" required="required"></td>
		이메일 :<input type="text" name="clientEmail" placeholder="weatherwear@naver.com" required="required" value="${ client.clientEmail }">  <br>
		생년월일 :${ client.clientBirth } <br>	
		"마케팅 수신 동의"  <br>
		<input type="radio" id="cEmailCheck_Y" name="clientEmailCheck" value="Y">
		<label for="cEmailCheck_Y">이메일 수신을 동의합니다.</label><br> 
		<input type="radio" id="cEmailCheck_N" name="clientEmailCheck" value="N">
		<label for="cEmailCheck_N">이메일 수신을 동의하지 않습니다.</label><br>
		<input type="submit" value="수정하기">
	</form>
	
	<h3>clientWithdraw.do</h3>
	<form action="clientWithdraw.do" method="post">
		<input type="hidden" name="clientId" value="${ client.clientId }">client01<br>
		<input type="text" name="clientPwd" value="123456789">123456789<br>
		<input type="submit" value="clientWithdraw.do">
	</form>
	<br>
	<br>
</body>
</html>