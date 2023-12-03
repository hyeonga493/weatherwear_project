package com.w2.client.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.w2.client.ClientVO;
import com.w2.weather.Utility;
import com.w2.weather.WeatherService;
import com.w2.weather.WeatherVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ClientGetController {

	@Autowired
	private WeatherService weatherService;
	 
	public void checkTime() {
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				LocalDateTime now = LocalDateTime.now();
				DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String fmNow = now.format(fm);
			}
		}, 0, 1000*60*60*24); //하루에 한 번 실행합니다.
	}
	
	// 메인페이지 호출
	@RequestMapping("/clientMain.do")
	public ModelAndView clientMain(WeatherVO vo, Model model, HttpServletRequest request) {
		System.out.println("[ ClientGetController ] : clientMain");
		log.debug(null);
		
		ModelAndView mv = new ModelAndView("client/client_main");

		if(request.getParameter("province") != null) {
			vo.setProvince(request.getParameter("province"));
		} else {
			vo.setProvince("seoul");
		}
		
		List<WeatherVO> wList = weatherService.getWeatherList(vo);
		System.err.println("weatherList : " + wList);
		mv.addObject("weather3_id", wList.get(2).getWeather_id());
		model.addAttribute("today", wList.get(2));
		model.addAttribute("weather1", wList.get(0));
		model.addAttribute("weather2", wList.get(1));
		model.addAttribute("weather4", wList.get(3));
		model.addAttribute("weather5", wList.get(4));

		checkTime();
		System.err.println("지역 : " + vo.getProvince());
		return mv;
	}
	
	// 로그인 페이지 호출
	@RequestMapping("/clientLogin.do")
	public String clientLogin() {
		System.out.println("[ ClientGetController ] : clientLogin");
		
		return "client/client_login";
	}
	
	// 로그아웃 요청
	@RequestMapping("/clientLogout.do")
	public String clientLogout(HttpSession session) {
		System.out.println("[ ClientGetContoller ] : clientLogout");

		if(session != null) {
			session.invalidate();
		}
		return "redirect:/clientMain.do";
	}
	
	// 회원 가입 페이지 요청
	@RequestMapping("/clientJoin.do")
	public String clientJoin() {
		System.out.println("[ ClientGetController ] : clientJoin");
	
		return "client/client_join";
	}

	// 회원 탈퇴 페이지 요청
	@RequestMapping("/clientWithdraw.do")
	public String clientWithdraw(ClientVO client) {
		System.out.println("[ ClientGetController ] : clientWithdraw/get");
		
		return "/client/client_withdraw";
	}
	
	// 회원 비밀번호 확인 페이지 요청
	@RequestMapping("/passwordCheck.do")
	public String passwordCheck(ClientVO client) {
		System.out.println("[ ClientGetController ] : passwordCheck/get");
		
		return "/client/client_checkPwd";
	}
	
	// 회원 비밀번호 확인 페이지 요청
	@RequestMapping("/clientPassword.do")
	public String passwordChange(ClientVO client) {
		System.out.println("[ ClientGetController ] : clientPassword/get");
		
		return "/client/client_changePwd";
	}
	
	// 회원 마이페이지 요청
	@RequestMapping("/clientMypage.do")
	public String clientMypage(ClientVO client) {
		System.out.println("[ ClientGetController ] : clientMypage/get");
		
		return "/client/client_mypage";
	}
	
	// 회원 정보 수정 페이지 요청
	@RequestMapping("/clientUpdate.do")
	public String clientUpdate(ClientVO client) {
		System.out.println("[ ClientGetController ] : clientUpdate/get");
		
		return "/client/client_update";
	}
	
	// 회원 정보 찾기 페이지 요청
	@RequestMapping("/clientFind.do")
	public String clientFind(ClientVO client) {
		System.out.println("[ ClientGetController ] : clientFind/get");
		
		return "/client/client_find";
	}
	
	// 네이버 로그인
	@RequestMapping("/naverLogin.do")
	public String naverLogin(ClientVO client) {
		System.out.println("[ ClientGetController ] : naverLogin/get");
		
		return "/client/client_login";
	}
}
