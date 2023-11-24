<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<link href="resources/client/css/style.css" rel="stylesheet" />
</head>
<html>
<div id="container" >
        <p>
            <h5>[ div : container ]</h5>
			<c:if test="${ client != null }"> <!-- 로그인한 경우 -->
				<h5 id="top_menu">${ client.clientName } | <a href="clientMypage.do">MYPAGE</a> | <a href="clientCart.do">CART</a> | <a href="clientLogout.do">LOGOUT</a></h5>
			</c:if>
			<c:if test="${ client == null }"> <!-- 익명 사용자인 경우 -->
				<h5 id="top_menu"><a href="clientLogin.do">LOGIN</a> | <a href="clientJoin.do">JOIN</a> | <a href="clientCart.do">CART</a></h5>
			</c:if>
        </p>
<header id="header">
	<h5>[ header : header ]</h5>
	<a href="/w2/clientMain.do"><img src="resources/image/client/logo_pull.png" id="banner_logo"></a>

	<nav id="menubar">
		<!--<h5>[ nav : menubar ]</h5>-->
		<ul>
			<!-- 새 창으로 열기 target="_blank" -->
			<li><a href="productList.do?page=new">New</a></li>
			<!-- product_new -->
			<li><a href="productList.do?page=weather">Weather</a></li>
			<!-- product_weather -->
			<li><a href="productList.do?page=outer">Outer</a></li>
			<!-- product_outer -->
			<li><a href="productList.do?page=top">Top</a></li>
			<!-- product_top -->
			<li><a href="productList.do?page=dress">Dress</a></li>
			<!-- product_dress -->
			<li><a href="productList.do?page=pants">Pants</a></li>
			<!-- product_pants -->
			<li><a href="productList.do?page=skirts">Skirts</a></li>
			<!-- product_skirts -->
		</ul>
	</nav>
</header>
</html>