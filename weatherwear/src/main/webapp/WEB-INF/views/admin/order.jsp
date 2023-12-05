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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/common.css">  
<script>
	//체크박스 전체 선택,해제 위해
	$(document).ready(function () {
	    $("#checkAll").click(function () {
	        $(".checkClass").prop("checked", this.checked);
	    });
	
	    $(".checkClass").click(function () {
	        if ($(".checkClass:checked").length === $(".checkClass").length) {
	            $("#checkAll").prop("checked", true);
	        } else {
	            $("#checkAll").prop("checked", false);
	        }
	    });
	});
	
	function fn_check(){
	    let checkList = "";
	    
	    $("#checkProduct:checked").each(function(num,item){
	                 
	       if(num==0){
	          checkList += item.value;
	       }else{
	          checkList += ","+item.value;
	       }
	    });
	    $("input[name='checkList']").val(checkList);
	    console.log("checkList : "+checkList);
	    console.log("input[name='checkList'] : "+$("input[name='checkList']").val());
	}

</script>

</head>
<body class="sb-nav-fixed">

	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>
	
	<div id="wrap">
		<div id="container">
			<section id="content">
				<div class="sub-type notice">
					<div class="inner-box"> 
						<article class="notice-area">
							<div class="menu-nav-wrap" style="width:120%;">
								<div style="display: flex;">
									<form id="dateSearchForm" name="dateSearchForm" action="/w2/adminOrder.mdo" method="post" style="margin-top:20px;">
										<label>조회기간</label>
										<input type="datetime-local" name="beginDate"> ~ <input type="datetime-local" name="endDate"> 
										<input class="btn-submit" type="submit" style="width:70px;">
									</form>
									<form id="searchForm" name="searchForm" action="/w2/updateOdStatus.mdo" method="post" style="margin-left:30px;">
										<input type="hidden" id="page" name="page" value="${ paging.currentPage }" />
		
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
						</article>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>