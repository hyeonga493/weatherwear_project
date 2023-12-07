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
<link href="resources/client/css/client_input_style.css" rel="stylesheet" />
<style>
.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
}

.table-bordered td, .table-bordered th {
    border: 1px solid #dee2e6;
}

.table td, .table th {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
</style>
</head>
<body>
	<%@ include file="../../client/base/header.jsp"%>
	<div class="qna_write">
		<div class="card-body">
			<form action="writeQna.do" method="post">
				<div id="table-reponsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th style="width: 80px;">제목</th>
							<td><input type="text" name="qnaTitle" size="40" placeholder="제목을 입력해주세요"/></td>
						</tr>
						<tr>
							<th>분류</th>
							<td>
								<select name="qnaType" class="form-control-osh-qna-insert">
									<option>회원정보</option>
									<option>상품문의</option>
									<option>주문/결제</option>
									<option>배송</option>
									<option>교환/취소(반품)</option>
									<option>서비스</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="height:100px;"><textarea name="qnaContent" cols="80" rows="20" style="height: 100px; padding:10px;" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" class="center-group">
								<input type="hidden" name="clientId" value="${ client.clientId }">
								<input type="submit" class="btn-write" value="문의글 등록">
							</td>
							<td colspan="2" class="center-group">
								<input type="button" class="btn-write" value="취소" onclick="location.href='clientQnaMyPageList.do'"/>
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