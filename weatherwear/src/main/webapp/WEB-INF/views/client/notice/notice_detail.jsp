<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항 상세 페이지</title>
 
<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
</head>
<body>
	<%@ include file="../../client/base/header.jsp"%>
		<div class="notice_detail">
			<h2>사용자 공지사항 상세 페이지</h2>
			<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> <strong>공지글 상세보기</strong>
				<!--새로고침 버튼-->
			</div>
			<div class="card-body">
				<form action="updateNoticeBoard.mdo" method="post">
					<div id="table-reponsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>글번호</th>
								<td>${ clientNotice.noId }</td>
								<input type="hidden" name="noId" value="${clientNotice.noId }">
								</tr>
							<tr>
								<th>제목</th>
								<td>${ clientNotice.noTitle}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>${ clientNotice.noContent }</td>
							</tr>
							<tr>
								<td colspan="2" class="center-group">
									<input type="button" class="btn-write" value="취소" onclick="location.href='clientNotice.do'"/>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		</div>
	<%@ include file="../../client/base/footer.jsp" %>
</body>
</html>