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
		
		<h2>혜택등록&emsp;&emsp;</h2>
		<hr style="border:solid gray; border-radius:1px;">
		<form action="login.jsp" name="joinform" method="POST">
			<div>
				혜택이름<span style="color: red;">*</span>
				<input type="text" id="coupon_name" name="coupon_name" style="margin-left:50px;" required>
			</div>
			<hr>
				<label>타켓팅 대상<span style="color: red;">*</span></label>
				
				<input type='radio' name='radio_targeting' value='allClient' id='allClient' style="margin-left:50px;"/>
				<label for='allClient'>전체고객</label>
				<input type='radio' name='radio_targeting' value='firstClient' id='firstClient'/>
				<label for='firstClient'>첫구매고객</label>
				<input type='radio' name='radio_targeting' value='reClient' id='reClient'/>
				<label for='reClient'>재구매고객</label>
				<input type='radio' name='radio_targeting' value='getAlarm' id='getAlarm'/>
				<label for='getAlarm'>알림받기</label>
				<input type='radio' name='radio_targeting' value='targeting' id='targeting'/>
				<label for='targeting'>타겟팅</label>
			<hr>
			<div>
				<p>타켓팅 목적&emsp;&emsp;&emsp;&emsp;스토어에 방문하는 고객에게 혜택 제공하기</p><br>
				<p style="margin-left:150px; color:#0000FF">구매 또는 알림받기 여부와 상관없이 스토어를 방문하는 모든 고객에게 혜택을 제공할 수 있습니다.</p>
				<p style="margin-left:150px; color:#0000FF">쿠폰발행번호별로 회원ID 당 한번만 다운 받을 수 있습니다.</p>
			</div>
			<hr>
			<div>
				<label>고객유형 제한</label>
				<input type='radio' name='radio_clientType' value='defaultType' id='defaultType' style="margin-left:50px;"/>
				<label for='defaultType'>제한없음(기본)</label>
				<input type='radio' name='radio_clientType' value='memberType' id='memberType'/>
				<label for='memberType'>네이버 플러스멤버십으로 제한</label>
			</div>
			<hr>
			<div>
				<label>혜택 종류<span style="color: red;">*</span></label>
				<input type='radio' name='radio_BenefitType' value='couponType' id='couponType' style="margin-left:75px;"/>
				<label for='couponType'>쿠폰</label>
				<input type='radio' name='radio_BenefitType' value='pointType' id='pointType'/>
				<label for='pointType'>포인트 적립</label>
			</div>
			<hr>	
			<div>
				<p>쿠폰종류<span style="color: red;">*</span>&emsp;&emsp;&emsp;&emsp;&emsp;스토어에 방문하는 고객에게 혜택 제공하기</p><br>
				<p style="margin-left:150px;">상품단위 할인
					<input type='radio' name='radio_doubleDiscountYN' value='doubleDiscount' id='doubleDiscount' style="margin-left:30px;"/>
					<label for='doubleDiscount'>상품중복 할인</label>
				</p>
				<p style="margin-left:150px;">스토어단위 할인
					<input type='radio' name='radio_storeDiscount' value='radio_storeDiscount' id='radio_storeDiscount' style="margin-left:30px;"/>
					<label for='radio_storeDiscount'>스토어 장바구니 할인</label>
					<input type='radio' name='radio_storeDiscount' value='deliveryDiscount' id='deliveryDiscount' style="margin-left:10px;"/>
					<label for='deliveryDiscount'>배송비 할인</label>
					<p style="margin-left:150px; color:#0000FF">즉시할인과 중복으로 사용할 수 있는 쿠폰입니다.</p>
				</p>
			</div>
			<hr>
			<div>
				<form method="post" id="discountForm">
					<label>할인설정<span style="color: red;">*</span></label>
					<select name="discount" id="discount" style="margin-left:50px;">
						<option value="10">10%</option>
						<option value="20">20%</option>
						<option value="30">30%</option>
						<p>
					</select>
					&emsp;최대 <input type="text" id="discountCoin" name="discountCoin" style="margin-left:10px;" placeholder="가격을 입력하세요.">&emsp;원 할인</p>
					<span style="color: red; margin-left:120px;">할인율/할인금액이 정확하게 입력되었는지 다시 한번 확인해 주세요!</span>
				</form>
			</div>
			<hr>
			<div>
				<label>최소주문금액</label>
				<input type="text" id="discountCoin" name="discountCoin" style="margin-left:10px;" placeholder="가격을 입력하세요.">&emsp;원 이상 구매시 사용 가능</p><br>
				<p style="margin-left:110px; color:#0000FF">- 삼품중복할인과 배송비 할인 쿠폰의 최소주문금액은 판매가 기준으로 사용됩니다.</p>
				<p style="margin-left:110px; color:#0000FF">(예시 : 최소주문금액 1,000원 / 100원 상품중복할인 쿠폰의 경우,<br>
				판매가 1,000원 / 즉시할인가 500원인 상품 -> 사용가능 / 400원에 결제<br>
				즉, 판매가 1,000원 이상이면 즉시할인가에 상관없이 사용가능)</p>
			</div>
			<hr>
			<!-- 혜택기간* -->
			<div>
				<label>혜택기간<span style="color: red;">*</span></label>
       			<input type="datetime-local" name="startDate" style="margin-left:30px;"> ~
 				<input type="datetime-local" name="endDate">
       			<input type="submit">
       			<p style="margin-left:100px; margin-top:10px; color:#0000FF">- 설정된 기간 동안 다운로드 가능한 쿠폰이 노출됩니다.</p>
       			<p style="margin-left:100px; color:#0000FF">- 종료일시는 시작일시로부터 최대 1년까지 설정할 수 있습니다.</p>
			</div>
			<hr>
			<!-- 쿠폰 유효기간* -->
			<div>
				<label>쿠폰 유효기간<span style="color: red;">*</span></label>
				<input type='radio' name='radio_couponDate' value='fromDate1' id='fromDate1' style="margin-left:50px;"/>
				<label for='fromDate1'>기간으로 설정</label>
				<input type='radio' name='radio_couponDate' value='fromDate2' id='fromDate2'/>
				<label for='fromDate2'>발급일 기준으로 설정</label><br>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;특정기간동안 쿠폰 유효
				<input type="datetime-local" name="startDate" style="margin-left:30px;"> ~
 				<input type="datetime-local" name="endDate">
       			<input type="submit">
       			<p style="margin-left:140px; margin-top:10px; color:#0000FF">- 유효기간 시작일시는 혜택기간 시작일시와 동일하게 자동 입력됩니다.</p>
			</div>
			<hr style="border:solid gray; border-radius:1px;">
		</form>

		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>