<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.w2.product.ProductVO"%>
<%@page import="com.w2.product.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>상품 등록 페이지</title>
<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
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

.form {
	width:80%;
	height:50%;
	border-collapse:collapse;
	margin:30px 0 30px 0;
}
td {
	padding:5px;
}
button {
background-color:#FFFFFF;
border-width:thin;
border-color:black;
}
input[type=button],
input[type=submit],
input[type=reset] {
	border:none;
}

textarea {
	padding:10px;
	width:350px;
	height:100px;
	border:0;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//옵션 적용하기
$(document).ready(function() {
$("#applyOption").click(function() {
	var opColor = $("input[name='opColor']").val();
	var opSize = $("input[name='opSize']").val();
	var opColorList = [];
	var opSizeList = [];

	if (opColor) {
		opColor.split(",").forEach(function(item) {
			opColorList.push(item);
			$("input[name='opColorList']").val(opColorList);
		});
	}

	if (opSize) {
		opSize.split(",").forEach(function(item) {
			opSizeList.push(item);
			$("input[name='opSizeList']").val(opSizeList);
		});
	}
	$("#optionResult").html("<font color='green' size='1'><b><b>적용되었습니다.</b></font>");
	
	
	console.log("opColorList : " + opColorList);
	console.log("opSizeList : " + opSizeList);
});
});
</script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar -->
	<!-- <ul> -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" aria-haspopup="true"
			aria-expanded="false">
				</div></li>
	</ul>
		<main>
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		</main>
		<script
			src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>"
			crossorigin="anonymous"></script>
		<hr><hr><hr><br>
		<section>
			<div>
				<h3>상품 등록</h3>
			</div>
			<form action="insertProduct.mdo" method="post">
			<div>
			<table class="form" border="1">
			<tr>
<!-- 					<input type="hidden" name="proSell" value="Y"> -->
				<td style="text-align:center">판매 상태</td>
				<td>
 					<label><input type="radio" name="proSell" value="Y" for="proSell" checked="checked">판매 중</label>
					<label><input type="radio" name="proSell" for="proSell" value="O">일시 품절</label>
					<label><input type="radio" name="proSell" for="proSell" value="N" >판매 종료</label>
				</td>
			</tr>
			<tr>
				<td style="width:100px; text-align:center">상품 번호</td>
				<td><input type="text" name="proId" style="border:none; width:50%;"/></td>
			</tr>
				<tr>
				<td style="text-align:center">카테고리</td>
				<td>
<!-- 				<input type="text" name="proCate"> -->
					<select name="proCate" id="category">
						<option>SELECT</option>
						<optgroup label="OUTER">
							<option value="111">PADDING</option>
							<option value="112">COAT</option>
							<option value="113">CARDIGAN</option>
						</optgroup>
						<optgroup label="TOP">
							<option value="121">KNIT</option>
							<option value="122">SHIRT</option>
							<option value="123">TSHIRT</option>
						</optgroup>
						<optgroup label="PANTS">
							<option value="131">JEANS</option>
							<option value="132">SLACKS</option>
							<option value="133">PANTS</option>
						</optgroup>
						<optgroup label="SKIRTS">
							<option value="141">SHORT</option>
							<option value="142">MIDI</option>
							<option value="143">LONG</option>
						</optgroup>
						<optgroup label="DRESS">
							<option value="151">SHORT</option>
							<option value="152">MIDI</option>
							<option value="153">LONG</option>
						</optgroup>
					</select>
				</td>
			<tr>
				<td style="text-align:center"><label>상품명</label></td>
				<td><input type="text" name="proName" style="border:none; width:100%;"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>공급가</label></td>
				<td><input type="text" name="proPrimeCost" style="border:none; width:10%; text-align:right"/>&nbsp;원</td>
			</tr>
			<tr>
				<td style="text-align:center"><label>옵션</label></td>
				<td>
				<div id="option">
						<table>
							<tr>
								<td>색상</td><td><input type="text" name="opColor" placeholder="색상1, 색상2.." value="c1,c2,c3">
							</tr>
							<tr>
								<td>사이즈</td><td><input type="text" name="opSize" placeholder="사이즈1, 사이즈2.." value="s1,s2,s3">
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" id="applyOption">옵션 적용하기</button><span id="optionResult"></span>
									<input type="hidden" name="opColorList" value="${opColorList}">
									<input type="hidden" name="opSizeList" value="${opSizeList}">
								</td>
							</tr>
						</table>
					</div>
					</td>
			</tr>
			<tr>
				<td style="text-align:center">상품 설명</td>
				<td><textarea name="proContent" style="width:1000px; rows:10"></textarea></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>상품 사진</label></td>
				<td><input type="file"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>부가 사진</label></td>
				<td><input type="file"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>상세 사진</label></td>
				<td><input type="file"/></td>
			</tr>
			</table>
			</div>
			<div style="margin-left:450px;">
				<input type="submit" class="btn-write" value="등록" style="padding:10px"/>
				<input type="reset" value="취소" style="padding:10px"/>  
			</div>
			</form>
		</section>
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>