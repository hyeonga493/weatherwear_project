package com.w2.weather;

import java.util.List;

public interface WeatherService {
	 
	public WeatherVO checkDate(WeatherVO vo);

	public int saveWeather(WeatherVO vo);
	
	public WeatherVO getWeather(WeatherVO weatherVO);

	public List<WeatherVO> getWeatherList(WeatherVO vo);
}
