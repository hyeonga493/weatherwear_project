<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
<link href="resources/product/css/style.css" rel="stylesheet" />
</head>
<style>

li {
	list-style:none;
}
</style>
<html>
<div id="container" >
        <p>
        <br><br>
			<c:if test="${ client != null }"> <!-- 로그인한 경우 -->
				<h5 id="top_menu">${ client.clientName } | <a href="clientMypage.do">MYPAGE</a> | <a href="clientCart.do?clientId=${ client.clientId}">CART</a> | <a href="clientLogout.do">LOGOUT</a></h5>
			</c:if>
			<c:if test="${ client == null }"> <!-- 익명 사용자인 경우 -->
				<h5 id="top_menu"><a href="clientLogin.do">LOGIN</a> | <a href="clientJoin.do">JOIN</a> | <a href="clientCart.do">CART</a></h5>
			</c:if>
        </p>
<header id="header">
	<a href="/w2/clientMain.do"><img src="resources/image/client/logo_pull.png" id="banner_logo"></a>

	<nav id="menubar">
		<!--<h5>[ nav : menubar ]</h5>-->
			<div class="product_list">
				<ul class="menu">
					<li><a href="#">WEATHER</a></li>
					<li><a href="productList.do?gubun=all">ALL</a></li>
					<li><a href="productList.do?gubun=outer">OUTER</a>
<!-- 						<ul> -->
<!-- 							<li><a href="productList.do?gubun=111">PADDING</a></li> -->
<!-- 							<li><a href="productList.do?gubun=112">COAT</a></li> -->
<!-- 							<li><a href="productList.do?gubun=113">CARDIGAN</a></li> -->
<!-- 						</ul> -->
					</li>
					<li><a href="productList.do?gubun=top">TOP</a>
<!-- 						<ul> -->
<!-- 							<li><a href="productList.do?gubun=121">KNIT</a></li> -->
<!-- 							<li><a href="productList.do?gubun=122">SHIRT</a></li> -->
<!-- 							<li><a href="productList.do?gubun=123">TSHIRT</a></li> -->
<!-- 						</ul> -->
					</li>
					<li value><a href="productList.do?gubun=pants">PANTS</a>
<!-- 						<ul> -->
<!-- 							<li><a href="productList.do?gubun=131">JEANS</a></li> -->
<!-- 							<li><a href="productList.do?gubun=132">SLACKS</a></li> -->
<!-- 							<li><a href="productList.do?gubun=133">PANTS</a></li> -->
<!-- 						</ul> -->
					</li>
					<li><a href="productList.do?gubun=skirts">SKIRTS</a>
<!-- 						<ul> -->
<!-- 							<li><a href="productList.do?gubun=141">SHORT</a></li> -->
<!-- 							<li><a href="productList.do?gubun=142">MIDI</a></li> -->
<!-- 							<li><a href="productList.do?gubun=143">LONG</a></li> -->
<!-- 						</ul>   -->
					</li>
					<li><a href="productList.do?gubun=dress">DRESS</a>
<!-- 						<ul> -->
<!-- 							<li><a href="productList.do?gubun=151">SHORT</a></li> -->
<!-- 							<li><a href="productList.do?gubun=152">MIDI</a></li> -->
<!-- 							<li><a href="productList.do?gubun=153">LONG</a></li> -->
<!-- 						</ul>	   -->
					</li>
					<li><a href="clientNotice.do">NOTICE</a></li>
			<!-- 공지사항 -->
					<li><a href="clientQnaList.do">Q&A</a></li>
			<!-- 문의사항 -->
				</ul>
			</div>
<!-- 		<ul> -->
			<!-- 새 창으로 열기 target="_blank" -->
<!-- 			<li><a href="productList.do?gubun=new">New</a></li> -->
<!-- 			<!-- product_new -->
<!-- 			<li><a href="productList.do?gubun=weather">Weather</a></li> -->
<!-- 			<!-- product_weather -->
<!-- 			<li><a href="productList.do?gubun=outer">Outer</a></li> -->
<!-- 			<!-- product_outer -->
<!-- 			<li><a href="productList.do?gubun=top">Top</a></li> -->
<!-- 			<!-- product_top -->
<!-- 			<li><a href="productList.do?gubun=dress">Dress</a></li> -->
<!-- 			<!-- product_dress -->
<!-- 			<li><a href="productList.do?gubun=pants">Pants</a></li> -->
<!-- 			<!-- product_pants -->
<!-- 			<li><a href="productList.do?gubun=skirts">Skirts</a></li> -->
<!-- 			<!-- product_skirts -->
<!-- 			<li><a href="clientNotice.do">Notice</a></li> -->
<!-- 			<!-- 공지사항 -->
<!-- 			<li><a href="clientQnaList.do">Qna</a></li> -->
<!-- 			<!-- 문의사항 -->
<!-- 		</ul> -->
	</nav>
</header>
</html>