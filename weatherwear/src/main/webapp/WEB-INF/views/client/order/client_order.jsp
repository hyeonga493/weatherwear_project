<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<link href="resources/client/order/css/cartStructure.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
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
							<p>주문금액</p>
							<h6>상품금액</h6>
							<h6>배송비</h6>
							<h6>쿠폰할인</h6>
							<h6>카드 간편결제</h6>
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
							<p>구매적립</p>
							<h6>기본적립</h6>
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
						<th>배송지</th>
					</tr>
				</table>
				<table class="detailTable" border="2">
					<tr>
						<th>
							<details open>
								<p>이름 :       </p>
								<h6>전화번호 :     </h6>
								<h6>배송지 :     </h6>
								<h6>배송메모 :   </h6>
								<input type="button" value="변경">
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
								<h6>이름 :   </h6>
								<h6>전화번호 :     </h6>
								<h6>이메일 :     </h6>
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
								<p>상품명</p>
								<p>옵션</p>
								<p>상품 가격</p>
								<p>주문 가격</p>
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
								<p>보유 포인트</p>
								<p><input type="input" value="사용할 포인트 입력">
								<input type="button" value="사용"></p>
							</details>
						</th>
					</tr>
				</table>
				<table class="contentTable" border="2">
					<p>
					<tr>
						<th>결제수단 선택</th>
					</tr>
				</table>
				<table class="detailTable" border="2">
					<tr>
						<th>
							<details open>
								<p></p>
								<input type="button" value="카드 간편결제">
								<p></p>
								<input type="button" value="일반결제">
							</details>	
						</th>
					</tr>
				</table>
				<table class="permitTable" border="2">
					<p>
					<tr>
						<th>개인정보 제공 동의</th>
					</tr>
				</table>
				<p>
				<button id="btn" type="button">결제하기</button>
			</article>
		</div>
		
    </div>
	<%@ include file="../base/footer.jsp" %>
</body>
</html>