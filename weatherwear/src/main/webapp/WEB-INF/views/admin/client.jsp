<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>회원관리 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/common.css">
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/card_add.css">
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/sub.css">

</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<main>
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
	</main>
	<script	src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>" crossorigin="anonymous"></script>
	<hr><hr><hr><br>
<div id="wrap">
	<div id="container">
		<section id="content">
			<div class="sub-type notice">
				<div class="inner-box"> 
					<article class="notice-area"> 
						<div class="menu-nav-wrap"> 
							<form id="searchForm" name="searchForm" action="client.mdo?page=1" method="post">
							
								<input type="hidden" id="page" name="page" value="${ paging.currentPage }" />
								
								<div class="select-type2" style="margin-top:20px; margin-left:250px;">
									<select id="searchtype" name="searchtype" style="width:130px;">
										<option ${ param.searchtype == 'clientId' ? 'selected' : '' } value="clientId">아이디</option>
										<option ${ param.searchtype == 'clientName' ? 'selected' : '' } value="clientName">이름</option>
										<option ${ param.searchtype == 'clientNickName' ? 'selected' : '' } value="clientNickName">닉네임</option>
										<option ${ param.searchtype == 'clientNum' ? 'selected' : '' } value="clientNum">전화번호</option>
										<option ${ param.searchtype == 'clientEmail' ? 'selected' : '' } value="clientEmail">이메일</option>
									</select>
									<input type="text" id="keyword" name="keyword" style="width:400px;" value="${ param.keyword }"> 
									<button type="submit" class="btn-search" style="border-radius: 8px; padding: 10px 24px;">검색</button>
								</div>
								<div class="table-type3" style = "position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
									<table>
										<thead>
											<tr>
												<th>ㅁ<input type="checkbox" name="checkProduct" value="checkAll"></th>
												<th>아이디</th>
												<th>닉네임</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>이메일수신동의여부</th>
												<th>등급</th>
												<th>포인트</th>
												<th>구매누적</th>
												<th>추천인</th>
												<th>수정하기</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="client" items="${ clientList }">
												<tr>
													<td>
														ㅁ<input type="checkbox" name="checkProduct" value="check">
													</td>
													<td>${ client.clientId }</td>
													<td>${ client.clientNickName }</td>
													<td>${ client.clientName }</td>
													<td>${ client.clientNum }</td>
													<td>${ client.clientEmail }</td>
													<td>${ client.clientEmailCheck }</td>
													<td>${ client.gradeId }</td>
													<td>${ client.clientPoint }</td>
													<td>${ client.clientBuyCnt }</td>
													<td>${ client.clientRecId }</td>
													<td><button type="button" id="updateClient" onclick="location.href='updateClient.mdo?clientId=${ client.clientId }&page=${paging.currentPage}&searchType=${ param.keyword }'">수정하기</button></td>
												</tr>
											</c:forEach>
										</tbody>
						 			</table>	
								</div>
							</form>
							<div class="paging">
							<!-- 페이징 처리 -->
								<!-- 이전 버튼 -->
								<c:if test="${ paging.prev }">
									<a href="client.mdo?page=${ startPage -1 }">처음페이지로</a>
								</c:if>&nbsp;	&nbsp;						
								<c:if test="${ paging.currentPage>1 }">
									<a href="client.mdo?page=${ paging.currentPage -1 }">이전</a>
								</c:if>&nbsp;&nbsp;
								
								<!-- 페이지 버튼 -->
								<c:forEach var="pageNum" begin="${ paging.startPage }" end="${ paging.endPage }">
									<a href="client.mdo?page=${ pageNum }&searchtype=${ param.searchtype }&keyword=${ param.keyword }"
										style="${ (pageNum == paging.currentPage) ? 'color:red; font-style:italic;' : 'color:blue;'}"> 
										${ pageNum } 
									</a>&nbsp;&nbsp;		
								</c:forEach>
								
								<c:if test="${ paging.currentPage < paging.endPage }">
									<a href="client.mdo?page=${ paging.currentPage + 1 }">다음</a>&nbsp;&nbsp;
								</c:if>
								<!-- 다음 버튼 -->
								<c:if test="${ paging.next }">
									<a href="client.mdo?page=${ paging.endPage +1 }">마지막페이지로</a>
								</c:if>
							</div>
						</div>	
					</article> 
				</div>
			</div> 
		</section>
	</div> 
</div> 
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>