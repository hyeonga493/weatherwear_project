<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#지연언니
.main_image {
	width: 95%;
	margin: 0 auto;
}

.main_image>.date_icon>.today_date {
	position: absolute;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}

.main_image>.today_temp {
	position: absolute;
	top: 25%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}

.main_image>.date_icon>.weather_image {
	position: absolute;
	top: 35%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	width: 5%;
	height: auto;
}
</style>
</head>
<body>
	<a href="/w2/saveWeather.do">날씨 불러온다</a>
	<hr>
	<form action="getWeather.do" method="GET">
		<div class="main_image" style="text-align: center;">
			
			<div class="weather_pic" style="width: 95%; height: auto;">
				<c:if test="${weather3.weather_id eq 800}">
					<img src="resources/image/weather/sunny.gif"  alt="맑음">
				</c:if>
				<c:if test="${ ( weather3.weather_id >= 500 && weather3.weather_id <= 504 ) || ( weather3.weather_id >= 300 && weather3.weather_id <= 321 ) && ( weather3.weather_id <= 520 && weather3.weather_id <= 531 ) }">
					<img src="resources/image/weather/rainy.gif" style="width: 95%; max-width: 1000px; height: auto;" alt="비">
				</c:if>
				<c:if test="${weather3.weather_id >= 200 && weather3.weather_id <= 232}">
					<img src="resources/image/weather/thunder.gif" style="width: 95%; max-width: 1000px; height: auto;" alt="천둥번개">
				</c:if>
				<c:if test="${weather3.weather_id == 511 || (weather3.weather_id >= 600 && weather3.weather_id <= 622)}">
					<img src="resources/image/weather/snowy.gif" style="width: 95%; max-width: 1000px; height: auto;" alt="눈">
				</c:if>
				<c:if test="${weather3.weather_id == 802}">
					<img src="resources/image/weather/rainy.gif" style="width: 95%; max-width: 1000px; height: auto;" alt="비">
				</c:if>
			</div>
			
			<div class="date_icon">
				<div class="today_date" style="float: left; font-size: 20px">
					${weather3.wdate }
				</div>
				<div class="weather_image">
					<c:if test="${weather3.weather_id eq 800}">
						<img src="resources/image/weather/brightness-high.svg" alt="clear_sky">
					</c:if>
					<c:if test="${weather3.weather_id eq 801}">
						<img src="resources/image/weather/few_clouds_02d.png" alt="few_clouds">
					</c:if>
					<c:if test="${weather3.weather_id eq 802}">
						<img src="resources/image/weather/scattered_clouds_03d.png" alt="scattered_clouds">
					</c:if>
					<c:if test="${weather3.weather_id >= 803 && weather3.weather_id <= 804}">
						<img src="resources/image/weather/broken_clouds_04d.png" alt="broken_clouds">
					</c:if>
					<c:if test="${weather3.weather_id >= 200 && weather3.weather_id <= 232}">
						<img src="resources/image/weather/thunderstorm_11d.png" alt="thunderstorm">
					</c:if>
					<c:if test="${weather3.weather_id >= 500 && weather3.weather_id <= 504}">
						<img src="resources/image/weather/rain_10d.png" alt="rain">
					</c:if>
					<c:if test="${ ( weather3.weather_id >= 300 && weather3.weather_id <= 321 ) && ( weather3.weather_id <= 520 && weather3.weather_id <= 531 ) }">
						<img src="resources/image/weather/shower_rain_09d.png" alt="shower_rain">
					</c:if>
					<c:if test="${weather3.weather_id == 511 || (weather3.weather_id >= 600 && weather3.weather_id <= 622)}">
						<img src="resources/image/weather/snow_13d.png" alt="snow">
					</c:if>
					<c:if test="${weather3.weather_id >= 701 && weather3.weather_id <= 781}">
						<img src="resources/image/weather/mist_50d.png" alt="mist">
					</c:if>
				</div>
			</div>
			
			<div class="today_temp" style="font-size: 50px">
				<strong>${weather3.temp_max }°C / ${weather3.temp_min }°C</strong>
			</div><br>
			

		</div>
	</form>
	<hr>
</body>
</html>



