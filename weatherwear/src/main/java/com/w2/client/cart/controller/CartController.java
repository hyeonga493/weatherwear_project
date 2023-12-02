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
	
	//장바구니 조회 -> 장바구니 페이지
//	@RequestMapping("client_cart")
//	public ModelAndView client_cart(HttpServletRequest request, String clientId) {
//		ModelAndView mav = new ModelAndView();
//		List<CartVO> cartVO = cartService.getCartList(clientId);
//		mav.addObject("CartVO",cartVO);
//		mav.setViewName(client_cart);
//		return mav;
//	}
	

	
	@RequestMapping("/clientCart/sample.do")
	public String getSample() {
		System.err.println("[CartController] : getSample");
		
		return "client/sample";
	}
	
	//장바구니에서 상품목록 조회
	@RequestMapping("/clientCart.do")
	public String getCartList(HttpServletRequest request,Model model, CartVO cartVO) {
		System.err.println("[CartController] : getCartList");
		System.err.println("clientId : " + cartVO.getClientId());
		HttpSession session = request.getSession();// order페이지에서 불러오기 위하여 세션에 회원번호 저장할 것
		session.setAttribute("clientId", cartVO.getClientId());//order페이지에서 불러오기 위하여 세션에 회원번호 저장할 것
//		List<CartVO> getCartList = cartService.getCartList(cartVO);
		model.addAttribute("getCartList", cartService.getCartList(cartVO));
		
//		System.err.println("[controller][getCartList] : " + cartService.getCartList(cartVO));
		return "client/client_cart";
	}

//	@RequestMapping("/") 
//	public String getCartList(CartVO cartVO, CartDAO cartDAO, Model model) {
//		System.out.println("[CartController] : getCartList");
//		model.addAttribute("cartList", cartDAO.getCartList(cartVO));
//		return "client/client_cart";
//	}
	
//	@GetMapping("/client/delete.do")
//	public String deleteCart(Model model, @RequestParam("proId") CartVO cartVO) {
//		System.err.println("[CartController] : deleteCart");
//		cartService.deleteCart(cartVO); // cartVO.getProId로 인수를 주어야 하는가? 포함되어 있으니 상관이 없는가?
//		return "redirect:client.do" +cartVO.getClientId();
//	}
	
	//장바구니에서 상품 삭제 - 개별 삭제
	@GetMapping("/clientCart/delete.do")
	public String deleteCart(CartVO cartVO) {
		String rememberClientId = cartVO.getClientId();
		System.err.println("[CartController] : deleteCart");
		cartService.deleteCart(cartVO); // cartVO.getProId로 인수를 주어야 하는가? 포함되어 있으니 상관이 없는가?
//		return "redirect:/client.do?clientId="+cartVO.getClientId(); // 페이지는 해당 사용자의 장바구니 전체 목록을 불러올 것이므로 caId가 아닌 clientId를 받아옴 
		return "redirect:/clientCart.do?clientId="+rememberClientId; // 페이지는 해당 사용자의 장바구니 전체 목록을 불러올 것이므로 caId가 아닌 clientId를 받아옴 
		//진짜로 삭제할 것인가? - Y / N 선택 추가
	}
	
	//장바구니에서 상품 삭제 - 체크 삭제 // 리스트로 값 넘기기
	@RequestMapping("/clientCart/deleteChecked.do")
	public String deleteCheckedCart(@RequestParam("checked_cart") List<Integer> checkedCaIdList,CartVO cartVO) {
		String rememberClientId = cartVO.getClientId();
		System.err.println("[CartController] : deleteCheckedCart");
			for(Integer checkedCaId : checkedCaIdList) {
				cartService.deleteCheckedCart(cartVO); // cartVO.getProId로 인수를 주어야 하는가? 포함되어 있으니 상관이 없는가?
			}
		return "redirect:/clientCart.do?clientId="+rememberClientId; // 페이지는 해당 사용자의 장바구니 전체 목록을 불러올 것이므로 caId가 아닌 clientId를 받아옴 
	}
	
	
	
	
	
	
	//장바구니에 상품 추가
	@RequestMapping("/clientCart/insert.do")
	public String insertCart (CartVO cartVO) {
		System.err.println("[CartController] : insertCart");
		System.err.println("[CartController][insertCart][cartVO] : "+cartVO.toString());
		System.err.println("[CartController][insertCart][cartVO] : "+cartVO.getCaId());//카트번호 확인
		cartService.insertCart(cartVO);
		
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
