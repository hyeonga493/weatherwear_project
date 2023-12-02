package com.w2.product;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
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
	
	// category
	private String cateName;
	
	// option_sample
	private List<String> opColorList;
	private List<String> opSizeList;
	private List<Integer> stCntList;
	
	private String searchtype;  // 검색조건
	private String keyword;  // 검색어
	private String ordertype;  // 정렬
	private String gubun;  // 카테고리별 목록(사용자)
	
	// 페이징
	private int postStart;
	private int postEnd;
	private int startPage;
	private int endPage;
	
	private MultipartFile uploadFile;

	@Override
	public String toString() {
		return "ProductVO [proSell=" + proSell + ", proId=" + proId + ", proCate=" + proCate + ", proName=" + proName
				+ ", proContent=" + proContent + ", proRegDate=" + proRegDate + ", proPrimeCost=" + proPrimeCost
				+ ", cateName=" + cateName + ", opColorList=" + opColorList + ", opSizeList=" + opSizeList
				+ ", stCntList=" + stCntList + "]";
	}
	
}