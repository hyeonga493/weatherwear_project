package com.w2.weather;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WeatherDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public WeatherVO checkDate(String wdate) {
		System.err.println("[ WeatherDAO ] : checkDate");
		// System.err.println("        > wdate : " + wdate);
	
		WeatherVO result = sqlSessionTemplate.selectOne("WeatherDAO.checkDate", wdate);
		
		// System.err.println(">>>>>>>>>> result : " + result);
		
		return result;
	}
	
	public int saveWeather(WeatherVO vo) {
		System.err.println("[ WeatherDAO ] : insertWeather");
		
		int result = sqlSessionTemplate.insert("WeatherDAO.saveWeather", vo);
		
		// System.err.println(">>> insert : " + result);
		
		return result;
		//return sqlSessionTemplate.insert("WeatherDAO.insertWeather", vo);
	}
	
	public WeatherVO getWeather(WeatherVO vo) {
		System.err.println("[ WeatherDAO ] : getWeather");
		
		return (WeatherVO) sqlSessionTemplate.selectOne("WeatherDAO.getWeather", vo);
	}
	
}
