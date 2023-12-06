package com.w2.client.order;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	//사용자의 주문하기,주문내역 조회를 위한 변수
	
	private String clientId; //회원(주문자)번호 - orders, client,coupon_list // 주문하기,주문내역
	private String clientNum; //주문자 전화번호 - client // 주문하기
	private String clientEmail; //주문자 이메일 - client // 주문하기
	private String clientName; //주문자 이름- client // 주문하기
	private int clientPoint; //주문자 포인트- client // 주문하기
	private String cpList; //주문자 쿠폰함 - client // 주문하기

	private String pmId; //상품 이미지 // 아직 안 함 -product_image // 주문하기,주문내역
	private String proId; // 상품번호 - product, product_image,pro_price // 주문하기,주문내역 
	private String proName; // 상품명 - product // 주문하기,주문내역
	private int proPrice; //상품 가격 - product_price // 주문하기,주문내역
	
	private String odid; //주문번호 - orders,orders_info
	private String opIdList; // 상품번호리스트 - orders // 주문하기,주문내역
	private String opId; // 옵션번호 - orders_info  // 주문하기,주문내역
	private String opSize; // 옵션번호 - orders_info  // 주문하기,주문내역
	private String opColor; // 옵션번호 - orders_info  // 주문하기,주문내역
	private int odProCnt; //(주문) 상품 수량 - orders_info // 주문하기,주문내역
	private String odStatus; // 주문 상태 - orders  // 주문내역
	private int odPrice; // 실결제금액 (= 화면단의 최초주문금액)(= 총결제금액 - '쿠폰,포인트'할인금액) - orders // 주문하기,주문내역 
	private Date odDate; //주문일자 - orders  // 주문내역
	private int odTotal; // 총결제금액 (실결제 전) - orders_info // 주문하기,주문내역
	private String cpId; //고유 쿠폰번호 - orders_info, coupon_info,cp_id // 주문하기,주문내역(주문내역에서 쿠폰 관련은 본 변수로 충분)
	private String cpId_choose; // 적용된 쿠폰번호
	
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
	private String addBase; //회원_기본배송지 여부 - client_address // 주문하기
	
	private String grId; //등급번호 - grade,client // 주문하기
	private double grPoint; // 등급별 포인트 - grade // 주문하기
	
	private String cpName; //쿠폰이름 - coupon_info // 주문하기, 주문내역
	private int cpPrice; // 쿠폰 할인 금액 - coupon_info // 주문하기, 주문내역
	private Date cpStDate; // 쿠폰 시작일 - coupon_info // 주문하기
	private Date cpEndDate; // 쿠폰 만료일 - coupon_info // 주문하기
	private String cpStatus; // 쿠폰 상태 - coupon_list // 주문하기
	private int minPrice; // 쿠폰 상태 - coupon_list // 주문하기
	
	private String payStatus; // 결제상태 - payment_info // 주문하기,주문내역
	private String payDate; // 결제일자 - payment_info // 주문하기,주문내역
	private String payId; // 결제번호 - payment_info // 주문하기,주문내역
	private String payMtd; // 결제방법 - payment_info // 주문하기, 주문내역
	
	private String addColumn; //db에 없고 자바에만 존재하는 변수, 주문내역 목록 조회 시, 상품명에 "__외 _개" 형식으로 출력될 값
	private int plusPoint; //db에 없고 자바에만 존재하는 변수, 주문내역 상세 조회 시, 적립된 포인트액
	private String usePoint; //db에 없고 자바에만 존재하는 변수, 주문내역 상세 조회 시, 사용할 포인트액
	private int usedPoint; //변수명 꼬여서 일단 입력. db에는 int usedPoint로 존재함!!!!
	private List<Integer> caIdList; //db에 없고 자바에만 존재하는 변수,주문하기 페이지에서 사용, 체크박스로 받아온 caId를 리스트로 저장
	private String caIdString;//db에 없고 자바에만 존재하는 변수, 주문하기 페이지에서 사용, 체크박스로 받아온 caId를 ,로 연결하여 문자열로 저장

	private int caId; //cart로부터 caId를 가져오기 위하여
	private int caCnt; //cart로부터 caCnt를 가져오기 위하여
	
	private List<String> sellList; //db에 없고 자바에만 존재하는 변수,주문하기 페이지에서 사용, 상세페이지에서 넘어온 옵션값을 리스트로 저장
	
	private String imageName;
	private String imageDir;
	// 쿠폰, 결제 카드 관련, 포인트

	private String reId;
	private String reContent;
	private double reStar;
	private String reImageName;
	private String reImageDir;
	private Date reDate;
}