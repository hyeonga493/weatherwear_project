package com.w2.weather.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.w2.weather.Utility;
import com.w2.weather.WeatherService;
import com.w2.weather.WeatherVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class WeatherController {
	 
	@Autowired
	private WeatherService weatherService;
	
	// API 인증 키
	String apiId = "485c891112814cdce063d91ca3359ab4";
	
	/**
	 * 날씨를 json형태로 받아와서 DB에 저장 및 업데이트
	 */
	@RequestMapping("/saveWeather.do")
	public String saveWeather() throws IOException, ParseException {
		
		//String province = "seoul";
		List<String> pvList = new ArrayList<String>();
		pvList.add("seoul");
		pvList.add("busan");
		pvList.add("daegu");
		pvList.add("chuncheon");
		pvList.add("suwon");
		pvList.add("incheon");
		pvList.add("jeju");
		
		// API url 주소
		String apiUrl = "https://api.openweathermap.org/data/2.5/forecast?";


		for(String province : pvList) {

			StringBuilder urlBuilder = new StringBuilder(apiUrl);
			urlBuilder.append(URLEncoder.encode("q", "UTF-8") + "=" + URLEncoder.encode(province, "UTF-8")); // 지역(서울)
			urlBuilder.append("&" + URLEncoder.encode("appid", "UTF-8") + "=" + apiId);
			urlBuilder.append("&" + URLEncoder.encode("units", "UTF-8") + "=" + URLEncoder.encode("metric", "UTF-8")); // 섭씨
	
			// 날씨 데이터를 받아올 url 주소
			URL url = new URL(urlBuilder.toString());
			//System.err.println("URL : " + url);
			System.err.println(">>>>>>>>>>>>>>> province : " + province);
			
			if(url != null) {
				// GET 방식, json형태로 받아오고, 제대로 연결되었는지 확인
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/json");
				System.err.println("Response code: " + conn.getResponseCode());
		
				BufferedReader br;
				if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				}
		
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}
		
				br.close();
				conn.disconnect();
		
				String dataJson = sb.toString();
		
				// json 에서 데이터 파싱
				try {
					JSONParser parser = new JSONParser();
					JSONObject jsonObject = (JSONObject) parser.parse(dataJson);
					JSONArray list = (JSONArray) jsonObject.get("list");
		
					WeatherVO vo = new WeatherVO();

					double minTemp = 30.0;
					double maxTemp = 0.0;	
					System.err.println("초기화");
					
					
					for (int i = 0; i < list.size(); i++) {
						if(i==0) {
							System.err.println("@@@@@@@@@@@@@@ 다음 도시");
						}
						JSONObject data = (JSONObject) list.get(i);

						
						String dt_txt = (String) data.get("dt_txt");
		
						String date = dt_txt.substring(0, 13); // 날짜
						String time = dt_txt.substring(11, 13); // 시간
		
		
						JSONObject main = (JSONObject) data.get("main");
						
						JSONArray weather = (JSONArray) data.get("weather");
						JSONObject weatherId = (JSONObject) weather.get(0);
						long id = (long) weatherId.get("id");
		
						vo.setWdate(date.substring(0, 10));
						vo.setWeatherday(Utility.getDay(date.substring(0, 10)));
						vo.setProvince(province);
						
						double temp = Double.parseDouble(main.get("temp").toString());
						System.err.println("온도온도 : " + temp);
						
						
						if(temp < minTemp) {
							minTemp = Math.round(temp*10)/10.0;
							System.err.println(">> 작은수로변경 : " + temp);
						}
						if(temp > maxTemp) {				
							maxTemp = Math.round(temp*10)/10.0;
							System.err.println(">>>> 큰수로변경 : " + temp);
						}
						
						vo.setTemp_min(minTemp);
						vo.setTemp_max(maxTemp);	
						
						if (time.equals("15")) {
							vo.setWeather_id((int) id);
						}
						
						if(time.equals("21")) {
							if(weatherService.saveWeather(vo) > 0) {
								System.out.println("insert 성공");
							} else {
								System.out.println("insert 실패");
							}
							System.err.println(minTemp + " : " + maxTemp);
						}
					}
					System.err.println(" > min : " + minTemp + "/ max : " + maxTemp);
	
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:clientMain.do";
	}
	
	/*
		weather1 : -2
		weather2 : -1
		weather3 : 오늘
		weather4 : +1
		weather5 : +2
	 */	
	@RequestMapping("/getWeather.do")
	public ModelAndView getWeather(WeatherVO vo, Model model) {
		System.out.println("[ WeatherController ] : getWeather");
		log.debug(null);
		
		Date d = new Date();
		ModelAndView mv = new ModelAndView("client/base/weather");
		List<WeatherVO> wList = new ArrayList<WeatherVO>();
		
		for(int i=1; i<6; i++) {
			String date = Utility.getDate(d, (i-4));
			System.err.println("++++++++++++++++++" + Utility.getDay(date.substring(0, 10)));
			vo.setWdate(Utility.getDay(date));
			vo.setWdate(date);
			vo = weatherService.getWeather(vo);
			wList.add(vo);
			model.addAttribute("wList", wList);
			
			mv.addObject("weather"+i+"_id", vo.getWeather_id());
			mv.addObject("weather"+i+"_max", vo.getTemp_max());
			mv.addObject("weather"+i+"_min", vo.getTemp_min());
			mv.addObject("weather"+i+"_date", vo.getWdate());
			System.err.println(vo.getWdate());
		}
		return mv;
	}
}