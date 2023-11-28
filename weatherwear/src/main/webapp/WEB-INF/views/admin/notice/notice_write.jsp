<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>공지글쓰기 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />

</head>
<body>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
	<!-- <ul> -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"></a>
				</div></li>
	</ul>
		<main>
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		</main>
		<script src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>" crossorigin="anonymous"></script>
		<hr><hr><hr><br>
		<!-- 메뉴관리 -> 메뉴 등록 페이지 -->
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> <strong>공지글 등록</strong>
				<!--새로고침 버튼-->
			</div>
			<div class="card-body">
				<form action="writeNotice.mdo" method="post">
					<div id="table-reponsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>제목</th>
								<td><input type="text" name="noTitle" size="40" /></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="noContent" cols="80" rows="10"></textarea></td>
							</tr>
							<input type="hidden" name="noWriter" value="${ client.clientName }">
							<tr>
								<td colspan="2" class="center-group">
									<input type="submit" class="btn-write" value="공지글 등록">
									<input type="button" class="btn btn-delete" value="취소" onclick="location.href='noticeList.mdo?gubun=notice'"/>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>