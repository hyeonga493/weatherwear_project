<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_detail.jsp</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<style>
.container {
	padding: 10px;
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

.qnaView {
	width:95%;
}
</style>
</head>
<body>
	<%@ include file="../../client/base/header.jsp"%>
		<div class="qna_detail container">
			
			<div class="card mb-4 qnaView">
				<div class="card-header">
					<strong>문의글 상세보기</strong>
				</div>
				<div class="card-body">
					<form action="updateMyPageQna.do" method="post"> 
						<div id="table-reponsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th>제목</th>
									<td>${clientQna.qnaTitle}</td>
								</tr>
								<tr>
									<th>분류</th>
									<td>${clientQna.qnaType}</td>
								</tr>
								<tr>
									<th>작성 일자</th>
									<td><fmt:formatDate value="${ clientQna.qnaDate }" pattern="yyyy-MM-dd"/></td>
								</tr>
								<tr>
									<th>내용</th>
									<td style="height:150px;">${ clientQna.qnaContent }</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${ clientQna.qnaAnswer == null }">
											<th>미답변</th>
											<td>빠른 시일 내로 답변도와드리겠습니다.</td>
										</c:when>
										<c:otherwise>
											<th>답변</th>
											<td>${ clientQna.qnaAnswer }</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td colspan="2" class="center-group">
										<input type="hidden" name="qnaId" value="${ clientQna.qnaId }">
										<input type="hidden" name="clientId" value="${ clientQna.clientId }">
										<input type="submit" class="btn-write" value="문의글 수정" />
										<input type="button" class="btn-write" value="삭제" onclick="location.href='deleteMyPageQna.do?qnaId=${ clientQna.qnaId }'"/>
										<input type="button" class="btn-write" value="취소" onclick="location.href='clientQnaMyPageList.do'"/>
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