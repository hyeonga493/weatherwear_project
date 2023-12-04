package com.w2.client.cart;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	//장바구니 정보
	//private String pmImg; //!!!상품이미지 -> 나중에 추가시키기!!!
	private int caId; //카트번호
	private String clientId; //회원번호
	private String proId; //상품번호
	private String opId; //옵션번호
	private String proName; //상품명
	private String opSize; //옵션 사이즈
	private String opColor; //옵션 색상
	private int proPrice; //상품 판매가
	private int caCnt; //상품 수량
	private long totalPrice; // MySQL에서 getCartView 의 컬럼으로 totalPrice를 생성했더니
							// BigInt로 자동 지정되어서 BigInt에 해당하는 java 데이터 타입 long 사용 
	private List<Integer> caIdList; // DB에 없는 값. 선택한 카트 받으려고 만든 변수
	

}
