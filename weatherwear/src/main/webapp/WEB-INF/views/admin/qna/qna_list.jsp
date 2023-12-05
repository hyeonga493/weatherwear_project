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

		<div id="wrap">
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
												<li><a href="noticeList.mdo?gubun=news">문의사항</a></li>
											</c:when>
											<c:when test="${param.gubun == 'news' }">
												<li><a href="noticeList.mdo?gubun=notice">공지사항</a></li>
												<li class="active"><a href="noticeList.mdo?gubun=news">문의사항</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="noticeList.mdo?gubun=notice">공지사항</a></li>
												<li><a href="noticeList.mdo?gubun=news">문의사항</a></li>
											</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
								
							<div class="notice-wrap">
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
										<table>
											<colgroup>
												<col style="width: 220px">
												<col>
												<col style="width: 120px">
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
												<c:forEach var="qna" items="${qnaBoardList }">
													<tr>
														<td>${qna.qnaId }</td>
														<th><strong><a href="qnaDetail.mdo?qnaId=${ qna.qnaId }">${qna.qnaTitle}</a></strong></th>
 														<td>${qna.clientId}</td>
 														<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
								</div>
								</form>
							</div>
							
							<div class="paging"> 
								<!-- 페이징 처리 -->
								<!-- 이전 버튼 -->
								<c:if test="${ paging.prev }">
									<a href="qnaList.mdo?page=${ startPage -1 }">처음페이지로</a> 
								</c:if>&nbsp; &nbsp;     
								<c:if test="${ paging.currentPage>1 }">
									<a href="qnaList.mdo?page=${ paging.currentPage -1 }">이전</a> 
								</c:if>&nbsp;&nbsp;
								
								<!-- 페이지 버튼 -->
								<c:forEach var="pageNum" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="qnaList.mdo?page=${     pageNum     }"
								style="${ (pageNum == paging.currentPage) ? 'color:red; font-style:italic;' : 'color:blue;'}">
								${ pageNum }
								</a>&nbsp;&nbsp;      
								</c:forEach>
								
								<c:if test="${ paging.currentPage < paging.endPage }">
									<a href="qnaList.mdo?page=${ paging.currentPage + 1 }">다음</a>&nbsp;&nbsp; 
								</c:if>
								<!-- 다음 버튼 -->
								<c:if test="${ paging.next }">
								<a href="qnaList.mdo?page=${ paging.endPage +1 }">마지막페이지로</a> 
								</c:if>
							</div>
						</article>
					</div>
				</div> 
			 </section>
		</div> 
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>