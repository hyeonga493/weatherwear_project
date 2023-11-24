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
					<li><a href="#">아우터</a>
						<div class="category">
							<a href="#">패딩</a> <a href="#">코트</a> <a href="#">파카</a>
						</div></li>
					<li><a href="#">상의</a>
						<div class="category">
							<a href="#">티셔츠</a> <a href="#">니트</a> <a href="#">셔츠</a>
						</div></li>
					<li><a href="#">하의</a>
						<div class="category">
							<a href="#">진</a> <a href="#">와이드팬츠</a> <a href="#">슬랙스</a>
						</div></li>
					<li><a href="#">원피스</a>
						<div class="category">
							<a href="#">서브1</a> <a href="#">서브2</a> <a href="#">서브3</a>
						</div></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'weather'}">
			<h1>Product_weather</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">전체</a></li>
					<li><a href="#">아우터</a>
						<div class="category">
							<a href="#">패딩</a> <a href="#">코트</a> <a href="#">파카</a>
						</div></li>
					<li><a href="#">상의</a>
						<div class="category">
							<a href="#">티셔츠</a> <a href="#">니트</a> <a href="#">셔츠</a>
						</div></li>
					<li><a href="#">하의</a>
						<div class="category">
							<a href="#">진</a> <a href="#">와이드팬츠</a> <a href="#">슬랙스</a>
						</div></li>
					<li><a href="#">원피스</a>
						<div class="category">
							<a href="#">서브1</a> <a href="#">서브2</a> <a href="#">서브3</a>
						</div></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'outer'}">
			<h1>Product_outer</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">페딩</a></li> 
					<li><a href="#">코트</a></li> 
					<li><a href="#">가디건</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'top'}">
			<h1>Product_top</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">티셔츠</a></li> 
					<li><a href="#">니트</a></li> 
					<li><a href="#">셔츠</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'dress'}">
			<h1>Product_dress</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">서브1</a></li> 
					<li><a href="#">서브2</a></li> 
					<li><a href="#">서브3</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'pants'}">
			<h1>Product_pants</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">데님</a></li> 
					<li><a href="#">와이드팬츠</a></li> 
					<li><a href="#">슬랙스</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${param.page == 'skirts'}">
			<h1>Product_skirts</h1>
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">롱스커트</a></li> 
					<li><a href="#">미디스커트</a></li> 
					<li><a href="#">미니스커트</a></li>
				</ul>
			</div>
		</c:when>
	</c:choose>
		<div class="clearfixed"></div>
		<div>
			<ul class="list">
				<li>정렬
					<div class="order">
						<a href="#" style="margin-top: 20px;">판매순</a><br> <a href="#">최신순</a><br>
						<a href="#">리뷰많은순</a><br> <a href="#">높은가격순</a><br> <a
							href="#">낮은가격순</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="clearfixed"></div>
		<div class="products">
		
			<c:forEach var="item" items="1,2,3,4,5,6,7">
				<ul class="product">
					<li><a href="productInfo.do?proId=${ item }"><img
							src="https://via.placeholder.com/220x290"></a></li>
					<li class="name"><a href="#">${ item } : 이름이 넘어가면 생략되어 표시됩니다.</a></li>
					<li class="price">00,000</li>
					<li class="review">리뷰 0건</li>
				</ul>
			</c:forEach>
		</div>
	</div>

	<%@ include file="../../client/base/footer.jsp"%>
</body>
</html>