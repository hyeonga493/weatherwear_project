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
		<div class="client_mypage_cate">
			<input type="button" name="cart" value="장바구니" onclick="location.href='clientCart.do'">
			<input type="button" name="see" value="최근 본 상품" onclick="location.href='#'">
			<input type="button" name="couponList" value="쿠폰함" onclick="location.href='couponList.do?clientId=${ client.clientId }'">
			<input type="button" name="paymentHistory" value="구매 내역" onclick="location.href='#'">
			<input type="button" name="wishList" value="찜한 상품" onclick="location.href='#'">
			<input type="button" name="update" value="회원정보 수정하기" onclick="location.href='passwordCheck.do'">
			<input type="button" name="showMyQnaList" value="내가쓴 문의글 목록 보기" onclick="location.href='clientQnaMyPageList.do?clientId=${ client.clientId }'">
			<br><br>
			<br><br>
			<br><br>
			<br><br>
			<br><br>
		</div>
	</c:if>
<%@ include file="./base/footer.jsp" %>
</body>