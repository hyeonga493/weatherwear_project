package com.w2.product;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	
	// product
	private String proSell;  // 판매상태
	private String proId;  // 상품번호
	private String proCate;  // 카테고리
	private String proName;  // 상품명
	private String proContent;  // 상세설명
	
	private int proView;  // 조회수
	private int proLike;  // 좋아요수
	private Date proRegDate;  // 등록일
	private int proCnt;  // 판매량
	
	// product_price
	private int proPrimeCost;  // 공급가
	private int proCost;  // 소비자가
	private int proPrice;  // 판매가
	private Double proTax;  // 과세율
	private Double proMargin;  // 마진율
	private int proAddCost;  // 추가금액
	
	private List<String> opColorList;
	private List<String> opSizeList;
	private List<Integer> stCntList;
	
	private String searchCondition;
	private String searchKeyword;
	
	private MultipartFile uploadFile;

}