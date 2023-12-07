<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>결제내역 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/admin/css/notice/common.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

		<div id="wrap">
			<section id="content">
				<div>
					 <div class="inner-box"> 
						
							
							
							<article>
								<form>
									<input type="hidden" id="type" name="type" value="N" /> 
									<input type="hidden" id="pageNo" name="pageNo" value="1" />
									<div class="table-type3" style = "position: relative; margin-top: 28px; padding-bottom: 15px; border-bottom: 2px solid #111;">
										<table>
											<colgroup>
												<col style="width: 220px">
												<col>
												<col style="width: 130px">
												<col style="width: 110px">
											</colgroup>
											<thead>
												<tr>
													<th>결제 번호</th>
													<th>주문 번호</th>
													<th>결제 상태</th>
													<th>결제 수단</th>
													<th>회원 아이디</th>
													<th>결제일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="payment" items="${paymentList }">
													<tr>
														<td>${payment.payId}</td>
														<th>${payment.odId}</th>
 														<td>${payment.payMtd}</td>
														<td>${payment.payStatus}</td>
														<td>${payment.clientId}</td>
 														<td><fmt:formatDate value="${payment.payDate }" pattern="yyyy-MM-dd" /></td>
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
									<a href="paymentList.mdo?page=${ startPage -1 }">처음페이지로</a> 
								</c:if>&nbsp; &nbsp;     
								<c:if test="${ paging.currentPage>1 }">
									<a href="paymentList.mdo?page=${ paging.currentPage -1 }">이전</a> 
								</c:if>&nbsp;&nbsp;
								
								<!-- 페이지 버튼 -->
								<c:forEach var="pageNum" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="paymentList.mdo?page=${     pageNum     }"
								style="${ (pageNum == paging.currentPage) ? 'color:red; font-style:italic;' : 'color:blue;'}">
								${ pageNum }
								</a>&nbsp;&nbsp;      
								</c:forEach>
								
								<c:if test="${ paging.currentPage < paging.endPage }">
									<a href="paymentList.mdo?page=${ paging.currentPage + 1 }">다음</a>&nbsp;&nbsp; 
								</c:if>
								<!-- 다음 버튼 -->
								<c:if test="${ paging.next }">
								<a href="paymentList.mdo?page=${ paging.endPage +1 }">마지막페이지로</a> 
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