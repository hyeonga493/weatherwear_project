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

</head>
<body>
	<%@ include file="../../client/base/header.jsp"%>
		<div class="qna_detail">
			<h2>사용자 문의사항 상세페이지</h2>
			
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> <strong>문의글 상세보기</strong>
				<!--새로고침 버튼-->
			</div>
			<div class="card-body">
				<form action="updateMyPageQna.do" method="post"> 
					<div id="table-reponsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>글번호 </th>
								<td>${ clientQna.qnaId }</td>
								<input type="hidden" name="qnaId" value="${ clientQna.qnaId }">
								</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="qnaTitle" value="${clientQna.qnaTitle}" size="40" /></td>
							</tr>
							<tr>
								<th>질문분류</th>
								<td>${clientQna.qnaType}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea type="text" name="qnaContent" cols="80" rows="10" >${ clientQna.qnaContent }</textarea></td>
							</tr>
							<input type="hidden" name="clientId" value="${ clientQna.clientId }">
							<tr>
								<th>답변</th>
								<td>${ clientQna.qnaAnswer }</td>
							</tr>
							<tr>
								<td colspan="2" class="center-group">
									<input type="submit" class="btn-write" value="문의글 수정" />
									<input type="button" class="btn-write" value="삭제" onclick="location.href='deleteMyPageQna.do?qnaId=${ clientQna.qnaId }&clientId=${ clientQna.clientId }'"/>
									<input type="button" class="btn-write" value="취소" onclick="location.href='clientQnaMyPageList.do?clientId=${ clientQna.clientId }'"/>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>	
	<%@ include file="../../client/base/footer.jsp" %>
</body>
</html>