<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="java.net.URLDecoder" %>

<%  
  String caIdList = request.getParameter("CaIdList");
  if (caIdList != null) {
      // URL 디코딩
      caIdList = URLDecoder.decode(caIdList, "UTF-8");
  }
%>
    <%String clientId = (String)session.getAttribute("clientId");%>
     <%String odid = (String)request.getParameter("odid"); %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="resources/client/css/style.css" rel="stylesheet" />
	<link href="resources/client/order/css/orderStructure.css" type="text/css" rel="stylesheet" />
	
<title>client_order.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 주소 검색 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/daum_post.js"></script>
	<script src="resources/js/client_join.js"></script>

<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
      
      /*function requestPay(pgName) {
    	  var form1 = document.getElementById('clientPay');


          var IMP = window.IMP; 
          IMP.init("imp51016864");    //아임포트 초기화
        
          var clientId = ${param.clientId};
          alert(clientId);
          var odid = ${odid};
          alert(odid);
          var today = new Date();   
          var hours = today.getHours(); // 시
          var minutes = today.getMinutes();  // 분
          var seconds = today.getSeconds();  // 초
          var milliseconds = today.getMilliseconds();
          var makeMerchantUid = hours +  minutes + seconds + milliseconds;
          
          var payMtd;
          if(pgName === 'kakao') {
             payMtd = 'kakaopay';
          } else if(pgName === 'html5_inicis') {
             payMtd = 'card';
          }

             IMP.request_pay({
             pg : pgName,
              merchant_uid: 'merchant_' + new Date().getTime(), 
              pay_method : payMtd,
              name : '주문명:결제테스트',   //purchaseName
              amount : 100,   //price
              buyer_email : 'client123@email.com',
              buyer_name : '구매자이름',
              buyer_tel : '010-1234-5678',
              buyer_addr : '서울특별시 강남구 삼성동',
             }, 
             function (rsp) { // callback
                   if ( rsp.success ) {
                       //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                          
                       var msg = '결제가 완료되었습니다.';
                           msg += '\n고유ID : ' + rsp.imp_uid;
                           msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                           msg += '\결제 금액 : ' + rsp.paid_amount;
                           msg += '카드 승인번호 : ' + rsp.apply_num;

                         
                         $.ajax({
                        	 url: 'insertPaymentInfo.do',
                             contentType : "application/json; charset=UTF-8;",
                             type: 'post',  
                             data : JSON.stringify({
                                merchant_uid : rsp.merchant_uid,//payId   
                                imp_uid : odid,               
                                payMtd : payMtd,
                                payDate : today,               
                                odPrice : '100',               
                                payStatus : '결제완료'//payStatus
                                cId : clientId
                           }),
                           success: function(data) {
                              form1.submit();
                              // 결과 페이지로 이동
                              location.href="결제완료 페이지 주소";
                           },
                           error: function() {
                              alert('처리도중 오류가 발생했습니다.');
                           }
                        }); 
               
                     } else {
                         var msg = '결제에 실패하였습니다.';
                         msg += '에러내용 : ' + rsp.error_msg;
                         
                         alert(msg);
                    }
                 });

      }*/
      /*
      function requestPay(pgName) {
    	  alert("requestPay");
    	    var IMP = window.IMP; 
    	    IMP.init("imp51016864");
    	    var clientId = "${param.clientId}";
    	    var odid = "${odid}";
    	    var odPrice = "${odPrice}";
    	    var clientEmail = "${toOrder_get_client.clientEmail }";
    	    var clientName = "${toOrder_get_client.clientName }";
    	    var clientNum = "${toOrder_get_client.clientNum }";
    	    var addressId = "${toOrder_get_AddBase.addId}";

    	    var today = new Date();   
    	    var hours = today.getHours();
    	    var minutes = today.getMinutes();
    	    var seconds = today.getSeconds();
    	    var milliseconds = today.getMilliseconds();
    	    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    	    
    	    var payMtd;
    	    alert('odid: ' + odid);
    	    alert('clientId: ' + clientId);
    	    if (pgName === 'kakao') {
    	        payMtd = 'kakaopay';
    	    } else if (pgName === 'html5_inicis') {
    	        payMtd = 'card';
    	    }

    	    IMP.request_pay({
    	        pg: pgName,
    	        merchant_uid: 'merchant_' + new Date().getTime(),
    	        pay_method: payMtd,
    	        name: '주문명:결제테스트',
    	        amount: 100, //odPrice
    	        buyer_email: clientEmail,//cEmail
    	        buyer_name: clientName,//cName
    	        buyer_tel:clientNum,//cNum
    	        buyer_addr: addressId,//addressId
    	    }, function (rsp) { // callback
    	        if (rsp.success) {
    	            var msg = '결제가 완료되었습니다.';
    	            msg += '\n고유ID : ' + rsp.imp_uid;
    	            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    	            msg += '\결제 금액 : ' + rsp.paid_amount;
    	            msg += '카드 승인번호 : ' + rsp.apply_num;

    	            $.ajax({
    	                url: 'insertPaymentInfo.do',
    	                contentType: "application/json; charset=UTF-8;",
    	                type: 'post',
    	                data: JSON.stringify({
    	                    merchant_uid: rsp.merchant_uid,
    	                    imp_uid: odid,
    	                    payMtd: payMtd,
    	                    payDate: today,
    	                    odPrice: 100,//odPrice
    	                    payStatus: '결제완료',
    	                    cId: clientId
    	                }),
    	                success: function(data) {
    	                    location.href = "/clientPay.do";
    	                },
    	                error: function() {
    	                    alert('처리도중 오류가 발생했습니다.');
    	                }
    	            });
    	        } else {
    	            var msg = '결제에 실패하였습니다.';
    	            msg += '에러내용 : ' + rsp.error_msg;
    	            alert(msg);
    	        }
    	    });
    	}*/
    	


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
									<th>적용 포인트 : </th><td>- ${ usedPoint }</td>							
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
						<form id="paymentForm_kakaopay" onsubmit="return requestPay('kakaopay')" method="post">
				<input type="hidden" name="odid" value="${odid}">
				<input type="hidden" name="clientId" value="${param.clientId}">
				<input type="hidden" name="addId" value="${toOrder_get_AddBase.addId}"><!-- 일단 기본배송지에서 보내지는 걸로 -->
				<input type="hidden" name="usedpoint" value="${usedPoint}">
				<input type="hidden" name="plusPoint" value="${getPlusPoint}">
				<input type="hidden" name="cpId" value="${param.cpId_choose}">
				<input type="hidden" name="opIdList" value="${opIdList}"><!-- opId는 for문으로 java에서 -->
				<input type="hidden" name="odStatus" value="배송준비중"><!-- 기본값으로 배송준비중 입력 -->
				<input type="hidden" name="caIdList" value="<%= caIdList %>">
				<input type="hidden" name="caId" value="${toOrder_get_Price.caId }">
				<input type="hidden" name="odPrice" value="${odPrice}">
				<input type="hidden" name="caCnt" value="${toOrder_get_Price.caCnt}">
	            <!-- HTML 부분에서 함수 호출할 때 매개변수로 필요한 값을 엘리먼트에 설정 -->
				<input type="submit" value="카카오페이">
			</form>	
			
			<form id="paymentForm_inicis" onsubmit="return requestPay('html5_inicis')" method="post">
				<input type="hidden" name="odid" value="${odid}">
				<input type="hidden" name="clientId" value="${param.clientId}">
				<input type="hidden" name="addId" value="${toOrder_get_AddBase.addId}"><!-- 일단 기본배송지에서 보내지는 걸로 -->
				<input type="hidden" name="usedpoint" value="${usedPoint}">
				<input type="hidden" name="plusPoint" value="${getPlusPoint}">
				<input type="hidden" name="cpId" value="${param.cpId_choose}">
				<input type="hidden" name="opIdList" value="${opIdList}"><!-- opId는 for문으로 java에서 -->
				<input type="hidden" name="odStatus" value="배송준비중"><!-- 기본값으로 배송준비중 입력 -->
				<input type="hidden" name="caIdList" value="<%= caIdList %>">
				<input type="hidden" name="caId" value="${toOrder_get_Price.caId }">
				<input type="hidden" name="odPrice" value="${odPrice}">
				<input type="hidden" name="caCnt" value="${toOrder_get_Price.caCnt}">
	            <!-- HTML 부분에서 함수 호출할 때 매개변수로 필요한 값을 엘리먼트에 설정 -->
				<input type="submit" value="카드결제">
			</form>	
			
			<!-- input 엘리먼트로 clientId와 odid 값을 전달할 수 있음 -->
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
        	<script>
        document.getElementById("paymentForm_kakaopay").addEventListener("submit", function (event) {
            event.preventDefault();
            requestPay('kakaopay');
        });
        document.getElementById("paymentForm_inicis").addEventListener("submit", function (event) {
            event.preventDefault();
            requestPay('html5_inicis');
        });

        function requestPay(pgName) {
            // 중복 클릭 방지를 위해 버튼 비활성화
            $("input[type='submit']").prop("disabled", true);
	
            var IMP = window.IMP;
            IMP.init("imp51016864");
            var clientId = "${param.clientId}";
            var odid = "${odid}";
            var odPrice = "${odPrice}";
            var clientEmail = "${toOrder_get_client.clientEmail}";
            var clientName = "${toOrder_get_client.clientName}";
            var clientNum = "${toOrder_get_client.clientNum}";
            var addressId = "${toOrder_get_AddBase.addId}";
            var usedPoint = "${usedPoint}";
            var plusPoint = "${getPlusPoint}";
            var cpId = "${param.cpId_choose}";
            var opIdList = "${opIdList}";
            var odStatus = "배송준비중";
            var caIdList = "<%= caIdList %>";
            var caId = "${toOrder_get_Price.caId }";
            var caCnt = "${toOrder_get_Price.caCnt}";

            var today = new Date();
            var hours = today.getHours();
            var minutes = today.getMinutes();
            var seconds = today.getSeconds();
            var milliseconds = today.getMilliseconds();
            var makeMerchantUid = hours + minutes + seconds + milliseconds;

            var payMtd;
            alert(odid+clientId);

            if (pgName === 'kakaopay') {
                payMtd = '간편결제';
            } else if (pgName === 'html5_inicis') {
                payMtd = '카드';
            }

            IMP.request_pay({
                pg: pgName,
                merchant_uid: 'merchant_' + new Date().getTime(),
                pay_method: payMtd,
                name: '주문명:결제테스트',
                amount: 1, //odPrice
                buyer_email: clientEmail,
                buyer_name: clientName,
                buyer_tel: clientNum,
                buyer_addr: addressId,
            }, function (rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;

                    $.ajax({
                        url: 'insertPaymentInfo.do',
                        contentType: "application/json; charset=UTF-8;",
                        type: 'post',
                        data: JSON.stringify({
                            merchant_uid: rsp.merchant_uid,
                            imp_uid: odid,
                            payMtd: payMtd,
                            payDate: today,
                            odPrice: odPrice, //odPrice
                            payStatus: '결제완료',
                            clientId: clientId,
                            clientEmail : clientEmail,
                        	clientName: clientName,
	                        clientNum: clientNum,
	                        addressId: addressId,
	                        usedPoint: usedPoint,
	                        plusPoint: plusPoint,
	                        cpId: cpId,
	                        opIdList: opIdList,
	                        odStatus: odStatus,
	                        caIdList: caIdList,
	                        caId: caId,
	                        caCnt: caCnt
                        
                        }),
                        success: function (data) {
                            alert('결제가 완료되었습니다.');
                            var clientId = "${param.clientId}";
                            console.log("ClientId:", clientId);
                            location.href = "clientList.do?clientId="+clientId;//주문내역리스트 페이지로 리다이렉트
                        },
                        error: function () {
                            alert('처리도중 오류가 발생했습니다.');
                        }
                    });
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                }
            });
        }

        function getPaymentInformation(merchant_uid) {
            $.ajax({
                url: '/get_payment_info',
                method: 'GET',
                data: {merchant_uid: merchant_uid},
                success: function (response) {
                    console.log(response);
                },
                error: function (error) {
                    console.error('Error fetching payment information:', error);
                }
            });
        }
  
      
         
      function getPaymentInformation(merchant_uid) {
        // Make an API request to your server or the iamport API to get detailed payment information
        // You need to implement this server-side endpoint
        // Example: Fetch payment information using Ajax
        $.ajax({
          url: '/get_payment_info', // Replace with your actual server-side endpoint
          method: 'GET',
          data: { merchant_uid: merchant_uid },
          success: function (response) {
            // Handle the response containing detailed payment information
            console.log(response);
          },
          error: function (error) {
            console.error('Error fetching payment information:', error);
          }
        });
      }
      </script>
	<%@ include file="../base/footer.jsp" %>
</body>
</html>