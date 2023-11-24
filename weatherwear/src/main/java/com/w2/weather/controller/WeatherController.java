package com.w2.weather.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		String province = "seoul";

		// API url 주소
		String apiUrl = "https://api.openweathermap.org/data/2.5/forecast?";

		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append(URLEncoder.encode("q", "UTF-8") + "=" + URLEncoder.encode(province, "UTF-8")); // 지역(서울)
		urlBuilder.append("&" + URLEncoder.encode("appid", "UTF-8") + "=" + apiId);
		urlBuilder.append("&" + URLEncoder.encode("units", "UTF-8") + "=" + URLEncoder.encode("metric", "UTF-8")); // 섭씨

		// 날씨 데이터를 받아올 url 주소
		URL url = new URL(urlBuilder.toString());
		//System.out.println("URL : " + url);
		
		// GET 방식, json형태로 받아오고, 제대로 연결되었는지 확인
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());

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
			//List<WeatherVO> weatherList = new ArrayList<>();
			WeatherVO vo = new WeatherVO();
			
			for (int i = 0; i < list.size(); i++) {

				JSONObject data = (JSONObject) list.get(i);

				String dt_txt = (String) data.get("dt_txt");

				String date = dt_txt.substring(0, 13); // 날짜
				String time = dt_txt.substring(11, 13); // 시간
				
				//System.err.println(i + " > date : " + date);
				//System.err.println(i + " > time : " + time);
				
				JSONObject main = (JSONObject) data.get("main");
				//System.err.println(i + " > main : " + main.toString());
				
				JSONArray weather = (JSONArray) data.get("weather");
				JSONObject weatherId = (JSONObject) weather.get(0);
				long id = (long) weatherId.get("id");
				//System.err.println(i + " > id : " + id);
				
				if((!time.equals("06")) && (!time.equals("15"))){
					// System.err.println("err : " + time + "지나간다");
					continue;
				}
				if (time.equals("06")) {
					String tempStr = main.get("temp").toString();
					double temp = Double.parseDouble(tempStr);
					vo.setWdate(date.substring(0, 10));
					vo.setProvince(province);
					vo.setTemp_min(temp);
					
					//System.err.println(i + " 6시 이후 >>>>>> " + vo.toString());
				}

				if (time.equals("15")) {
					String tempStr = main.get("temp").toString();
					double temp = Double.parseDouble(tempStr);
					
					vo.setTemp_max(temp);
					vo.setWeather_id((int) id);

					///weatherList.add(vo); // weatherList에 추가
					//System.err.println(i + " 15시 이후 >>>>>> " + vo.toString());
					
					//System.err.println(i + " >>> check 전에 vo : " + vo.toString());
					
					/* 날짜가 null인 경우 toString에서 nullpointException이 발생
					if(weatherService.checkDate(vo)!=null) {	
						System.err.println("vo : " + vo.toString());
					}
					*/
					
					
					// 3시 데이터 넣고 삽입해야하므로 if문 안에 작성합니다.
					if(weatherService.saveWeather(vo) > 0) {
						System.out.println("insert 성공");
					} else {
						System.out.println("insert 실패");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	
	@RequestMapping("/getWeather.do")
	public String getWeather(WeatherVO vo, Model model) {
		System.out.println("[ WeatherController ] : getWeather");
		log.debug(null);
		
		Date d = new Date();
		for(int i=1; i<6; i++) {
			String date = Utility.getDate(d, (i-3));
			vo.setWdate(date);
			
			model.addAttribute("weather" + i, weatherService.getWeather(vo));
			System.err.println("------- getWeather vo : " + weatherService.getWeather(vo));
		}
		//weather1 : -2
		//weather2 : -1
		//weather3 : 오늘
		//weather4 : +1
		//weather5 : +2
		
		return "client/base/weather";
	}
	
}