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
<title>Insert title here</title>
<script>

	//input text 태그 클릭하면 설명값 사라지도록 
  function clearText(thefield) {        
	if (thefield.defaultValue == thefield.value)            
	thefield.value = "";    
}
	
	
	
	
	
function submitFunction(){
	let coupon_choose =  document.querySelector('input[name="checked_coupon"]:checked');
	coupon_choose = coupon_choose.value;
	console.log(coupon_choose);
	/* */ //coupon_list.forEach((coupon)=> {
	    //if(coupon.checked)  {
			alert(coupon_choose);
			//console.log($(this).parent().find(".cpId_choose").val(coupon_list));
			//$(this).parent().find(".cpId_choose").val(coupon_list);
			$("input[name='cpId']").val(coupon_choose);

	   //}
	//})
	
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
			<section>
				<h6 class="grayText">
					<span>장바구니></span>주문결제 > 완료
				</h6>
			</section>
		</header>
		<aside class="sidebar">
			<h6 class="grayText">장바구니><span>주문결제</span>완료</h6>
			<table class="sideTable" border="2">
				<tr>
					<th>결제 상세</th>
				</tr>
			</table>
			<table class="sideDetailTable" border="2">
				<tr>
					<th>
						<details open>
							<p name="odPrice">주문금액 : ${odPrice} </p>
							<h6>상품금액 : ${toOrder_get_Price.odTotal}</h6>
							<h6>배송비 : + ${deliPrice}</h6>
							<h6>쿠폰할인 : - ${toOrder_get_coupon_choose.cpPrice}</h6>
							<h6>포인트할인 : -  ${usePoint} </h6>
						</details>
					</th>
				</tr>
			</table>			
			<table class="sideTable" border="2">
				<p>
				<tr>
					<th>포인트 혜택</th>
				</tr>
			</table>
			<table class="sideDetailTable" border="2">
				<tr>
					<th>
						<details open>
							<p>구매적립 : ${getPlusPoint}</p>
						</details>
						
					</th>
				</tr>
			</table>
		</aside>
		<div class="content">
			<article>
				<p></p>
				<p></p>
				<p></p>
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
							<h3>${i.index+1}번</h3>
							<h3>배송지 : ${Order. addId}</h3>
							<h3>수령인 :${Order. addName}</h3>
							<h3>전화번호 : ${Order. addNum}</h3>
							<h3>우편번호 : ${Order. addPostNum}</h3>
							<h3>주소 : ${Order. address1}</h3>
							<h3>상세주소 : ${Order. address2}</h3>
							<h3>배송메모 : ${Order. addMemo}</h3>
							<br>
							</c:forEach>
							</details>	
						</th>
					</tr>
					<tr>
						<th>기본 배송지</th>
					</tr>
					<tr>
						<th>
							<details open>
								<br>
								<h3>배송지 : ${toOrder_get_AddBase. addId}</h3>
								<h3>수령인 :${toOrder_get_AddBase. addName}</h3>
								<h3>전화번호 : ${OtoOrder_get_AddBaserder. addNum}</h3>
								<h3>우편번호 : ${toOrder_get_AddBase. addPostNum}</h3>
								<h3>주소 : ${toOrder_get_AddBase. address1}</h3>
								<h3>상세주소 : ${OtoOrder_get_AddBaserder. address2}</h3>
								<h3>배송메모 : ${toOrder_get_AddBase. addMemo}</h3> 
								<br>
							</details>	
						</th>
					</tr>
					<tr>
						<th>배송지 추가</th>
					</tr>
					<tr>
						<th>
							<details open>
							
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
								<h6>이름 :${toOrder_get_client.clientName }</h6>
								<h6>전화번호 :${toOrder_get_client.clientNum }</h6>
								<h6>이메일 :${toOrder_get_client.clientEmail }</h6>
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
								<c:forEach var="Order_product" items="${toOrder_get_cart}"
									varStatus="i">
									<c:if test="${not empty Order_product.opId}">
										<c:set var="opIdList"
											value="${opIdList}${Order_product.opId}${i.last ? '' : ','}" />
									</c:if>
									<br>
									<h3>${i.index+1}번</h3>
									<h3>opId : ${Order_product. opId}</h3>
									<h3>상품명 : ${Order_product. proName}</h3>
									<h3>색상 : ${Order_product. opColor}, 사이즈 : ${Order_product. opSize},
										수량 : ${Order_product.caCnt}</h3>
									<br>
								</c:forEach>
								
							</details>

						</th>
					</tr>
				</table>
				<table class="contentTable" border="2">
					<tr>
						<th>포인트 사용</th>
					</tr>
				</table>
				<table class="detailTable" border="2">
					<tr>
						<th>
							<details open>
							<form action="clientOrder/minusPrice.do" method="post">
								<p>보유 포인트 : ${toOrder_get_client.clientPoint}</p>
								<p>사용할 포인트 : ${usePoint}</p>
								<p><input type="text" value="사용할 포인트 입력" name="use_point"  onFocus="clearText(this)">
								<input type="hidden" name="clientId" value="<%=clientId%>">
								<input type="hidden" class="cpId_choose" name="cpId" value="${param.cpId_choose}">	
								<input type="hidden" name="caIdList" value="<%= caIdList %>">
								<input type="submit" value="사용" onclick="submitFunction()" ></p>
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
						<p>선택된 쿠폰</p>
						<p>쿠폰 명: ${toOrder_get_coupon_choose.cpName}, 쿠폰 할인 금액 : ${toOrder_get_coupon_choose.cpPrice}, 
						최소 사용 금액 : ${toOrder_get_coupon_choose.minPrice}</p>
							<details open>
								<p>보유 쿠폰</p>
								<form action="clientOrder/minusPrice.do" method="post">
									<c:forEach var="coupon" items="${toOrder_get_couponList}"
										varStatus="i">
										<p>
											<input type="radio" name="checked_coupon" id="checked_coupon" value="${ coupon.cpId }"><label>${i.index+1}</label>
											 ${coupon.cpId}
											쿠폰 명: ${coupon.cpName}, 쿠폰 할인 금액 : ${coupon.cpPrice}, 최소 사용
											금액 : ${coupon.minPrice}
									</p>
									</c:forEach>
									<p>caIdList: <%= caIdList %></p>
									<input type="hidden" name="clientId" value="<%=clientId%>">
									<input type="hidden" name="caIdList" value="<%= caIdList %>">
									<input type="hidden" name="use_point" value="${usePoint}">
									<input type="hidden" class="cpId_choose" name="cpId">
									<input type="submit" value="사용" onclick="submitFunction()" >
									<!-- <input type="submit" value="사용" > -->
								</form>

							</details>
						</th>
					</tr>
				</table>
				<table class="permitTable" border="2">
					<tr>
						<th>개인정보 제공 동의</th>
					</tr>
				</table>
				
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
			</article>
		</div>
		
    </div>
	<%@ include file="../base/footer.jsp" %>
</body>
</html>