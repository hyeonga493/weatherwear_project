package com.w2.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.client.coupon.CouponService;
import com.w2.client.coupon.CouponVO;

import jdk.jfr.Description;

@Controller
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping(value = "/couponList.do")
	@Description("쿠폰 관리페이지(사용자)")
	public String couponClientList(CouponVO coupon, Model model) {
		/* return "/w2/coupon/coupon"; */
		model.addAttribute("couponList", couponService.couponClientList(coupon));
		System.err.println("couponList model : " + model.toString());
		return "/client/coupon_list";
	}
	
}
