package com.w2.weather;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class Utility {
 
	/**
	 * @return yyyy.MM.dd 형식 날짜 반환
	 */
	public static String getDate(Long unixTime) {
		Date date = new Date(unixTime * 1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));
		String day = sdf.format(date);
		
		return day;
	}
	
	/**
	 * @return "yyyy-MM-dd" 형식의 String 날짜를 받아와서 요일을 반환
	 */
	public static String getDay(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date strToDate = null;
		String day = "";
		try {
			strToDate = sdf.parse(dateStr);
			Calendar cal = Calendar.getInstance();
			cal.setTime(strToDate);
			
			int dayNum = cal.get(Calendar.DAY_OF_WEEK);
			switch(dayNum) {
				case 1:
					day = "일"; break;
				case 2:
					day = "월"; break;
				case 3:
					day = "화"; break;
				case 4:
					day = "수"; break;
				case 5:
					day = "목"; break;
				case 6:
					day = "금"; break;
				case 7:
					day = "토"; break;
			}
		} catch(ParseException e) {
			e.printStackTrace();
		}

		return day;
	}
	
	/**
	 * @return Date 형식의 날짜를 yyyy-MM-dd 형식의 string으로 반환
	 */
	public static String getDate(Date d, int day) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		cal.add(cal.DATE, day);
		String date = sdf.format(cal.getTime());
		
		return date;
	}
	
	public static void main(String[] args) {
		String dateStr = "2023-11-18";
		String day = Utility.getDay(dateStr);
		System.out.println(day);
		
		Date d = new Date();
		String yesterday = Utility.getDate(d, 0);
		System.out.println(yesterday);
		
	}

}
