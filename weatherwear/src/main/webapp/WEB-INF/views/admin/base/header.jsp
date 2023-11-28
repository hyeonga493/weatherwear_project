<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>w2</title>
<link rel="stylesheet" type="text/css" href="resources/admin/css/style.css">
</head>

<body>
	<div id="header" style="overflow: hidden; height: 165px;">
		<div class="headercontent">
			<!-- gnb -->
			<nav id="gnb">
				<ul>
					<li><a class="dp1" href="/w2/stoke.mdo">물류관리</a></li>
					<li><a class="dp1" href="/w2/productList.mdo">상품관리</a></li>
					<li><a class="dp1" href="/w2/adminOrder.mdo">주문관리</a></li>
					<li><a class="dp1" href="/w2/swap.mdo">교환/환불</a></li>
					<!-- <li><a class="dp1" href="/w2/balance.mdo">정산관리</a></li> -->
					<li><a class="dp1" href="/w2/reviewList.do">결제내역(리뷰)</a></li>
					<li><a class="dp1" href="/w2/couponUser.do">쿠폰관리</a></li>
					<li><a class="dp1" href="/w2/client.mdo">회원관리</a></li>
					<li><a class="dp1" href="/w2/noticeList.mdo?gubun=notice">공지/문의사항</a></li>
					<li><a class="dp1" href="/w2/product.mdo">상품관리</a></li>
					<li><a class="dp1" href="/w2/total.mdo">통계</a></li>
				</ul>
			</nav>
			<!-- gnb 끝 -->

			<!-- Topbar Navbar -->
			<ul class="navbar-nav ml-auto">
				<!-- Nav Item - User Information -->
				<li class="nav-item dropdown no-arrow">
				<a href="/w2/dashboard.mdo">
					<img src="resources/image/admin/logo2.png" width="150px" style="margin: 50px 80px 10px 45px;"/>
				</a>
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" style="float:right; margin: 25px 100px 75px 20px;"> 
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자 계정</span>
						<img class="img-profile rounded-circle"
						src="resources/image/admin/person_icon.png" width="20px">
				</a> 
				
				<!-- Dropdown - User Information -->
					<div class="dropdown-menu" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="#">정보수정</a>
						<a class="dropdown-item" href="/w2/login.mdo">로그아웃</a>
					</div></li>
			</ul>

		</div>
	</div>
</body>
</html>