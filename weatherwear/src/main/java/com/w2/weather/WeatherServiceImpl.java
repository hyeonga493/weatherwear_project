package com.w2.weather;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("weatherService")
public class WeatherServiceImpl implements WeatherService {

	@Autowired
	private WeatherDAO dao;

	@Override
	public WeatherVO checkDate(WeatherVO vo) {
		System.err.println("[WeatherServiceImpl] : checkDate");
		WeatherVO result = dao.checkDate(vo.getWdate());
		// System.err.println("result : " + result);

		return result;
	}

	@Override
	public int saveWeather(WeatherVO vo) {
		System.err.println("[WeatherServiceImpl] : insertWeather");
		
		//System.err.println("______impl vo : " + vo.toString());
		
		if(vo.getWdate() == null) {
			// System.err.println("값없으니 돌아가 >>>>>>>>");
			return 0;
		}
		
		int result = dao.saveWeather(vo);
		// System.err.println("_______result : " + result);

		return result;
	}

	@Override
	public WeatherVO getWeather(WeatherVO vo) {
		return dao.getWeather(vo);
	}
	
}
