<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.w2.product.ProductVO"%>
<%@page import="com.w2.product.ProductDAO"%>
<%
	ProductVO product = (ProductVO)session.getAttribute("product");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_info.jsp</title>
<script src="../js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
	function count(type) {
		  const resultElement = document.getElementById('cnt');
		  let number = resultElement.innerText;
		
		  if (type === 'plus') {
		    number = parseInt(number) + 1;
		  } else if (type === 'minus') {
		    number = parseInt(number) - 1;
		  }
		  
		  if (number < 1) {
		    number = 1;
		  }
		  
		  resultElement.innerText = number;
		}
	
	function select(e) {
		const text = e.options[e.selectedIndex].text;
		
		console.log(e.options);
		
		document.getElementById('selected').innerText = text;
	}
</script>
<style>
div.clearfixed::after {
	display: block;
	content: "";
	clear: both
}
a {
	text-decoration: none;
	color:black;
}
li {
	list-style:none;
}

button {
	background-color: #FFFFFF;
	border: none;
}
div.clearfixed::after {
	display: block;
	content: "";
	clear: both
}

.product_content{
	margin : 0 auto;
	text-align : auto;
}

.product {
	position:relative;
	padding:0 0 0 400px;
	width:1000px;
	box-sizing:border-box;
}
.product .image {
	position:absolute;
	left:0;
}
.product .image > image {
	width:400px;
	height:480px;
	border:1px solid #EAEAEA;
}
.product .image li {
	float:left;
	padding:0 10px 10px 0px;
}
.product .image li:after {
	content:"";
	display:block;
	clear:both;
}
.product .image li.on img {
	border-color:#DAD9FF;
}
.product .image li img {
	witdh:70px;
	height:100px;
	border:1px solid #EAEAEA;
}
.product .info {
	padding:0 0 0 30px;
}
.product .info div {
	padding:5px 0 5px 0;
	white-space: normal;
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient:vertical;
}

.menu {
	display: inline-block;
	word-spacing:170px;
	margin-left:140px;
	padding:15px 0 10px 0;
}
.cart {
	font-size: 15px;
	padding: 15px;
	width:150px;
}
.order {
	font-size: 15px;
	padding: 15px;
	width:150px;
}

input[type=button] {
	border: none;
}
	</style>
</head>
<body>
	<%@ include file="../../client/base/header.jsp" %>
	<div id="product_content">
	
		<div style="padding: 10px 0 10px 0">
			<a href="/w2">HOME</a> > 
			<span><a href="#">카테고리1</a></span> > 
			<span><a href="productList.do">카테고리2</a></span>
		</div>
		<div class="product">
			<div class="image">
				<img src="https://via.placeholder.com/400x480" alt="상품이미지">
				<ul style="list-style-type: none">
					<li><a href="#a"><img src="https://via.placeholder.com/100x100" alt="상품이미지"></a></li>
					<li><a href="#a"><img src="https://via.placeholder.com/100x100" alt="상품이미지"></a></li>
					<li><a href="#a"><img src="https://via.placeholder.com/100x100" alt="상품이미지"></a></li>
				</ul>
				<div class="clearfixed"></div>
			</div>
			<div class="info" style="width:350px">
				<div style="height:50px; font-size:20px;">${product.proName}</div>
				<div style="font-size:30px; text-align:right; border-bottom:solid 1px">${product.proPrice}원</div>
				<div style="margin-top: 10px">
					<label>색상</label><select name="opColor">
						<option value="SELECT">선택</option>
						<c:forEach var="option" items="${optionList}">
						<option value="${option.opColor}">${option.opColor}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>사이즈</label><select name="opSize" onchange="select(this)">
						<option value="SELECT">선택</option>
						<c:forEach var="option" items="${optionList}">
						<option value="${option.opSize}">${option.opSize}</option>
						</c:forEach>
					</select>
					</div>
<!-- 					<label>색상</label> <select name="opColor"> -->
<!-- 						<option value="SELECT">선택</option> -->
<!-- 						<option value="WHITE">WHITE</option> -->
<!-- 						<option value="BLACK">BLACK</option> -->
<!-- 						<option value="GRAY">GRAY</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<label>사이즈</label> <select name="opSize"> -->
<!-- 						<option value="SELECT">선택</option> -->
<!-- 						<option value="XS">XS</option> -->
<!-- 						<option value="S">S</option> -->
<!-- 						<option value="M">M</option> -->
<!-- 						<option value="L">L</option> -->
<!-- 						<option value="XL">XL</option> -->
<!-- 					</select> -->		
				<div>
					<button onclick="count('minus')">-</button>
					<span id="cnt" style="padding:0 20px 0 20px">1</span>
					<button onclick="count('plus')">+</button>
					<input type="button" class="select" value="선택"><br>
					<br>
				</div>
				<div id="selected" style="overflow: auto; width: 300px; height: 50px;">
					
				</div>
				<div style="padding:10px 0 10px 0">
					배송비 0,000원<br> 00,000원 이상 무료배송
				</div>
				<div style="font-size:20px; text-align:right; padding:10px 0 10px 0">
					총 상품금액&nbsp;<span>00,000원</span>&nbsp;<span>(0개)</span>
				</div>
				<div style="padding:10px 0 10px 0">
					<a href="#">배송 안내</a><br> <a href="#">반품/교환 안내</a>
				</div>
				<div>
					<div style="padding:50px 0 50px 20px;">
						<a href="clientCart.do"><input type="button" class="cart" value="장바구니"></a>
						<a href="clientOrder.do"><input type="button" class="order" value="구매하기"></a>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfixed"></div>
		<div class="menu">
			<a href="#">상세정보</a> <a href="#">리뷰</a> <a href="#">문의</a>
		</div>
		<div class="detail">
			<img src="https://via.placeholder.com/800x400" alt="상세페이지1"><br>
			<img src="https://via.placeholder.com/800x400" alt="상세페이지2"><br>
			<img src="https://via.placeholder.com/800x400" alt="상세페이지3">
		</div>	

	</div>
	<%@ include file="../../client/base/footer.jsp"%>
</body>
</html>