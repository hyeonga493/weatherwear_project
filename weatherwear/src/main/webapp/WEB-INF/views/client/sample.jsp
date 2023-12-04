<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
	<h3>Sample이다</h3>

	
	
	<h1>장바구니에 데이터 삽입</h1>
	<form class="product_add_btn" action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client01">
		<input type="hidden" name="proId" value="W2DR10720">
		<input type="hidden" name="opId" value="W2DR10720블랙L">
		<input type="hidden" name="caCnt" value="5">
		<!-- <input type="hidden" id="goToCart" name="goToCart"value=YesOrNo> --><!-- 장바구니 이동 안내 선택에 따라 -->
		<input type="submit" value="장바구니에 데이터 삽입 위해- client01,W2DR10720블랙L">
	</form>				
	<form class="product_add_btn" action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client02">
		<input type="hidden" name="proId" value="W2DR10720">
		<input type="hidden" name="opId" value="W2DR10720아이보리L">
		<input type="hidden" name="caCnt" value="1">
		<input type="submit" value="장바구니에 데이터 삽입 위해 - client02,W2DR10720아이보리L">
	</form>				
	<form class="product_add_btn" action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client01">
		<input type="hidden" name="proId" value="W2DR64903">
		<input type="hidden" name="opId" value="W2DR64903블랙S">
		<input type="hidden" name="caCnt" value="3">
		<input type="submit" value="장바구니에 데이터 삽입 위해 - client01,W2DR64903블랙S">
	</form>				
	<form action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client02">
		<input type="hidden" name="proId" value="W2DR85026">
		<input type="hidden" name="opId" value="W2DR85026아이보리M">
		<input type="hidden" name="caCnt" value="1">
		<input type="submit" value="장바구니에 데이터 삽입 위해 - client02,W2DR85026아이보리M">
	</form>				
	<br><br><br><br>
	    <p>주문 번호: ${param.odid}</p>
    <p>고객 ID: ${param.clientId}</p>
    <p>배송지 ID: ${param.addId}</p>
    <p>사용 포인트: ${param.usedpoint}</p>
    <p>획득 포인트: ${param.plusPoint}</p>
    <p>쿠폰 ID: ${param.cpId}</p>
    <p>상품 옵션 ID 목록: ${param.opIdList}</p>
    <p>주문 상태: ${param.odStatus}</p>
    <p>장바구니 ID 목록: ${param.caIdList}</p>
    <p>주문 가격: ${param.odPrice}</p>
    <p>주문 상품 개수: ${param.caCnt}</p>
	
	
	
</body>
</html>