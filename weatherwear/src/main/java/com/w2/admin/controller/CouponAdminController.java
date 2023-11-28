package com.w2.admin.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.admin.coupon.CouponAdminService;
import com.w2.admin.coupon.CouponAdminVO;

import jdk.jfr.Description;

@Controller
public class CouponAdminController {
	
	@Autowired
	private CouponAdminService couponAdminService;
	
	
	@RequestMapping(value = "/couponAdminList.mdo")
	@Description("쿠폰 관리페이지(관리자)")
	public String couponAdminList(CouponAdminVO couponAdmin, Model model) {
		
		// 보여주기 전에 확인(쿠폰별로 현재 시간보다 쿠폰유효날짜가 크지 않을경우 update하기)
		LocalDateTime now = LocalDateTime.now();  
		System.out.println("----현재 시간 now : " + now);
		
		Date nowDate = Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
		System.out.println("now의 date 타입 : " + nowDate);
		
		// arrayList에 couponAdminService.couponAdminList(coupon)) 값 넣고 보여주기
		
		List<CouponAdminVO> test = couponAdminService.couponAdminList(couponAdmin);
		for(int i = 0; i < test.size(); i++) {
			String cpId = test.get(i).getCpId();
			couponAdmin.setCpId(cpId);
			
			Date cpEndDate = test.get(i).getCpEndDate();
			System.err.println("쿠폰 관리 페이지에 보이는 cpEndDate 시간 : " + cpEndDate);

			String beforeCpStatus = test.get(i).getCpStatus();
			int result = nowDate.compareTo(cpEndDate);
			if(result > 0) {
				beforeCpStatus = "기간만료";
				couponAdmin.setCpStatus(beforeCpStatus);
				System.err.println("******~~~~~~~~~~coupon!!! : " + couponAdmin);
				
				//update 로직 하나 짜기, 갯수 여러개일때 동시변화???
				couponAdminService.updateCpStatus(couponAdmin);
				System.err.println("******~~~~~~~~~~coupon 변화후!!! : " + couponAdmin);
			}
		}
		
		// 하나씩 값 가져온 후 가져온 값이 지금 현재보다 작으면 상태 변경 update문 로직 else model...
		
		model.addAttribute("couponAdminList", couponAdminService.couponAdminList(couponAdmin));
		System.err.println("couponAdminList model : " + model.toString());
		return "/admin/coupon/coupon_adminList"; 
	}
	
	@RequestMapping(value = "/coupon.mdo")
	@Description("쿠폰 등록페이지(관리자)")
	public String coupon(Locale locale, Model model) {
		 return "/admin/coupon/coupon_regist"; 
	}
	
	@PostMapping("/couponRegist.mdo")
	@Description("쿠폰 등록")
	public String couponRegist(CouponAdminVO couponAdmin, String chClientType) throws IOException, ParseException{
		
		System.err.println("=================coupon Start!=====================");
		System.err.println("coupon : " + couponAdmin);
		
		//String형 date타입으로 변경하기
		String lastDate = couponAdmin.getCpStrEndDate();
		SimpleDateFormat changeDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Date date = changeDate.parse(lastDate);
		System.out.println("date타입으로 변경한 마지막 날짜 : " + date);
		couponAdmin.setCpEndDate(date);
		
		//자바단에서 쿠폰 아이디값 랜덤으로 생성
	      String randomCpId = "";
	      for(int i=0; i<14; i++) {
	    	 randomCpId += (char)((Math.random()*26)+97);
	    	  
	         if(i%3==0) {
	        	 randomCpId += (i*8);
	         }
		  }
	    System.out.println("---- 랜덤 쿠폰 아이디 : " + randomCpId);
	    couponAdmin.setCpId(randomCpId);
	    System.err.println("=============================랜덤 쿠폰아이디 들어간 coupon : " + couponAdmin);
	    
	    //맨 앞에 ',' 삭제 후 들어가도록 처리하기
		String ch = chClientType.substring(1);
		couponAdmin.setChClientType(ch);
		
		//insert coupon_info에 쿠폰정보 한번만 insert, id도 같이 입력
		couponAdminService.couponInfoRegist(couponAdmin);
		
		// 등급 조건에 맞는 cid list를 뽑고, 뽑은 cid 리스트에서 하나하나 넣어서 돌리기
		String[] chArray = chClientType.split(",");
		for(int i = 0; i < chArray.length; i++) {
			System.out.println(i + "번째 chArray값 : " + chArray[i]);
			couponAdmin.setChClientType(chArray[i]);
			System.out.println("coupon22 : " + couponAdmin);
			
			List<CouponAdminVO> clientIdList = couponAdminService.clientIdList(couponAdmin);
			System.out.println(">>>>>>>>>>>>>clientIdList : " + clientIdList);
			
			//공통모듈로 빼기(update, select)
			for(int j = 0; j < clientIdList.size(); j++) {
				String cId = clientIdList.get(j).getClientId();
				System.out.println(j +"번째 회원번호 : " + cId);
				couponAdmin.setClientId(cId);
				System.err.println("%%%%%%%%%%%%coupon 마지막 : " + couponAdmin);
				
				System.out.println("고객id 변경한 coupon : " + couponAdmin);
				//insert coupon_list에 clientId
				couponAdminService.couponListRegist(couponAdmin);
			}
		}
				
		return "redirect: couponAdminList.mdo";
	}
	
}
