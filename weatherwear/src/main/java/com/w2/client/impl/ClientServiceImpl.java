package com.w2.client.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.w2.client.ClientDAO;
import com.w2.client.ClientService;
import com.w2.client.ClientVO;
import com.w2.paging.Paging;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientDAO dao;

	@Autowired
	private BCryptPasswordEncoder pwden;
	
	// 아이디 체크
	@Override
	public int idCheckService(String clientId) {
		System.out.println("[ Impl ] : idCheckService >" + clientId);
		
		int idCheck = dao.idCheck(clientId);
		System.err.println(">>>>>>>>>> idCheckService idCheck : " + idCheck);
		
		// 테스트
		if(idCheck == 1) { // 아이디 존재하는 경우
			System.err.println("[ ClientServiceImpl ] : 아이디 존재합니다.");
		} else {	// 아이디 존재하지 않는 경우
			System.err.println("[ ClientServiceImpl ] : 아이디 존재하지 않음");
		}
		return idCheck;
	}

	// 닉네임 체크
	public int nickCheckService(String clientNickName) {
		System.out.println("[ Impl ] : nickCheckService >" + clientNickName);

		int nickCheck = dao.nickCheck(clientNickName);
		System.err.println(">>>>>>>>>> getClientNickName idCheck : " + nickCheck);
		
		// 테스트
		if(nickCheck == 1) { // 아이디 존재하는 경우
			System.err.println("[ ClientServiceImpl ] : 닉네임 존재합니다.");
		} else {	// 아이디 존재하지 않는 경우
			System.err.println("[ ClientServiceImpl ] : 닉네임 존재하지 않음");
		}
		return nickCheck;
		
	}

	// 회원 정보 가져오기
	@Override
	public ClientVO getClientService(ClientVO client) {
		System.out.println("[ Impl ] : getClient >" + client.getClientId());
		
		//test
		ClientVO check = dao.getClient(client);
		System.err.println(">>>>>>>>>> getClientService client : " + check);
		
		return check;
	}
		
	// 회원 정보 수정
	@Override
	public ClientVO updateClient(ClientVO client) {
		System.out.println("[ Impl ] : updateClient >" + client.getClientId());

		return dao.updateClient(client);
	}

	// 탈퇴 요청
	@Override
	public ClientVO withdrawService(ClientVO client) {
		System.out.println("[ Impl ] : withdrawService >" + client.getClientId());
	
		if(dao.withdrawClient(client.getClientId()) == 1) {
			return client;
		} else {
			return null;
		}
	}
	
	// 비밀번호 변경 요청
	@Override
	public ClientVO changePwdService(ClientVO client) {
		System.out.println("[ Impl ] : changePwdService >" + client.getClientId());
		
		if(dao.updatePassword(client) == 1) {
			return client;
		} else {
			return null;
		}
	}
	
	// 회원 등록
	@Override
	public ClientVO insertService(ClientVO client) {
		System.out.println("[ Impl ] : insertService >" + client.getClientId());

		if(dao.insertClient(client) == 1) {
			return client;
		} else {
			return null;
		}
	}
	
	// 비밀번호 찾기
	@Override
	public void findPwd(HttpServletResponse response, ClientVO client) throws Exception{
		response.setContentType("text/html; charseh=utf-8");
		
		ClientVO check = new ClientVO();
		check.setClientId(client.getClientId());
		check = dao.getClient(check);

		String imsiPwd = "";
		
		for(int i=0; i<10; i++) {
			imsiPwd += (char)((Math.random()*26)+97);
		}
		
		client.setClientPwd(pwden.encode(imsiPwd));
		dao.updatePassword(client);
		
		
		String subject =  "WeatherWear 임시 비밀번호 입니다.";
		
		String msg = "<div align='center' style='border:1px solid black; font-family:verdana; width:80%; background-color:ivory;'><br><br><hr>";
		msg += "<a href='http://localhost:8080/w2/clientMain.do' style='text-decoration:none;'>";
		msg	+= "<img src='https://hyeongabucket.s3.ap-northeast-2.amazonaws.com/admin_image/logo_pull.png' style='width:500px; height:auto;'></a><br><br><hr><br><br>";
		msg += "<h2 style='color: blue;'>";
		msg += client.getClientId() + "님의 임시 비밀번호 입니다.</h2><br>";
		msg += "<p><h3 data-ke-size='size23'>임시 비밀번호 : ";
		msg += imsiPwd + "</h3><h3>비밀번호를 변경해주세요.</h3></p><br><br></div>";
		
		sendEmail(client, imsiPwd, subject, msg);
	}
	
	// 이메일 인증
	@Override
	public void sendEmail(ClientVO client, String imsiPwd, String subject, String msg) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "hyeonga1004@gmail.com";
		String hostSMTPpwd = "fjbr jivi yyen txtn";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = client.getClientEmail();

		String fromName = "[ WeatherWear ]";		

		// 받는 사람 E-Mail 주소
		String mail = client.getClientEmail();
		try {
			System.err.println("try 시작");
			
			HtmlEmail email = new HtmlEmail();
			email.setSmtpPort(587); //네이버 이용시 587 / 465
			email.setSSLOnConnect(true);
			
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	// 회원 리스트
	@Override
	public List<ClientVO> getClientList(ClientVO client){
		System.out.println("[ Impl ] : getClientList >" + client.getClientId());

		return dao.clientList(client);
	}
	
	@Override
	public int getClientCount(ClientVO client) {
		System.out.println("[ Impl ] : getClientCount >" + client.getClientId());

		return dao.searchCount(client.getSearch());
	}
}
