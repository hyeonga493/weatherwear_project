<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<link rel="stylesheet" type="text/css" href="resources/admin/css/style.css">
</head>
<div id="container">
<body>
	<div id="header" style="overflow: hidden; height: 165px;">
	
		<div class="headercontent">
			<a href="/w2/adminOrder.mdo"><img src="resources/image/admin/logo2.png" width="300px"></a>
				<div style="float:right;">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자 계정</span>
				<img class="img-profile rounded-circle" src="resources/image/admin/person_icon.png" width="20px">
				&emsp;&emsp;<a href="adminLogout.mdo">로그아웃</a>
				</div>
				
			<!-- gnb -->
			<nav id="gnb" style="display: block; border-collapse: separate; box-sizing: border-box; text-indent: initial; border-spacing: 2px;">
				<ul>
					<li><a class="dp1" href="/w2/productList.mdo">상품관리</a></li>
					<li><a class="dp1" href="/w2/adminOrder.mdo">주문관리</a></li>
					<li><a class="dp1" href="/w2/couponAdminList.mdo">쿠폰관리</a></li>
					<li><a class="dp1" href="/w2/paymentList.mdo">결제내역</a></li>
					<li><a class="dp1" href="/w2/client.mdo">회원관리</a></li>
					<li><a class="dp1" href="/w2/noticeList.mdo?gubun=notice">공지/문의사항</a></li>
				</ul>
			</nav>
			
			<!-- gnb 끝 -->
		</div>
	</div>
</body>
</div>
</html>