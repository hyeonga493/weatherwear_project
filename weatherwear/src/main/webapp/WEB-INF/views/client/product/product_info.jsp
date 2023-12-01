<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_info.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	document.getElementById("deli").innerHTML = "배송비 3,000원";
})
	function count(num) {
		var cnt = parseInt($("input[name='cnt']").val());
		var odTotal = parseInt($("input[name='odTotal']").val());
		
		console.log("odTotal : " + odTotal);
		console.log("cnt : " + cnt);
		
		if (num == 1) {
			odTotal += ${ product.proPrice };
			cnt++;
		} else {
			odTotal -= ${ product.proPrice };
			cnt--;
		}

		if (cnt < 1) {
			cnt = 1;
		}
		
		if(odTotal > 50000){
			document.getElementById("deli").innerHTML = "배송비 무료";
			$("input[name='deliPrice']").val(0);
		} else { 
			document.getElementById("deli").innerHTML = "배송비 3,000원";
			$("input[name='deliPrice']").val(3000);
		}
		
		$("input[name='cnt']").val(cnt);
		$("input[name='odTotal']").val(odTotal);
	}
</script>
<script>
	function select(selectElement) {
		var color = document.getElementById("opColor").value;
		//console.log(color);
		var size = document.getElementById("opSize").value;
		//console.log(size);
		
		if(color === "SELECT" || size === "SELECT"){
			return;
		}
		var name= color+size;
		
		//if($("#"+name).length){
		//	alert("이미 있다");
			
		var select = "";
		select += "<div name='" + color + size + "' style='border:1px dotted green; padding:30px;'>"
				+ "${ product.proName }&nbsp;/&nbsp;" + color + "&nbsp;/&nbsp;" + size + "&nbsp;&nbsp;&nbsp;<br>"
				+ "<button type='button' onclick='count(2)'>-</button>"
				+ "<input name='cnt' style='padding:0 20px 0 20px; width:30px;' value='1'>"
				+ "<button type='button' onclick='count(1)'>+</button>"
				+ "<input type='hidden' name='opId' value='${ produce.proName }" + name + "'>"
				+ "<span style='float:right;'>&nbsp;&nbsp;&nbsp;&nbsp;</span>"
				+ "<button id='id' name='name' onclick='deleteSelected(this)' style='float:right;'>X</button>"
				+ "</div>";

		$("#selectOption").append(select);
		$("input[name='odTotal']").val(${ product.proPrice });
		
		// 초기화
		document.getElementById("opColor").value = "SELECT";
		document.getElementById("opSize").value = "SELECT";
	}


	function deleteSelected(element){
		$(element).parent().remove();
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
			<c:forEach var="cate" items="${ category }">
				<c:if test="${ cate == 'ALL' }">
					<span><a href="/w2/clientMain.do">${ cate }</a></span>&nbsp;> 
				</c:if>
				<c:if test="${ cate != 'ALL' }">
					<span>&nbsp;${ cate }</span>&nbsp;>
				</c:if>
			</c:forEach>
			&nbsp;${ product.proName }
		</div>
		<div class="product">
			<div class="image">
			
				<img src="${ mainImage.imageDir }${ mainImage.imageName }" alt="${ producr.proName }" style="width:400px; height:480px;">
				
				<div class="clearfixed"></div>
			</div>
			<div class="info" style="width:350px">
				<div style="height:50px; font-size:20px;">${product.proName}</div>
				<div style="font-size:30px; text-align:right; border-bottom:solid 1px">${product.proPrice}원</div>
				<div style="margin-top: 10px">
					<label>색상</label><select name="opColor" id="opColor">
						<option value="SELECT">선택</option>
						<c:forEach var="option" items="${opColorList}">
							<option value="${option}">${option}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>사이즈</label><select name="opSize" id="opSize" onchange="select(this)">
						<option value="SELECT">선택</option>
						<c:forEach var="option" items="${opSizeList}">
							<option value="${option}">${option}</option>
						</c:forEach>
					</select>
				</div>
				<section id="selectOption" style="border:3px solid blue; padding:10px;">
				
				</section>
				
					<input type="text" name="deliPrice" value="3000">
				<div style="padding:10px 0 10px 0">
					<span id="deli"></span>
					<br> 00,000원 이상 무료배송
				</div>
				<div style="font-size:20px; text-align:right; padding:10px 0 10px 0">
					총 상품금액&nbsp;<input type="text" name="odTotal" value="0" style="border:none; text-align:center;" disabled="disabled">
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
			<c:forEach var="detail" items="${ detailImageList }">
			<img src="${ detail.imageDir }${ detail.imageName }" style="witdh:800px; height:400px;" alt="${ product.proName }"><br>
			</c:forEach>
		</div>	

	</div>
	<%@ include file="../../client/base/footer.jsp"%>
</body>
</html>
