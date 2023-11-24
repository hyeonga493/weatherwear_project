<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>주문관리 페이지</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/admin/css/managerOrder.css"> -->
<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />

</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
	<div class="container-fluid">
		<h1 class="mt-4"></h1>
	</div>
	</main>
	<script src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>" crossorigin="anonymous"></script>
		<hr><hr><hr><br>
		<div class="select" style="margin-top:50px;">
		<hr>
		<label>조회기간</label> 
		<input type="datetime-local" name="startDate"> ~ 
		<input type="datetime-local" name="endDate"> 
		<input type="submit">
			<form method="get" action="SelectOrderStatusServlet">
				<label for="orderStatusAll"></label> 
				<select id="orderStatusAll" name="orderStatusAll" size="1">
					<option value="선택하세요" selected>선택하세요.</option>
					<option value="주문완료">주문완료</option>
					<option value="상품준비중">상품준비중</option>
					<option value="배송준비중">배송준비중</option>
					<option value="배송보류">배송보류</option>
					<option value="배송대기">배송대기</option>
					<option value="배송중">배송중</option>
					<option value="배송완료">배송완료</option>
					<option value="교환중">교환중</option>
					<option value="환불중">환불중</option>
					<option value="교환완료">교환완료</option>
					<option value="환불완료">환불완료</option>
				</select>
				<input class="btn1" type="button" value="변경사항 저장">
			</form>
		</div>
		
		<div id="table-scroll" class="table-scroll">
		<div class="table-wrap">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>주문 번호</th>
						<th>회원 번호</th>
						<th>주문 날짜</th>
						<th>주문 상태</th>
						<th>주문 상품 및 수량</th>
						<th>총 금액</th>
						<th>적용된 쿠폰</th>
						<th>할인 금액</th>
						<th>결제 수단</th>
						<th>실 결제 금액</th>
						<th>연락처</th>
						
						<!-- <th class="fixed-side">번호</th>
						<th class="fixed-top">주문 번호</th>
						<th class="fixed-top">회원 번호</th>
						<th class="fixed-top">주문 날짜</th>
						<th class="fixed-top">주문 상태</th>
						<th class="fixed-top">주문 상품 및 수량</th>
						<th class="fixed-top">총 금액</th>
						<th class="fixed-top">적용된 쿠폰</th>
						<th class="fixed-top">할인 금액</th>
						<th class="fixed-top">결제 수단</th>
						<th class="fixed-top">실 결제 금액</th>
						<th class="fixed-top">연락처</th> -->
					</tr>
				</thead>

				<tbody>
					<tr>
						<td class="fixed-side">
							<form method="POST">
		      					<label><input type="checkbox" name="checkProduct" value="check">1</label>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>
							<form method="get" action="SelectOrderStatusServlet">
								<label for="orderStatus"></label> <select id="orderStatus"
									name="orderStatus" size="1">
									<option value="">선택하세요.</option>
									<option value="주문완료" selected>주문완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송준비중">배송준비중</option>
									<option value="배송보류">배송보류</option>
									<option value="배송대기">배송대기</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="교환중">교환중</option>
									<option value="환불중">환불중</option>
									<option value="교환완료">교환완료</option>
									<option value="환불완료">환불완료</option>
								</select> <br> <br>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>010-0000-0000</td>
					<tr>
						<td class="fixed-side">
							<form method="POST">
		      					<label><input type="checkbox" name="checkProduct" value="check">2</label>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>
							<form method="get" action="SelectOrderStatusServlet">
								<label for="orderStatus"></label> <select id="orderStatus"
									name="orderStatus" size="1">
									<option value="">선택하세요.</option>
									<option value="주문완료" selected>주문완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송준비중">배송준비중</option>
									<option value="배송보류">배송보류</option>
									<option value="배송대기">배송대기</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="교환중">교환중</option>
									<option value="환불중">환불중</option>
									<option value="교환완료">교환완료</option>
									<option value="환불완료">환불완료</option>
								</select> <br> <br>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>010-0000-0000</td>
					<tr>
						<td class="fixed-side">
							<form method="POST">
		      					<label><input type="checkbox" name="checkProduct" value="check">3</label>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>
							<form method="get" action="SelectOrderStatusServlet">
								<label for="orderStatus"></label> <select id="orderStatus"
									name="orderStatus" size="1">
									<option value="">선택하세요.</option>
									<option value="주문완료" selected>주문완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송준비중">배송준비중</option>
									<option value="배송보류">배송보류</option>
									<option value="배송대기">배송대기</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="교환중">교환중</option>
									<option value="환불중">환불중</option>
									<option value="교환완료">교환완료</option>
									<option value="환불완료">환불완료</option>
								</select> <br> <br>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>010-0000-0000</td>
					</tr>
					<tr>
						<td class="fixed-side">
							<form method="POST">
		      					<label><input type="checkbox" name="checkProduct" value="check">4</label>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>
							<form method="get" action="SelectOrderStatusServlet">
								<label for="orderStatus"></label> 
								<select id="orderStatus" name="orderStatus" size="1">
									<option value="">선택하세요.</option>
									<option value="주문완료" selected>주문완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송준비중">배송준비중</option>
									<option value="배송보류">배송보류</option>
									<option value="배송대기">배송대기</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="교환중">교환중</option>
									<option value="환불중">환불중</option>
									<option value="교환완료">교환완료</option>
									<option value="환불완료">환불완료</option>
								</select> <br> <br>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>010-0000-0000</td>
					</tr>
					<tr>
						<td class="fixed-side">
							<form method="POST">
		      					<label><input type="checkbox" name="checkProduct" value="check">5</label>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>
							<form method="get" action="SelectOrderStatusServlet">
								<label for="orderStatus"></label> 
								<select id="orderStatus" name="orderStatus" size="1">
									<option value="">선택하세요.</option>
									<option value="주문완료" selected>주문완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송준비중">배송준비중</option>
									<option value="배송보류">배송보류</option>
									<option value="배송대기">배송대기</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="교환중">교환중</option>
									<option value="환불중">환불중</option>
									<option value="교환완료">교환완료</option>
									<option value="환불완료">환불완료</option>
								</select> <br> <br>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>010-0000-0000</td>
					</tr>
					<tr>
						<td class="fixed-side">
							<form method="POST">
		      					<label><input type="checkbox" name="checkProduct" value="check">6</label>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>
							<form method="get" action="SelectOrderStatusServlet">
								<label for="orderStatus"></label> 
								<select id="orderStatus" name="orderStatus" size="1">
									<option value="">선택하세요.</option>
									<option value="주문완료" selected>주문완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송준비중">배송준비중</option>
									<option value="배송보류">배송보류</option>
									<option value="배송대기">배송대기</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="교환중">교환중</option>
									<option value="환불중">환불중</option>
									<option value="교환완료">교환완료</option>
									<option value="환불완료">환불완료</option>
								</select> <br> <br>
							</form>
						</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>Text</td>
						<td>010-0000-0000</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>