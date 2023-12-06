<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>쿠폰관리 페이지</title>
<style>
.container{
	padding: 10px;
}

.table-type3{
	padding-left: 80px;
}
th {
	padding : 10px;
	text-align:center;
	border-bottom: 2px dotted grey;
}

td {
	padding : 10px;
	text-align:center;
	border-bottom: 2px dotted grey;
}
</style>
</head>
<body>
	<%@ include file="./base/header.jsp"%>

	<div id="wrap">
		<!-- container -->
		<div id="container"> 
			<section id="content">
				<div class="sub-type notice">
					<div class="inner-box"></div> 
						<article class="notice-area">
							<div class="notice-wrap">
								<form id="searchForm" name="searchForm" action="couponUser.do" method="post">
									<input type="hidden" id="type" name="type" value="N" /> 
									<input type="hidden" id="pageNo" name="pageNo" value="1" />
									<div class="table-type3" id="couponTable">
										<table>
											<colgroup>
												<col style="width: 100px">
												<col style="width: 300px">
												<col style="width: 230px">
												<col style="width: 230px">
												<col style="width: 130px">
											</colgroup>
											<thead>
												<tr>
													<th>NO.</th><th>쿠폰 이름</th><th>쿠폰 기간</th><th>사용 가능 여부</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="coupon" items="${ couponList }" varStatus="num">
													<tr>
														<td>${ num.index + 1 }</td>
														<td>${ coupon.cpName }</td>
														<td>
															<fmt:formatDate value="${ coupon.cpStDate }" pattern="yyyy-MM-dd"/>
															 ~ <fmt:formatDate value="${ coupon.cpEndDate }" pattern="yyyy-MM-dd"/>
														</td>
													<c:choose>
													  	<c:when test="${coupon.cpStatus == '사용가능'}">
													    	<td style="color:blue">${coupon.cpStatus }</td>
													  	</c:when>
													  	<c:when test="${coupon.cpStatus == '기간만료'}">
													    	<td>${coupon.cpStatus }</td>
													  	</c:when>
													  	<c:when test="${coupon.cpStatus == '사용불가'}">
													    	<td style="color:red">${coupon.cpStatus }</td>
													  </c:when>
													</c:choose>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="pagination">
										<ol>
											<c:if test="${noticePageMaker.prev}">
												<li><a href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.startPage - 1)}">이전</a></li>
											</c:if>
											<c:forEach begin="${noticePageMaker.startPage}" end="${noticePageMaker.endPage}" var="idx">
												<c:if test="${ noticePageMaker.endPage > 1 }">
													<li><a href="noticeList.do${noticePageMaker.makeQuery(idx)}">${idx + 1}</a></li>
												</c:if>
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
			</section>
		</div>
		<!-- //container -->
	</div>
	<%@ include file="./base/footer.jsp"%>
</body>
</html>
