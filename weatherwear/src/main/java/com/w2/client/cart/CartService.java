package com.w2.client.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface CartService {

	public void insertCart(CartVO cartVO);//장바구니에 상품 등록
	public List<CartVO> getCartList(CartVO cartVO); //장바구니 조회
	public void deleteCart(CartVO cartVO);//장바구니에서 상품 삭제
	public void deleteCheckedCart(CartVO cartVO);//장바구니에서 선택된 상품 삭제
//	public int checkCartService(CartVO cartVO); // 장바구니에 상품이 존재하는지 체크	
//	public boolean cartRepeatCheck(CartVO cartVO) ;//장바구니 상품-옵션 중복 확인
	public void updateCaCnt (CartVO cartVO);
}
