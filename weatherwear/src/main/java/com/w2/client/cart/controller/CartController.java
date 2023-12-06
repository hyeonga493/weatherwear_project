package com.w2.client.cart.controller;



import java.util.List;

import javax.management.modelmbean.ModelMBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.w2.client.cart.CartService;
import com.w2.client.cart.CartVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService; // CartService 와 매핑
		
	@RequestMapping("/clientCart/sample.do")
	public String getSample() {
		System.err.println("[CartController] : getSample");
		
		return "client/sample";
	}
	
	//장바구니에서 상품목록 조회
	@RequestMapping("/clientCart.do")
	public String getCartList(HttpServletRequest request,Model model, CartVO cartVO, HttpSession session ) {
		System.err.println("[CartController] : getCartList");
		
		cartVO.setClientId((String)session.getAttribute("clientId"));
		model.addAttribute("getCartList", cartService.getCartList(cartVO));
		
		return "client/client_cart";
	}
	
	//장바구니에서 상품 삭제 - 개별 삭제
	@GetMapping("/clientCart/delete.do")
	public String deleteCart(CartVO cartVO) {
		System.err.println("[CartController] : deleteCart");
		cartService.deleteCart(cartVO); // cartVO.getProId로 인수를 주어야 하는가? 포함되어 있으니 상관이 없는가?

		return "redirect:/clientCart.do?clientId="+cartVO.getClientId(); // 페이지는 해당 사용자의 장바구니 전체 목록을 불러올 것이므로 caId가 아닌 clientId를 받아옴 
		//진짜로 삭제할 것인가? - Y / N 선택 추가
	}
	
	//장바구니에서 상품 삭제 - 체크 삭제 // 리스트로 값 넘기기
	@RequestMapping("/clientCart/deleteChecked.do")
	public String deleteCheckedCart(HttpServletRequest request,CartVO cartVO) {

		System.err.println("[CartController] : deleteCheckedCart");
		System.err.println("###########orderVO.clientId: "+ cartVO.getClientId()); // 값 
		System.err.println("###########orderVO.선택한 카트: "+ cartVO.getCaIdList()); // 값 존재
//		System.err.println("###########request.선택한 카트: "+ request.getParameter("caIdList")); //값 없음
		for(int i=0; i<cartVO.getCaIdList().size(); i++) {
			System.err.println("caId"+(i+1)+" : "+cartVO.getCaIdList().get(i));
			cartVO.setCaId(cartVO.getCaIdList().get(i));
			System.err.println("$$$$$$$$$$$orderVO.toString"+cartVO.toString());
			cartService.deleteCart(cartVO);
			System.err.println("주문한 카트 삭제");
		}
		return "redirect:/clientCart.do?clientId="+cartVO.getClientId(); // 페이지는 해당 사용자의 장바구니 전체 목록을 불러올 것이므로 caId가 아닌 clientId를 받아옴 
	}

	//장바구니에 상품 추가
	@RequestMapping("/clientCart/insert.do")
	public String insertCart (@RequestParam("sellList") List<String> sellList,HttpServletRequest request, CartVO cartVO) {
		System.err.println("[CartController] : insertCart");
		
		System.err.println("cart.cId : "+cartVO.getClientId());
		System.err.println("req.cId : "+request.getParameter("clientId"));
		System.err.println("proId : "+request.getParameter("proId"));
		System.err.println("sellList : "+sellList);
		//상품 상세로부터 여러 옵션 받아오는 것 for문 내에서 삽입//실행해보기
		for (String item : sellList) {
	        String[] parts = item.split("_");
	        
	        // parts 배열에는 "상품명_색상_사이즈_수량" 형태의 정보가 들어있음
	        String opId = parts[0];
	        int cnt = Integer.parseInt(parts[1]);

	        // CartVO에 정보 설정
	        cartVO.setProId(request.getParameter("proId"));
	        cartVO.setOpId(cartVO.getProId()+opId);
	        cartVO.setCaCnt(cnt);
	        System.err.println("opId : "+cartVO.getOpId());
	        System.err.println("caCnt : "+cartVO.getCaCnt());

	        System.err.println("[CartController][insertCart][cartVO] : "+cartVO.getCaId());//카트번호 확인
	        System.err.println("[CartController][insertCart][cartVO] : "+cartVO.toString());
	        
	        cartService.insertCart(cartVO);
	    }
		
		
		//장바구니로 이동하시겠습니까 - Y / N 선택가능하도록 추가
		
		return "redirect:/clientCart.do?clientId="+cartVO.getClientId(); // 페이지는 해당 사용자의 장바구니 전체 목록을 불러올 것이므로 caId가 아닌 clientId를 받아옴
	}
	
	//상품 수량 수정
	@RequestMapping("/clientCart/updateCaCnt.do")
	public String updateCaCnt (CartVO cartVO) {
		System.err.println("[CartController] [updateCaCnt] cartVO.getCaId: "+cartVO.getCaId());
		System.err.println("[CartController] [updateCaCnt] cartVO.getCaCnt: "+cartVO.getCaCnt());
		cartService.updateCaCnt(cartVO);
		
		
		return "redirect:/clientCart.do?clientId="+cartVO.getClientId();
	}
	

	
	
}
