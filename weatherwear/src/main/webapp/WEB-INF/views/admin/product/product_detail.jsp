<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.w2.product.ProductVO"%>
<%@page import="com.w2.product.ProductDAO"%>
<%
	ProductVO product = (ProductVO)session.getAttribute("product");
%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<title>상품 등록 정보 / 수정</title>
<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
<style>
div.clearfixed{
	display: block;
	content: "";
	clear: both
}
a {
	text-decoration: none;
	color:black;
}
li {
	list-style:none;
}

.form {
	width:80%;
	height:50%;
	border-collapse:collapse;
	margin:30px 0 30px 0;
}
td {
	padding:5px;
}
button {
background-color:#FFFFFF;
border-width:thin;
border-color:black;
}
input[type=button] {
	border:none;
}
input[type=submit] {
	border:none;
}
input[type=reset] {
	border:none;
}
textarea {
	padding:10px;
	width:350px;
	height:100px;
	border:0;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 상품 아이디 조회
	var proId = "${ product.proId }";
	
	// 색상 옵션 조회
	var opColorList = "${ opColorList }";
	var opColor = opColorList.substring(1,opColorList.length-1).replace(/\s/g, '');
	$("input[name='opColor']").val(opColor);
	
	// 사이즈 옵션 조회
	var opSizeList = "${ opSizeList }";
	var opSize = opSizeList.substring(1,opSizeList.length-1).replace(/\s/g, '');
	$("input[name='opSize']").val(opSize);
	
	// 옵션별 재고 조회
	var stCntList = "${ stCntList }";
	var stCnt = stCntList.substring(1,stCntList.length-1).replace(/\s/g, '');
	
	// 옵션값
	stCnt = stCnt.split(",").map(function(num) {
	  return parseInt(num);
	});
	
	// 재고 입력 위치 지정 
	var su=0;
	
	// 수정 값 읽어오기
	opColorList = [];
	opSizeList = [];
	
	if (opColor) {
		opColor.split(",").forEach(function(item) {
			opColorList.push(item);
			$("input[name='opColorList']").val(opColorList);
		});
	}

	if (opSize) {
		opSize.split(",").forEach(function(item) {
			opSizeList.push(item);
			$("input[name='opSizeList']").val(opSizeList);
		});
	}

	
	$("#optionResult").html("<font color='blue' size='3'>적용되었습니다.</font>");
	$("#optionStock").html("<form action='insertStock.mdo' method='post'>" 
							+ "<table style='text-align:center;'>" 
							+ "<thead>" 
							+ "<tr style='border-bottom:1px solid grey;'>" 
							+ "<th style='width:80px'>색상</th><th style='width:80px'>사이즈</th><th style='width:80px'>재고</th>" 
							+ "</tr>" 
							+ "</thead>" 
							+ "<tbody></tbody>" 
							+ "</table>" 
							+ "</form>"
							+ "<input type='number' name='changeall'><button type='button' class='btn-write' id='changeStockAll'>재고 일괄 적용하기</button><br>"
							+ "<button type='button' class='btn-write' id='applyStock'>재고 적용하기</button>" 
							+ "<input type='hidden' name='stCntList' value='${ stCntList }'>"
							+ "<span id='stockResult'></span>");
	
	for(var i=0; i<opColorList.length; i++){
		for(var j=0; j<opSizeList.length; j++){
			$("#optionStock table tbody:last").append("<tr style='border-bottom:1px solid grey;'><td>" + opColorList[i] + "</td><td>" + opSizeList[j] + "</td><td>" 
					+ "<input type='number' name='stCnt' id='stCnt" + opColorList[i] + opSizeList[j] + "' value='" + stCnt[su] + "'min='0' style='width:40px; text-alin:center; border:none;'></td></tr>");	
			su++;
		}
	}
	
	$("#applyStock").click(function() {
		var stCntList = [];
		for(var i=0; i<opColorList.length; i++){
			for(var j=0; j<opSizeList.length; j++){
				var cnt = $("#stCnt"+ opColorList[i] + opSizeList[j] + "").val();
				
				if(cnt<0){
					alert("재고는 0개 이상이어야 합니다.");
					$("#stCnt"+ opColorList[i] + opSizeList[j] + "").val('0');
					return;
				}
				stCntList.push(cnt);
			}
		}
		console.log("stCntList : " + stCntList);
		$("input[name='stCntList']").val(stCntList);

		if(stCntList!=null){
			$("#stockResult").html("<font color='blue' size='3'>적용되었습니다.</font>");
		}
	});
	
	$("#changeStockAll").click(function() {
		var stCntList = [];
		for(var i=0; i<opColorList.length; i++){
			for(var j=0; j<opSizeList.length; j++){
				var cnt = $("input[name='changeall']").val();

				stCntList.push(cnt);
				$("#stCnt"+ opColorList[i] + opSizeList[j] + "").val(cnt);
			}
		}
		console.log("stCntList : " + stCntList);
		$("input[name='stCntList']").val(stCntList);
		
		if(stCntList!=null){
			$("#stockResult").html("<font color='blue' size='3'>일괄 적용되었습니다.</font>");
		}
	});
	
	$("#applyOption").click(function() {
		proId = $("input[name='proId']").val();
		opColor = $("input[name='opColor']").val().replace(/\s/g, '');
		opSize = $("input[name='opSize']").val().replace(/\s/g, '');
		$("input[name='opColorList']").val('');
		$("input[name='opSizeList']").val('');
		
		opColorList = [];
		opSizeList = [];
		
		if (opColor) {
			opColor.split(",").forEach(function(item) {
				opColorList.push(item);
				$("input[name='opColorList']").val(opColorList);
			});
		}
	
		if (opSize) {
			opSize.split(",").forEach(function(item) {
				opSizeList.push(item);
				$("input[name='opSizeList']").val(opSizeList);
			});
		}
		$("#optionResult").html("<font color='blue' size='3'>적용되었습니다.</font>");

		$("#optionStock").html("<form action='insertStock.mdo' method='post'>" 
								+ "<table style='text-align:center;'>" 
								+ "<thead>" 
								+ "<tr style='border-bottom:1px solid grey;'>" 
								+ "<th style='width:80px'>색상</th><th style='width:80px'>사이즈</th><th style='width:80px'>재고</th>" 
								+ "</tr>" 
								+ "</thead>" 
								+ "<tbody></tbody>" 
								+ "</table>" 
								+ "</form>"
								+ "<input type='number' name='changeall'><button type='button' class='btn-write' id='changeStockAll'>일괄적용하기</button><br>"
								+ "<button type='button' class='btn-write' id='applyStock'>재고 저장하기</button>" 
								+ "<input type='hidden' name='stCntList' value='${ stCntList }'>"
								+ "<span id='stockResult'></span>");
		for(var i=0; i<opColorList.length; i++){
			for(var j=0; j<opSizeList.length; j++){
				$("#optionStock table tbody:last").append("<tr style='border-bottom:1px solid grey;'><td>" + opColorList[i] + "</td><td>" + opSizeList[j] + "</td><td>" 
						+ "<input type='number' name='stCnt' id='stCnt" + opColorList[i] + opSizeList[j] + "' value='0' min='0' style='width:40px; text-alin:center; border:none;'></td></tr>");	
			}
		}
		
		console.log("change opColorList : " + opColorList);
		console.log("change opSizeList : " + opSizeList);

		$("#applyStock").click(function() {
			var stCntList = [];
			for(var i=0; i<opColorList.length; i++){
				for(var j=0; j<opSizeList.length; j++){
					var cnt = $("#stCnt"+ opColorList[i] + opSizeList[j] + "").val();
					
					if(cnt<0){
						alert("재고는 0개 이상이어야 합니다.");
						$("#stCnt"+ opColorList[i] + opSizeList[j] + "").val('0');
						return;
					}
					stCntList.push(cnt);
				}
			}
			console.log("stCntList : " + stCntList);
			$("input[name='stCntList']").val(stCntList);

			if(stCntList!=null){
				$("#stockResult").html("<font color='blue' size='3'>적용되었습니다.</font>");
			}
		});
		
		$("#changeStockAll").click(function() {
			var stCntList = [];
			for(var i=0; i<opColorList.length; i++){
				for(var j=0; j<opSizeList.length; j++){
					var cnt = $("input[name='changeall']").val();

					stCntList.push(cnt);
					$("#stCnt"+ opColorList[i] + opSizeList[j] + "").val(cnt);
				}
			}
			console.log("stCntList : " + stCntList);
			$("input[name='stCntList']").val(stCntList);
			
			if(stCntList!=null){
				$("#stockResult").html("<font color='blue' size='3'>일괄 적용되었습니다.</font>");
			}
		});
	});
});

</script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
	<!-- <ul> -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" aria-haspopup="true" aria-expanded="false"></a>
		</li>
	</ul>
		<main>
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		</main>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<hr><hr><hr><br>
		
		<section>
			<div>
				<h3>상품 상세</h3>
			</div>
			<form action="updateProduct.mdo"  method="post">
			<div>
			<table class="form" border="1">
			<tr>
				<td style="text-align:center">판매 상태</td>
				<td>
<%-- 				<input type="text" name="proSell" value="${product.proSell}"> --%>
					<label><input type="radio" name="proSell" value="Y" <c:if test="${product.proSell eq 'Y'}">checked</c:if>>판매 중</label>
					<label><input type="radio" name="proSell" value="O" <c:if test="${product.proSell eq 'O'}">checked</c:if>>일시 품절</label>
					<label><input type="radio" name="proSell" value="N" <c:if test="${product.proSell eq 'N'}">checked</c:if>>판매 종료</label>
				</td>
			</tr>
			<tr>
				<td style="width:100px; text-align:center">상품 번호</td>
				<td><input type="text" name="proId" value="${product.proId}"/></td>
			</tr>
				<tr>
				<td style="text-align:center">카테고리</td>
				<td>
					<select name="proCate" id="category">
						<option>SELECT</option>
						<optgroup label="OUTER">
							<option value="111" <c:if test="${product.proCate eq '111'}">selected</c:if>>(O)PADDING</option>
							<option value="112" <c:if test="${product.proCate eq '112'}">selected</c:if>>(O)COAT</option>
							<option value="113" <c:if test="${product.proCate eq '113'}">selected</c:if>>(O)CARDIGAN</option>
						</optgroup>
						<optgroup label="TOP">
							<option value="121" <c:if test="${product.proCate eq '121'}">selected</c:if>>(T)KNIT</option>
							<option value="122" <c:if test="${product.proCate eq '122'}">selected</c:if>>(T)SHIRT</option>
							<option value="123" <c:if test="${product.proCate eq '123'}">selected</c:if>>(T)TSHIRT</option>
						</optgroup>
						<optgroup label="PANTS">
							<option value="131" <c:if test="${product.proCate eq '131'}">selected</c:if>>(P)JEANS</option>
							<option value="132" <c:if test="${product.proCate eq '132'}">selected</c:if>>(P)SLACKS</option>
							<option value="133" <c:if test="${product.proCate eq '133'}">selected</c:if>>(P)PANTS</option>
						</optgroup>
						<optgroup label="SKIRTS">
							<option value="141" <c:if test="${product.proCate eq '141'}">selected</c:if>>(S)SHORT</option>
							<option value="142" <c:if test="${product.proCate eq '142'}">selected</c:if>>(S)MIDI</option>
							<option value="143" <c:if test="${product.proCate eq '143'}">selected</c:if>>(S)LONG</option>
						</optgroup>
						<optgroup label="DRESS">
							<option value="151" <c:if test="${product.proCate eq '151'}">selected</c:if>>(D)SHORT</option>
							<option value="152" <c:if test="${product.proCate eq '152'}">selected</c:if>>(D)MIDI</option>
							<option value="153" <c:if test="${product.proCate eq '153'}">selected</c:if>>(D)LONG</option>
						</optgroup>
					</select>
				</td>
			<tr>
				<td style="text-align:center"><label>상품명</label></td>
				<td><input type="text" name="proName" value="${product.proName}"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>공급가</label></td>
				<td><input type="text" name="proPrimeCost" value="${product.proPrimeCost}"/>&nbsp;원</td>
			</tr>
			<tr>
				<td style="text-align:center"><label>옵션</label></td>
				<td>
				<div id="option">
					<table>
						<tr>
							<td>색상</td><td><input type="text" name="opColor" placeholder="색상1, 색상2..">
						</tr>
						<tr>
							<td>사이즈</td><td><input type="text" name="opSize" placeholder="사이즈1, 사이즈2..">
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn-write" id="applyOption">옵션 적용하기</button><span id="optionResult"></span>
								<input type="hidden" name="opColorList" value="${opColorList}">
								<input type="hidden" name="opSizeList" value="${opSizeList}">
								<span id="optionStock">
								</span>
							</td>
						</tr>
					</table>
				</div>
				</td>
			</tr>
			<tr>
				<td style="text-align:center">상품 설명</td>
				<td><textarea name="proContent" style="width:1000px; rows:10">${product.proContent}</textarea></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>상품 사진</label></td>
				<td><input type="file"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>부가 사진</label></td>
				<td><input type="file"/></td>
			</tr>
			<tr>
				<td style="text-align:center"><label>상세 사진</label></td>
				<td><input type="file"/></td>
			</tr>
			</table>
			</div>
			<div style="margin-left:450px;">
				<input type="submit" value="수정" style="padding:10px"/>
				<a href="deleteProduct.mdo?proId=${product.proId}">삭제</a>
				
			</div>
			</form>
			
		</section>
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>