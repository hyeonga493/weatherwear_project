<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<link href="resources/client/order/css/client_order_list.css" type="text/css" rel="stylesheet" />
<title>사용자_주문내역_조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Style 태그는 head 태그 안에 있어야 합니다.-->

</head>
<body>
	<%@ include file="../base/header.jsp"%>
<div class="container">
		<table border="1">
			<thead class="categoty">
				<tr>
					<th>주문번호</th>
					<th>이미지</th>
					<th>상품명</th>
				    <th>결제 방법</th>
				    <th>주문금액</th>
				    <th>주문상태</th>
				    <th>주문일시</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="OrderDAO" items="${getOrderList}"
						varStatus="i">
					<tr>
						<td><a href="clientDetail.do?clientId=${OrderDAO.clientId}&&odid=${OrderDAO.odid}">${OrderDAO.odid}</a></td>
						<td class="image">이미지</td>
						<td>${OrderDAO.addColumn }</td>
					    <td>결제 방법</td>
					    <td>${OrderDAO.odPrice}</td>
					    <td>${OrderDAO.odStatus }</td>
					    <td>${OrderDAO.odDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	
	
	
	</div>
	<%@ include file="../base/footer.jsp" %>
</body>
</html>