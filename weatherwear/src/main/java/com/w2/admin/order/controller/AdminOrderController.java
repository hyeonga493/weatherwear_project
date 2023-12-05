package com.w2.admin.order.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.w2.admin.order.AdminOrderService;
import com.w2.admin.order.AdminOrderVO;

@Controller
public class AdminOrderController {

	@Autowired
	private AdminOrderService adminOrderService; // CartService 와 매핑
	
	//관리자- 주문목록 조회
	@PostMapping("/adminOrder.mdo")
	public String getAdminOrderList(Model model,AdminOrderVO adminOrderVO)  throws Exception {
		System.err.println("post");
		
		System.err.println(adminOrderVO.getBeginDate());
		System.err.println(adminOrderVO.getEndDate());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		adminOrderVO.setBeginDateU(sdf.parse(adminOrderVO.getBeginDate())) ;
		adminOrderVO.setEndDateU(sdf.parse(adminOrderVO.getEndDate())) ;
		System.err.println(">>>>>>>>>>>>>>>" + adminOrderVO.toString());
		
		System.err.println("변환된 시작 날짜"+adminOrderVO.getBeginDateU());
		System.err.println("변환된 마지막 날짜"+adminOrderVO.getEndDateU());
		
		List<AdminOrderVO> getAdminOrderList = adminOrderService.getAdminOrderList(adminOrderVO);
		
		model.addAttribute("getAdminOrderList",getAdminOrderList);
		return "/admin/order";
	}	

	//주문 상태 수정 - 각각
	@RequestMapping(value = "/updateOdStatus.mdo", method = { RequestMethod.POST })
	public String updateAdminOrderStatus(AdminOrderVO adminOrderVO, RedirectAttributes rtt,
	        HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.err.println("[controller][updateAdminOrderStatus] ");

		if(request.getParameter("orderStatusAll")!=null && request.getParameter("checkList")!=null) {
		    System.err.println("selectBox 값 : "+request.getParameter("orderStatusAll"));
		    System.err.println("checkList 값 : "+request.getParameter("checkList"));
		    
		  
		    adminOrderVO.setCheckList(request.getParameter("checkList"));
		    adminOrderVO.setOdStatus(request.getParameter("orderStatusAll"));

		}else if( request.getParameter("odStatus")!=null) {
			System.err.println("odStatus : "+ request.getParameter("odStatus"));
			System.err.println("odid : "+ request.getParameter("odid"));
	    	adminOrderVO.setOdStatus(request.getParameter("odStatus"));
	    	adminOrderVO.setOdid(request.getParameter("odid"));
		}
	
		adminOrderService.updateAdminOrderStatus(adminOrderVO);
	    return "redirect:/adminOrder.mdo";
	}
	
	
	

}
