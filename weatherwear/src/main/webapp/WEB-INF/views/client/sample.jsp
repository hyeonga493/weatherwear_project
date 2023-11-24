<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>Sample이다</h3>
	<script type="text/javascript">
	<!--장바구니 이동 선택에 따라 -> 주말에 다시 생각하기!!!!!>-->
	<!--const YesOrNo = document.getElementById('goToCart').val();
	$(document).ready(function() { // form - input - goToCart로 값 전달 
		$(".product_add_btn").on("click",function(){
			 if (!confirm("장바구니로 이동하시겠습니까?")) {
				 	const YesOrNo = "No";
		        } else {
		        	const YesOrNo = "Yes";
		        }
		});
	});-->
	</script>
	
	<h1>장바구니에 데이터 삽입</h1>
	<form class="product_add_btn" action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client01">
		<input type="hidden" name="proId" value="1111">
		<input type="hidden" name="opId" value="1111블랙M">
		<input type="hidden" name="proName" value="패딩 샘플 1">
		<input type="hidden" name="opSize" value="M">
		<input type="hidden" name="opColor" value="블랙">
		<!-- <input type="hidden" id="goToCart" name="goToCart"value=YesOrNo> --><!-- 장바구니 이동 안내 선택에 따라 -->
		<input type="submit" value="장바구니에 데이터 삽입 위해- client01,1111블랙M">
	</form>				
	<form class="product_add_btn" action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client02">
		<input type="hidden" name="proId" value="1111">
		<input type="hidden" name="opId" value="1111블랙S">
		<input type="hidden" name="proName" value="패딩 샘플 1">
		<input type="hidden" name="opSize" value="S">
		<input type="hidden" name="opColor" value="블랙">
		<input type="submit" value="장바구니에 데이터 삽입 위해 - client02,1111블랙S">
	</form>				
	<form class="product_add_btn" action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client01">
		<input type="hidden" name="proId" value="1111">
		<input type="hidden" name="opId" value="1111블랙S">
		<input type="hidden" name="proName" value="패딩 샘플 1">
		<input type="hidden" name="opSize" value="S">
		<input type="hidden" name="opColor" value="블랙">
		<input type="submit" value="장바구니에 데이터 삽입 위해 - client01,1111블랙S">
	</form>				
	<form action="insert.do" method="post">
		<input type="hidden" name="clientId" value="client01">
		<input type="hidden" name="proId" value="1113">
		<input type="hidden" name="opId" value="1113블랙S">
		<input type="hidden" name="proName" value="패딩 샘플 3">
		<input type="hidden" name="opSize" value="S">
		<input type="hidden" name="opColor" value="블랙">
		<input type="submit" value="장바구니에 데이터 삽입 위해 - client01,1113블랙S">
	</form>				
	<br><br><br><br>
	<h1>주문 내역으로 이동(주문하기 페이지 코딩 전)</h1>
	<form action="" method="">
		<input>
	</form>
	
	
</body>
</html>