<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>쿠폰관리 페이지</title>
</head>
<body>
	<%@ include file="./base/header.jsp"%>

	<div id="wrap">
		<div id="container"> 
			<section id="content">
				<div class="sub-type notice">
					<div class="inner-box">
						<article class="notice-area">
							</div> 
							<div class="notice-wrap">
								<form id="searchForm" name="searchForm" action="couponUser.do?clientId=''" method="post">
									<input type="hidden" id="type" name="type" value="N" /> 
									<input type="hidden" id="pageNo" name="pageNo" value="1" />
									<div class="table-type3" id="couponTable" style="position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
										<table>
											<colgroup>
												<col style="width: 300px">
												<col style="width: 300px">
												<col style="width: 230px">
												<col style="width: 230px">
												<col style="width: 130px">
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>쿠폰이름</th>
													<th>쿠폰 적용시작일</th>
													<th>쿠폰 만료일</th>
													<th>사용가능여부</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="coupon" items="${couponList }">
													<tr>
														<td>${coupon.cpId }</td>
														<td>${coupon.cpName}</td>
														<td><fmt:formatDate value="${coupon.cpStDate }" pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${coupon.cpEndDate }" pattern="yyyy-MM-dd" /></td>
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
								</form>
							</div>
						</article>
					</div>
				</div>
			</section>
		</div>
	</div>
	
	<%@ include file="./base/footer.jsp"%>
</body>
</html>
