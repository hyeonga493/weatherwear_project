package com.w2.weather;

public interface WeatherService {
	
	public WeatherVO checkDate(WeatherVO vo);

	public int saveWeather(WeatherVO vo);
	
	public WeatherVO getWeather(WeatherVO weatherVO);

}
