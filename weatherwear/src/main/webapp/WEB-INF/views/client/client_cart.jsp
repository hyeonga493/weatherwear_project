<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String clientId = (String)session.getAttribute("clientId");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<link href="resources/client/css/cartStructure.css" type="text/css" rel="stylesheet" />
<title>client_cart.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Style 태그는 head 태그 안에 있어야 합니다.-->
<script type="text/javascript">
	$(document).ready(function() {
	    $("input[name='minus_btn']").click(function() {
	      var cntId = $(this).parent().find(".quantity_input").val();
	      var newVal = parseInt(cntId) - 1;
	      if (newVal >= 1) {
	         alert("상품의 수량이 -1 되었습니다.");
	         $(this).parent().find(".quantity_input").val(newVal);
	      }else if(newVal < 1){
	         alert("수량은 하나 이상이어야 합니다.");
	         newVal = 1;
	         $(this).parent().find(".quantity_input").val(newVal);
	      }
	      //$("input[name='caCnt']").val() = $(this).parent().find(".quantity_input").val();
	    });
	  });
	  $(document).ready(function() {
	       $("input[name='plus_btn']").click(function() {
	         var cntId = $(this).parent().find(".quantity_input").val();
	         var newVal = parseInt(cntId) + 1;
	            alert("상품의 수량이 +1 되었습니다.");
	            $(this).parent().find(".quantity_input").val(newVal);
	         //$("input[name='caCnt']").val() = $(this).parent().find(".quantity_input").val();
	       });
	     });
	  

//체크박스 전체 선택,해제 위해
$(document).ready(function () {
    $("#checkAllId").click(function () {
        $(".checkClass").prop("checked", this.checked);
    });

    $(".checkClass").click(function () {
        if ($(".checkClass:checked").length === $(".checkClass").length) {
            $("#checkAllId").prop("checked", true);
        } else {
            $("#checkAllId").prop("checked", false);
        }
    });
});

function submitFunction(){
	let CaIdList = "";
	
	$("#checked_cart:checked").each(function(num, item){
		
		if(num == 0){
			CaIdList += item.value;
		} else {
			CaIdList += "," + item.value;
		}
	});
	
	$("input[name='CaIdList']").val(CaIdList);
	
	console.log("String : " + CaIdList);}
	console.log("input : " + $("input[name='CaIdList']").val());

</script>

</head>
<body>
	<%@ include file="./base/header.jsp"%>

<div id="product_content">
	

	
	
	<header>
		<section class="process">
			<h1>Cart</h1>
		</section>
		<section>
			<h6 class="grayText">
				<span>장바구니></span>주문결제>완료
			</h6>
		</section>
	</header>
	<!-- 
		<h6 class="line">로그인 후 이용해주세요</h6>

		<div class="box1">광고 배너</div>
	
	<section class="main"> -->
	<div class="table_div">
		<table border="1">
			
				<tr>
					<td colspan="7"><input class="hiddenType" id="checked tab" type="radio" name="tabs" checked>
					<label for="checked tab">일반 상품</label></td>
				</tr>
				<tr class="category">
					<th>
						<input type="checkbox" id="checkAllId" name="checked_cart" >
					</th>
					<th>상품명</th>
					<th>상품 정보</th>
					<th>판매가/혜택</th>
					<th>수량</th>
					<th>소계</th>
					<th>주문/저장</th>
				</tr>
			
				<c:forEach var="CartDAO" items="${getCartList}" varStatus="i">
					<tr class="products">
						<td>
						<!-- 체크박스 form -->
							<form method="get" name="order_form" id="order_form">
							<!-- <label><input type="checkbox" name="checked_cart" value="${ CartDAO.caId }" onClick="get_checked_value()">이미지</label> -->
		      					<label><input type="checkbox" id="checked_cart" class="checkClass" name="checked_cart" value="${ CartDAO.caId }" >이미지</label>
							</form>	
							
							<!-- 삭제 데이터 전송 form 
							<form action="/w2/client/delete.do" method="post" class="product_delete_form">
								<input type="hidden" name="clientId" value="${cartDAO.clientId}">
								<input type="hidden" name="proId" class="delete_proId" value="${cartDAO.proId}">
							</form>-->
							
						</td>
						<td>${CartDAO.proName}</td>
						<td>사이즈 : ${CartDAO.opSize}, 색상 : ${CartDAO.opColor}
						</td>
						<td>${CartDAO.proPrice}</td>
						<td>
							<!-- form 태그로 수량 변경 추가- java로 보낼 정보 -->
							
							<div id="CartDAO.productCnt">
								<form action="clientCart/updateCaCnt.do" method="POST">
								<input name="minus_btn" class="minus_btn" type="button" value="-">
								<!-- <input type="text" name="quantity_input" size="2" class="quantity_input" data-caId="${CartDAO.caId}" value="${CartDAO.caCnt}" style="text-align:center;"> -->
								<input type="text" name="cntName" id="cntId" size="2" class="quantity_input" value="${CartDAO.caCnt}" style="text-align:center;">
								<input name="plus_btn" class="plus_btn" type="button" value="+">
								<p>
								<!--<a class="quantity_update_btn" data-cartId="${CartDAO.caId}">변경</a>-->
								<input type="hidden" name="clientId" value="${CartDAO.clientId}">
								<input type="hidden" name="caId" value="${CartDAO.caId}">
								<input type="hidden" name="caCnt" id="cntId" size="2" class="quantity_input" value="${CartDAO.caCnt}" style="text-align:center;"><!-- 수정된 값 java로 전송 위하여 수정값이랑 똑같은 id,class 기입 -->
								<input type="submit" value="변경">
								</form>							
							</div>
								
								
						</td>
						<td>${CartDAO.totalPrice}</td>
						<td><p>
							<form action="clientOrder.do" id="order_form" name="order_form"
								method="get">
								<input type="hidden" name="clientId" value="<%=clientId%>">
								<input type="hidden" id="checked_cart" class="checked_cart"
									name="CaIdList" value="${CartDAO.caId}"> <input
									type="submit" name="check_order_submit" value="바로주문">
							</form> &nbsp;&nbsp; <a
							href="clientCart/delete.do?caId=${CartDAO.caId}&&clientId=${CartDAO.clientId}"><input
								type="button" value="삭제"></a>
						</p></td>
					</tr>				
				</c:forEach>
		</table>
		</div>
		<div class="wrap">
		<p>선택한 상품 
		<form action="clientCart/deleteChecked.do" name="delete_hidden_form" method="post">
			<input type="hidden" name="clientId" value="${param.clientId}">
			<input type="hidden" id="checked_cart" class="checked_cart" name="CaIdList">
			<input type = "submit" name="delete_checked_submit" value = "삭제하기" onclick="submitFunction()">
		</form>
		
		<input class="btn" type="button" value="계속 쇼핑하기" onclick="location.href='#'"> 
	
		<form action="clientOrder.do" id="order_form" name="order_form" method="get">
			<input type="hidden" name="clientId" value="<%=clientId%>">        
			<input type="hidden" id="checked_cart" class="checked_cart" name="CaIdList">
			<input type="submit" name="check_order_submit" value="주문하기" onclick="submitFunction()">
		</form>
		</div>
		
<!-- 
	</section>
 -->
</div>
	<%@ include file="./base/footer.jsp" %>
</body>
</html>