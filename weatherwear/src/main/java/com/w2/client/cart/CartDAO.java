package com.w2.client.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository//("cartDAO")
public class CartDAO {
	
	
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	//여기 콘솔에 안 찍힘//
	public void insertCart(CartVO cartVO) { //장바구니에 상품 추가
		System.err.println("[ CartDAO ] [insertCart] [proId]: "+cartVO.getCaId());
		sqlsessionTemplate.insert("CartDAO.insertCart", cartVO);
	}
	
	
	public String cartRepeatCheck(CartVO cartVO) {//장바구니 상품 중복 확인
		System.err.println("[ CartDAO ] [cartRepeatCheck]");
		return sqlsessionTemplate.selectOne("CartDAO.cartRepeatCheck",cartVO);
	}
	
	public void deleteCart(CartVO cartVO) { // 장바구니에서 상품 삭제 // caId를 받아서 삭제하려니 안됨
		System.err.println("[ CartDAO ] [deleteCart]: "+cartVO);
		sqlsessionTemplate.delete("CartDAO.deleteCart",cartVO);
		
	}	
	
	public List<CartVO> getCartList(CartVO cartVO){//장바구니 조회
		System.err.println("[ CartDAO ] : 탄다");
		System.err.println("[dao][ cartVO ] : " + cartVO.toString());
		System.err.println("[ tem ] : " + sqlsessionTemplate.selectList("CartDAO.getCartList", cartVO));
		return sqlsessionTemplate.selectList("CartDAO.getCartList", cartVO);
	}
	
	public void updateCaCnt(CartVO cartVO) { // 장바구니에서 수량 변경
		CartVO cart = new CartVO();
		cart.setClientId(cartVO.getClientId());
		cart.setCaId(cartVO.getCaId());
		cart.setCaCnt(cartVO.getCaCnt());
		System.err.println("[dao][ updateCaCnt ] [cartVO.getCaCnt] : " + cartVO.getCaCnt());
		System.err.println("[ tem ] : " + sqlsessionTemplate.update("CartDAO.updateCaCnt", cartVO));
		sqlsessionTemplate.update("CartDAO.updateCaCnt", cartVO);
	}
	
	
}
