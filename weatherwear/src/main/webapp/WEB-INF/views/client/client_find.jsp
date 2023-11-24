<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String clientId = request.getParameter("clientId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client_login.jsp</title>
<script>

</script>
</head>
<body>
	<%@ include file="./base/header.jsp"%>
	<div class="client_login">
		<h2>아이디/비밀번호 찾기</h2>
		<a href="clientFind.do?keyword=Id">아이디 찾기</a> | 
		<a href="clientFind.do?keyword=Pwd">비밀번호 찾기</a><br><br>
		<c:if test="${ clientId != null }">
			<h3>아이디 : ${ clientId }</h3>
		</c:if>
		<c:if test="${ clientId == null }">
			<c:if test="${ param.keyword == 'Id' or param.keyword == null}">
				<h3>아이디 찾기</h3>
				<form name="findId" action="clientFind.do?keyword=Id" method="post">
					<table>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="clientName" id="clientName" placeholder="이름을 입력해주세요" value="name01">
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="clientEmail" id="clientEmail" placeholder="이메일을 입력해주세요" value="1234@naver.com">
							</td>
						</tr>
					</table>
					<br>
					<input type="submit" value="아이디 찾기">
					<br>
					<br>
				</form>
			</c:if>
			
			
			<c:if test="${ param.keyword == 'Pwd'}">
				<h3>비밀번호 찾기</h3>
				<form name="findId" action="clientFind.do?keyword=Pwd"method="post">
					<table>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="clientName" id="clientName" placeholder="이름을 입력해주세요" value="name01">
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="clientEmail" id="clientEmail" placeholder="이메일을 입력해주세요" value="1234@naver.com">
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="clientId" id="clientId" placeholder="아이디를 입력해주세요" value="client01">
							</td>
						</tr>
					</table>
					<br>
					<input type="submit" id="findPwd" value="비밀번호 찾기">
					<br>
					<br>
				</form>
			</c:if>
		</c:if>
	</div>	
	<%@ include file="./base/footer.jsp" %>
</body>
</html>