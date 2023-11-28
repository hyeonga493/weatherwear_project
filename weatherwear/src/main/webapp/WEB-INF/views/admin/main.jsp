<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>w2 메인페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css"/>
 
<!-- chart js -->
<script type="text/javascript"
	src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js" '/>"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="<c:url value='https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" '/>"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="<c:url value='https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" '/>"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var lang_kor = {
		"emptyTable" : "데이터가 없습니다.",
		"info" : "_START_ - _END_ (총 _TOTAL_ 건)",
		"infoEmpty" : "0건",
		"infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
		"lengthMenu" : "_MENU_ 개씩 보기",
		"search" : "빠른 검색 : ",
		"zeroRecords" : "검색된 데이터가 없습니다.",
		"paginate" : {
			"first" : "첫 페이지",
			"last" : "마지막 페이지",
			"next" : "다음",
			"previous" : "이전"
		}
	};
	$(document).ready(function() {
		$('#dataTable1').DataTable({
			order : [ [ 0, 'desc' ] ],
			ordering : true,
			language : lang_kor
		});
	});
</script>
</head>
<body class="sb-nav-fixed">
	<c:if test="${client == null}">
		<script>
			alert("잘못된 접근입니다. 다시 시도해주세요");
			location.href="/w2/login.mdo";
		</script>
	</c:if>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

		<!-- 전체화면 버튼 -->
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar-->
		<!-- <ul> -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				</div></li>
		</ul>
			<main>
			<div class="container-fluid">
				<h1 class="mt-4"></h1> 
				<hr>
				<div class="card-body">
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header"
									onClick="location.href='statistics_list.smdo?store=${storename}'"
									style="cursor: pointer">
									<i class="fas fa-chart-area mr-1"></i><b> 최근 12개월 매출</b>
								</div>
								<div class="card-body">
									<c:forEach var="storeMonthly" items="${storeMonthly}"
										varStatus="status">
										<input type="hidden" id="storeMonthly${status.index }"
											value="${storeMonthly}" />
									</c:forEach>
									<c:forEach var="storeMonthlySales"
										items="${storeMonthlySales }" varStatus="status">
										<input type="hidden" id="storeMonthlySales${status.index }"
											value="${storeMonthlySales }" />
									</c:forEach>
									<canvas id="Store_AreaChart_month" width="100%" height="30"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header"
									onClick="location.href='statistics_list.smdo?store=${storename}'"
									style="cursor: pointer">
									<i class="fas fa-chart-bar mr-1"></i><b> 최근 5년 매출</b>
								</div>
								<div class="card-body">
									<c:forEach var="storeYearly" items="${storeYearly }"
										varStatus="status">
										<input type="hidden" id="storeYearly${status.index }"
											value="${storeYearly }" />
									</c:forEach>
									<c:forEach var="storeYearlySales" items="${storeYearlySales }"
										varStatus="status">
										<input type="hidden" id="storeYearlySales${status.index }"
											value="${storeYearlySales }" />
									</c:forEach>
									<canvas id="Store_AreaChart_year" width="100%" height="30"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="card-body">
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header"
									onClick="location.href='statistics_list.smdo?store=${storename}'"
									style="cursor: pointer">
									<i class="fas fa-chart-bar mr-1"></i> 최근 12개월 주문건수
								</div>
								<div class="card-body">
									<c:forEach var="storeMonthlyCount"
										items="${storeMonthlyCount }" varStatus="status">
										<input type="hidden" id="storeMonthlyCount${status.index }"
											value="${storeMonthlyCount }" />
									</c:forEach>
									<canvas id="Store_BarChart_month" width="100%" height="30"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header"
									onClick="location.href='statistics_list.smdo?store=${storename}'"
									style="cursor: pointer">
									<i class="fas fa-chart-bar mr-1"></i> 최근 5년 주문건수
								</div>
								<div class="card-body">
									<c:forEach var="storeYearlyCount" items="${storeYearlyCount }"
										varStatus="status">
										<input type="hidden" id="storeYearlyCount${status.index }"
											value="${storeYearlyCount }" />
									</c:forEach>
									<canvas id="Store_BarChart_Year2" width="100%" height="30"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header" onClick="location.href='order.mdo'"
						style="cursor: pointer">
						<i class="fas fa-table mr-1"></i> 주문 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable1" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>날짜</th>
										<th>메뉴</th>
										<th>판매금액</th>
										<th>수령방식</th>
										<th>결제방식</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="storeSalesList" items="${storeSalesList }">
										<tr>
											<td><fmt:formatDate value="${storeSalesList.orderdate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${storeSalesList.menus}</td>
											<td>${storeSalesList.price}</td>
											<td>${storeSalesList.take}</td>
											<td>${storeSalesList.paytool}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			</main>

			<script
				src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>"
				crossorigin="anonymous"></script>

			<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>