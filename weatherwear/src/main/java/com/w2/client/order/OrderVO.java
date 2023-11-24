package com.w2.client.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	//사용자의 주문하기,주문내역 조회를 위한 변수
	
	private String odid; //주문번호 - orders,orders_info
	
	
	private String clientId; //회원(주문자)번호 - orders, client // 주문하기,주문내역
	private String clientNum; //주문자 전화번호 - client // 주문하기
	private String clientEmail; //주문자 이메일 - client // 주문하기
	private String clientName; //주문자 이름- client // 주문하기

	
	private String pmid; //상품 이미지 // 아직 안 함 -product_image // 주문하기,주문내역
	private String proId; // 상품번호 - product, product_image // 주문하기,주문내역 
	private String proName; // 상품명 - product // 주문하기,주문내역
	private String proPrice; //상품 가격 - product // 주문하기,주문내역

	
	private String odProList; // 상품번호리스트 - orders // 주문하기,주문내역
	private String opId; // 옵션번호 - orders  // 주문하기,주문내역
	private String odProCnt; //(주문) 상품 수량 - orders_info // 주문하기,주문내역
	private String odStatus; // 주문 상태 - orders  // 주문내역
	private String odPrice; // 실결제금액 (= 화면단의 최초주문금액)(= 총결제금액 - '쿠폰,포인트'할인금액) - orders // 주문하기,주문내역 
	private String odDate; //주문일자 - orders  // 주문내역

	private String odTotal; // 총결제금액 (실결제 전) - orders_info // 주문하기,주문내역
	private String cpId; // 적용된 고유 쿠폰번호 - orders_info // 주문하기,주문내역(주문내역에서 쿠폰 관련은 본 변수로 충분)
	
	
	private String deliId; //배송고유번호 - orders, deliver_info // 주문내역
	private String deliNum; //송장번호 - deliver_info // 주문내역
	private int deliPrice; //배송비 - deliver_info // 주문하기,주문내역
	
	
	private String addId; // 배송지고유번호 - client_address(PK),orders // 주문하기,주문내역
	private String addName; // 수령인 - client_address // 주문하기,주문내역
	private String addNum; // 수령인 전화번호 - client_address // 주문하기,주문내역
	private String addPostNum; //수령인 우편번호 - client_address // 주문하기,주문내역
	private String address1; //수령인 주소 - client_address // 주문하기,주문내역
	private String address2;//수령인 상세주소 - client_address // 주문하기,주문내역
	private String addMemo; //수령인 배송매모 - client_address  // 주문하기,주문내역
	
// 쿠폰, 결제 카드 관련, 포인트

}
