<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<link href="resources/client/order/css/client_order_detail.css" type="text/css" rel="stylesheet" />
<title>사용자_주문내역_상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Style 태그는 head 태그 안에 있어야 합니다.-->

</script>
</head>
<body>
	<%@ include file="../base/header.jsp"%>

	<div class="container">
		<div class="top">
			<div class="image">
				<a>이미지	</a>
			</div>
			<div class="sideText">
				<h1>
					<br>&nbsp;배송정보
				</h1>
				<br>
				<h3>&nbsp;상품명</h3>
				<h3>&nbsp;(옵션 정보) 주문 수량, 색상</h3>
				<h3>&nbsp;상품 금액&nbsp;&nbsp;&nbsp;&nbsp;-----&nbsp;&nbsp;원</h3>
				<h3>&nbsp;배송비&nbsp;&nbsp;&nbsp;&nbsp;-----&nbsp;&nbsp;원</h3>
				<br><input type="button" value="배송조회">
				<input type="button" value="반품요청">
				<input type="button" value="교환요청">
				<input type="button" value="재구매">
				<input type="button" value="리뷰작성">
			</div>
			</div>
			<div class="middle">
			<div class="deili_info">
				<h1>배송지정보</h1>
				<h3>수령인&nbsp;&nbsp;이름</h3>
				<h3>연락처&nbsp;&nbsp;010-0000-0000</h3>
				<h3>배송지&nbsp;&nbsp;우편번호<br>주소<br>상세주소</h3>
				<h3>배송메모&nbsp;&nbsp;-----</h3>
			</div>

			<div class="orderPrice">
				<h1>최초 주문금액&nbsp;&nbsp;---원</h1>
				<h3>상품금액&nbsp;&nbsp;----원</h3>
				<h3>배송비&nbsp;&nbsp;+___원</h3>
				<h3> - 쿠폰할인&nbsp;&nbsp;-___원</h3>
				<h4> - 상품 할인&nbsp;&nbsp;----원</h4>
				<h4> - 배송비 할인&nbsp;&nbsp;----원</h4>
			</div>

			<div class="chargeInfo">
				<h1>결제상세</h1>
				<h3>---포인트 사용&nbsp;&nbsp;----원</h3>
				<h3>카드 간편 결제&nbsp;&nbsp;---원</h3>
				<h3>--카드(카드번호-카드번호-카드번호-카드번호) &nbsp;&nbsp;---원</h3>
			</div>

			<div class="plusPoint">
				<h1>포인트 혜택&nbsp;&nbsp;최대---원</h1>
				<h3>---포인트 사용&nbsp;&nbsp;총---원</h3>
				<h4>기본적립&nbsp;&nbsp;--원</h4>
			</div>
			<input type="button" value="전체 재구매">
</div>
		</div>

	<%@ include file="../base/footer.jsp" %>
</body>
</html>