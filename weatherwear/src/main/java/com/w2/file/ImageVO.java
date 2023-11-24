package com.w2.file;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ImageVO {
	private String imageId;	// 이미지 고유 번호
	private String imageName; 	// 이미지 이름
	private String imageDir;	// 이미지 저장 경로
	private String imageStatus;	// 이미지 상태(환불, 문의, 리뷰)
	private String who; // admin, client, product 구분
	private String imageBy; // client/admin : cId, product : proId
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageDir() {
		return imageDir;
	}
	public void setImageDir(String imageDir) {
		this.imageDir = imageDir;
	}
	public String getImageStatus() {
		return imageStatus;
	}
	public void setImageStatus(String imageStatus) {
		this.imageStatus = imageStatus;
	}
	public String getWho() {
		return who;
	}
	public void setWho(String who) {
		this.who = who;
	}
	public String getImageBy() {
		return imageBy;
	}
	public void setImageBy(String imageBy) {
		this.imageBy = imageBy;
	}
	@Override
	public String toString() {
		return "ImageVO [imageId=" + imageId + ", imageName=" + imageName + ", imageDir=" + imageDir + ", imageStatus="
				+ imageStatus + ", who=" + who + ", imageBy=" + imageBy + "]";
	}
	
	
}
