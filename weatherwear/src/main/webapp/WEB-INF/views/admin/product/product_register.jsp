<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.w2.product.ProductVO"%>
<%@page import="com.w2.product.ProductDAO"%>
<!DOCTYPE html>
<style>
.delBtn {
    color: blue;
    cursor: pointer;
}

.delBtn:hover {
    color: red;
}
</style>
<html>
<head>
	<meta charset="utf-8" />
	<title>상품 등록 페이지</title>
	<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
	<link rel="stylesheet" href="resources/product/css/product_style.css" />
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/admin/js/jquery/jquery.min.js"></script>
	
	<!-- 스마트에디터 적용 -->
	<script type="text/javascript" src="resources/static/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/product/js/usingEditor.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/product/js/product_register.js" charset="UTF-8"></script>

	<!-- 파일 업로드시 필요합니다. -->
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.809.0.min.js"></script>
	<script src="resources/product/js/productImage_insert.js"></script>
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
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle"	href="#" aria-haspopup="true" aria-expanded="false"></a>
		</li>
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
		<section style="margin:0 auto;">
			<div>
				<h3>상품 등록</h3>
			</div>
			<form action="insertProduct.mdo" method="post" enctype="multipart/form-data">
			<div>
			<table class="form" border="1">
			<tr>
<!-- 					<input type="hidden" name="proSell" value="Y"> -->
				<td style="text-align:center;">판매 상태</td>
				<td>
 					<input type="radio" name="proSell" id="판매중" value="Y" checked="checked"><label for="판매중" >판매 중</label>
					<input type="radio" name="proSell" id="일시품절" value="O"><label for="일시품절">일시 품절</label>
					<input type="radio" name="proSell" id="판매종료" value="N" ><label for="판매종료">판매 종료</label>
				</td>
			</tr>
			<tr>
				<td style="width:100px; text-align:center">상품 번호</td>
				<td><input type="text" name="proId" value="1234567"/></td>
			</tr>
				<tr>
				<td style="text-align:center" >카테고리</td>
				<td>
<!-- 				<input type="text" name="proCate"> -->
					<select name="proCate" id="category">
						<option>SELECT</option>
						<optgroup label="OUTER">
							<option value="111" selected="selected">PADDING</option>
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
				<td><input type="text" name="proName" value="상품이름"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>공급가</label></td>
				<td><input type="text" name="proPrimeCost" value="10000"/>&nbsp;원</td>
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
									<button type="button" class="btn-write" id="applyOption">옵션 적용하기</button><span id="optionResult"></span>
									<input type="hidden" name="opColorList" value="${opColorList}">
									<input type="hidden" name="opSizeList" value="${opSizeList}">
									<span id="optionStock">
									</span>
								</td>
							</tr>
						</table>
					</div>
					</td>
			</tr>
			<tr>
				<td style="text-align:center">상품 설명</td>
				<td>
					<div id="smarteditor">
						<textarea name="proContent" id="proContent" rows="20" cols="10" placeholder="내용 입력해주세요" style="width:500px; border: 2px solid black"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align:center"><label>메인 사진</label></td>
				<td>
					<input type="file" id="mainImageUpload" name="main_img[]"/>
			        <ul id="mainfileList"></ul>
			        <ul id="mainimageList"></ul>
			        <input type="hidden" id="main_imageList" name="main_imageList" >
				</td>
			</tr>
			<tr>
				<td style="text-align:center"><label>상세 사진</label></td>
				<td>
					<input type="file" id="detailImageUpload" name="detail_img[]" multiple/>
			        <ul id="detailfileList"></ul>
			        <ul id="detailimageList"></ul>
			        <input type="hidden" name="detail_imageList" id="detail_imageList">
				</td>
			</tr>
			</table>
			</div>
			<div style="margin-left:450px;">
				<input type="submit" class="btn-write" value="등록" onclick="submitPost()" style="padding:10px"/>
				<input type="reset" value="취소" style="padding:10px"/>  
			</div>
			</form>
		</section>
		<section>
			<h3>Naver Smart Editor</h3>

			<span id="content"></span>
		</section>
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>