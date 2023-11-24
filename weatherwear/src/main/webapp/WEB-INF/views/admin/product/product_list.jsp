<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<link rel="stylesheet" href="resources/admin/css/slickGrid/slick.grid.css" type="text/css" />
<link rel="stylesheet" href="resources/admin/css/jquery/jquery-ui.css" type="text/css" />

<title>등록 상품 목록 페이지</title>

<script src="resources/admin/js/slickGrid/slick.core.js"></script>
<script src="resources/admin/js/slickGrid/slick.interactions.js"></script>
<script src="resources/admin/js/slickGrid/slick.grid.js"></script>
<script src="resources/admin/js/jquery/jquery-3.7.1.min.js"></script>
<script src="resources/admin/js/slickGrid/jquery.event.drag-2.3.0.js"></script>
<script src="resources/admin/js/slickGrid/slick.checkboxselectcolumn.js"></script>
<script src="resources/admin/js/slickGrid/slick.rowselectionmodel.js"></script>
<script src="resources/admin/js/jquery/jquery-ui.min.js"></script>
	
<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />

<script type="text/javascript" charset="UTF-8">
$(document).ready(function () {
	
	var columns = [
		{id: "sale", name: "판매상태", field:"sale", width:100, sortable: true},
		{id: "category1", name: "카테고리1", field: "category1", width:100, sortable: true},
		{id: "category2", name: "카테고리", field: "category2", width:100, sortable: true},
	    {id: "no", name: "상품번호", field: "no", width:100, sortable: true},
	    {id: "productName", name: "상품명", field: "productName", width:350, sortable: true},
	    {id: "primeCost", name: "공급가", field: "primeCost", width:100, sortable: true},
	    {id: "cost", name: "정가", field: "cost", width:100, sortable: true},
	    {id: "price", name: "판매가", field: "price", width:100, sortable: true},
	    {id: "openDate", name: "등록일", field: "openDate", width:100, sortable: true},
	    {id: "proCnt", name: "판매량", field: "proCnt", width:100, sortable: true},
	    {id: "button", name: "삭제", field: "button", width:52, formatter: buttonFormatter}
	];
	
	var checkboxSelector = new Slick.CheckboxSelectColumn({
        cssClass: "slick-cell-checkboxsel"
    });
	columns.splice(0, 0, checkboxSelector.getColumnDefinition())
	
	var options = {
		enableColumnReorder: false
	};
	
	function buttonFormatter(row, cell, value, columnDef, dataContext) {
		 return "<button>삭제</button>";
	}
	
	var data = [
		{ sale: "판매중", category1: 'outer', category2: 'coat', no: 123456, productName: '코트', primeCost: '00,000원', cost: '00,000원',  price: '00,000원', openDate:'23-11-07', proCnt: 0},
		{ sale: "판매중", category1: 'outer', category2: 'coat', no: 123456, productName: '코트', primeCost: '00,000원', cost: '00,000원',  price: '00,000원', openDate:'23-11-07', proCnt: 0},
		{ sale: "판매중", category1: 'outer', category2: 'coat', no: 123456, productName: '코트', primeCost: '00,000원', cost: '00,000원',  price: '00,000원', openDate:'23-11-07', proCnt: 0},
		{ sale: "일시품절", category1: 'outer', category2: 'coat', no: 123456, productName: '코트', primeCost: '00,000원', cost: '00,000원', price: '00,000원', openDate:'23-11-07', proCnt: 0},
		{ sale: "판매종료", category1: 'outer', category2: 'coat', no: 123456, productName: '코트', primeCost: '00,000원', cost: '00,000원', price: '00,000원', openDate:'23-11-07', proCnt: 0}
	];
	
	grid = new Slick.Grid("#myGrid", data, columns, options);
	grid.setSelectionModel(new Slick.RowSelectionModel({selectActiveRow: false}));
	grid.registerPlugin(checkboxSelector);
	});

	function getSelectedRow(){
		var selectedIndexes = grid.getSelectedRows();
		alert(selectedIndexes);
	}
</script>
<style>

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
		
		<div style="margin-bottom:30px;">
			<h3>등록 상품 목록</h3>
		</div>
		<div style="font-size:15px; padding:10px 0 10px 0">
			<table style="margin-bottom:10px">
				<tr>
					<td>
					<select class="box" name="searchCondition">
								<option value="SELECT">선택</option>
								<option value="SELL">판매상태</option>
								<option value="CATEGORY">카테고리</option>
								<option value="NAME">상품명</option>			                  
					</select>
					</td>
					<td><input type="text" name="searchKeyword"/></td>
					<td>
						<input type="submit" value="검색"/>
						<button type="button" id="btn_prodcutRegist" class="btn-write" style="margin-left:100px; padding:8px 8px;" onClick="location.href='/w2/insertProduct.mdo'">상품 등록하기</button>
					</td>
				</tr>
				</table>
				등록 상품 개수
		</div>
	<table>
		<tr>
			<th>판매상태</th>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>상품설명</th>
			<th>공급가</th>
			<th>소비자가</th>
			<th>판매가</th>
			<th>등록일</th>
			<th>판매량</th>
			<th>조회수</th>
			<th>좋아요수</th>		
		</tr>
		<c:forEach var="product" items="${productList}">
			<tr>
				<td>${product.proSell}</td>
				<td>${product.proId}</td>
				<td>${product.proCate}</td>
				<td><a href="getProduct.mdo?proId=${product.proId}">${product.proName}</a></td>
				<td>${product.proContent}</td>
				<td>${product.proPrimeCost}</td>
				<td>${product.proCost}</td>
				<td>${product.proPrice}</td>
				<td fmt:formatDate pattern="yyyy-MM-dd">${product.proRegDate}</td>
				<td>${product.proCnt}</td>
				<td>${product.proView}</td>
				<td>${product.proLike}</td>
			</tr>
		</c:forEach>
	</table>
	</form>
	<br/>
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>