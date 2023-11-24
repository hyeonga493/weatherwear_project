package com.w2.product;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OptionVO {
	
	private String proId;
	private String opId;
	private String opColor;
	private String opSize;
	
	private List<OptionVO> optionList;
	
}
