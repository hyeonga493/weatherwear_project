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
}
