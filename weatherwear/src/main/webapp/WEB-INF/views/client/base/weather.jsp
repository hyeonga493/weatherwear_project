<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#background_img {
background-repeat: no-repeat;
background-position: center;
width : 95%;
height : 400px;
}

#today_date {
font-weight: bold;
text-align: center;
}

#date_icon {
width: 30px;
height: 30px;
}

#today_temp {
font-size: 50px;
font-weight: bold;
text-align: center;
color: white;
}
</style>
</head>
<body>
	<a href="/w2/saveWeather.do">날씨 불러온다</a>
	<hr>
		<div class="main_image" style="text-align: center;">
			
			<c:if test="${weather3.weather_id eq 800}">
				<section id="background_img" style="background-image: url('resources/image/weather/sunny.gif');"  alt="맑음">
			</c:if>
			<c:if test="${ ( weather3.weather_id >= 500 && weather3.weather_id <= 504 ) || ( weather3.weather_id >= 300 && weather3.weather_id <= 321 ) && ( weather3.weather_id <= 520 && weather3.weather_id <= 531 ) }">
				<section id="background_img" style="background-image: url('resources/image/weather/rainy.gif');" alt="비">
			</c:if>
			<c:if test="${weather3.weather_id >= 200 && weather3.weather_id <= 232}">
				<section id="background_img" style="background-image: url('resources/image/weather/thunder.gif');" alt="천둥번개">
			</c:if>
			<c:if test="${weather3.weather_id == 511 || (weather3.weather_id >= 600 && weather3.weather_id <= 622)}">
				<section id="background_img" style="background-image: url('resources/image/weather/snowy.gif');" alt="눈">
			</c:if>
			<c:if test="${weather3.weather_id == 802}">
				<section id="background_img" style="background-image: url('resources/image/weather/rainy.gif');" alt="비">
			</c:if>
				
				<span id="today_temp"><strong>${weather3.temp_max }°C / ${weather3.temp_min }°C</strong></span>
			</section>
			
			

		</div>
	<hr>
</body>
</html>



