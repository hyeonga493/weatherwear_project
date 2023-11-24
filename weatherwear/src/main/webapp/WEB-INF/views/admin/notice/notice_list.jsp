<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>공지 / 문의사항 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/common.css">
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/card_add.css"> 
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/sub.css">

<script>

</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
		<main> 
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		</main> 
		<script src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>"
			crossorigin="anonymous"></script>
		<hr><hr><hr><br> 
		<h2>공지 / 문의사항 페이지</h2>
		
		<div id="wrap">
			<!-- container -->
			<div id="container">
				<section id="content">
					<div class="sub-type notice">
						 <div class="inner-box"> 
							<article class="notice-area"> 
								 <div class="menu-nav-wrap"> 
									<div class="menu-nav">
										<ul>
											<c:choose>
												<c:when test="${param.gubun == 'notice' }">
													<li class="active"><a href="noticeList.mdo?gubun=notice">공지사항</a></li>
													<!-- <li><a href="noticeList.mdo?gubun=news">문의사항</a></li>  -->
													<li><a href="qnaList.mdo">문의사항</a></li> 
												</c:when>
												<c:when test="${param.gubun == 'news' }">
													<li><a href="noticeList.mdo?gubun=notice">공지사항</a></li>
													<!-- <li class="active"><a href="noticeList.mdo?gubun=news">문의사항</a></li>  -->
													<li class="active"><a href="qnaList.mdo">문의사항</a></li> 
												</c:when>
												<c:otherwise>
													<li><a href="noticeList.mdo?gubun=notice">공지사항</a></li>
													<!-- <li><a href="noticeList.mdo?gubun=news">문의사항</a></li> -->
													<li><a href="qnaList.mdo">문의사항</a></li> 
												</c:otherwise>
												</c:choose>
											</ul>
										</div>
									</div>
									
								<div class="notice-wrap">
								
								<c:choose>
								<c:when test="${param.gubun == 'notice' }">
									<form id="searchForm" name="searchForm" action="noticeList.mdo?gubun=notice" method="post">
										<input type="hidden" id="type" name="type" value="N" /> 
										<input type="hidden" id="pageNo" name="pageNo" value="1" />
										<div class="select-type2" style="margin-top:20px; margin-left:250px;">
											<select id="search_noticeSelect" name="noType" style="width:130px;">
												<option value="subject">제목</option>
												<option value="content">내용</option>
											</select>
											<input type="text" id="search_noticeText" name="noKeyword" style="width:400px;"> 
											<button type="submit" class="btn-search" style="border-radius: 8px; padding: 10px 24px;">검색</button>
										</div>
										<div class="table-type3" style = "position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
											<p class="side">총 ${countNoticeBoard }건</p>
											
											<table>
												<caption>news</caption>
												<colgroup>
													<col style="width: 220px">
													<col>
													<col style="width: 130px">
													<col style="width: 110px">
												</colgroup>
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>등록일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="board" items="${noticeBoardList }">
														<tr>
															<td>${board.noId }</td>
															<th><strong><a href="noticeDetail.mdo?noId=${ board.noId }">${board.noTitle}</a></strong></th>
	 														<td>${board.noWriter}</td>
	 														<td><fmt:formatDate value="${board.noDate }" pattern="yyyy-MM-dd" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<button type="button" id="noticeBtn" class="btn-write" style="margin-left:1000px;" onclick="location.href='writeNoticeView.mdo'">공지 글쓰기</button>
											
										</div>
										<div class="pagination">
											<ol>
											 	<c:if test="${noticePageMaker.prev}">
											 		<li><a href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.startPage - 1)}">이전</a></li>
											    </c:if> 
											    
												<c:forEach begin="${noticePageMaker.startPage}" end="${noticePageMaker.endPage}" var="idx">
													<li><a href="noticeList.do${noticePageMaker.makeQuery(idx)}">${idx}</a></li>
												</c:forEach>
											    
											    <c:if test="${noticePageMaker.next && noticePageMaker.endPage > 0}">
											    	<li><a href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.endPage + 1)}">다음</a></li>
											    </c:if> 
											</ol>
										</div>
									</form>
									</c:when>
									</c:choose>
									
								<c:choose>
								<c:when test="${param.gubun == 'news' }">
									<form id="searchForm" name="searchForm" action="qnaList.mdo" method="post">
										<input type="hidden" id="type" name="type" value="N" /> 
										<input type="hidden" id="pageNo" name="pageNo" value="1" />
										<div class="select-type2" style="margin-top:20px; margin-left:250px;">
											<select id="search_noticeSelect" name="qnaSelectType" style="width:130px;">
												<option value="subject">제목</option>
												<option value="content">내용</option>
											</select>
											<input type="text" id="search_noticeText" name="qnaKeyword" style="width:400px;"> 
											<button type="submit" class="btn-search" style="border-radius: 8px; padding: 10px 24px;">검색</button>
										</div>
										<div class="table-type3" style = "position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
											<p class="side">총 ${countNoticeBoard }건</p>
											
											<table>
												<caption>news</caption>
												<colgroup>
													<col style="width: 220px">
													<col>
													<col style="width: 130px">
													<col style="width: 110px">
													<col style="width: 110px">
												</colgroup>
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>등록일</th>
														<th>답변상태</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="qna" items="${qnaBoardList }">
														<tr>
															<td>${qna.qnaId }</td>
															<th><strong><a href="qnaDetail.mdo?qnaId=${ qna.qnaId }">${qna.qnaTitle}</a></strong></th>
	 														<td>${qna.clientId}</td>
	 														<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd" /></td>
	 														<td>${qna.qnaStatus}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											
											<c:choose>
												<c:when test="${param.gubun == 'notice' }">
													<button type="button" id="noticeBtn" class="btn-write" style="margin-left:1000px;" onclick="location.href='writeNoticeView.mdo'">공지 글쓰기</button>
													<button type="button" id="faqBtn" class="btn-write" style="display : none;" onclick="">문의사항 글쓰기</button> 
												</c:when>
											
												<c:when test="${param.gubun == 'news' }">
													<button type="button" id="noticeBtn" class="btn-write" style="display : none;">공지 글쓰기</button>
													<button type="button" id="faqBtn" class="btn-write" style="margin-left:1000px;" onclick="location.href='writeQna.mdo'">문의사항 글쓰기</button>
												</c:when>
											</c:choose>
										</div>
										<div class="pagination">
											<ol>
											 	<c:if test="${noticePageMaker.prev}">
											 		<li><a href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.startPage - 1)}">이전</a></li>
											    </c:if> 
											    
												<c:forEach begin="${noticePageMaker.startPage}" end="${noticePageMaker.endPage}" var="idx">
													<li><a href="noticeList.do${noticePageMaker.makeQuery(idx)}">${idx}</a></li>
												</c:forEach>
											    
											    <c:if test="${noticePageMaker.next && noticePageMaker.endPage > 0}">
											    	<li><a href="noticeList.do${noticePageMaker.makeQuery(noticePageMaker.endPage + 1)}">다음</a></li>
											    </c:if> 
											</ol>
										</div>
									</form>
									</c:when>
									</c:choose>
									
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