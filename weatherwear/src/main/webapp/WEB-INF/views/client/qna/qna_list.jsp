<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_list.jsp</title>
</head>
<body>
	<%@ include file="../../client/base/header.jsp"%>
	<div class="qna_list">
		<h2>사용자 문의사항 페이지</h2>
		
		<div id="wrap">
			<!-- container -->
			<div id="container">
				<section id="content">
					<div class="sub-type notice">
						 <div class="inner-box"> 
							<article class="notice-area"> 
								<div class="notice-wrap">
									<form id="searchForm" name="searchForm" action="clientQnaList.do" method="post">
										<input type="hidden" id="type" name="type" value="N" /> 
										<input type="hidden" id="pageNo" name="pageNo" value="1" />
										<div class="select-type2" style="margin-top:20px; margin-left:250px;">
											<select id="search_qnaSelect" name="qnaSelectType" style="width:130px;">
												<option value="subject">제목</option>
												<option value="content">내용</option>
											</select>
											<input type="text" id="search_qnaText" name="qnaKeyword" style="width:400px;"> 
											<button type="submit" class="btn-search" style="border-radius: 8px; padding: 10px 24px;">검색</button>
										</div>
										<div class="table-type3" style = "position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
											<p class="side">총 ${countNoticeBoard }건</p>
											
											<table>
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
													<c:forEach var="qna" items="${qnaList }" varStatus="num"> 
														<tr>
															<td>${ (paging.currentPage -1) * 20 + 1 + num.index}</td>
															<td><strong><a href="qnaDetail.do?qnaId=${ qna.qnaId }">${qna.qnaTitle}</a></strong></td>
	 														<td>${qna.clientId}</td>
	 														<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd" /></td>
	 														<td>${qna.qnaStatus}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<button type="button" id="qnaBtn" class="btn-write" style="margin-left:1000px;" onclick="location.href='writeQnaView.do'">문의사항 글쓰기</button>
										</div>
									</form>
								</div> 
								
								<div class="paging"> 
								<!-- 페이징 처리 -->
								<!-- 이전 버튼 -->
								<c:if test="${ paging.prev }">
									<a href="clientQnaList.do?page=${ startPage -1 }">처음페이지로</a> 
								</c:if>&nbsp; &nbsp;     
								<c:if test="${ paging.currentPage>1 }">
									<a href="clientQnaList.do?page=${ paging.currentPage -1 }">이전</a> 
								</c:if>&nbsp;&nbsp;
								
								<!-- 페이지 버튼 -->
								<c:forEach var="pageNum" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="clientQnaList.do?page=${ pageNum }"
								style="${ (pageNum == paging.currentPage) ? 'color:red; font-style:italic;' : 'color:blue;'}">
								${ pageNum }
								</a>&nbsp;&nbsp;      
								</c:forEach>
								
								<c:if test="${ paging.currentPage < paging.endPage }">
									<a href="clientQnaList.do?page=${ paging.currentPage + 1 }">다음</a>&nbsp;&nbsp; 
								</c:if>
								<!-- 다음 버튼 -->
								<c:if test="${ paging.next }">
								<a href="clientQnaList.do?page=${ paging.endPage +1 }">마지막페이지로</a> 
								</c:if>
							</div>
							</article> 
						</div>
					 </div> 
				 </section>
			 </div> 
			<!-- //container -->
		</div> 
		<%@ include file="../../client/base/footer.jsp" %>
	</div>
</body>
</html>