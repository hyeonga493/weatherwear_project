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
	<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />
	<link rel="stylesheet" href="resources/product/css/product_style.css" />
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/admin/js/jquery/jquery.min.js"></script>
	
	<!-- 스마트에디터 적용 -->
	<script type="text/javascript" src="resources/static/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/product/js/usingEditor.js" charset="UTF-8"></script>

	<!-- 파일 업로드시 필요합니다. -->
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.809.0.min.js"></script>
	<script type="text/javascript" src="resources/product/js/product_detail.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/product/js/checkbox.js" charset="UTF-8"></script>
<script>
$(document).ready(function() {

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
							+ "<input type='text' name='stCntList' value='${ stCntList }'>"
							+ "<span id='stockResult'></span>");
	
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

	$("input[name='stCntList']").val(stCnt);
	
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
		console.log("stCntList : " + $("input[name='stCntList']").val());
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
			<form action="updateProduct.mdo"  method="post" enctype="multipart/form-data">
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
						<option value="11" <c:if test="${product.proCate eq '11'}">selected</c:if>>OUTER</option>
						<option value="12" <c:if test="${product.proCate eq '12'}">selected</c:if>>TOP</option>
						<option value="13" <c:if test="${product.proCate eq '13'}">selected</c:if>>PANTS</option>
						<option value="14" <c:if test="${product.proCate eq '14'}">selected</c:if>>SKIRTS</option>
						<option value="15" <c:if test="${product.proCate eq '15'}">selected</c:if>>DRESS</option>
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
								<input type="hidden" name="opColorList" value="${ product.opColorList}">
								<input type="hidden" name="opSizeList" value="${ product.opSizeList}">
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
				<td>
					<div id="smarteditor">
						<textarea name="proContent" id="proContent" rows="20" cols="10" placeholder="내용 입력해주세요" style="width:500px; border: 2px solid black">${ product.proContent }</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align:center"><label>메인 사진</label></td>
				<td>
					<input type="file" id="mainImageUpload" name="main_Changeimg[]"/>
			        <ul id="mainfileList"></ul>
			        <ul id="mainimageList"></ul>
			        <input type="hidden" id="main_imageList" name="main_imageList" >
				</td>
			</tr>
			<tr>
				<td style="text-align:center"><label>상세 사진</label></td>
				<td>
					<input type="file" id="detailImageUpload" name="detail_Changeimg[]" multiple/>
			        <ul id="detailfileList"></ul>
			        <ul id="detailimageList"></ul>
			        <input type="hidden" name="detail_imageList" id="detail_imageList">
				</td>
			</tr>
			<tr>
				<td>
					이미지
				</td>
				<td>
			        <ul id="mainimageList_ori">
			        <c:if test="${ mainImage != null }">
			        	<img src="${ mainImage.imageDir }${ mainImage.imageName }" style="width:auto; height:150px;">
			        </c:if>
			        </ul>
			        <ul id="detailimageList_ori">
			        <c:if test="${ detailImageList != null }">
			        	<c:forEach var="detail" items="${ detailImageList }">
			        		<label for="${ detail.imageName }">
			        			<input type="checkbox" id="${ detail.imageName }" class="checkClass" value="${ detail.imageName }" name="DetailImage">
				        		<img id="${ detail.imageName }" src="${ detail.imageDir }${ detail.imageName }" style="width:auto; height:150px;">
				        	</label>
			        	</c:forEach>
			        	<br><br><br>
			        	<input type="button" value="기존 이미지 삭제" style="padding:10px" onclick="deleteFunction()">
			        	<input type="hidden" name="deleteList">
			        </c:if>
			        </ul>
				</td> 
			</tr>
			</table>
			</div>
			<div style="margin-left:450px;">
				<input type="submit" value="수정" onClick="submitPost()" style="padding:10px"/>
				<a href="deleteProduct.mdo?proId=${product.proId}">삭제</a>
				
			</div>
			</form>
			
		</section>
		
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>