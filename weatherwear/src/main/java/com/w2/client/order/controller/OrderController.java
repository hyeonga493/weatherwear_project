package com.w2.client.order.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

//import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.w2.client.order.OrderService;
import com.w2.client.order.OrderVO;
import com.w2.client.order.PaymentVO;
import com.w2.client.review.ReviewService;
import com.w2.client.review.ReviewVO;

@Controller
public class OrderController {

	@Autowired 
	private OrderService orderService; // OrderService 주입
	
	@Autowired
	private ReviewService reviewService;
	
	//주문하기 - 장바구니에서 주문하기 
	@RequestMapping("/clientOrder.do")
	public String orderFromCart(HttpServletRequest request,OrderVO orderVO,Model model, HttpSession session) {
		System.err.println("[OrderController] : orderFromCart");
		System.err.println(" request.client@@"+request.getParameter("clientId")) ;
		System.err.println("orderVO.clientId : "+ orderVO.getClientId());
		orderVO.setClientId((String)session.getAttribute("clientId")) ;
		System.err.println("선택한 쿠폰: "+ orderVO.getCpId_choose()); //존재
		System.err.println("선택한 포인트: "+ orderVO.getUsePoint()); //
	
		System.err.println("orderVO.선택한 카트: "+ orderVO.getCaIdList()); // 값 존재
		System.err.println("request.선택한 카트: "+ request.getParameter("caIdList")); // 값 존재
		
		int usedPoint = 0;
		if(orderVO.getUsePoint()!=null&& !orderVO.getUsePoint().isEmpty()) {
			orderVO.setUsedPoint(Integer.parseInt(orderVO.getUsePoint()));
			model.addAttribute("usedPoint",Integer.parseInt(orderVO.getUsePoint()));
			usedPoint = Integer.parseInt(orderVO.getUsePoint());
		}
				
		if(request.getParameter("CaIdList")!=null && !request.getParameter("CaIdList").isEmpty()) {
			String[] list = request.getParameter("CaIdList").split(",");
			List<Integer> li = new ArrayList<Integer>();
			for(int i=0; i<list.length; i++) {
				li.add(Integer.parseInt(list[i]));
			}
			orderVO.setCaIdList(li);
		}
			//그게 아니라면 caIdList 는 이미 존재함//쿠폰타고 다시 온 것이기에
			System.err.println("@@@@@@@@@@@@ : "+orderService.toOrder_get_couponList(orderVO));

		
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
		
		orderService.toOrder_get_cart(orderVO,model);
		System.err.println("+++++++orderVO.getCaCnt : "+orderVO.getCaCnt());
		
		System.err.println("----------Controller-----toOrder_get_cart 끝");
		model.addAttribute("toOrder_get_Price",orderService.toOrder_get_Price(orderVO));
		orderVO.setGrPoint(orderService.toOrder_get_Point(orderVO).getGrPoint());
		
		System.err.println("*******orderVO.getGrPoint : "+orderVO.getGrPoint());
		System.err.println("*******orderVO.getOdTotal : "+orderVO.getOdTotal());
		
		orderVO.setPlusPoint((int)Math.round(orderService.toOrder_get_Point(orderVO).getGrPoint()*orderVO.getOdTotal()));
		model.addAttribute("getPlusPoint",orderVO.getPlusPoint());
		
		//결제 금액에 따른 배송비
		int delliPrice = 0;
		if(orderService.toOrder_get_Price(orderVO).getOdTotal()>=50000) {
			orderVO.setDeliPrice(0);
			delliPrice=0;
		} else {
			orderVO.setDeliPrice(2500);
			delliPrice = 5000;
		}
		
		model.addAttribute("deliPrice",delliPrice);
		int cpPrice = 0;
		if(orderVO.getCpId_choose()!=null && !orderVO.getCpId_choose().isEmpty()) {
			model.addAttribute("toOrder_get_coupon_choose",orderService.toOrder_get_coupon_choose(orderVO));
			cpPrice = orderService.toOrder_get_coupon_choose(orderVO).getCpPrice();
		}
		

		int odTotal = orderService.toOrder_get_Price(orderVO).getOdTotal();
		
		int odPrice = odTotal + delliPrice - usedPoint - cpPrice ;
		orderVO.setOdPrice(odPrice);
		
		model.addAttribute("odPrice",odPrice);
		model.addAttribute("odid",orderVO.getOdid());
		model.addAttribute("toOrder_get_couponList",orderService.toOrder_get_couponList(orderVO));//잠시 주석

		return "client/order/client_order";
	}
	
	/*
	//상품상세에서 바로 주문
	@RequestMapping("/clientOrderProduct.do")
	public String orderFromProduct(@RequestParam("sellList") List<String> sell,HttpServletRequest request,OrderVO orderVO,Model model) {
		System.err.println("[OrderController] : orderFromProduct");
		System.err.println("req.cId : "+request.getParameter("clientId"));
		System.err.println("proId : "+request.getParameter("proId"));
		System.err.println("sell : "+sell);
		
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
		
		System.err.println("[OrderController] [odid] : "+orderVO.getOdid());
		System.err.println("[OrderController] [orderVO] : "+orderVO.toString());

		int price=0;
		//상품 상세로부터 여러 옵션 받아오는 것 for문 내에서 삽입//실행해보기
	    orderVO.setSellList(sell);    
	    System.err.println("@@@@@@@@@@@@ : "+orderService.toOrder_get_couponList(orderVO));
	    
	    
	        //  정보 설정
	        orderVO.setProId(request.getParameter("proId"));
//	        orderVO.setOpId(orderVO.getProId()+opId);
//	        orderVO.setOdProCnt(cnt);
//	        System.err.println("opId : "+orderVO.getOpId());
//	        System.err.println("odProCnt : "+orderVO.getOdProCnt());

	    	model.addAttribute("toOrder_get_AddList",orderService.toOrder_get_AddList(orderVO));
			model.addAttribute("toOrder_get_AddBase",orderService.toOrder_get_AddBase(orderVO));
			model.addAttribute("toOrder_get_client",orderService.toOrder_get_client(orderVO));
	        
			System.err.println("----------Controller-----toOrder_get_cart 전");
			orderService.toOrder_get_product(orderVO,model);
			
			System.err.println("----------Controller-----toOrder_get_cart 끝");*/
	       
			/*
			for (String item : sell) {
		        String[] parts = item.split("_");
		        int cnt = Integer.parseInt(parts[1]);
		        
		        
		        price += cnt*(orderService.toOrder_get_Price_product(orderVO).getProPrice());
		        System.err.println("for문 내의 price"+price);
			}
			//
			 */
//	        orderService.toOrder_get_product(orderVO, model);
	        
	   /*     
		orderVO.setOdTotal(price);
		
		System.err.println("for문 밖의 odTotal"+orderVO.getOdTotal());
		System.err.println("toOrder_get_Point"+orderService.toOrder_get_Point(orderVO));
		System.err.println("grPoint : "+orderService.toOrder_get_Point(orderVO).getGrPoint());
		orderVO.setGrPoint(orderService.toOrder_get_Point(orderVO).getGrPoint());
		orderVO.setPlusPoint((int)Math.round(orderVO.getGrPoint()*orderVO.getOdTotal()));
		
	
		model.addAttribute("toOrder_get_Price",orderVO.getOdTotal());
		model.addAttribute("getPlusPoint",orderVO.getPlusPoint());
		
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
		
		return "client/order/client_order";
	}*/

	
	//쿠폰,포인트 선택//장바구니에서 주문한 상품에 대하여
	@RequestMapping("/clientOrder/minusPrice.do")
	public String toOrder_coupon_update(@RequestParam String use_point,HttpServletRequest request,OrderVO orderVO, RedirectAttributes rtt){
		System.err.println("[OrderController] : toOrder_coupon_update");
		System.err.println("clientId : "+ orderVO.getClientId());
		System.err.println("선택한 쿠폰: "+ orderVO.getCpId());
		System.err.println("orderVO.선택한 카트: "+ orderVO.getCaIdList());
		System.err.println(" request.client@@"+request.getParameter("clientId"));
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
		return "redirect:/clientOrder.do?";
	}

	//쿠폰,포인트 선택//상세에서 주문한 경우
		/*
		@RequestMapping("/clientOrderProduct/minusPrice.do")
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
			
			if(request.getParameter("caIdList")!=null) {
				String[] list = request.getParameter("caIdList").split(",");
				List<Integer> li = new ArrayList<Integer>();
				for(int i=0; i<list.length; i++) {
					li.add(Integer.parseInt(list[i]));
				}
				rtt.addAttribute("CaIdList",orderVO.getCaIdList() );
				
			}else if(request.getParameter("sellList")!=null) {
				rtt.addAttribute("sell", request.getParameter("sellList"));
				
			}
			
			//orderVO.setCaIdList(li);
			rtt.addAttribute("clientId", orderVO.getClientId());
			rtt.addAttribute("cpId_choose", orderVO.getCpId_choose());
			rtt.addAttribute("usePoint",request.getParameter("use_point"));
			return "redirect:/clientOrderProduct.do?";
		}*/

	
	//주문내역 리스트로 조회
	@RequestMapping("/clientList.do")
	public String getOrderList(HttpServletRequest request, Model model, OrderVO orderVO, HttpSession session) {
		System.err.println("[OrderController] : getOrderList");
		
		orderVO.setClientId((String)session.getAttribute("clientId"));
		System.err.println("clientId : "+ orderVO.getClientId());
		
		model.addAttribute("getOrderList", orderService.getOrderList(orderVO));
		return "client/order/client_order_list";
	}
	
	//주문내역 상세 조회
	@RequestMapping("/clientDetail.do")
	public String getOrderDetail(Model model, OrderVO orderVO, ReviewVO review, HttpSession session) {

		System.err.println("[OrderController] : getOrderDetail");
		System.err.println("clientId : "+ session.getAttribute("clientId"));
		orderVO.setClientId((String) session.getAttribute("clientId"));
		System.err.println("odId : "+ orderVO.getOdid());
		orderVO.setPlusPoint((int)Math.round(orderVO.getGrPoint()*orderVO.getOdTotal()));

		OrderVO result = orderService.getOdStatus(orderVO);
		System.err.println("1. odStatus : " + result);
		System.err.println("2. getOdInfo : " + orderService.getOdInfo(orderVO));
		System.err.println("3. getAdress : " + orderService.getAdress(orderVO));
		System.err.println("4. getPrice : " + orderService.getPrice(orderVO));
		
		Double grPoint = 0.0;
		if( orderService.toOrder_get_Point(orderVO)!=null) {
		grPoint = orderService.toOrder_get_Point(orderVO).getGrPoint();
		}
		int odTotal = orderService.getPrice(orderVO).getOdTotal();
		int plusPoint = (int)Math.round(grPoint*odTotal);
		int deliPrice = orderService.getPrice(orderVO).getDeliPrice();
		int usedPoint = orderService.getPrice(orderVO).getUsedPoint();
		int cpPrice = orderService.getPrice(orderVO).getCpPrice();
		
		int odPrice = odTotal + deliPrice - usedPoint - cpPrice;
		
		
		model.addAttribute("plusPoint", plusPoint);
		model.addAttribute("odPrice", odPrice);
		model.addAttribute("deliPrice", deliPrice);
		model.addAttribute("usedPoint", usedPoint);
		model.addAttribute("getOdStatus", orderService.getOdStatus(orderVO));
		model.addAttribute("getOdInfo", orderService.getOdInfo(orderVO));
		model.addAttribute("getAdress", orderService.getAdress(orderVO));
		model.addAttribute("getPrice", orderService.getPrice(orderVO));

		return "client/order/client_order_detail";
	}
	
	// 결제 값 받아오기
			@RequestMapping(value = "/insertPaymentInfo.do", method = {RequestMethod.POST})
			@ResponseBody
			public String insertPaymentInfo(@RequestBody Map<String, Object> param, PaymentVO vo,HttpServletRequest request,OrderVO orderVO) throws Exception {
				
			System.err.println("!!!!param : "+param);	
				
			String imp_uid = (String) param.get("imp_uid");			//<< ajax로 넘겨주는 부분입니다.
			String merchant_uid = (String) param.get("merchant_uid");	//ex) merchant_uid 를 jsp에서 odId로 선언하셨으면 이름을 똑같이 바꿔주세요 
			String payMtd = (String) param.get("payMtd");
			String payStatus = (String) param.get("payStatus");
			String clientId = (String) param.get("clientId");					   //앞단에서 넘겨주는 값으로 넣어주세요.
			
			vo.setPayId(merchant_uid);
			vo.setOdId(imp_uid);					//<< db에 넘기는 부분인데 날짜는 안 넣어주셔도 됩니다.
			vo.setPayMtd(payMtd);						   //jsp에서 넘기는것도 삭제해도 됩니다.
			vo.setPayStatus(payStatus);					   //default로 들어가게 해뒀어요.
			vo.setClientId(clientId);
				
			orderService.insertPaymentInfo(vo);
				
			System.err.println("[ OrderController ] : insertPaymentInfo ---------- " + vo.toString());
			
			System.err.println(">>>>>>>>[orderService.orderFromCart]");
			System.err.println("!!!!param.clientEmail : "+(String) param.get("clientEmail"));
			
			int odPrice = Integer.parseInt((String)param.get("odPrice"));
			String clientEmail =(String) param.get("clientEmail");
			String clientNum =(String) param.get("clientNum");
			String clientName =(String) param.get("clientName");
			String addressId =(String) param.get("addressId");
			String usePoint =(String) param.get("usedPoint");
			int plusPoint =Integer.parseInt((String)param.get("plusPoint"));
			String cpId =(String) param.get("cpId");
			String opIdList =(String) param.get("opIdList");
			String odStatus =(String) param.get("odStatus");
			String caIdString = (String) param.get("caIdList");
			int caId =Integer.parseInt((String)param.get("caId"));
			int caCnt =Integer.parseInt((String)param.get("caCnt"));

			String[] list = caIdString.split(",");
			List<Integer> li = new ArrayList<Integer>();
			for(int i=0; i<list.length; i++) {
				li.add(Integer.parseInt(list[i]));
			}
			orderVO.setCaIdList(li);
			orderVO.setClientId(clientId);
			orderVO.setOdid(imp_uid);
			orderVO.setClientEmail(clientEmail);
			orderVO.setClientNum(clientNum);
			orderVO.setClientName(clientName);
			orderVO.setAddId(addressId);
			if(usePoint != null && !usePoint.isEmpty()) {
				orderVO.setUsedPoint(Integer.parseInt(usePoint));
			}
			
			orderVO.setPlusPoint(plusPoint);
			orderVO.setCpId(cpId);
			orderVO.setOpIdList(opIdList);
			orderVO.setOdStatus(odStatus);
			orderVO.setCaId(caId);
			orderVO.setCaCnt(caCnt);
			orderVO.setOdPrice(odPrice);
			
			System.err.println("@@@@@@@@orderVO.toString"+orderVO.toString());
			
			
			
			orderService.orderFromCart(orderVO); 
			
//			return "redirect:/clientList.do?clientId="+orderVO.getClientId();//주문내역리스트로 리다이렉트
			return "success"; // ajax로 돌아가서 주문내역리스트 페이지로 리다이렉트
			}

	
	
	
}