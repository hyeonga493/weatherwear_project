<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLDecoder" %>

<%  
  String caIdList = request.getParameter("CaIdList");
  if (caIdList != null) {
      // URL 디코딩
      caIdList = URLDecoder.decode(caIdList, "UTF-8");
  }
%>
    <%String clientId = (String)session.getAttribute("clientId");%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="resources/client/css/style.css" rel="stylesheet" />
	<link href="resources/client/order/css/orderStructure.css" type="text/css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 주소 검색 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/daum_post.js"></script>
	<script src="resources/js/client_join.js"></script>
<title>Insert title here</title>
<script>

//전화번호 자리 자동 이동
function checkL(id, next) {
	var addNum = document.getElementById(id);
	if (addNum.value.length == addNum.maxLength) {
		document.getElementById(next).focus();
	}
}

//전화번호 통합 >>> 안되고있음
/**/
function madeaddNum(){
	var addNum_1 = document.getElementById("addNum_1").value;
	var addNum_2 = document.getElementById("addNum_2").value;
	var addNum_3 = document.getElementById("addNum_3").value;
	
	var addNum = addNum_1 + "" + addNum_2 + "" + addNum_3;
	document.getElementById("addNum").value = addNum;
}

	//input text 태그 클릭하면 설명값 사라지도록 
function clearText(thefield) {        
	if (thefield.defaultValue == thefield.value)            
	thefield.value = "";    
}
	
function submitFunction(){
	let coupon_choose =  document.querySelector('input[name="checked_coupon"]:checked');
	coupon_choose = coupon_choose.value;
	console.log(coupon_choose);
	alert(coupon_choose);
	$("input[name='cpId']").val(coupon_choose);
}
</script>
</head>
<body>
	<%@ include file="../base/header.jsp"%>

	<div id="product_content">
			
		<header>
			<section class="process">
				<h1>Order</h1>
			</section>
		</header>
		<aside class="sidebar">
			<table class="sideTable" border="2">
				<tr>
					<th>결제 상세</th>
				</tr>
			</table>
			<table class="sideDetailTable" border="2">
				<tr>
					<th>
						<details open>
							<table>
								<tr>
									<th>주문 금액 : </th>
								<c:choose>
									<c:when test="${ odPrice == 0 }">
										<td>${toOrder_get_Price.odTotal}</td>
									</c:when>
									<c:otherwise>
										<td>${odPrice}</td>
									</c:otherwise>
								</c:choose>
								</tr>
								<tr>
									<th>상품 금액 : </th><td>${ toOrder_get_Price.odTotal }</td>							
								</tr>
								<tr>
									<th>배 송 비 : </th><td>+ ${ deliPrice}</td>							
								</tr>
								<tr>
									<th>쿠폰 할인 : </th><td>- ${ toOrder_get_coupon_choose.cpPrice }</td>							
								</tr>
								<tr>
									<th>적용 포인트 : </th><td>- ${ usePoint }</td>							
								</tr>
								<tr>
									<th>적립 예정 포인트 : </th><td> ${getPlusPoint}</td>							
								</tr>
							</table>
						</details>
					</th>
				</tr>
			</table>	
			<br><br>
			<form action="clientPay.do" method="post">
				<input type="hidden" name="odid" value="${odid}">
				<input type="hidden" name="clientId" value="${param.clientId}">
				<input type="hidden" name="addId" value="${toOrder_get_AddBase.addId}"><!-- 일단 기본배송지에서 보내지는 걸로 -->
				<input type="hidden" name="usedpoint" value="${param.usePoint}">
				<input type="hidden" name="plusPoint" value="${getPlusPoint}">
				<input type="hidden" name="cpId" value="${param.cpId_choose}">
				<input type="hidden" name="opIdList" value="${opIdList}"><!-- opId는 for문으로 java에서 -->
				<input type="hidden" name="odStatus" value="배송준비중"><!-- 기본값으로 배송준비중 입력 -->
				<input type="hidden" name="caIdList" value="<%= caIdList %>">
				<input type="hidden" name="caId" value="${toOrder_get_Price.caId }">
				<input type="hidden" name="odPrice" value="${odPrice}">
				<input type="hidden" name="caCnt" value="${toOrder_get_Price.caCnt}">
				<input id="btn" type="submit" value="결제하기">
			</form>	
		</aside>
		<div class="content">
			<article>
				<table class="contentTable" border="2">
					<tr>
						<th>배송지 목록</th>
					</tr>
				</table>
				<table class="detailTable" border="2">
					<tr>
						<th>
							<details open>
							<c:forEach var="Order" items="${ toOrder_get_AddList}" varStatus="i">
								<br>
								<table style="width:600px;">
									<tr>
										<th>배송지 이름 : </th><td colspan="2">${Order. addId}</td>
										<td>
											<c:choose>	
												<c:when test="${ toOrder_get_AddBase. addId == Order. addId }">
													<font color="blue">기본 배송지</font>
													<input type="button" value="기본 배송지 변경">
												</c:when>
												<c:otherwise>
													<input type="button" name="${i.index+1}" value="선택하기">
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>수 령 인 : </th><td>${Order. addName}</td><th>전화 번호 : </th><td>${Order. addNum}</td>
									</tr>
									<tr>
										<th>우편 번호 : </th><td>${Order. addPostNum}</td>
									</tr>
									<tr>
										<th>기본 주소 : </th><td colspan="3">${Order. address1} / ${Order. address2}</td>
									</tr>
									<tr>
										<th>기본 배송 메모 : </th><td>${Order. addMemo}</td>
									</tr>
								</table>
							</c:forEach>
							</details>	
						</th>
					</tr>
					<tr>
						<th>신규 배송지</th>
					</tr>
					<tr>
						<th>
							<details open>
								<table style="width:800px;">
										<tr>
											<th>배송지 이름 : </th><td colspan="2"><input type="text" name="addId"></td>
											<td>
												<input type="checkbox" value="">기본 배송지로 설정
											</td>
										</tr>
										<tr>
											<th>수 령 인 : </th><td><input type="text" name="addName"></td>
										</tr>
										<tr>
											<th>전화 번호 : </th>
											<td>
											<input type="text" name="addNum_1" id="addNum_1" required="required" placeholder="010" maxlength="3" size="3" onkeyup="checkL('addNum_1', 'addNum_2')"> - 
											<input type="text" name="addNum_2" id="addNum_2" required="required" maxlength="4" size="4" onkeyup="checkL('addNum_2', 'addNum_3')"> - 
											<input type="text" name="addNum_3" id="addNum_3" required="required" maxlength="4" size="4">
											<br>
											<input type="hidden" name="addNum" id="addNum" required="required">
											</td>
										</tr>
										<tr>
											<th>우편 번호 : </th>
											<td>
												<input type="text" name="addPostNum" id="addPostNum" readonly="readonly" placeholder="우편 번호">
												<button type="button" onclick="daumPost()">Find Postnumber</button><br>
											</td>
										</tr>
										<tr>
											<th>주소 : <br></th>
											<td colspan="3">
												<input type="text" name="address1" id="address1" readonly="readonly" placeholder="기본 주소"><br>
												<input type="text" name="address2" id="address2" placeholder="상세 주소를 입력해주세요"><br>	
											</td>
										</tr>
										<tr>
											<th>기본 배송 메모 : </th><td><input type="text" name="addMemo" placeholder="베송 메모를 입력해주세요"></td>
										</tr>
									</table>
							</details>	
						</th>
					</tr>
				</table>
				<table class="contentTable" border="2">
					<p>
					<tr>
						<th>주문자</th>
					</tr>
				</table>
				<table class="detailTable" border="2">
					<tr>
						<th>
							<details open>
								<table>
									<tr>
										<th>이 름 : </th><td>${toOrder_get_client.clientName }</td>
									</tr>
									<tr>
										<th>전화번호 : </th><td>${toOrder_get_client.clientNum }</td>
									</tr>
									<tr>
										<th>이메일 : </th><td>${toOrder_get_client.clientEmail }</td>
									</tr>
								</table>
								<input type="button" value="변경">
							</details>
						</th>
					</tr>
				</table>
				<table class="contentTable" border="2">
					<p>
					<tr>
						<th>주문상품</th>
					</tr>
				</table>
				<table class="detailTable" border="2">	
					<tr>
						<th>
							<details open>
								<c:set var="opIdList" value="" />
								<c:forEach var="Order_product" items="${toOrder_get_cart}" varStatus="i">
									<c:if test="${not empty Order_product.opId}">
										<c:set var="opIdList" value="${opIdList}${Order_product.opId}${i.last ? '' : ','}" />
									</c:if>
									<br>
									<table style="width: 600px;">
										<tr>
											<th>상 품</th><th>색 상</th><th>사이즈</th><th>수 량</th>
										</tr>
										<tr>
											<td>${Order_product. proName}</td><td>${Order_product. opColor}</td><td>${Order_product. opSize}</td><td>${Order_product.caCnt}</td>
										</tr>
									</table>
								</c:forEach>
								
							</details>

						</th>
					</tr>
				</table>
				<table class="contentTable" border="2">
					<p>
					<tr>
						<th>포인트 사용</th>
					</tr>
				</table>
				<table class="detailTable" border="2">
					<tr>
						<th>
							<details open>
							<form action="clientOrder/minusPrice.do" method="post">
								<table>
									<tr>
										<th>보유 포인트 :</th><td>${toOrder_get_client.clientPoint}</td>
									</tr>
									<tr>
										<th>사용 포인트 :</th>
										<td>
											<input type="text" value="포인트를 입력해주세요" name="use_point" value="${ usePoint }" onFocus="clearText(this)">
											<input type="submit" value="사용" onclick="submitFunction()" >
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<input type="hidden" name="clientId" value="<%=clientId%>">
											<input type="hidden" class="cpId_choose" name="cpId" value="${param.cpId_choose}">	
											<input type="hidden" name="caIdList" value="<%= caIdList %>">
											
										</td>
									</tr>
								</table>
							</form>
							</details>
						</th>
					</tr>
				</table>
				<table class="contentTable" border="2">
					<p>
					<tr>
						<th>쿠폰 사용</th>
					</tr>
				</table>
				<table class="detailTable" border="2">
					<tr>
						<th>
							<c:if test="${ toOrder_get_coupon_choose != null }">
								<table>
									<tr>
										<th colspan="2">적용 쿠폰</th>
									</tr>
									<tr>
										<th>쿠폰 이름 :</th>
										<td>${toOrder_get_coupon_choose.cpName}</td>
									</tr>
									<tr>
										<th>쿠폰 할인 금액 :</th>
										<td>${toOrder_get_coupon_choose.cpPrice}</td>
									</tr>
									<tr>
										<th>쿠폰 적용 조건 :</th>
										<td>${toOrder_get_coupon_choose.minPrice} 원 이상 주문시</td>
									</tr>
								</table>
							</c:if>
							<details open>
								<p>보유 쿠폰</p>
								<form action="clientOrder/minusPrice.do" method="post">
									<c:forEach var="coupon" items="${toOrder_get_couponList}" varStatus="i">
										<table>
											<tr>
												<th><input type="radio" name="checked_coupon" id="checked_coupon" value="${ coupon.cpId }"><label>${i.index+1}</label></th>
											</tr>
											<tr>
												<th>쿠폰 이름 :</th>
												<td>${coupon.cpName}</td>
											</tr>
											<tr>
												<th>쿠폰 할인 금액 :</th>
												<td>${coupon.cpPrice}</td>
											</tr>
											<tr>
												<th>쿠폰 적용 조건 :</th>
												<td>${coupon.minPrice}<c:if test="${ coupon.minPrice == null }">0</c:if> 원 이상 주문시</td>
											</tr>
										</table>
									</c:forEach>
									<p>caIdList: <%= caIdList %></p>
									<input type="hidden" name="clientId" value="<%=clientId%>">
									<input type="hidden" name="caIdList" value="<%= caIdList %>">
									<input type="hidden" name="use_point" value="${usePoint}">
									<input type="hidden" class="cpId_choose" name="cpId">
									<input type="submit" value="사용" onclick="submitFunction()" >
								</form>
							</details>
						</th>
					</tr>
				</table>
			</article>
		</div>
		
    </div>
	<%@ include file="../base/footer.jsp" %>
</body>
</html>