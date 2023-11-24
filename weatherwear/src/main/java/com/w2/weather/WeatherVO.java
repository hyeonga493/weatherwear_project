package com.w2.weather;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WeatherVO {

	private String wdate; // 날짜
	private String province = "seoul"; // 지역
	private double temp_min; // 최저기온
	private double temp_max; // 최고기온
	private int weather_id; // 날씨 코드

	public WeatherVO() {
		super();
	}

	public WeatherVO(String wdate, String province, Double temp_min, Double temp_max, int weather_id) {
		super();
		this.wdate = wdate;
		this.province = province;
		this.temp_min = temp_min;
		this.temp_max = temp_max;
		this.weather_id = weather_id;
	}
}
