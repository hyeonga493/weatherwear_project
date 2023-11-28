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
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/card_add.css"> 
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/sub.css">
 
<script>

</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
		<main> 
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		</main> 
		<script src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>"
			crossorigin="anonymous"></script>
		<hr><hr><hr><br> 
		
		<div id="wrap">
			<!-- container -->
			<div id="container">
				<section id="content">
					<div class="sub-type notice">
						 <div class="inner-box"> 
							<article class="notice-area"> 
								 <div class="menu-nav-wrap">
								 	<h2>쿠폰관리페이지</h2> 
									</div>
								<div class="notice-wrap">
									<form id="searchForm" name="searchForm" action="couponList.mdo" method="post">
										<input type="hidden" id="type" name="type" value="N" /> 
										<input type="hidden" id="pageNo" name="pageNo" value="1" />
										<div class="table-type3" style = "position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
											<p class="side">총 ${countNoticeBoard }건</p>
											
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
										<div class="pagination">
											<ol>
											 	<c:if test="${noticePageMaker.prev}">
											 		<li><a href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.startPage - 1)}">이전</a></li>
											    </c:if> 
											    
												<c:forEach begin="${noticePageMaker.startPage}" end="${noticePageMaker.endPage}" var="idx">
													<li><a href="noticeList.do${noticePageMaker.makeQuery(idx)}">${idx}</a></li>
												</c:forEach>
											    
											    <c:if test="${noticePageMaker.next && noticePageMaker.endPage > 0}">
											    	<li><a href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.endPage + 1)}">다음</a></li>
											    </c:if> 
											</ol>
										</div>
									</form>
								</div> 
							</article> 
						</div>
					 </div> 
				 </section>
			 </div> 
			<!-- //container -->
		</div> 
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>