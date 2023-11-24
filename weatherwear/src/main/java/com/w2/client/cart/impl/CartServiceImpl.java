package com.w2.client.cart.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.w2.client.cart.CartDAO;
import com.w2.client.cart.CartService;
import com.w2.client.cart.CartVO;

@Service//("CartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;
	
		
	//장바구니에 상품 추가
	@Override // [CartServiceImpl] : insertCart 는 찍히는데 장바구니에 존재여부 확인 구문이 안 찍힘
	public  void insertCart(CartVO cartVO)  { //장바구니에 상품 추가
		System.err.println("[CartServiceImpl] : insertCart");
		System.err.println("[insertCart]cartVO : "+cartVO.getClientId()+"의 "+cartVO.getCaId()+"카트");
		String cartRepeatCheck = cartDAO.cartRepeatCheck(cartVO);
		
		if(cartRepeatCheck == null) {
			
			System.err.println("상품이 추가되었습니다. 장바구니로 이동하시겠습니까?");
			cartDAO.insertCart(cartVO);
			// Y / N 선택 시, 장바구니로 이동
			} //중복이 없다면
		else {
			//중복되었다고 안내
			System.err.println("상품이 이미 존재합니다. 장바구니로 이동하시겠습니까?");
			// Y / N 선택 시, 장바구니로 이동
			
			} // 중복이 있다면
				
			
//				
//		System.err.println("[insertCart]cartVO : "+getCartList(cartVO).get(0).getClientId());
//		for(int i=0; i<getCartList(cartVO).size(); i++) {
//			if(cartVO.getClientId()==getCartList(cartVO).get(i).getClientId()&&(cartVO.getProId()==getCartList(cartVO).get(i).getProId())) { //장바구니에 이미 존재하는 경우
//				System.err.println("장바구니에 이미 존재합니다.");
//			}else {
//				cartDAO.insertCart(cartVO);
//				System.err.println("장바구니에 추가한 상품 : "+cartVO.toString());
//			}
//			
//		}
	}

	//장바구니 상품-옵션 중복 확인
//	@Override
//	public boolean cartRepeatCheck(CartVO cartVO) {
////		String cartRepeatCheck = cartDAO.cartRepeatCheck(cartVO.getProId(),cartVO.getOpId());
//		String cartRepeatCheck = cartDAO.cartRepeatCheck(cartVO);
//		
//		if(cartDAO.cartRepeatCheck(cartVO) == null) {
//			return false;} //중복이 없다면
//		else {
//			// 중복되었다고 안내
//			System.err.println("상품이 이미 존재합니다. 장바구니로 이동하시겠습니까?");
//			// Y / N 선택 시, 장바구니로 이동
//			} // 중복이 있다면
//	}
	
	
	
	
	
	
	@Override
	public List<CartVO> getCartList(CartVO cartVO) {
		System.err.println("[CartServiceImpl] : getCartList");
		System.err.println("[ clientId ] : " + cartVO.toString());
		
		List<CartVO> cart = cartDAO.getCartList(cartVO);//cartDAO 내에서 sqltemplate 통해서 데이터 가져오기
		
		System.err.println("[impl][ cart ] : " + cart.toString()); //sql에서 값 넘어옴을 확인
		
		return cart;
	}


	@Override
	//장바구니에서 상품 삭제 - 회원번호,요청받은 상품번호에 대하여 // 삭제 성공 시 : 1, 삭제 실패 시 : 0
	public void deleteCart(CartVO cartVO) {
		cartDAO.deleteCart(cartVO);
	}
	
	
	@Override
	//장바구니에서 선택된 상품 삭제
	public void deleteCheckedCart(CartVO cartVO) {
		System.err.println("[CartServiceImpl] : deleteCheckedCart");
		cartDAO.deleteCheckedCart(cartVO);
	}


//	@Override
//	//장바구니에 해당 상품이 존재하는지 체크
//	public int checkCartService(CartVO cartVO) {
//		System.err.println("[CartServiceImpl] : checkCart");
//		int checkCart = cartDAO.checkCart(cartVO);
//		if(checkCart == 1) { 
//			System.err.println("[CartServiceImpl] : 해당 상품이 존재합니다.");
//		}else {
//			System.err.println("[CartServiceImpl] : 해당 상품이 존재하지 않습니다.");
//		}
//		return checkCart;	
//	}
	

	//상품수량 수정
	@Override
	public void updateCaCnt(CartVO cartVO) {
		System.err.println("[CartServiceImpl] : updateCaCnt");
		System.err.println("[ cartVO.getCaCnt ] : " + cartVO.getCaCnt());
		cartDAO.updateCaCnt(cartVO);
	}

	
	

}
