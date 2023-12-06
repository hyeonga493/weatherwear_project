package com.w2.client.review;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	
	private String reId;
	private String reContent;
	private String reImage;
	private double reStar;
	private Date reDate;
	
	private String clientId;
	private String odId;
	private String opId;
	
	private int rePlus;
	private int reMinus;
	
	private String reStatus;
	private String odStatus;
	
	//리뷰 리스트에 필요한 내용
	private int odPrice;
	private String proId;
	private String proName;
	private String opColor;
	private String opSize; 
	
	private String opIdList;
}
