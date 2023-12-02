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
	  

	  /*$(document).ready(function() {
		  $("input[name='delete_checked_submit']").click(function(){   
				//var checked_cart_arr = [];
				checked_value_arr 
			  
		  });
  
 
		 });*/
	  
	  //체크박스 값 가져오기 -> post form-input-hidden-value로 전달 
	 /*  $(document).ready(function get_checked_value() {
		  var values = document.getElementsByName("checked_cart");
		  var hidden_input_value = document.getElementsByName("delete_hidden_form").find("input[name='caId']"); // hidden-input-caId 찾기
		    for(var i = 0; i < values.length; i++) {
		      if(values[i].checked) {
		    	  if(hidden_input.value == ""){
		    		  hidden_input.value = values[i].value;
		    	  }else{
		    		  hidden_input.value += "," + values[i].value; 
		    	  }
		        console.log(values[i].value);  // checked 된 값을 출력
		      }
		    }
		  });*/
		  
		  //체크된 값 //세션으로 값 받아오려고 했을 때 사용한 것
/*		  
		  function get_checked_value() {
			  var checked_value_arr = [];  
			  var values = document.getElementsByName("checked_cart");
			  for(var i = 0; i < values.length; i++) {
			    if(values[i].checked) {
			     checked_value_arr.push(values[i].value);  // checked 된 값을 출력
			    }
			  }
			 console.log(checked_value_arr);
			 sessionStorage.setItem("checked_value_arr", JSON.stringify(checked_value_arr));
		  }*/
	  
	  $(document).ready(function(){
		//전체 체크하면 개별 체크도 
		  //$("#all_check").click(function(){
			  $("input[name='all_check']").click(function(){
				  
				  var values = document.getElementsByName("checked_cart");
				  
				  var check = $("input[name='all_check']").prop("checked");
				  if(check){
					    for(var i = 0; i < values.length; i++) {
						   if(values[i].checked) {
							   values[i].prop("checked",true);
						  }
				  	}
				  }else{
					  for(var i = 0; i < values.length; i++) {
						   if(values[i].checked) {
							   values[i].prop("checked",false);
						  }
				  	}
				  }
			  });
		
		  //전체 선택에서 하나라도 해제하면 전체 체크도 해제됨
		  /*$(".checked_cart").click(function(){
			  $("input[name='all_check']").prop("checked",false);
		  });*/
	  });
	  
	  
	  
	  //let caCnt = $(this).parent().find(".quantity_input").val();
</script>

<script>
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
						<input type="checkbox" name="all_check" id="all_check" >
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
		      					<label><input type="checkbox" id="checked_cart" name="checked_cart" value="${ CartDAO.caId }" >이미지</label>
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
						<td><br><input type="button" value="바로주문" >
							<p>&nbsp;&nbsp;
							<a href="clientCart/delete.do?caId=${CartDAO.caId}&&clientId=${CartDAO.clientId}"><input type="button" value="삭제"></a>
							<!-- <button class="delete_btn" data-proId="${CartDAO.proId }">삭제</button> -->
						</td>
					</tr>				
				</c:forEach>
		</table>
		</div>
		<div class="wrap">
		<p>선택한 상품 
		<form action="clientCart/deleteChecked.do" name="delete_hidden_form" method="post">
			<input type = "hidden" name="caId" value="" >
			<input type="hidden" name="clientId" value="${CartDAO.clientId}">
			<input type = "submit" name="delete_checked_submit" value = "삭제">
		</form>
		<input type="button" value="삭제하기" style="font-size: 1em;"></p>
		<input class="btn" type="button" value="계속 쇼핑하기" onclick="location.href='#'"> 
		<!-- <input class="btn" type="button" value="주문하기" onclick="location.href='clientOrder.do'" > -->
		<form action="clientOrder.do" id="order_form" name="order_form" method="get">
			<input type="hidden" name="clientId" value="<%=clientId%>">        
			<input type="hidden" id="checked_cart" class="checked_cart" name="CaIdList">
			<button type="button" onclick="submitFunction()">적용</button>
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