package com.w2.admin.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.w2.client.ClientService;
import com.w2.client.ClientVO;
import com.w2.paging.PagingService;

import jdk.jfr.Description;

@Controller
public class AdminController {
	
	@Autowired
	private ClientService clientService;

	@Autowired
	private PagingService pagingService;
	
	@RequestMapping(value = "/login.mdo")
	@Description("DashBoard 페이지")
	public String login(Locale locale, Model model) {
		return "/admin/login";
	}
	
	@RequestMapping(value = "/dashboard.mdo")
	@Description("DashBoard 페이지")
	public String index(Locale locale, Model model) {
		return "/admin/main";
	}

	@RequestMapping("/adminOrder.mdo")
	public String getAdminOrderList(Locale locale, Model model) {
		return "/admin/order";
	}

	@RequestMapping(value = "/coupon.mdo")
	@Description("쿠폰 등록페이지(관리자)")
	public String coupon(Locale locale, Model model) {
		 return "/admin/coupon/coupon"; 
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

		if(client.getSearchtype() == null) client.setSearchtype("");
		if(client.getKeyword() == null) client.setKeyword("");
		
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
	
}
