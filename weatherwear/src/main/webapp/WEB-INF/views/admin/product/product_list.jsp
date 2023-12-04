<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="resources/admin/css/jquery/jquery-ui.css" type="text/css" />
<title>등록 상품 목록 페이지</title>
<script src="resources/admin/js/jquery/jquery-3.7.1.min.js"></script>
<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<script type="text/javascript" charset="UTF-8">
function order() {
	var value = document.getElementById("ordertype").value;
	 
	if(value == "proRegDate") {
		window.location.replace("productList.mdo?ordertype=proRegDate");
	} else if(value == "proCnt") {
		window.location.replace("productList.mdo?ordertype=proCnt");
	} else if(value == "proPriceH") {
		window.location.replace("productList.mdo?ordertype=proPriceH");
	} else if(value == "proPriceL") {
		window.location.replace("productList.mdo?ordertype=proPriceL");
	} else if(value == "proSell") {
		window.location.replace("productList.mdo?ordertype=proSell");
	}
	
}
</script>
<style>
#productList {
	text-align:center;
}

#productList th {
	width:150px;
	padding:10px;
	white-space:nowrap;  
	overflow:hidden;
 	text-overflow:ellipsis;
}

/* display:inline >> display:inline-block / block */

#productList td {
	width:150px;
	padding:10px;
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}
</style>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

		
		<div style="margin-bottom:30px;">
			<h3>등록 상품 목록</h3>
		</div>
		<form id="searchForm" name="searchForm" action="productList.mdo?page=1" method="post">
 		<input type="hidden" id="page" name="page" value="${ paging.currentPage }"/>
		<div style="font-size:15px; padding:10px 0 10px 0">
			<table style="margin-bottom:10px">
				<tr>
					<td>
					<select class="box" id="searchtype" name="searchtype">
								<option ${ param.searchtype == null ? 'selected' : '' }  value="proId">상품번호</option>
								<option ${ param.searchtype == 'proId' ? 'selected' : '' }  value="proId">상품번호</option>
								<option ${ param.searchtype == 'proName' ? 'selected' : '' } value="proName">상품명</option>		                  
					</select>
					</td>
					<td style="padding:10px"><input type="text" id="keyword" name="keyword" value="${param.keyword}"></td>
					<td>
						<input type="submit" value="검색">
						<button type="button" id="btn_productRegist" class="btn-write" style="margin-left:100px; padding:8px 8px;" onClick="location.href='/w2/registerProduct.mdo'">상품 등록하기</button>
					</td>
				</tr>
				</table>
				</form>
				</div>
				<div>
			<select class="box" id="ordertype" name="ordertype" onchange="order()">
				<option ${ param.ordertype == 'proRegDate' ? 'selected' : '' } value="proRegDate">등록일</option>
				<option ${ param.ordertype == null ? 'selected' : '' } value="proRegDate">등록일</option>
				<option ${ param.ordertype == 'proCnt' ? 'selected' : '' } value="proCnt">판매량</option>
				<option ${ param.ordertype == 'proSell' ? 'selected' : '' } value="proSell">판매상태</option>
			</select>
			</div>
	<table id="productList">
		<tr>
			<th>판매상태</th>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>공급가</th>
			<th>소비자가</th>
			<th>판매가</th>
			<th>등록일</th>
			<th>판매량</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="product" items="${productList}">
			<tr>
				<td>${product.proSell}</td>
				<td>${product.proId}</td>
				<td>${product.cateName}</td>
				<td><a href="getProduct.mdo?proId=${product.proId}">${product.proName}</a></td>
				<td>${product.proPrimeCost}</td>
				<td>${product.proCost}</td>
				<td>${product.proPrice}</td>
				<td fmt:formatDate pattern="yyyy-MM-dd">${product.proRegDate}</td>
				<td>${product.proCnt}</td>
				<td>${product.proView}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="paging">
		<c:if test="${paging.prev}">
			<a href="productList.mdo?page=${startPage -1}&searchtype=${param.searchtype}&keyword=${param.keyword}&ordertype=${param.ordertype}">처음페이지로</a>
		</c:if>
		&nbsp; &nbsp;
		<c:if test="${ paging.currentPage>1 }">
			<a href="productList.mdo?page=${paging.currentPage -1}&searchtype=${param.searchtype}&keyword=${param.keyword}&ordertype=${param.ordertype}">이전</a>
		</c:if>
		&nbsp;&nbsp;
		<c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
			<a href="productList.mdo?page=${ pageNum }&searchtype=${param.searchtype}&keyword=${param.keyword}&ordertype=${param.ordertype}"
				style="${(pageNum == paging.currentPage) ? 'color:red; font-style:italic;' : 'color:blue;'}">
				${ pageNum } </a>&nbsp;&nbsp; 
 		</c:forEach>
		<c:if test="${ paging.currentPage < paging.endPage }">
			<a href="productList.mdo?page=${ paging.currentPage + 1 }&searchtype=${param.searchtype}&keyword=${param.keyword}&ordertype=${param.ordertype}">다음</a>&nbsp;&nbsp;
 		</c:if>
		<!-- 다음 버튼 -->
		<c:if test="${ paging.next }">
			<a href="productList.mdo?page=${ paging.endPage +1 }&searchtype=${param.searchtype}&keyword=${param.keyword}&ordertype=${param.ordertype}">마지막페이지로</a>
		</c:if>
	</div>
	<br/>
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>