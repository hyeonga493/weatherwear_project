package com.w2.admin.order;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminOrderVO {
	//사용자 주문내역 정보
	//private String pmImg; //!!!상품이미지 -> 나중에 추가시키기!!!
	private String odid; //주문번호
	private String clientId; //회원번호
	private String addid; //배송지번호
	private String opIdList; //옵션번호리스트
	private String deliId; //배송번호
	private Date odDate; //주문 날짜
	private String beginDate; //조회 - 시작 날짜 - String 타입
	private String endDate;	// 조회 - 종료 날짜 - String 타입
	private Date beginDateU; //조회 - 시작 날짜 - util 타입
	private Date endDateU;	// 조회 - 종료 날짜 - util 타입
	private int odPrice; //주문 가격
	private String odStatus; //주문 상태
	private String clientNum; //회원 연락처

	private String checkList;
	
	private int odTotal; //총 가격
	private int odProCnt; 
	private String opId; 
	private int usedPoint; 
	private int cpPrice; 
	private String cpId; 
	private String cpName; 
	
	private String payStatus; 
	private String payMtd; 
	private Date payDate; 
	
	
//일단 쿠폰//결제수단 보류
}
