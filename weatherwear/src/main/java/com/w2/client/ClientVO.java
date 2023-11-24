package com.w2.client;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ClientVO {
	private String clientId;				//필수
	private String clientPwd;				//필수
	private Date chPwdDate;
	private String clientName;				//필수
	private String clientNum;				//필수
	private String clientEmail;				//필수
	private char clientEmailCheck;			//필수
	private Date clientRegDate;
	private String clientRecId;
	private String clientBirth;				//필수
	private String clientNickName;			//필수
	private char gradeId;					//필수
	private int clientPoint;				//필수
	private String cpList;
	private String crList;
	private String cmarkList;
	private Date clientLogDate;
	private int clientBuyCnt;
	
	private String keyword;

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientPwd() {
		return clientPwd;
	}

	public void setClientPwd(String clientPwd) {
		this.clientPwd = clientPwd;
	}

	public Date getChPwdDate() {
		return chPwdDate;
	}

	public void setChPwdDate(Date chPwdDate) {
		this.chPwdDate = chPwdDate;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientNum() {
		return clientNum;
	}

	public void setClientNum(String clientNum) {
		this.clientNum = clientNum;
	}

	public String getClientEmail() {
		return clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public char getClientEmailCheck() {
		return clientEmailCheck;
	}

	public void setClientEmailCheck(char clientEmailCheck) {
		this.clientEmailCheck = clientEmailCheck;
	}

	public Date getClientRegDate() {
		return clientRegDate;
	}

	public void setClientRegDate(Date clientRegDate) {
		this.clientRegDate = clientRegDate;
	}

	public String getClientRecId() {
		return clientRecId;
	}

	public void setClientRecId(String clientRecId) {
		this.clientRecId = clientRecId;
	}

	public String getClientBirth() {
		return clientBirth;
	}

	public void setClientBirth(String clientBirth) {
		this.clientBirth = clientBirth;
	}

	public String getClientNickName() {
		return clientNickName;
	}

	public void setClientNickName(String clientNickName) {
		this.clientNickName = clientNickName;
	}

	public char getGradeId() {
		return gradeId;
	}

	public void setGradeId(char gradeId) {
		this.gradeId = gradeId;
	}

	public int getClientPoint() {
		return clientPoint;
	}

	public void setClientPoint(int clientPoint) {
		this.clientPoint = clientPoint;
	}

	public String getCpList() {
		return cpList;
	}

	public void setCpList(String cpList) {
		this.cpList = cpList;
	}

	public String getCrList() {
		return crList;
	}

	public void setCrList(String crList) {
		this.crList = crList;
	}

	public String getCmarkList() {
		return cmarkList;
	}

	public void setCmarkList(String cmarkList) {
		this.cmarkList = cmarkList;
	}

	public Date getClientLogDate() {
		return clientLogDate;
	}

	public void setClientLogDate(Date clientLogDate) {
		this.clientLogDate = clientLogDate;
	}

	public int getClientBuyCnt() {
		return clientBuyCnt;
	}

	public void setClientBuyCnt(int clientBuyCnt) {
		this.clientBuyCnt = clientBuyCnt;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "ClientVO [clientId=" + clientId + ", clientPwd=" + clientPwd + ", chPwdDate=" + chPwdDate
				+ ", clientName=" + clientName + ", clientNum=" + clientNum + ", clientEmail=" + clientEmail
				+ ", clientEmailCheck=" + clientEmailCheck + ", clientRegDate=" + clientRegDate + ", clientRecId="
				+ clientRecId + ", clientBirth=" + clientBirth + ", clientNickName=" + clientNickName + ", gradeId="
				+ gradeId + ", clientPoint=" + clientPoint + ", cpList=" + cpList + ", crList=" + crList
				+ ", cmarkList=" + cmarkList + ", clientLogDate=" + clientLogDate + ", clientBuyCnt=" + clientBuyCnt
				+ ", keyword=" + keyword + "]";
	}
}
