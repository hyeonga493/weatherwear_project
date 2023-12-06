package com.w2.client.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.client.ClientService;
import com.w2.client.ClientVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ClientPostController {

	@Autowired
	private ClientService service;
 
	@Autowired
	private BCryptPasswordEncoder pwden;
	
	@RequestMapping("/do.do")
	public String dodo() {
		return "test/prac";
	}
	
	@PostMapping("getCheckbox.do")
	public String getCheck(HttpServletRequest request) {
		String[] deleteCode = request.getParameter("deleteList").split(",");
		String[] selectCode = request.getParameter("selectList").split(",");

		List<String> deleteList = new ArrayList<String>();
		List<String> selectList = new ArrayList<String>();
		
		for(int i=0; i<deleteCode.length; i++) {
			deleteList.add(deleteCode[i].toString());
			selectList.add(selectCode[i].toString());
		}

		System.err.println("deleteList : " + deleteList);
		System.err.println("selectList : " + selectList);
		
		return "redirect:/do.do";
	}
	
	// 아이디 체크
	@PostMapping("/checkId.do")
	public void checkId(ClientVO client, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		System.out.println("[ Controller ] : checkId");

		System.err.println("@@@@@ controller clientId : " + client.getClientId());

		// test
		int check = service.idCheckService(client.getClientId());
		System.err.println("@@@@@ controller check : " + check);

		if (check == 1) {
			System.err.println("아이디 있음");
		} else {
			System.err.println("아이디 없음");
		}

		response.setContentType("applicaion/json");
		response.getWriter().write(String.valueOf(check));
	}
	
	// 닉네임 체크
	@PostMapping("/checkNick.do")
	public void checkNick(ClientVO client, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		System.out.println("[ Controller ] : checkNick");

		System.err.println("cNickname : " + client.getClientNickName());
		
		// test
		int check = service.nickCheckService(client.getClientNickName());

		if (check == 1) {
			System.err.println("닉네임 있음");
		} else {
			System.err.println("닉네임 없음");
		}

		response.setContentType("applicaion/json");
		response.getWriter().write(String.valueOf(check));
	}
	
	// 회원 정보 가져오기
	@PostMapping("/getClient.do")
	public void getClient(ClientVO client) {
		System.out.println("[ Controller ] : getClient");

		System.err.println("@@@@@ controller clientId : " + client.getClientId());
		ClientVO result = service.getClientService(client);
		System.err.println("@@@@@ controller client : " + result.toString());

		// 테스트
		if (result != null) {
			System.err.println("[ Controller ] : 회원 존재");
		} else {
			System.err.println("[ Controller ] : 회원 없음");
		}
	}

	// 로그인
	@PostMapping("/clientLogin.do")
	public String clientLogin(ClientVO client, HttpServletRequest request) {
		System.out.println("[ Controller ] : clientLogin");

		HttpSession session = request.getSession(false);

		System.err.println("@@@@@ controller clientId : " + client.getClientId());

		ClientVO result = service.getClientService(client);
		//System.err.println("@@@@@ controller client : " + result.toString());
		
		// 테스트
		if (result != null) {
			System.err.println(">>[ Controller ] : 회원 존재");

			if (pwden.matches(client.getClientPwd(), result.getClientPwd())) {
				System.err.println(">>>> [ Controller ] : 비밀번호 일치");

				session.setAttribute("client", result);
				session.setAttribute("clientId", result.getClientId());
				System.err.println(">>>>>> [ Controller ] : 세션 설정 " + result.toString());

				//ClientVO cl = (ClientVO)session.getAttribute("client");
				//System.err.println("________________ cl : " + cl.toString());
				
				// 세션 확인 가능
				//System.err.println(">>>>>>>> session.getAttribute : " + session.getAttribute("clientId"));
				//System.err.println(">>>>>>>> session.getValue : " + session.getValue("client"));

				/*
				 * ClientVO vo =
				 * (ClientVO)session.getAttribute(session.getAttributeNames().nextElement());
				 * System.out.println(vo.toString());
				 */

				// return "redirect:/do.do";
				return "redirect:/clientMain.do";
			}
			System.err.println(">>>> [ Controller ] : 비밀번호 불일치");
		}
		return "redirect:/clientLogin.do";
	}

	// 비밀번호 확인
	@PostMapping("/passwordCheck.do")
	public String passwordCheck(ClientVO client) {
		System.out.println("[ Controller ] : clientLogin");

		System.err.println("@@@@@ controller clientPwd : " + client.getClientPwd());
		
		ClientVO result = service.getClientService(client);
		System.err.println("@@@@@ controller client : " + result.toString());

		
		if (result == null) {
			System.err.println(">>[ Controller ] : 데이터 없음");

			return "redirect:/clientMain.do";
		}
		else if (pwden.matches(client.getClientPwd(), result.getClientPwd())) {
			System.err.println(">>[ Controller ] : 비밀번호 일치");

			// return "redirect:/do.do";
			return "redirect:/clientUpdate.do";
		} else {
			System.err.println(">>[ Controller ] : 비밀번호 불일치");

			return "redirect:/passwordCheck.do";
		}
	}
	
	// 비밀번호 수정
	@PostMapping("/clientPassword.do")
	public String passwordChange(ClientVO client, HttpServletRequest request) {
		System.out.println("[ Controller ] : clientPassword");
		client.setClientPwd(pwden.encode(client.getClientPwd()));
		
		HttpSession session = request.getSession(false);
		
		System.err.println("@@@@@ clientPassword client : " + client.toString());
		ClientVO result = service.getClientService(client);
		
		if (result != null) {
			System.err.println(">>[ Controller ] : 데이터 있음");

			if(service.changePwdService(client)!= null) {
				System.err.println(">>>>[ Controller ] : 변경 완료");
				
				session.invalidate();
				System.err.println(">>>>[ Controller ] : 세션 종료");
				
				// 세션 만료 확인
				if(request.isRequestedSessionIdValid() == true) {
					System.err.println("세션 아직 살아있다");
				} else {
					System.err.println("세션 사라졌다");
				}
				return "redirect:/clientMain.do";
			} else {
				System.err.println(">>>>[ Controller ] : 변경 실패");
				
				return "redirect:/clientMypage.do";
			}
		} else {
			System.err.println(">>[ Controller ] : 비밀번호 불일치");

			return "redirect:/passwordCheck.do";
		}
	}
	
	// 정보 수정
	@PostMapping("/clientUpdate.do")
	public String clientUpdate(ClientVO client, HttpSession session) {
		System.out.println("[ Controller ] : clientUpdate");

		ClientVO result = service.updateClient(client);

		if (result != null) {
			System.err.println(">>[ Controller ] : 회원 존재");
			
			session.setAttribute("client", result);

			return "redirect:/clientMypage.do";
		}
		System.err.println(">> [ Controller ] : 회원 없음");
		return "redirect:/clientLogin.do";
	}

	// 탈퇴 요청
	@PostMapping("/clientWithdraw.do")
	public String clientWithdraw(ClientVO client, HttpServletRequest request) {
		System.out.println("[ Controller ] : clientWithdraw");
		
		HttpSession session = request.getSession(false);

		ClientVO result = service.getClientService(client);

		if (pwden.matches(result.getClientPwd(), client.getClientPwd())) {
			System.err.println(">>[ Controller ] : 비밀번호 일치");

			if(service.withdrawService(result)!= null) {
				
				session.invalidate();
				System.err.println(">>>>[ Controller ] : 세션 종료");
				
				/* 세션이 삭제된 후에도 session.getId() 값은 여전히 남아있을 수 있습니다
				 * 일정 시간이 지나면 사라짐
				System.err.println(">>>>>>>> session.getId : " + session.getId());
				*/
				return "/clientMain.do";
			} else {
				System.err.println(">>>>[ Controller ] : 탈퇴 실패");
				
				return "redirect:/clientMypage.do";
			}
		} else {
			System.err.println(">>[ Controller ] : 비밀번호 불일치");

			return "redirect:/passwordCheck.do";
		}
	}

	// 회원 등록
	@PostMapping("/clientJoin.do")
	public String clientJoin(ClientVO client) {
		System.out.println("[ Controller ] : clientJoin/post");
		client.setClientPwd(pwden.encode(client.getClientPwd()));
		
		if(client.getClientRecId() == null || client.getClientRecId().equals(""))
			client.setClientRecId(null);
		
		if (service.insertService(client) != null) {
			System.err.println(">>[ Controller ] : 성공");
			return "redirect:/clientLogin.do";
		} else {
			System.err.println(">> [ Controller ] : 실패");
			return "redirect:/clientJoin.do";
		}
	}
	
	// 회원 정보 찾기
	@PostMapping("/clientFind.do")
	public String clientFind(ClientVO client,String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("[ Controller ] : clientFind/post");

		ClientVO check = new ClientVO();

		if((client.getKeyword().equals("Id") || keyword == null)) {
			check.setClientName(client.getClientName());
			
			check = service.getClientService(check);
		} else {
			check.setClientId(client.getClientId());
			
			check = service.getClientService(check);
		}
		
		boolean checkName = check.getClientName().equals(client.getClientName());
		boolean checkEmail = check.getClientEmail().equals(client.getClientEmail());
		boolean checkId = check.getClientId().equals(client.getClientId());

		if(!checkEmail) {
			System.err.println("이메일이 다릅니다.");
			return "redirect:/clientFind.do?keyword="+client.getKeyword();
		}
		
		if((client.getKeyword().equals("Id") || keyword == null)) {
			if(!checkName) {
				System.err.println("아이디가 존재하지 않습니다.");
				return "redirect:/clientFind.do?keyword="+client.getKeyword();
			}
			request.setAttribute("clientId", check.getClientId());
		} else if (client.getKeyword().equals("Pwd")){
			if(!checkId) {
				System.err.println("아이디가 존재하지 않습니다.");
				return "redirect:/clientFind.do?keyword="+client.getKeyword();
			}
			findPwd(client, response);
			
			return "redirect:/clientLogin.do";
		}
		return "client/client_find";
	}
	
	@PostMapping("/findPwd.do")
	public void findPwd(@ModelAttribute ClientVO client, HttpServletResponse response) throws Exception{
		service.findPwd(response, client);
	}
}
