

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<link href="resources/client/order/css/client_order_detail.css" type="text/css" rel="stylesheet" />
<title>사용자_주문내역_상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Style 태그는 head 태그 안에 있어야 합니다.-->
<script src="resources/client/js/order_detail.js"></script>
<script src="resources/client/js/reviewImage_insert.js"></script>
<style>
.product {
	position:relative;
	padding:0 0 0 400px;
	width:1000px;
	box-sizing:border-box;
}

.product .image {
	position:absolute;
	left:0;
}

.product .image > image {
	width:400px;
	height:480px;
	border:1px solid #EAEAEA;
}

div.clearfixed::after {
	display: block;
	content: "";
	clear: both
}

th {
 	padding:5px;
}

td {
 	padding:5px;
}

.top {
	width: 95%;
	padding-left: 80px;
	justify-content: space-evenly;
}

fieldset {
	width: 40%;
	height: 250px;
	text-align: center;
	float: left;
	padding-left: 50px;
}

.middle {
	padding:10px;
	display:flex;
	margin: 0 auto;
	justify-content: space-evenly;
}
</style>
<style>
	.starpoint_wrap{display:inline-block;}
	.starpoint_box{position:relative; background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0 no-repeat; font-size:0;}
	.starpoint_box .starpoint_bg{display:block; position:absolute; top:0; left:0; height:18px; background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 -20px no-repeat; pointer-events:none;}
	.starpoint_box .label_star{display:inline-block; width:10px; height:18px; box-sizing:border-box;}
	.starpoint_box .star_radio{opacity:0; width:0; height:0; position:absolute;}
	.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
	.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
	.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
	.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
	.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
	.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
	.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
	.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
	.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
	.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}
	.blind{position:absolute; clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}

#viewModal.modal-overlay {
	top: 30%;
    left: 50%;
    transform: translate(-50%, 0%);
    width: 100%;
    height: 100%;
    position: absolute;
    display: none;	/* 평소에 보이지 않게 하기 */
    flex-direction: column;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
}

#viewModal .modal-window{
    background: #aaaaaa;
    box-shadow: 0 5px 8px 0 rgb(37 37 37 / 56%);
    align-items: center;
    border-radius: 10px;
    width: 500px;
    height: auto;
    position: fixed;
    top: -41px;
    padding: 24px;
    padding-bottom: 100px;
}

#viewModal .title {
    padding-left: 10px;
    display: inline;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#viewModal .title h2 {
    display: inline;
}

#viewModal .close-view {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#viewModal .content {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
}


#writeModal.modal-overlay {
	top: 30%;
    left: 50%;
    transform: translate(-50%, 0%);
    width: 100%;
    height: 100%;
    position: absolute;
    display: none;	/* 평소에 보이지 않게 하기 */
    flex-direction: column;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
}

#writeModal .modal-window {
    background: #aaaaaa;
    box-shadow: 0 5px 8px 0 rgb(37 37 37 / 56%);
    align-items: center;
    border-radius: 10px;
    width: 500px;
    height: auto;
    position: fixed;
    top: -41px;
    padding: 24px;
    padding-bottom: 100px;
}

#writeModal .title {
    padding-left: 10px;
    display: inline;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#writeModal .title h2 {
    display: inline;
}

#writeModal .close-write {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#writeModal .content {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

</style>

</head>
<body>
	<%@ include file="../base/header.jsp"%>


	<div class="container">
		<div style="padding: 10px 0 10px 0">
			<span><a href="javascript:history.back()">돌아가기</a></span>&nbsp;
		</div>
		<div class="top">
			
			<c:forEach var="OrderDAO" items="${getOdInfo}" varStatus="i">
			<div class="product">
					<article class="image">
						<img src="${ OrderDAO.imageDir }${ OrderDAO.imageName }" onclick="location.href='productInfo.do?proId=${ OrderDAO.proId }'" style="width:300px; height:300px;">
					</article>
					<article class="sideText">
						<br>
						<table style="padding:30px;">
							<tr>
								<th> 주문 번호 : </th><td>${getOdStatus.odid}</td>
							</tr>
							<tr>
								<th> 주문 상태 : </th><td>${ getOdStatus.odStatus }</td>
							</tr>
							<tr>
								<th> 상품 이름 : </th><td>${OrderDAO.proName }</td>
							</tr>
							<tr>
								<th> 색 상 : </th><td>${OrderDAO.opColor }</td>
							</tr>
							<tr>
								<th> 사이즈 : </th><td>${OrderDAO.opSize }</td>
							</tr>
							<tr>
								<th> 수량 : </th><td>${OrderDAO.odProCnt }</td>
							</tr>
							<tr>
								<th> 상품 금액 : </th><td>${getPrice.odTotal} 원</td>
							</tr>
							<tr>
								<td colspan="2"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:if test="${ getOdStatus.odStatus != '배송완료' }">
										<a href="#">배송 조회</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
									<c:if test="${ getOdStatus.odStatus == '배송완료' }">
										<a href="#">반품/교환요청</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
									<a href="#">재구매</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<c:choose>
										<c:when test="${ OrderDAO.reId != null }">
											<a id="${ OrderDAO.reId }" onclick="showReview('${ OrderDAO }', '${getOdStatus.odid}')">리뷰보기</a>
										</c:when>
										<c:otherwise>
				    						<a id="${ OrderDAO.reId }" onclick="writeReview('${ OrderDAO }', '${getOdStatus.odid}')">리뷰쓰기</a>&nbsp;&nbsp;&nbsp;&nbsp;
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</article>
				</div>
				<div class="clearfixed"></div>
			</c:forEach>
		</div>
		<div class="clearfixed"></div>
		<div class="middle">
			<fieldset>
				<legend>배송지 정보</legend>
				<table>
					<tr>
						<th>수령인</th><td>${ getAdress.addName }</td>
					</tr>
					<tr>
						<th>연락처</th><td>${ getAdress.addNum }</td>
					</tr>
					<tr>
						<th>배송지<br><br><br></th><td>${ getAdress.addPostNum }<br>${getAdress.address1 }<br>${getAdress.address2 }</td>
					</tr>
					<tr>
						<th>배송메모</th><td>${ getAdress.addMemo }</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>결제 상세</legend>
				<table>
					<tr>
						<th>주문 금액</th><td>${ getPrice.odPrice } 원</td>
					</tr>
					<tr>
						<th>상품 금액</th><td>${ getPrice.odTotal } 원</td>
					</tr>
					<tr>
						<th>배송비</th><td>+ ${ getPrice.deliPrice } 원</td>
					</tr>
					<tr>
						<th>쿠폰 할인</th><td>- ${ getPrice.cpPrice } 원</td>
					</tr>
					<tr>
						<th>포인트 사용</th><td>- ${ getPrice.cpPrice } 원</td>
					</tr>
					<tr>
						<th>결제 방식</th><td> ${ getPrice.payMtd }</td>
					</tr>
					<tr>
						<th>포인트 적립 예정</th><td>  원</td>
					</tr>
				</table>
			</fieldset>
		<div class="clearfixed"></div>
		</div>
		
	</div>
	
	<!-- veiwReview modal -->
	<div id="viewModal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2 id="vireviewTitle"></h2>
			</div>
			<div class="close-view">X</div>
			<div class="modal-content">
				<br>
				<hr style="border:solid #DCDCDC; border-radius:1px;">
				<div>
					<table>
						<tr>
							<th>주문 번호</th><td><span id="viorderId"></span></td>
						</tr>
						<tr>
							<th>상품 이름</th><td><span id="viproName"></span></td>
						</tr>
						<tr>
							<th>색 상</th><td><span id="viopColor"></span></td>
						</tr>
						<tr>
							<th>사이즈</th><td><span id="viopSize"></span></td>
						</tr>
						<tr>
							<th>수 량</th><td><span id="reodProCnt"></span></td>
						</tr>
					</table>
					<h3>별점</h3>
					<!-- 별표 관련 html -->
					<div class="starpoint_wrap">
						<div class="starpoint_box">
							<label for="vistarpoint_1" class="label_star"></label>
							<label for="vistarpoint_2" class="label_star"></label>
							<label for="vistarpoint_3" class="label_star"></label>
							<label for="vistarpoint_4" class="label_star"></label>
							<label for="vistarpoint_5" class="label_star"></label>
							<label for="vistarpoint_6" class="label_star"></label>
							<label for="vistarpoint_7" class="label_star"></label>
							<label for="vistarpoint_8" class="label_star"></label>
							<label for="vistarpoint_9" class="label_star"></label>
							<label for="vistarpoint_10" class="label_star"></label>
							<input type="radio" name="reStar" id="vistarpoint_1" class="star_radio" value=0.5 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_2" class="star_radio" value=1 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_3" class="star_radio" value=1.5 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_4" class="star_radio" value=2 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_5" class="star_radio" value=2.5 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_6" class="star_radio" value=3 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_7" class="star_radio" value=3.5 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_8" class="star_radio" value=4 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_9" class="star_radio" value=4.5 disabled="disabled">
							<input type="radio" name="reStar" id="vistarpoint_10" class="star_radio" value=5 disabled="disabled">
							<span class="starpoint_bg"></span>
						</div>
					</div>
					<hr>
					<div>
						<table>
							<tr>
								<th>리뷰 내용</th><td><span id="virecontent"></span></td>
							</tr>
							<tr>
								<td colspan="2"><span id="vireImage"></span></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- writeReview modal -->
	<div id="writeModal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2 id="writeTitle"></h2>
			</div>
			<div class="close-write">X</div>
			<div class="modal-content">
				<br>
				<form action="writeReview.do" method="post" id="reviewPopForm" enctype="multipart/form-data">
					<input type="text" name="clientId">
					<input type="text" name="odId">
					<input type="text" name="opId">
					<hr style="border:solid #DCDCDC; border-radius:1px;">
					<div>
						<table>
							<tr>
								<th>주문 번호</th><td><span id="wrorderId"></span></td>
							</tr>
							<tr>
								<th>상품 이름</th><td><span id="wrproName"></span></td>
							</tr>
							<tr>
								<th>색 상</th><td><span id="wropColor"></span></td>
							</tr>
							<tr>
								<th>사이즈</th><td><span id="wropSize"></span></td>
							</tr>
							<tr>
								<th>수 량</th><td><span id="wrodProCnt"></span></td>
							</tr>
						</table>
						<h3>별점</h3>
						<!-- 별표 관련 html -->
						<div class="starpoint_wrap">
							<div class="starpoint_box">
								<label for="wrstarpoint_1" class="label_star"></label>
								<label for="wrstarpoint_2" class="label_star"></label>
								<label for="wrstarpoint_3" class="label_star"></label>
								<label for="wrstarpoint_4" class="label_star"></label>
								<label for="wrstarpoint_5" class="label_star"></label>
								<label for="wrstarpoint_6" class="label_star"></label>
								<label for="wrstarpoint_7" class="label_star"></label>
								<label for="wrstarpoint_8" class="label_star"></label>
								<label for="wrstarpoint_9" class="label_star"></label>
								<label for="wrstarpoint_10" class="label_star"></label>
								<input type="radio" name="reStar" id="wrstarpoint_1" class="star_radio" value=0.5>
								<input type="radio" name="reStar" id="wrstarpoint_2" class="star_radio" value=1>
								<input type="radio" name="reStar" id="wrstarpoint_3" class="star_radio" value=1.5>
								<input type="radio" name="reStar" id="wrstarpoint_4" class="star_radio" value=2>
								<input type="radio" name="reStar" id="wrstarpoint_5" class="star_radio" value=2.5>
								<input type="radio" name="reStar" id="wrstarpoint_6" class="star_radio" value=3>
								<input type="radio" name="reStar" id="wrstarpoint_7" class="star_radio" value=3.5>
								<input type="radio" name="reStar" id="wrstarpoint_8" class="star_radio" value=4>
								<input type="radio" name="reStar" id="wrstarpoint_9" class="star_radio" value=4.5>
								<input type="radio" name="reStar" id="wrstarpoint_10" class="star_radio" value=5>
								<span class="starpoint_bg"></span>
							</div>
						</div>
						<hr>
						<div>
							<table>
								<tr>
									<th>리뷰 내용</th>
									<td><textarea rows="8" cols="40" name="reContent" placeholder="리뷰를 작성해주세요"></textarea></td>
								</tr>
								<tr>
									<th>첨부 사진</th>
									<td>
										<input type="file" id="reviewImageUpload" name="review_img[]" multiple/>
		       							<ul id="reviewfileList"></ul>
		        						<ul id="reviewImageList"></ul>
		        						<input type="text" name="review_imageList" id="review_imageList">	
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="등록하기">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../base/footer.jsp" %>
</body>
</html>