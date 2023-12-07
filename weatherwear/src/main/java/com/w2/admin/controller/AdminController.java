package com.w2.admin.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.w2.admin.order.AdminOrderService;
import com.w2.admin.order.AdminOrderVO;
import com.w2.client.ClientService;
import com.w2.client.ClientVO;
import com.w2.paging.PagingService;

import jdk.jfr.Description;

@Controller
public class AdminController {

	@Autowired
	private AdminOrderService adminOrderService;
	
	@Autowired
	private ClientService service;
	
	@Autowired
	private PagingService pagingService;
	
	@Autowired
	private BCryptPasswordEncoder pwden;
	
	@RequestMapping(value = "/login.mdo")
	@Description("DashBoard 페이지")
	public String login(Locale locale, Model model) {
		return "/admin/login";
	}
	

	@RequestMapping(value = "/adminOrder.mdo")
	public String getAdminOrderList(Locale locale,@RequestParam(value="page", required=false)Integer page, Model model,AdminOrderVO adminOrderVO)throws Exception {
		System.err.println("시작,종료 지정 없이 첫 화면");
		List<AdminOrderVO>	getAdminOrderList = pagingService.getAdminOrderListAll(page, adminOrderVO, model);

		model.addAttribute("getAdminOrderList",getAdminOrderList);

		return "/admin/order";
	}

	@RequestMapping(value = "/stoke.mdo")
	@Description("물류 관리 페이지")
	public String distribution(Locale locale, Model model) {
		return "/admin/stoke";
	}
	
	@RequestMapping(value = "/deliverInfo.mdo")
	@Description("배송관리 페이지")
	public String deliverInfo(Locale locale, Model model) {
		return "/admin/deliverInfo";
	}
	
	@RequestMapping(value = "/swap.mdo")
	@Description("교환/환불 페이지")
	public String swap(Locale locale, Model model) {
		return "/admin/swap";
	}
	
	@RequestMapping(value = "/balance.mdo")
	@Description("정산 관리 페이지")
	public String balance(Locale locale, Model model) {
		return "/admin/balance";
	}
	
	@RequestMapping(value = "/client.mdo")
	@Description("회원 관리 페이지")
	public String getClientList(@RequestParam(value="page", required=false)Integer page, ClientVO client, Model model) {
		
		if(client.getSearchtype() == null) {
			System.err.println("type 널이야");
			client.setSearchtype("");
		}
		if(client.getKeyword() == null) {
			System.err.println("keyword 널이야");
			client.setKeyword("");
		}
		
		List<ClientVO> clientList = pagingService.clientList(page, client, model);
		
		model.addAttribute("clientList", clientList);
		
		return "/admin/client";
	}
	
	@RequestMapping(value = "/writeQna.mdo")
	@Description("문의사항 글쓰기 페이지")
	public String writeFaq(Locale locale, Model model) {
		 return "/admin/qna/qna_write"; 
	}
	
	@RequestMapping(value = "/product.mdo")
	@Description("상품 관리(상품 목록) 페이지")
	public String product(Locale locale, Model model) {
		return "/admin/product/product_list";
	}
	
	@RequestMapping(value = "/insertProduct.mdo")
	@Description("상품 등록 페이지")
	public String insertProduct(Locale locale, Model model) {
		return "/admin/product/product_regist";
	}
	
	@RequestMapping(value = "/total.mdo")
	@Description("통계 페이지")
	public String stats(Locale locale, Model model) {
		return "/admin/total";
	}

	// 로그인
	@PostMapping("/adminLogin.mdo")
	public String adminLogin(ClientVO client, HttpServletRequest request) {
		System.out.println("[ Controller ] : clientLogin");
		System.err.println("client : " + client.toString());

		HttpSession session = request.getSession(false);
		if(client.getClientId().equals("admin")) {
			
			ClientVO result = service.getClientService(client);
			
			// 테스트
			if (result != null) {
				
				if (pwden.matches(client.getClientPwd(), result.getClientPwd())) {
					session.setAttribute("client", result);
					System.err.println("session : " + session.getAttribute("client.clientId"));
					System.err.println("session : " + session.getValue("client"));
					System.err.println("session : " + session.getAttributeNames());
					
					return "redirect:/adminOrder.mdo";
				}
				System.err.println(">>>> [ Controller ] : 비밀번호 불일치");
			}
		}
		return "redirect:/login.mdo";
	}
	
	// 로그아웃 요청
	@RequestMapping("/adminLogout.mdo")
	public String adminLogout(HttpSession session) {
		System.out.println("[ Contoller ] : adminLogout");
	
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/login.mdo";
	}
}
