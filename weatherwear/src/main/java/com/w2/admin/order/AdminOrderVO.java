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
	
	private int startPage;
	private int endPage;
	private int postStart;
	private int postEnd;
	public String getOdid() {
		return odid;
	}
	public void setOdid(String odid) {
		this.odid = odid;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getAddid() {
		return addid;
	}
	public void setAddid(String addid) {
		this.addid = addid;
	}
	public String getOpIdList() {
		return opIdList;
	}
	public void setOpIdList(String opIdList) {
		this.opIdList = opIdList;
	}
	public String getDeliId() {
		return deliId;
	}
	public void setDeliId(String deliId) {
		this.deliId = deliId;
	}
	public Date getOdDate() {
		return odDate;
	}
	public void setOdDate(Date odDate) {
		this.odDate = odDate;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Date getBeginDateU() {
		return beginDateU;
	}
	public void setBeginDateU(Date beginDateU) {
		this.beginDateU = beginDateU;
	}
	public Date getEndDateU() {
		return endDateU;
	}
	public void setEndDateU(Date endDateU) {
		this.endDateU = endDateU;
	}
	public int getOdPrice() {
		return odPrice;
	}
	public void setOdPrice(int odPrice) {
		this.odPrice = odPrice;
	}
	public String getOdStatus() {
		return odStatus;
	}
	public void setOdStatus(String odStatus) {
		this.odStatus = odStatus;
	}
	public String getClientNum() {
		return clientNum;
	}
	public void setClientNum(String clientNum) {
		this.clientNum = clientNum;
	}
	public String getCheckList() {
		return checkList;
	}
	public void setCheckList(String checkList) {
		this.checkList = checkList;
	}
	public int getOdTotal() {
		return odTotal;
	}
	public void setOdTotal(int odTotal) {
		this.odTotal = odTotal;
	}
	public int getOdProCnt() {
		return odProCnt;
	}
	public void setOdProCnt(int odProCnt) {
		this.odProCnt = odProCnt;
	}
	public String getOpId() {
		return opId;
	}
	public void setOpId(String opId) {
		this.opId = opId;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public int getCpPrice() {
		return cpPrice;
	}
	public void setCpPrice(int cpPrice) {
		this.cpPrice = cpPrice;
	}
	public String getCpId() {
		return cpId;
	}
	public void setCpId(String cpId) {
		this.cpId = cpId;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getPayMtd() {
		return payMtd;
	}
	public void setPayMtd(String payMtd) {
		this.payMtd = payMtd;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPostStart() {
		return postStart;
	}
	public void setPostStart(int postStart) {
		this.postStart = postStart;
	}
	public int getPostEnd() {
		return postEnd;
	}
	public void setPostEnd(int postEnd) {
		this.postEnd = postEnd;
	}
	@Override
	public String toString() {
		return "AdminOrderVO [odid=" + odid + ", clientId=" + clientId + ", addid=" + addid + ", opIdList="
				+ opIdList + ", deliId=" + deliId + ", odDate=" + odDate + ", beginDate=" + beginDate + ", endDate="
				+ endDate + ", beginDateU=" + beginDateU + ", endDateU=" + endDateU + ", odPrice=" + odPrice
				+ ", odStatus=" + odStatus + ", clientNum=" + clientNum + ", checkList=" + checkList + ", odTotal="
				+ odTotal + ", odProCnt=" + odProCnt + ", opId=" + opId + ", usedPoint=" + usedPoint + ", cpPrice="
				+ cpPrice + ", cpId=" + cpId + ", cpName=" + cpName + ", payStatus=" + payStatus + ", payMtd="
				+ payMtd + ", payDate=" + payDate + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", postStart=" + postStart + ", postEnd=" + postEnd + "]";
	}
}
