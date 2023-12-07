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
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/card_add.css"> 
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/sub.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>
		<div class="card-body">
			<form action="writeNotice.mdo" method="post">
				<div id="table-reponsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th>제목</th>
							<td><input type="text" name="noTitle" size="40" /></td>
						</tr>
						<tr>
							<th>질문 분류</th>
							<td>
								<select name="faq_type" class="form-control-osh-qna-insert">
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
							<td><textarea name="noContent" cols="80" rows="10"></textarea></td>
						</tr>
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
		
	<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>