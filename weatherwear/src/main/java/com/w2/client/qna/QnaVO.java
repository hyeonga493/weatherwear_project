package com.w2.client.qna;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaVO {
	
	private String qnaId;
	private String clientId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaImage;
	private Date qnaDate;
	private char qnaSecCheck;
	private char qnaSecPwd;
	private String qnaStatus;
	private String qnaAnswer;
	private String qnaType;
	
	//선택
	private String qnaSelectType;
	private String qnaKeyword;
	
	public String getQnaId() {
		return qnaId;
	}
	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaImage() {
		return qnaImage;
	}
	public void setQnaImage(String qnaImage) {
		this.qnaImage = qnaImage;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public char getQnaSecCheck() {
		return qnaSecCheck;
	}
	public void setQnaSecCheck(char qnaSecCheck) {
		this.qnaSecCheck = qnaSecCheck;
	}
	public char getQnaSecPwd() {
		return qnaSecPwd;
	}
	public void setQnaSecPwd(char qnaSecPwd) {
		this.qnaSecPwd = qnaSecPwd;
	}
	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public String getQnaType() {
		return qnaType;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	public String getQnaSelectType() {
		return qnaSelectType;
	}
	public void setQnaSelectType(String qnaSelectType) {
		this.qnaSelectType = qnaSelectType;
	}
	public String getQnaKeyword() {
		return qnaKeyword;
	}
	public void setQnaKeyword(String qnaKeyword) {
		this.qnaKeyword = qnaKeyword;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qnaId=" + qnaId + ", clientId=" + clientId + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaImage=" + qnaImage + ", qnaDate=" + qnaDate + ", qnaSecCheck=" + qnaSecCheck
				+ ", qnaSecPwd=" + qnaSecPwd + ", qnaStatus=" + qnaStatus + ", qnaAnswer=" + qnaAnswer + ", qnaType="
				+ qnaType + ", qnaSelectType=" + qnaSelectType + ", qnaKeyword=" + qnaKeyword + "]";
	}
	
}
