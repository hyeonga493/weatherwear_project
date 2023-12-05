package com.w2.product;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OptionVO {
	
	private String proId;
	private String opColor;
	private String opSize;
	
	private int stCnt;

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getOpColor() {
		return opColor;
	}

	public void setOpColor(String opColor) {
		this.opColor = opColor;
	}

	public String getOpSize() {
		return opSize;
	}

	public void setOpSize(String opSize) {
		this.opSize = opSize;
	}

	public int getStCnt() {
		return stCnt;
	}

	public void setStCnt(int stCnt) {
		this.stCnt = stCnt;
	}

	@Override
	public String toString() {
		return "OptionVO [proId=" + proId + ", opColor=" + opColor + ", opSize=" + opSize + ", stCnt=" + stCnt + "]";
	}
	
}
