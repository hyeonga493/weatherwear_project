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

<!-- 스마트에디터 적용 -->
<script type="text/javascript" src="resources/static/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" src="resources/admin/js/notice/usingEditor.js" charset="UTF-8"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>
	
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
								<td>
									<div id="smarteditor">
										<textarea name="noContent" id="noContent" rows="20" cols="10" placeholder="내용 입력해주세요" style="width:500px; border: 2px solid black"></textarea>
									</div>
								</td>
								<!-- <td><textarea name="noContent" cols="80" rows="10"></textarea></td> -->
							</tr>
							<input type="hidden" name="noWriter" value="${ client.clientName }">
							<tr>
								<td colspan="2" class="center-group">
									<input type="submit" class="btn-write" value="공지글 등록" onClick="submitPost()">
									<input type="button" class="btn-write" value="취소" onclick="location.href='noticeList.mdo?gubun=notice'"/>
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