package com.w2.client.order.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

//import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.w2.client.order.OrderService;
import com.w2.client.order.OrderVO;

@Controller
public class OrderController {

	@Autowired 
	private OrderService orderService; // OrderService 주입
	
	//주문하기 - 장바구니에서 주문하기 
	@RequestMapping("/clientOrder.do")
	public String orderFromCart(HttpServletRequest request,OrderVO orderVO,Model model) {
		System.err.println("[OrderController] : orderFromCart");
		System.err.println(" request.client@@"+request.getParameter("clientId")) ;
		System.err.println("orderVO.clientId : "+ orderVO.getClientId());
		orderVO.setClientId(request.getParameter("clientId")) ;
		System.err.println("선택한 쿠폰: "+ orderVO.getCpId_choose()); //존재
		System.err.println("선택한 포인트: "+ orderVO.getUsePoint()); //
	
		System.err.println("orderVO.선택한 카트: "+ orderVO.getCaIdList()); // 값 존재
		System.err.println("request.선택한 카트: "+ request.getParameter("caIdList")); // 값 존재
//		System.err.println("caIdList: "+request.getParameter("CaIdList"));
//		String checked_coupon = request.getParameter("checked_coupon");
//		System.err.println(checked_coupon);
		
//			orderVO.setCaIdString(request.getParameter("CaIdList"));
			
//		System.err.println("CaIdString : "+ orderVO.getCaIdString());
				
		//String 값을 ,로 끊어서
		//String[] 에 값 받아서 이용
				String[] list = request.getParameter("CaIdList").split(",");
				List<Integer> li = new ArrayList<Integer>();
				for(int i=0; i<list.length; i++) {
					li.add(Integer.parseInt(list[i]));
				}
				orderVO.setCaIdList(li);
				System.err.println("@@@@@@@@@@@@ : "+orderService.toOrder_get_couponList(orderVO));
		
				
				
				
				/*//잠시 주석
				int price = orderService.toOrder_get_Price(orderVO).getOdTotal() + orderVO.getDeliPrice();
				int choose_cp_price =0;
				if(orderVO.getCpId_choose() != null && !orderVO.getCpId_choose().isEmpty()) 
				{choose_cp_price= orderService.toOrder_get_coupon_choose(orderVO).getCpPrice();}
				else {choose_cp_price = 0;}
				int use_point = 0;
				if(orderVO.getUsePoint()!=null && !orderVO.getUsePoint().isEmpty()) {
					use_point = Integer.parseInt(orderVO.getUsePoint());
					orderVO.setUsedPoint(Integer.parseInt(orderVO.getUsePoint()));
					}
				else {use_point = 0;}
				
//				int odPrice_sum = price - choose_cp_price - Integer.parseInt(orderVO.getUsePoint());
				int odPrice_sum = price - choose_cp_price - use_point;
				
				orderVO.setOdPrice(odPrice_sum);
				
				
				System.err.println("!!! 포인트 usedPoint: "+ orderVO.getUsedPoint()); //
				*/
				
				   // 현재 시간을 LocalDateTime으로 얻음
		        LocalDateTime currentTime = LocalDateTime.now();

		        // DateTimeFormatter를 사용하여 문자열로 변환
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
		        String formattedTime = currentTime.format(formatter);

		        Random random = new Random();
		        int randomDigits = random.nextInt(1000);

				String make_odid = "OD"+orderVO.getClientId()+formattedTime+String.format("%03d", randomDigits);
				orderVO.setOdid(make_odid);
				System.err.println(orderVO.getOdid());
						
				
		//아래 경우 다, 바로 위가 선행되었을 때에만 실행되도록 수정
		model.addAttribute("toOrder_get_AddList",orderService.toOrder_get_AddList(orderVO));
		model.addAttribute("toOrder_get_AddBase",orderService.toOrder_get_AddBase(orderVO));
		model.addAttribute("toOrder_get_client",orderService.toOrder_get_client(orderVO));
		System.err.println("----------Controller-----toOrder_get_cart 전");
//		model.addAttribute("toOrder_get_cart",orderService.toOrder_get_cart(orderVO));
		orderService.toOrder_get_cart(orderVO,model);
		System.err.println("+++++++orderVO.getCaCnt : "+orderVO.getCaCnt());
		
		System.err.println("----------Controller-----toOrder_get_cart 끝");
		model.addAttribute("toOrder_get_Price",orderService.toOrder_get_Price(orderVO));
		orderVO.setGrPoint(orderService.toOrder_get_Point(orderVO).getGrPoint());
		System.err.println("*******orderVO.getGrPoint : "+orderVO.getGrPoint());
		System.err.println("*******orderVO.getOdTotal : "+orderVO.getOdTotal());
		orderVO.setPlusPoint((int)Math.round(orderVO.getGrPoint()*orderVO.getOdTotal()));
		model.addAttribute("getPlusPoint",orderVO.getPlusPoint());
//		model.addAttribute("toOrder_get_deliPrice",orderService.toOrder_get_deliPrice(orderVO));//삭제
		
		//결제 금액에 따른 배송비
		if(orderVO.getOdTotal()>=50000)orderVO.setDeliPrice(0);
		else orderVO.setDeliPrice(2500);
		
		model.addAttribute("deliPrice",orderVO.getDeliPrice());
		model.addAttribute("toOrder_get_couponList",orderService.toOrder_get_couponList(orderVO));//잠시 주석
		if(orderVO.getCpId_choose()!=null)
		{model.addAttribute("toOrder_get_coupon_choose",orderService.toOrder_get_coupon_choose(orderVO));}
		if(orderVO.getUsePoint()!=null) 
		{model.addAttribute("usePoint",orderVO.getUsePoint());}
		model.addAttribute("odPrice",orderVO.getOdPrice());
		model.addAttribute("odid",orderVO.getOdid());
		
//		orderService.toOrder_add_address_update(orderVO);
//		orderService.toOrder_add_address_insert(orderVO);
//		orderService.toOrder_insert_into_orders(orderVO);
//		orderService.toOrder_insert_into_orders_info(orderVO);
//		orderService.toOrder_delete_usedcaId(orderVO);
//		orderService.toOrder_usedPoint(orderVO);
//		orderService.toOrder_plusPoint(orderVO);
//		//orderService.orderFromCart(orderVO); //위의 insert,delete,update를 모두 통합
		
//		orderService.orderFromCart(orderVO);
		return "client/order/client_order";
	}
	
	//쿠폰,포인트 선택
	@RequestMapping("/clientOrder/minusPrice.do")
	public String toOrder_coupon_update(@RequestParam String use_point,HttpServletRequest request,OrderVO orderVO, RedirectAttributes rtt){
		System.err.println("[OrderController] : toOrder_coupon_update");
		System.err.println("clientId : "+ orderVO.getClientId());
		System.err.println("선택한 쿠폰: "+ orderVO.getCpId());
		System.err.println("orderVO.선택한 카트: "+ orderVO.getCaIdList());
		System.err.println(" request.client@@"+request.getParameter("clientId")) ;
		orderVO.setCpId_choose(orderVO.getCpId());
		orderVO.setClientId(orderVO.getClientId()) ;
		System.err.println("request.선택한 카트: "+ request.getParameter("caIdList"));
		System.err.println(" request.use_point@@"+request.getParameter("use_point"));
		
		String[] list = request.getParameter("caIdList").split(",");
		List<Integer> li = new ArrayList<Integer>();
		for(int i=0; i<list.length; i++) {
			li.add(Integer.parseInt(list[i]));
		}

		//orderVO.setCaIdList(li);
		rtt.addAttribute("clientId", orderVO.getClientId());
		rtt.addAttribute("cpId_choose", orderVO.getCpId_choose());
		rtt.addAttribute("CaIdList",orderVO.getCaIdList() );
		rtt.addAttribute("usePoint",request.getParameter("use_point"));
//		System.err.println("[OrderController] [toOrder_coupon_update] orderVO.getCpId_choose : "+orderVO.getCpId_choose());
//		return "redirect:/clientOrder.do?clientId="+orderVO.getClientId()+"&cpId_choose="+orderVO.getCpId_choose();
		return "redirect:/clientOrder.do?";
	}
	
	
	
	
	
	
	
	//주문내역 리스트로 조회
	@RequestMapping("/clientList.do")
	public String getOrderList(Model model, OrderVO orderVO) {
		System.err.println("[OrderController] : getOrderList");
		System.err.println("clientId : "+ orderVO.getClientId());
		
		model.addAttribute("getOrderList", orderService.getOrderList(orderVO));
		return "client/order/client_order_list";
	}
	
	//주문내역 상세 조회
	@RequestMapping("/clientDetail.do")
	public String getOrderDetail(Model model, OrderVO orderVO) {

		System.err.println("[OrderController] : getOrderDetail");
		System.err.println("clientId : "+ orderVO.getClientId());
		System.err.println("odId : "+ orderVO.getOdid());
		
		model.addAttribute("getOdStatus", orderService.getOdStatus(orderVO));
		model.addAttribute("getOdInfo", orderService.getOdInfo(orderVO));
		model.addAttribute("getAdress", orderService.getAdress(orderVO));
		model.addAttribute("getPrice", orderService.getPrice(orderVO));
		return "client/order/client_order_detail";
	}
	
	//결제하기로 이동
	@RequestMapping("/clientPay.do")
	public String pay(HttpServletRequest request,OrderVO orderVO) {
		
		orderService.orderFromCart(orderVO); 
		
		return "client/sample";
	}
	
	
	
}
