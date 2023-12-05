package com.w2.admin.notice;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeBoardVO {
	
	private String noId;
	private String noWriter;
	private Date noDate;
	private String noTitle;
	private String noContent;
	private String noImage;
	private String noFile;
	
	//검색기능
	private String noType;
	private String noKeyword;
	
	// 페이징 정보(글 번호)
	private int postStart;
	private int postEnd;
	
	private int startPage;
	private int endPage;
		
	public String getNoFile() {
		return noFile;
	}
	public void setNoFile(String noFile) {
		this.noFile = noFile;
	}
	public String getNoType() {
		return noType;
	}
	public void setNoType(String noType) {
		this.noType = noType;
	}
	public String getNoKeyword() {
		return noKeyword;
	}
	public void setNoKeyword(String noKeyword) {
		this.noKeyword = noKeyword;
	}
	public String getNoId() {
		return noId;
	}
	public void setNoId(String noId) {
		this.noId = noId;
	}
	public String getNoWriter() {
		return noWriter;
	}
	public void setNoWriter(String noWriter) {
		this.noWriter = noWriter;
	}
	public Date getNoDate() {
		return noDate;
	}
	public void setNoDate(Date noDate) {
		this.noDate = noDate;
	}
	public String getNoTitle() {
		return noTitle;
	}
	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}
	public String getNoContent() {
		return noContent;
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
	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}
	public String getNoImage() {
		return noImage;
	}
	public void setNoImage(String noImage) {
		this.noImage = noImage;
	}
	@Override
	public String toString() {
		return "NoticeBoardVO [noId=" + noId + ", noWriter=" + noWriter + ", noDate=" + noDate + ", noTitle=" + noTitle
				+ ", noContent=" + noContent + ", noImage=" + noImage + ", noFile=" + noFile + ", noType=" + noType
				+ ", noKeyword=" + noKeyword + ", postStart=" + postStart + ", postEnd=" + postEnd + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}
	
}
