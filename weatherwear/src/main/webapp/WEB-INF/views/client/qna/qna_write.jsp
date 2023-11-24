<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_write.jsp</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />

</head>
<body>
	<%@ include file="../../client/base/header.jsp"%>
	<div class="qna_write">
		<h2>사용자 문의사항 글쓰기 페이지</h2>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> <strong>공지글 등록</strong>
				<!--새로고침 버튼-->
			</div>
			<div class="card-body">
				<form action="writeQna.do" method="post">
					<div id="table-reponsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>제목</th>
								<td><input type="text" name="qnaTitle" size="40" /></td>
							</tr>
							<tr>
								<th>질문 분류</th>
								<td>
									<select name="qnaType" class="form-control-osh-qna-insert">
											<option>회원정보</option>
											<option>상품확인</option>
											<option>주문/결제</option>
											<option>배송</option>
											<option>교환/취소(반품)</option>
											<option>서비스</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="qnaContent" cols="80" rows="10"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" class="center-group">
									<input type="submit" class="btn-write" value="공지글 등록">
									<!-- <input type="button" class="btn-write" value="취소" onclick="location.href='noticeList.mdo?gubun=notice'"/> -->
									<input type="button" class="btn-write" value="취소" onclick="location.href='clientQnaList.do'"/>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		
		
		<%@ include file="../../client/base/footer.jsp" %>
	</div>
</body>
</html>