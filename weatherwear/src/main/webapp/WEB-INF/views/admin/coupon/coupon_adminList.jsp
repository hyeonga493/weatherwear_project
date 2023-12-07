<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>쿠폰관리 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/common.css">

</head>
<body>
	<c:if test="${client == null}">  
		<script>
			alert("잘못된 접근입니다. 다시 시도해주세요");
			location.href="/w2/clientMain.do";
		</script>
	</c:if>
	<c:if test="${client.clientId != 'admin'}">
		<script>
			alert("잘못된 접근입니다. 다시 시도해주세요");
			location.href="/w2/clientMain.do";
		</script>
	</c:if>	
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>
	<div id="wrap" style="height:height:2300px;">
		<section id="content">
			<div class="sub-type notice">
				 <div class="inner-box"> 
					<article class="notice-area"> 
					 	<h2 style="margin-top:10px;">쿠폰관리페이지</h2> 
						<div class="notice-wrap">
							<form id="searchForm" name="searchForm" action="couponList.mdo" method="post">
								<input type="hidden" id="type" name="type" value="N" /> 
								<input type="hidden" id="pageNo" name="pageNo" value="1" />
								<div class="table-type3" style = "position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
									<table>
										<colgroup>
											<col style="width: 230px">
											<col style="width: 350px">
											<col style="width: 100px">
											<col style="width: 150px">
											<col style="width: 150px">
											<col style="width: 100px">
											<col style="width: 100px">
										</colgroup>
										<thead>
											<tr>
												<th>쿠폰아이디</th>
												<th>쿠폰이름</th>
												<th>쿠폰할인금액</th>
												<th>최소주문금액</th>
												<th>쿠폰시작일</th>
												<th>쿠폰만료일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="couponAdmin" items="${couponAdminList }">
												<tr>
													<td>${couponAdmin.cpId }</td>
														<td>${couponAdmin.cpName}</td>
														<td>${couponAdmin.cpPrice}</td>
														<td>${couponAdmin.minPrice}</td>
														<td><fmt:formatDate value="${couponAdmin.cpStDate }" pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${couponAdmin.cpEndDate }" pattern="yyyy-MM-dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<input type="button" class="btn-write" style="width:150px; height:40px; margin-left:950px;"value="쿠폰 등록" onclick="location.href='coupon.mdo'">
								</div>
							</form>
						</div> 
					</article> 
				</div>
			 </div> 
		 </section>
	</div> 
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>