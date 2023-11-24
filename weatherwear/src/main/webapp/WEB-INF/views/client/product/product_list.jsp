<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<title>product_list.jsp</title>
<style>

</style>
</head>
<body>
	<%@ include file="../../client/base/header.jsp" %>
	<div id="product_content">
	<c:choose>
		<c:when test="${param.page == 'new'}">
			<h1>Product_new</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">전체</a></li>
					<li><a href="#">OUTER</a>
						<div class="category">
							<a href="#">PADDING</a> <a href="#">COAT</a> <a href="#">CARDIGAN</a>
						</div>
					</li>
					<li><a href="#">TOP</a>
						<div class="category">
							<a href="#">KNIT</a> <a href="#">SHIRT</a> <a href="#">TSHIRT</a>
						</div>
					</li>
					<li><a href="#">PANTS</a>
						<div class="category">
							<a href="#">JEANS</a> <a href="#">SLACKS</a> <a href="#">PANTS</a>
						</div>
					</li>
					<li><a href="#">SKIRTS</a>
						<div class="category">
							<a href="#">SHORT</a> <a href="#">MIDI</a> <a href="#">LONG</a>
						</div>
					</li>
					<li><a href="#">DRESS</a>
						<div class="category">
							<a href="#">SHORT</a> <a href="#">MIDI</a> <a href="#">LONG</a>
						</div>
					</li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'weather'}">
			<h1>Product_weather</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">전체</a></li>
					<li><a href="#">OUTER</a>
						<div class="category">
							<a href="#">PADDING</a> <a href="#">COAT</a> <a href="#">CARDIGAN</a>
						</div></li>
					<li><a href="#">TOP</a>
						<div class="category">
							<a href="#">KNIT</a> <a href="#">SHIRT</a> <a href="#">TSHIRT</a>
						</div></li>
					<li><a href="#">PANTS</a>
						<div class="category">
							<a href="#">PANTS</a> <a href="#">SLACKS</a> <a href="#">JEANS</a>
						</div></li>
					<li><a href="#">SKIRTS</a>
						<div class="category">
							<a href="#">LONG</a> <a href="#">MIDI</a> <a href="#">SHORT</a>
						</div></li>
					<li><a href="#">DRESS</a>
						<div class="category">
							<a href="#">LONG</a> <a href="#">MIDI</a> <a href="#">SHORT</a>
						</div></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'OUTER'}">
			<h1>Product_outer</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">PADDING</a></li> 
					<li><a href="#">COAT</a></li> 
					<li><a href="#">CARDIGAN</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'TOP'}">
			<h1>Product_top</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">KNIT</a></li> 
					<li><a href="#">SHIRT</a></li> 
					<li><a href="#">TSHIRT</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'PANTS'}">
			<h1>Product_dress</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">PANTS</a></li> 
					<li><a href="#">SLACKS</a></li> 
					<li><a href="#">JEANS</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'SKIRTS'}">
			<h1>Product_pants</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">LONG</a></li> 
					<li><a href="#">MIDI</a></li> 
					<li><a href="#">SHORT</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'DRESS'}">
			<h1>Product_skirts</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">LONG</a></li> 
					<li><a href="#">MIDI</a></li> 
					<li><a href="#">SHORT</a></li>
				</ul>
			</div>
		</c:when>
	</c:choose>
		<div class="clearfixed"></div>
		<div>
			<ul class="list">
				<li>정렬
					<div class="order">
						<a href="#" style="margin-top: 20px;">판매순</a><br> 
						<a href="#">최신순</a><br>
						<a href="#">리뷰많은순</a><br> 
						<a href="#">높은가격순</a><br>
						<a href="#">낮은가격순</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="clearfixed"></div>
		<div class="products">
<%-- 			<c:forEach var="item" items="1,2,3,4,5,6,7"> --%>
<!-- 				<ul class="product"> -->
<!-- 					<li> -->
<%-- 						<a href="productInfo.do?proId=${ item }"> --%>
<!-- 						<img src="https://via.placeholder.com/220x290"></a> -->
<!-- 					</li> -->
<%-- 					<li class="name"><a href="#">${ item } : 이름이 넘어가면 생략되어 표시됩니다.</a></li> --%>
<!-- 					<li class="price">00,000</li> -->
<!-- 					<li class="review">리뷰 0건</li> -->
<!-- 				</ul> -->
<%-- 			</c:forEach> --%>
				<c:forEach var="product" items="${productList}">
					<ul class="product">
						<li><a href="productInfo.do?proId=${product.proId}"><img src="https://via.placeholder.com/220x290"></a></li>
						<li class="name"><a href="productInfo.do?proId=${product.proId}">${product.proName}</a></li>
						<li class="price">${product.proPrice}</li>
						<li class="review">리뷰 0건</li>
					</ul>
				</c:forEach>
		</div>
	</div>

	<%@ include file="../../client/base/footer.jsp"%>
</body>
</html>