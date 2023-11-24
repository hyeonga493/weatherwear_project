package com.w2.client;

import javax.servlet.http.HttpServletResponse;

public interface ClientService {

	// 아이디 체크
	public int idCheckService(String clientId);

	// 회원 정보 가져오기
	public ClientVO getClientService(ClientVO client);

	// 회원 정보 수정
	public ClientVO updateClient(ClientVO client);

	// 탈퇴 요청
	public ClientVO withdrawService(ClientVO client);
	
	// 비밀번호 변경 요청
	public ClientVO changePwdService(ClientVO client);
	
	// 회원 등록
	public ClientVO insertService(ClientVO client);
	
	// 이메일 인증
	public void sendEmail(ClientVO client,  String div) throws Exception;
	
	// 비밀번호 찾기
	public void findPwd(HttpServletResponse response, ClientVO client) throws Exception;
}
