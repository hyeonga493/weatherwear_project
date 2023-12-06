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
		<h2>MyPage</h2>
		<div class="client_mypage_cate">&nbsp;&nbsp;&nbsp;
			<a href="clientCart.do">장바구니</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="couponList.do">쿠폰함</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="clientList.do">구매 내역</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="passwordCheck.do">회원 정보 수정하기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="clientQnaMyPageList.do">문의 글 보기</a>
			
			
			
			
			
			<br><br>
			<br><br>
			<br><br>
			<br><br>
			<br><br>
		</div>
	</c:if>
<%@ include file="./base/footer.jsp" %>
</body>