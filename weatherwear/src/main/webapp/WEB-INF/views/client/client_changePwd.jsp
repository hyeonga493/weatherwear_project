<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<script src="resources/client/js/client_join.js"></script>
<title>mainIndex.jsp</title>
<!-- Style 태그는 head 태그 안에 있어야 합니다.-->
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
		<div class="password_update_info">
			<fieldset id="password_update_info">
				<legend><b>개인 정보 수정</b></legend>
				<form name="password_update" action="clientPassword.do" method="POST">
					<input type="hidden" id="clientId" name="clientId" value="${ client.clientId }">
					<table class="password_update_table">
						<tr>
							<th class="password_update_title">변경할 비밀번호 : </th>
							<td class="password_update_data">
								<input type="password" id="clientPwd" name="clientPwd" minlength="8">
							</td>
						</tr>
						<tr>
							<th class="password_update_title">비밀번호 확인 : </th>
							<td class="password_update_data">
								<input type="password" id="chPwd" name="chPwd" onchange="checkPwd(this)">
								<span id="checkPw"></span>
							</td>
						</tr>
					</table>
					<input type="submit" value="수정하기">
					<input type="button" value="취소하기" onclick="location.href='clientMypage.do'">
					<br><br>
				</form>
			</fieldset>
		</div>	
	</c:if>
<%@ include file="./base/footer.jsp" %>
</body>