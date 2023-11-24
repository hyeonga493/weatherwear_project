package com.w2.admin.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jdk.jfr.Description;

@Controller
public class AdminController {

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
	
	@RequestMapping(value = "/couponUser.mdo")
	@Description("쿠폰 관리페이지(사용자)")
	public String couponUser(Locale locale, Model model) {
		/* return "/w2/coupon/coupon"; */
		return "/admin/coupon/user/couponUser";
	}
	
	@RequestMapping(value = "/newCouponDetail.mdo")
	@Description("새 쿠폰 받기 페이지(사용자)")
	public String newCouponDetail(Locale locale, Model model) {
		/* return "/w2/coupon/coupon"; */
		return "/admin/coupon/user/newCouponDetail";
	}
	
	@RequestMapping(value = "/coupon.mdo")
	@Description("쿠폰 관리페이지(관리자)")
	public String coupon(Locale locale, Model model) {
		 return "/admin/coupon/coupon"; 
	}
	
	@RequestMapping(value = "/stoke.mdo")
	@Description("물류 관리 페이지")
	public String distribution(Locale locale, Model model) {
		return "/admin/stoke";
	}
	
	@RequestMapping(value = "/order.mdo")
	@Description("주문 관리 페이지")
	public String order(Locale locale, Model model) {
		return "/admin/order";
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
	public String client(Locale locale, Model model) {
		return "/admin/client";
	}
	
//	@RequestMapping(value = "/notice.mdo")
//	@Description("공지사항 페이지")
//	public String notice(Locale locale, Model model) {
//		 return "/admin/board/notice"; 
//	}
	
//	@RequestMapping(value = "/writeNotice.mdo")
//	@Description("공지사항 글쓰기 페이지")
//	public String writeNotice(Locale locale, Model model) {
//		 return "/admin/board/writeNotice"; 
//	}
	
	@RequestMapping(value = "/writeFaq.mdo")
	@Description("문의사항 글쓰기 페이지")
	public String writeFaq(Locale locale, Model model) {
		 return "/admin/board/writeFaq"; 
	}
	
	@RequestMapping(value = "/faq.mdo")
	@Description("문의 페이지")
	public String faq(Locale locale, Model model) {
		return "/admin/board/faq";
	}
	
	@RequestMapping(value = "/product.mdo")
	@Description("상품 관리(상품 목록) 페이지")
	public String product(Locale locale, Model model) {
		return "/admin/product/product";
	}
	
	@RequestMapping(value = "/insertProduct.mdo")
	@Description("상품 등록 페이지")
	public String insertProduct(Locale locale, Model model) {
		return "/admin/product/insertProduct";
	}
	
	@RequestMapping(value = "/total.mdo")
	@Description("통계 페이지")
	public String stats(Locale locale, Model model) {
		return "/admin/total";
	}
}
