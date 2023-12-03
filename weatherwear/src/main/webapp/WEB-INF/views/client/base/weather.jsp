<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
 
#background_img {
background-repeat: no-repeat;
background-position: center;
background-size: 100%;
height : 400px;

display: flex; /* 자식 요소 가운데 정렬 */
flex-direction: column;
justify-content : center; /* 가로 정렬 */
align-items: center; /* 세로 정렬 */
}

#today_date {
font-weight: bold;
font-size: 30px;
text-align: center;
color: white;
}

#today_temp {
font-size: 60px;
font-weight: bold;
text-align: center;
color: white;
}

</style>

<script>
$(document).ready(function() {	
	
	let wId = ${ weather3_id };
	//wId = 901;
	//console.log(wId);
	let max = '${ weather3_max }';
	let min = '${ weather3_min }';
	let date = '${ weather3_date }';
	
	image = '';
	
	switch(wId){
	// 천둥번개
	case 200: case 201: case 202: case 210: case 211: case 212: case 221: case 230: case 231: case 232:
		image = 'resources/image/weather/thunder.gif';
		break;
	// 안개비
	case 300: case 301: case 302: case 310: case 311: case 312: case 313: case 314: case 321:
		image = 'resources/image/weather/rainy.gif';
		break;
	// 비
	case 500: case 501: case 502: case 503: case 504: case 511: case 520: case 521: case 522: case 531:
		image = 'resources/image/weather/rainyrainy.gif';
		break;
	// 눈
	case 600: case 601: case 602: case 611: case 612: case 615: case 616: case 620: case 621: case 622:
		image = 'resources/image/weather/snowy.gif';
		break;
	// 안개
	case 701: case 711: case 721: case 731: case 741: case 751: case 761: case 762: case 771: case 781:
		image = 'resources/image/weather/fog.gif';
		break;
	// 맑음
	case 800:
		image = 'resources/image/weather/sunny.gif';
		break;
	// 구름
	case 801: case 802: case 803: case 804:
		image = 'resources/image/weather/cloudy.gif';
		break;
	// 재난
	case 900: case 901: case 902: case 903: case 904: case 905: case 906:
		image = 'resources/image/weather/thunderthunder.gif';
		break;
	default: //맑음으로 합니다.
		image = 'resources/image/weather/sunny.gif';
		break;
	}
	
	console.log("image" + image);
	$("#weather").html("<section id='background_img' style='background-image:url(" + image + ");'>" 
					+ "<span id='today_date'>" + date + "</span><br>"
					
					+ "<span id='today_temp'>"
					+ "<strong>" + min + "°C / " + max + "°C</strong>"
					+ "</span>" 
					+ "</section>");
});
</script>

</head>
<body>
	<a href="/w2/saveWeather.do">날씨 불러온다</a>
	<hr>
		${ weather3.wdate }
	<hr>
	<div id="weather">
	
		
				
	</div>
	<div id="totalWeather">
		<h1>확인</h1>
		
		<table id="check" style="width:400px;">
			<tr>
				<th>date</th><th>province</th><th>min</th><th>max</th><th>id</th>
			</tr>
			<c:forEach var="day" items="${ wList }">
			<tr style="text-align: center;">
				<td>${ day.wdate }</td>
				<td>${ day.province }</td>
				<td>${ day.temp_min }</td>
				<td>${ day.temp_max }</td>
				<td>${ day.weather_id }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
	</div>
</body>
</html>



