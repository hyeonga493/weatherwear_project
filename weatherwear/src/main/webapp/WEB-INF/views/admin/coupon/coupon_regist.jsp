<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>쿠폰등록 페이지</title>

<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<script src="resources/admin/js/jquery/jquery.js"></script>
<script src="resources/admin/js/bootstrap/bootstrap.bundle.min.js"></script>

</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
	<!-- <ul> -->
	<ul class="navbar-nav ml-auto ml-md-0">
 		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" aria-haspopup="true"
			aria-expanded="false">
				</div></li> 
	</ul>
		<main>
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		</main>
		<hr><hr><hr><br>
		
		<h2>쿠폰등록&emsp;&emsp;</h2>
		<hr style="border:solid gray; border-radius:1px;">
		<form action="couponRegist.mdo?chClientType=${ coupon.chClientType }" method="POST">
			<div>
				쿠폰이름
				<input type="text" id="coupon_name" name="cpName" style="margin-left:50px;" required>
			</div>
			<hr>
			<div>
				<label>고객유형 제한</label>
				<input type='checkbox' name='chClientType' value='S' id='silverType' style="margin-left:50px;"/>
				<label for='silverType'>silver</label>
				<input type='checkbox' name='chClientType' value='G' id='goldType'/>
				<label for='goldType'>gold</label>
				<input type='checkbox' name='chClientType' value='B' id='blackType'/>
				<label for='blackType'>black</label>
			</div>
			<hr>
			<div>
				<label>할인설정</label>
				&emsp;최대 <input type="text" id="discountCoin" name="cpPrice" style="margin-left:10px;" placeholder="가격을 입력하세요.">&emsp;원 할인</p>
				<span style="color: red; margin-left:120px;">할인금액이 정확하게 입력되었는지 다시 한번 확인해 주세요!</span>
			</div>
			<hr>
			<div>
				<label>최소주문금액</label>
				<input type="text" id="discountCoin" name="minPrice" style="margin-left:10px;" placeholder="가격을 입력하세요.">&emsp;원 이상 구매시 사용 가능</p><br>
			</div>
			<hr>
			<div>
				<label>쿠폰 유효기간
				&emsp;&emsp;&emsp;&emsp;&emsp;특정기간동안 쿠폰 유효기간
 				<input type="datetime-local" name="cpStrEndDate">&emsp;까지
       			<p style="margin-left:180px; margin-top:10px; color:#0000FF">- 유효기간 시작일시는 상품등록일과 동일합니다.</p>
       			</label>
			</div>
			<hr style="border:solid gray; border-radius:1px;">
			<button type="submit" id="couponBtn" class="btn-write" style="margin-left:100px;">쿠폰 등록</button>
			<button type="submit" class="btn-write" style="margin-left:100px;" onClick="location.href='/w2/couponList.mdo'">취소</button>
		</form>

		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>