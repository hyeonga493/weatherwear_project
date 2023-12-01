<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/product/css/style.css" rel="stylesheet" />
<title>product_list.jsp</title>
<style>
#ordertype {
	width: 100px;
	padding: 10px;
	font-size: 15px;
	float: right;
	margin-right: 60px;
	border: none;
 	-o-appearance: none; 
 	-webkit-appearance: none; 
 	-moz-appearance: none; 
 	appearance: none;
}

#searchtype {
	margin-left: 60px;
	padding: 10px;
	font-size: 15px;
	border: none;
}

#searchtype option {
	text-align: center;
}

.product {
	text-align: left;
}

.product .name {
	width: 300px;
	text-align: left;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function order() {
	var value = document.getElementById("ordertype").value;
	
	if(value == "proRegDate") {
		window.location.replace("productList.do?ordertype=proRegDate");
	} else if(value == "proCnt") {
		window.location.replace("productList.do?ordertype=proCnt");
	} else if(value == "proPriceH") {
		window.location.replace("productList.do?ordertype=proPriceH");
	} else if(value == "proPriceL") {
		window.location.replace("productList.do?ordertype=proPriceL");
	}
	
}
</script>
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
		<div style="float:left">
			<form id="searchForm" name="searchForm" action="productList.do?page=1" method="post">
				<input type="hidden" id="page" name="page" value="${ paging.currentPage }" />
				<table style="margin-bottom:10px">
					<tr>
						<td><select class="box" id="searchtype" name="searchtype">
								<option value="SELECT">선택</option>
								<option ${ param.searchtype == 'proId' ? 'selected' : '' } value="proId">상품번호</option>
								<option ${ param.searchtype == 'proName' ? 'selected' : '' } value="proName">상품명</option>
						</select></td>
						<td style="padding: 10px"><input type="text" id="keyword" name="keyword" value="${param.keyword}"></td>
						<td><input type="submit" value="검색"></td>
					</tr>
				</table>
			</form>
		</div>	
		<div style="float:right">
			<select class="box" id="ordertype" name="ordertype" onchange="order()">
				<option value="ORDER">정렬</option>
				<option ${ param.ordertype == 'proRegDate' ? 'selected' : '' } value="proRegDate">최신순</option>
				<option ${ param.ordertype == 'proCnt' ? 'selected' : '' } value="proCnt">판매순</option>
				<option ${ param.ordertype == 'proPriceH' ? 'selected' : '' } value="proPriceH">높은가격순</option>
				<option ${ param.ordertype == 'proPriceL' ? 'selected' : '' } value="proPriceL">낮은가격순</option>
			</select>
<!-- 			<ul class="order"> -->
<!-- 					<li><a href="productList.do?ordertype=proRegDate">최신순</a></li> -->
<!-- 					<li><a href="productList.do?ordertype=proCnt">판매순</a></li> -->
<!-- 					<li><a href="productList.do?ordertype=proPriceH">높은가격순</a></li> -->
<!-- 					<li><a href="productList.do?ordertype=proPriceL">낮은가격순</a></li> -->
<!-- 			</ul> -->
		</div>
		<div class="clearfixed"></div>
		<div class="products" style="margin-right:20px">
				<c:forEach var="product" items="${productList}">
					<ul class="product">
						<li><a href="productInfo.do?proId=${product.proId}"><img src="https://via.placeholder.com/300x400"></a></li>
						<li class="name"><a href="productInfo.do?proId=${product.proId}">${product.proName}</a></li>
						<li class="price">${product.proPrice}</li>
						<li class="review">리뷰 0건</li>
					</ul>
				</c:forEach>
				<div class="clearfixed"></div>
			<div class="paging" style="padding:50px;">
				<c:if test="${paging.prev}">
					<a href="productList.do?page=${startPage -1}">처음페이지로</a>
				</c:if>
				&nbsp; &nbsp;
				<c:if test="${ paging.currentPage>1 }">
					<a href="productList.do?page=${paging.currentPage -1}">이전</a>
				</c:if>
				&nbsp;&nbsp;
				<c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
					<a href="productList.do?page=${pageNum}&searchtype=${param.searchtype}&keyword=${param.keyword}&ordertype=${param.ordertype}"
						style="${(pageNum == paging.currentPage) ? 'color:red; font-style:italic;' : 'color:blue;'}">
						${ pageNum } </a>&nbsp;&nbsp;
 		</c:forEach>
				<c:if test="${ paging.currentPage < paging.endPage }">
					<a href="productList.do?page=${ paging.currentPage + 1 }">다음</a>&nbsp;&nbsp;
 		</c:if>
				<!-- 다음 버튼 -->
				<c:if test="${ paging.next }">
					<a href="productList.do?page=${ paging.endPage +1 }">마지막페이지로</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<%@ include file="../../client/base/footer.jsp"%>
</body>
</html>