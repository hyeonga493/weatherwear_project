package com.w2.client;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

//import com.w2.admin.blackList.BlackListVO;
import com.w2.paging.SearchVO;

public interface ClientService {

	// 아이디 체크
	public int idCheckService(String clientId);
 
	// 닉네임 체크
	public int nickCheckService(String clientNickName);

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
	public void sendEmail(ClientVO client, String imsiPwd, String subject, String msg) throws Exception;
	
	// 비밀번호 찾기
	public void findPwd(HttpServletResponse response, ClientVO client) throws Exception;

	// 회원 리스트 조회
	public List<ClientVO> getClientList(ClientVO client);
}
