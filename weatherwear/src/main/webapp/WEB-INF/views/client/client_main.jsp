<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="resources/client/css/style.css" rel="stylesheet" />
<title>mainIndex.jsp</title>
<!-- Style 태그는 head 태그 안에 있어야 합니다.-->
<style type="text/css">

#weather{
	width:95%;
	height:400px;
}

#background_img {
	background-repeat: no-repeat;
	background-position: center;
	background-size: 97%;
	height : 400px;
	display: flex; /* 자식 요소 가운데 정렬 */
	flex-direction: column;
	justify-content : center; /* 가로 정렬 */
	align-items: center; /* 세로 정렬 */
}

#today{
	text-align:right;
}

#today_day {
	font-weight: bold;
	font-size: 130%;
	text-align: center;
	color: white;
}

#today_date {
	margin-top:0;
	font-weight: bold;
	font-size: 150%;
	text-align: center;
	color: white;
}

#today_temp {
	font-size: 300%;
	font-weight: bold;
	text-align: center;
	color: white;
}

#week {
	display: flex; /* 자식 요소 가운데 정렬 */
	font-size: 120%;
	width: 100%;
	align-content: center;
	align-items: center;
}

#weekTable {
	margin: 50px auto 0 auto;
	width: 90%;
	text-align: center;
 	color: white; 
	opacity: 0.9;
}

#province{
	cursor: pointer;
  	background: rgb(255,255,255,0);
	border: none;
	font-size: 110%;
	color: white;
	width:600px;
	margin: 0 auto;
}

#prov{
	color: white;
	letter-spacing: 2px;
	
}

#provSelect {
	font-size:80%;
}

div.clearfixed::after {
	display: block;
	content: "";
	clear: both;
	opacity: 0.7;
}

.product .name {
  max-width: 190px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

</style>

<script>
$(document).ready(function() {
	let wId = ${ weather3_id };
	console.log(wId);
	image = '';
	
	switch(wId){
	// 천둥번개
	case 200: case 201: case 202: case 210: case 211: 
	case 212: case 221: case 230: case 231: case 232:
		image = 'resources/image/weather/thunder.gif';
		break;
	// 안개비
	case 300: case 301: case 302: case 310: case 311: 
	case 312: case 313: case 314: case 321:
		image = 'resources/image/weather/rainy.gif';
		break;
	// 비
	case 500: case 501: case 502: case 503: case 504: 
	case 511: case 520: case 521: case 522: case 531:
		image = 'resources/image/weather/rainyrainy.gif';
		break;
	// 눈
	case 600: case 601: case 602: case 611: case 612: 
	case 615: case 616: case 620: case 621: case 622:
		image = 'resources/image/weather/snowy.gif';
		break;
	// 안개
	case 701: case 711: case 721: case 731: case 741: 
	case 751: case 761: case 762: case 771: case 781:
		image = 'resources/image/weather/fog.gif';
		break;
	// 구름
	case 801: case 802: case 803: case 804:
		image = 'resources/image/weather/wind.gif';
		break;
	// 재난
	case 900: case 901: case 902: case 903: case 904: case 905: case 906:
		image = 'resources/image/weather/thunderthunder.gif';
		break;
	// 맑음
	case 800: default: //맑음으로 합니다.
		image = 'resources/image/weather/sunny.gif';
		break;
	}
	
	console.log("image" + image);
	var div = document.querySelector("#weather");
	
	div = "<section id='background_img' style='background-image:url(" + image + ");'>" + div.innerHTML;
	
	$("#weather").html(div);
});

function setProvince(){
	var province = document.getElementById("province").value;
	console.log(province);

	switch(province){
	case "seoul":	window.location.replace("clientMain.do?province=seoul");	break;
	case "chuncheon":	window.location.replace("clientMain.do?province=chuncheon");	break;
	case "suwon":	window.location.replace("clientMain.do?province=suwon");	break;
	case "incheon":	window.location.replace("clientMain.do?province=incheon");	break;
	case "daegu":	window.location.replace("clientMain.do?province=daegu");	break;
	case "busan":	window.location.replace("clientMain.do?province=busan");	break;
	case "jeju":	window.location.replace("clientMain.do?province=jeju");	break;
	default:	break;
	}
}


function setProvince(province){
	console.log(province);

	switch(province){
	case "seoul":	window.location.replace("clientMain.do?province=seoul");	break;
	case "chuncheon":	window.location.replace("clientMain.do?province=chuncheon");	break;
	case "suwon":	window.location.replace("clientMain.do?province=suwon");	break;
	case "incheon":	window.location.replace("clientMain.do?province=incheon");	break;
	case "daegu":	window.location.replace("clientMain.do?province=daegu");	break;
	case "busan":	window.location.replace("clientMain.do?province=busan");	break;
	case "jeju":	window.location.replace("clientMain.do?province=jeju");	break;
	default:	break;
	}
}
</script>
</head>
<body>
	<%@ include file="./base/header.jsp"%>
	<!-- 경고창 띄우기 -->
	<c:if test="${ msg != null }">
		<script>
			alert("${ msg }");
		</script>
	</c:if>
		<div class="clearfixed"></div>
	<div id="weather">
		<article id="province">
			<a id="prov" onClick="setProvince('seoul')">서울</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a id="prov" onClick="setProvince('chuncheon')">춘천</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a id="prov" onClick="setProvince('suwon')">수원</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a id="prov" onClick="setProvince('incheon')">인천</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a id="prov" onClick="setProvince('daegu')">대구</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a id="prov" onClick="setProvince('busan')">부산</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a id="prov" onClick="setProvince('jeju')">제주</a><br><br><br><br>
		</article>
		<article id="today">
			<span> </span><span> </span>
			<span id="today_day">
				<span id="provSelect">
					<c:if test="${ param.province == 'seoul' }">서울</c:if> 
					<c:if test="${ param.province == null }">서울</c:if> 
					<c:if test="${ param.province == 'chuncheon' }">춘천</c:if> 
					<c:if test="${ param.province == 'suwon' }">수원</c:if> 
					<c:if test="${ param.province == 'incheon' }">인천</c:if> 
					<c:if test="${ param.province == 'daegu' }">대구</c:if> 
					<c:if test="${ param.province == 'busan' }">부산</c:if> 
					<c:if test="${ param.province == 'jeju' }">제주</c:if> 
					&nbsp;&nbsp;&nbsp;
				</span>
				${ today.weatherday }요일
			</span><br>
			<span id="today_date"> ${ today.wdate } </span>
		</article>
		<span id="today_temp"><strong> ${ today.temp_min } °C / ${ today.temp_max } °C</strong></span>
		<article id="week">
			<table id="weekTable">
				<tr>
			 		<th>${ weather1.weatherday }</th>
			 		<th>${ weather2.weatherday }</th>
			 		<th>${ today.weatherday }</th>
			 		<th>${ weather4.weatherday }</th>
			 		<th>${ weather5.weatherday }</th>
				</tr>
				<tr>
					<td> ${ weather1.temp_min } / ${ weather1.temp_max }</td>
					<td> ${ weather2.temp_min } / ${ weather2.temp_max }</td>
					<td> ${ today.temp_min } / ${ today.temp_max }</td>
					<td> ${ weather4.temp_min } / ${ weather4.temp_max }</td>
					<td> ${ weather5.temp_min } / ${ weather5.temp_max }</td>
				</tr>
			</table>
		</article>
	</div>
	
	<div class="clearfixed"></div>
	<section id="best">
        <section id="contents">
			<article>
				<h2>Best View</h2>
				<c:forEach var="product" items="${ proBestView }" varStatus="int">
					<ul class="product">
						<li><a href="productInfo.do?proId=${product.proId}"><img src="${ product.imageDir }${ product.imageName }" style="width:190px; height:190px;"></a></li>
						<li class="name"><a href="productInfo.do?proId=${product.proId}">${product.proName}</a></li>
					</ul>
				</c:forEach>           	
			</article>
        </section>
        <section id="contents">
			<article>
				<h2>Best Sell</h2>
				<c:forEach var="product" items="${ proBestSell }" varStatus="int">
					<ul class="product">
						<li><a href="productInfo.do?proId=${product.proId}"><img src="${ product.imageDir }${ product.imageName }" style="width:190px; height:190px;"></a></li>
						<li class="name"><a href="productInfo.do?proId=${product.proId}">${product.proName}</a></li>
					</ul>
				</c:forEach>           	
			</article>
        </section>
	</section>
    <section id="middle">
        <section id="contents">
			<article>
				<h2>New Items</h2>
				<c:forEach var="product" items="${ proNew }" varStatus="int">
					<ul class="product">
						<li><a href="productInfo.do?proId=${product.proId}"><img src="${ product.imageDir }${ product.imageName }" style="width:190px; height:190px;"></a></li>
						<li class="name"><a href="productInfo.do?proId=${product.proId}">${product.proName}</a></li>
					</ul>
				</c:forEach>           	
			</article>
        </section>
    </section>
          
<%@ include file="./base/footer.jsp" %>
</body>