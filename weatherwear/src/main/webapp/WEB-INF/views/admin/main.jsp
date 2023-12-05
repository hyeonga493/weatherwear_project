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
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/common.css">  

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
		$('#getAdminOrderList').DataTable({
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
					<div class="card-header" onClick="location.href='adminOrder.mdo'"
						style="cursor: pointer">
						<i class="fas fa-table mr-1"></i> 주문 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<div class="menu-nav-wrap" style="width:120%;">
								<div style="display: flex;">
									<form id="dateSearchForm" name="dateSearchForm" action="/w2/adminOrder.mdo" method="post" style="margin-top:20px;">
										<label>조회기간</label>
										<input type="datetime-local" name="beginDate"> ~ <input type="datetime-local" name="endDate"> 
										<input class="btn-submit" type="submit" style="width:70px;">
									</form>
								<form id="searchForm" name="searchForm" action="/w2/updateOdStatus.mdo" method="post" style="margin-left:30px;">
	
									<div class="select-type2" style="margin-top: 20px; margin-left: 10px;">
										<select id="orderStatusAll" name="orderStatusAll" size="1" style="width: 130px;">
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
										</select>
			 							<input type="hidden" name="checkList">
										<input class="btn-write" type="submit" style="width:160px;" value="변경사항 저장" onClick="fn_check()">
									</div>
									</form>
								</div>
									<div class="table-type3" style="position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
										<table id="productList" style="width:1400px;">
											<colgroup>
													<col style="width: 30px;">
													<col style="width: 40px;">
													<col style="width: 80px;">
													<col style="width: 80px;">
													<col style="width: 100px;">
													<col style="width: 220px">
													<col style="width: 110px">
													<col style="width: 150px">
													<col style="width: 100px">
													<col style="width: 180px;">
													<col style="width: 160px;">
													<col style="width: 140px;">
													<col style="width: 130px">
													<col style="width: 110px">
												</colgroup>
											<thead>
												<tr>
													<th><input type="checkbox" name="checkProduct" id="checkAll"></th>
													<th>번호</th>
													<th>주문 번호</th>
													<th>회원 번호</th>
													<th>주문 날짜</th>
													<th>주문 상태</th>
													<th>결제 상태</th>
													<th>주문 상품</th>
													<th>총 금액</th>
													<th>적용된 쿠폰</th>
													<th>할인 금액</th>
													<th>결제 수단</th>
													<th>실 결제 금액</th>
													<th>연락처</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="AdminOrderDAO" items="${getAdminOrderList}" varStatus="i">
													<tr>
														<td><input type="checkbox" id="checkProduct" class="checkClass" name="checkProduct" value="${AdminOrderDAO.odid}" ></td>
														<td>${i.count}</td>
														<td>${AdminOrderDAO.odid}</td>
														<td>${AdminOrderDAO.clientId}</td>
														<td><fmt:formatDate value="${AdminOrderDAO.odDate}" pattern="yyyy-MM-dd" /></td>
														<!-- 주문상태 selectBox -->	
														<!-- <label for="orderStatus"></label>  -->
														<td>
														<form id="searchForm" name="searchForm" action="/w2/updateOdStatus.mdo" method="post">
															<select id="s_orderStatus${i.index }" name="odStatus" size="1" style="width:100px;">
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
															</select>
															<input type="hidden" name="odid" value="${AdminOrderDAO.odid}">
															<input type="hidden" name="odStatus" >
															<input type="submit" class="btn1" value='제출' style="width:60px;">
														</form>
														</td> 
														<td>${AdminOrderDAO.payStatus}</td>
														<td>${AdminOrderDAO.opIdList}</td>
														<td>${AdminOrderDAO.odTotal}</td>
														<td>${AdminOrderDAO.cpName}</td>
														<td>쿠폰 : ${AdminOrderDAO.cpPrice}, 포인트 : ${AdminOrderDAO.usedPoint}</td>
														<td>${AdminOrderDAO.payMtd}결제수단</td>
														<td>${AdminOrderDAO.odPrice}</td>
														<td>${AdminOrderDAO.clientNum}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								
								<!-- paging -->
							</div>
							<%-- <table class="table table-bordered" id="dataTable1" width="100%"
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
							</table> --%>
						</div>
					</div>
				</div>
			</div>
			</main>

			<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>