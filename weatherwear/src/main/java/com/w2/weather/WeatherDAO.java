package com.w2.weather;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

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
	
	public List<WeatherVO> getWeatherList(WeatherVO vo){
		Map<String, Object> map = new HashMap<>();
		map.put("province", vo.getProvince());	
		
		Date d = new Date();

		for(int i=1; i<6; i++) {
			String date = Utility.getDate(d, (i-3));
			
			vo.setWdate(date);
			map.put("day_"+i, date);
		}
		
		List<WeatherVO> result = sqlSessionTemplate.selectList("WeatherDAO.getWeatherList", map);
		
		System.err.println("[ DAO ] List : " + result);
		return result;
	}
	
}
