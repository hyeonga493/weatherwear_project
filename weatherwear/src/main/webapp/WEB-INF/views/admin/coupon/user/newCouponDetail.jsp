<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>새 쿠폰 받기 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/common.css">
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/sub.css">
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/card_add.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
	<main>
	<div class="container-fluid">
		<h1 class="mt-4"></h1>
	</div>
	</main>
	<script src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>" crossorigin="anonymous"></script>
	<hr><hr><hr><br>
	
	<div id="wrap">
	
		<!-- container -->
		<div id="container">
			<section id="content">
				<div class="sub-type notice">
					<div class="inner-box">
						<article class="notice-area">
						<h2>새 쿠폰 받기 페이지</h2>
							<div class="notice-wrap">
								<form id="searchForm" name="searchForm" action="#" method="post">
									<input type="hidden" id="type" name="type" value="N" /> <input
										type="hidden" id="pageNo" name="pageNo" value="1" />
									<div class="table-type3"
										style="position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
										<table>
											<caption>news</caption>
											<colgroup>
												<col style="width: 106px">
												<col>
												<col style="width: 333px">
												<col style="width: 110px">
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>쿠폰이름</th>
													<th>유효기간</th>
													<th>쿠폰받기</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="board" items="${noticeBoardList }">
													<tr>
														<td>${board.seq }</td>
														<td><strong><a
																href="noticeDetail.do?seq=${board.seq}">[${board.flag }]
																	${board.title}</a></strong></td>
														<td><fmt:formatDate value="${board.regDate }"
																pattern="yyyy-MM-dd" /></td>
														<td>${board.cnt }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="pagination">
										<ol>
											<c:if test="${noticePageMaker.prev}">
												<li><a
													href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.startPage - 1)}">이전</a></li>
											</c:if>

											<c:forEach begin="${noticePageMaker.startPage}"
												end="${noticePageMaker.endPage}" var="idx">
												<li><a
													href="noticeList.do${noticePageMaker.makeQuery(idx)}">${idx}</a></li>
											</c:forEach>


											<c:if
												test="${noticePageMaker.next && noticePageMaker.endPage > 0}">
												<li><a
													href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.endPage + 1)}">다음</a></li>
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
