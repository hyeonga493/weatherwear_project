<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
input[type=button] {
	border:none;
}
textarea {
	padding:10px;
	width:350px;
	height:100px;
	border:0;
}
</style>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
	<!-- <ul> -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
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
			<div>
			<table class="form" border="1">
			<tr>
				<td style="text-align:center">판매 상태</td>
				<td>
					<label><input type="radio" name="sale" value="onsale" checked="checked">판매 중</label>
					<label><input type="radio" name="sale" value="soldout">일시 품절</label>
					<label><input type="radio" name="sale" value="">판매 종료</label>
				</td>
			</tr>
			<tr>
				<td style="width:100px; text-align:center">상품 번호</td>
				<td><input type="text" style="border:none; width:50%;"/></td>
				</tr>
				<tr>
				<td style="text-align:center">카테고리</td>
				<td>
					<table class="option">
						<tr>
							<td>카테고리1 <select name="category1">
								<option value="SELECT">선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select></td>
						</tr>
						<tr>
							<td>카테고리2 <select name="category2">
								<option value="SELECT">선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
							</td>
						</tr>
					</table>
				</td>
			<tr>
				<td style="text-align:center"><label>상품명</label></td>
				<td><input type="text" style="border:none; width:100%;"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>상품 가격</label></td>
				<td><input type="text" style="border:none; width:10%; text-align:right"/>&nbsp;원</td>
			</tr>
			<tr>
				<td style="text-align:center">옵션</td>
				<td>
			            <table class="option">
			                <tr>
			                    <th>색상&nbsp;<input type="text" style="width:50px"/>&nbsp;<button class="add">추가</button></th>
			                    <td>&nbsp;</td>
			                    <th>사이즈&nbsp;<input type="text" style="width:50px"/>&nbsp;<button class="add">추가</button></th>
			                </tr>
			                <tr>
			                </tr>
			                <tr>
			                    <td>색1&nbsp;<button class="delete">수정</button>&nbsp;<button class="delete">삭제</button></td>
			                    <td>&nbsp;</td>
			                    <td>사이즈1&nbsp;<button class="delete">수정</button>&nbsp;<button class="delete">삭제</button></td>
			                </tr>
			                <tr>
			                	<td>색2&nbsp;<button class="delete">수정</button>&nbsp;<button class="delete">삭제</button></td>
			                	<td>&nbsp;</td>
			                </tr>
			            </table>
			        </td>
			</tr>
			<tr>
				<td style="text-align:center">상품 설명</td>
				<td><textarea style="width:1000px; rows:10"></textarea></td>
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
				<input type="button" class="btn-write" value="등록" style="padding:10px" onClick="location.href='/w2/product.mdo'"/>
			</div>
		</section>
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>