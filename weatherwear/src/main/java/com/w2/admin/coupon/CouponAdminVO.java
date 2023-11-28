package com.w2.admin.coupon;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponAdminVO {
	
	private String cpId;
	private String clientId;
	private String cpCate;
	private String cpName;
	private int cpPrice;
	private int minPrice;
	private Date cpStDate;
	private Date cpEndDate;
	private String cpStrEndDate;
	private String chClientType;
	private String cpProList;
	private String cpStatus;
	
	public String getChClientType() {
		return chClientType;
	}
	public String getCpStrEndDate() {
		return cpStrEndDate;
	}
	public void setCpStrEndDate(String cpStrEndDate) {
		this.cpStrEndDate = cpStrEndDate;
	}
	public void setChClientType(String chClientType) {
		this.chClientType = chClientType;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public String getCpId() {
		return cpId;
	}
	public void setCpId(String cpId) {
		this.cpId = cpId;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getCpCate() {
		return cpCate;
	}
	public void setCpCate(String cpCate) {
		this.cpCate = cpCate;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public int getCpPrice() {
		return cpPrice;
	}
	public void setCpPrice(int cpPrice) {
		this.cpPrice = cpPrice;
	}
	public Date getCpStDate() {
		return cpStDate;
	}
	public void setCpStDate(Date cpStDate) {
		this.cpStDate = cpStDate;
	}
	public Date getCpEndDate() {
		return cpEndDate;
	}
	public void setCpEndDate(Date cpEndDate) {
		this.cpEndDate = cpEndDate;
	}
	public String getCpProList() {
		return cpProList;
	}
	public void setCpProList(String cpProList) {
		this.cpProList = cpProList;
	}
	public String getCpStatus() {
		return cpStatus;
	}
	public void setCpStatus(String cpStatus) {
		this.cpStatus = cpStatus;
	}
	@Override
	public String toString() {
		return "CouponAdminVO [cpId=" + cpId + ", clientId=" + clientId + ", cpCate=" + cpCate + ", cpName=" + cpName
				+ ", cpPrice=" + cpPrice + ", minPrice=" + minPrice + ", cpStDate=" + cpStDate + ", cpEndDate="
				+ cpEndDate + ", cpStrEndDate=" + cpStrEndDate + ", chClientType=" + chClientType + ", cpProList="
				+ cpProList + ", cpStatus=" + cpStatus + "]";
	}
	
}
