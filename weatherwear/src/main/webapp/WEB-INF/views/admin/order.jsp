<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>주문관리 페이지</title>
<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css"/>
</head>
<body class="sb-nav-fixed">

	<%@ include file="./base/header.jsp"%>
	<div>
	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>
	
		<!-- Navbar-->
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<hr>
		<hr>
		<hr>
		<br>
	<div class="select" style="margin-top: 50px;">
		<hr>
		<label>조회기간</label>
		<form action="/w2/adminOrder.mdo" method="post">
			<input type="datetime-local" name="beginDate">
			 ~ <input type="datetime-local" name="endDate"> 
			<input type="submit">
		</form>
		
		
		<form name="form_orderStatus_all" method="get">
			<label for="orderStatusAll"></label> <select id="orderStatusAll"
				name="orderStatusAll" size="1">
				<option selected>선택하세요.</option>
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
			</select> <input class="btn1" type="button" value="변경사항 저장"
				onClick="updateOrderStatus('${AdminOrderDAO.odid}','s_orderStatus${i.index }')">
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

					</tr>
				</thead>

				<tbody>
					<c:forEach var="AdminOrderDAO" items="${getAdminOrderList}"
						varStatus="i">
						<tr>
							<td class="fixed-side">
								<form method="POST">
									<label><input type="checkbox" name="checkProduct"
										value="check">${i.count}</label>
								</form>
							</td>
							<td>${AdminOrderDAO.odid}</td>
							<td>${AdminOrderDAO.clientId}</td>
							<td>${AdminOrderDAO.odDate}</td>
							<td>
								<form method="get">
									<label for="orderStatus"></label> <select
										id="s_orderStatus${i.index }" name="s_orderStatus${i.index }"
										size="1">
										<c:choose>
											<c:when test="${AdminOrderDAO.odStatus=='주문완료'}">
												<option value="주문완료" selected>주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중'">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='상품준비중'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중" selected>상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='배송준비중'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중" selected>배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='배송보류'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류" selected>배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='배송대기'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기" selected>배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='배송중'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중" selected>배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='배송완료'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료" selected>배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='교환중'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중" selected>교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='환불중'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중" selected>환불중</option>
												<option value="교환완료">교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='교환완료'}">
												<option value="주문완료">주문완료</option>
												<option value="상품준비중">상품준비중</option>
												<option value="배송준비중">배송준비중</option>
												<option value="배송보류">배송보류</option>
												<option value="배송대기">배송대기</option>
												<option value="배송중">배송중</option>
												<option value="배송완료">배송완료</option>
												<option value="교환중">교환중</option>
												<option value="환불중">환불중</option>
												<option value="교환완료" selected>교환완료</option>
												<option value="환불완료">환불완료</option>
											</c:when>
											<c:when test="${AdminOrderDAO.odStatus=='환불완료'}">
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
												<option value="환불완료" selected>환불완료</option>
											</c:when>
										</c:choose>


									</select> <br> <br>
								</form>
							</td>
							<td>${AdminOrderDAO.opIdList}</td>
							<td>${AdminOrderDAO.odPrice}</td>
							<td>적용된 쿠폰</td>
							<td>할인금액</td>
							<td>결제수단</td>
							<td>실결제금액</td>
							<td>${AdminOrderDAO.clientNum}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="./base/footer.jsp"%>
	</div>
</body>
</html>