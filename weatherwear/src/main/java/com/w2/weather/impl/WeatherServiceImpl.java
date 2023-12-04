package com.w2.weather.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.weather.WeatherDAO;
import com.w2.weather.WeatherService;
import com.w2.weather.WeatherVO;

@Service("weatherService")
public class WeatherServiceImpl implements WeatherService {
 
	@Autowired
	private WeatherDAO dao;

	@Override
	public WeatherVO checkDate(WeatherVO vo) {
		System.err.println("[WeatherServiceImpl] : checkDate");
		WeatherVO result = dao.checkDate(vo.getWdate());

		return result;
	}

	@Override
	public int saveWeather(WeatherVO vo) {
		System.err.println("[WeatherServiceImpl] : insertWeather");
		
		if(vo.getWdate() == null) {
			return 0;
		}
		
		int result = dao.saveWeather(vo);

		return result;
	}

	@Override
	public WeatherVO getWeather(WeatherVO vo) {
		return dao.getWeather(vo);
	}
	
	@Override
	public List<WeatherVO> getWeatherList(WeatherVO vo){
		return dao.getWeatherList(vo);
	}
}
