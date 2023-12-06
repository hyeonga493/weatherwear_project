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
		<input type="hidden" name="clientId" value="client02">
		<input type="hidden" name="proId" value="1113">
		<input type="hidden" name="opId" value="1113블랙S">
		<input type="hidden" name="proName" value="패딩 샘플 3">
		<input type="hidden" name="opSize" value="S">
		<input type="hidden" name="opColor" value="블랙">
		<input type="submit" value="장바구니에 데이터 삽입 위해 - client02,1113블랙S">
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