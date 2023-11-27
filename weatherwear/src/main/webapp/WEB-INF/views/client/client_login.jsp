<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client_login.jsp</title>
</head>
<body>
	<%@ include file="./base/header.jsp"%>
	<div class="client_login">
		<h2>Login</h2>
		
		<!-- 경고창 띄우기 -->
		<c:if test="${ msg != null }">
			<script>
				alert("${ msg }");
			</script>
		</c:if>
		
		<form action="clientLogin.do" method="post">
			<table>
				<tr>
					<th>아이디 : </th>
					<td><input type="text" name="clientId" id="clientId" placeholder="아이디를 입력해주세요" value="client01"></td>
				</tr>
				<tr>
					<th>비밀번호 : </th>
					<td><input type="password" name="clientPwd" id="clientPwd" placeholder="비밀번호를 입력하세요" value="123456789"></td>
				</tr>
			</table><br><br>
			<input type="submit" value="로그인"><br><br>
			<input type="button" value="아이디/비밀번호 찾기" onClick="location.href='clientFind.do'">
			<input type="button" value="회원가입" onClick="location.href='clientJoin.do'">
			<br><br><br>
		</form>
	</div>
	<%@ include file="./base/footer.jsp" %>
</body>
</html>