package com.w2.client.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.client.ClientVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ClientGetController {
	// 메인페이지 호출
	@RequestMapping("/clientMain.do")
	public String clientMain() {
		System.out.println("[ ClientGetController ] : clientMain");
		log.debug(null);
		
		return "client/client_main";
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
