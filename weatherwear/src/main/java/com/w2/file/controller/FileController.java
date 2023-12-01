package com.w2.file.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.w2.file.AwsS3;
import com.w2.file.FileService;
import com.w2.file.ImageVO;

import lombok.extern.slf4j.Slf4j;

@Controller
public class FileController {
	@Autowired
	private AwsS3 awsS3 = AwsS3.getInstance();
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private Environment env;
	
	// 이미지 업로드 페이지 요청(테스트)
	@RequestMapping("/insertImage.do")
	public String insert() {
		System.out.println("[ FileController ] : insert/get");
		
		return "/test/insert_image";
	}
	
	// 이미지 업로드 페이지 요청(테스트)
	@PostMapping("/insertImage.do")
	public void insertCmImage(MultipartHttpServletRequest request, ImageVO imvo, String where) throws IllegalStateException, IOException {
		System.out.println("[ FileController ] : insertCmImage/get");
		System.err.println("imvo : " + imvo.toString());
		imvo.setImageStatus("환불");
		imvo.setImageBy("client01");
		//insertImage(request, imvo, "client");
	}
	
	/**
	 * 작업하는 Controller 호출시 MultipartHttpServletRequest multiRequest를 매개변수로 가져와야 합니다.
	 * 
	 * - 호출 전에 VO에 imageStatus, imageBy 지정
	 * 		- imvo.setImageStatus("")
	 * 			- client : '환불','문의','리뷰'
	 * 			- admin : '공지','메인','기타'
	 * 			- product : '대표','추가','상세'
	 * 		- imvo.setImageBy("");
	 * 			- client : cId
	 * 			- admin : cId
	 * 			- product : proId 
	 * 
	 * - 호출
	 * @Autowired 값으로 지정한 파일명.insert(multiRequest, imvo, "client/admin/product 중 하나");
	 */
	public void insertImage(MultipartHttpServletRequest request, ImageVO imvo, String where) throws IllegalStateException, IOException {
		System.out.println("[ FileController ] : insertImage/post");

		// 업로드할 파일 기본 저장 위치
		String rootUploadDir = "C:" + File.separator + "Weatherwear";
		
		// 업로드할 파일 저장 위치
		String uploadDir = "https://hyeongabucket.s3.ap-northeast-2.amazonaws.com/";
		String folder = "";
		
		if(where.equals("client")) {
			uploadDir += "client_image/";
			folder = "client_image/";
			imvo.setWho("client");
			
		} else if(where.equals("admin")) {
			uploadDir += "admin_image/";
			folder = "admin_image/";
			imvo.setWho("admin");
			
		} else if(where.equals("product")) {
			uploadDir += "product_image/";
			folder = "product_image/";
			imvo.setWho("product");
		}
		
		// 다중 파일 처리위함
		List<MultipartFile> fileList = request.getFiles("upload[]");

		// 서버에 저장할 파일 이름
		String sysFileName = "";

		// 이름 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMddHHss");
		Calendar calendar = Calendar.getInstance();
		sysFileName = simpleDateFormat.format(calendar.getTime());
		
		// 중복 방지
		for(int i=0; i<10; i++) {
			sysFileName += (char)((Math.random()*26)+97);
		}
		sysFileName += "_" ;
		
		// 리스트로 받아온 파일을 하나씩 저장
		for(MultipartFile file : fileList){
			System.out.println(file.getOriginalFilename());

			// 순서 정렬을 위한 인덱스 추가 (날짜 + 인덱스)
			sysFileName += fileList.indexOf(file);
			
			// 기본 이름
			// String orgFileName = file.getOriginalFilename();

			// 업로드할 파일의 풀 경로
			String orgFilePath = request.getServletContext().getRealPath("/");
			
			// 변경된 파일 이름으로 지정
			file.transferTo(new File(orgFilePath + File.separator + sysFileName + ".jpg"));
			
			// S3에 저장할 파일 생성
			File result = new File(orgFilePath + File.separator + sysFileName + ".jpg");

			// 업로드 위치 (S3 주소)
			awsS3.upload(result, folder + sysFileName + ".jpg");	
			
			// 이름에 추가한 인덱스 제거
			sysFileName = sysFileName.substring(0, sysFileName.length() -1);
			
			imvo.setImageId(sysFileName);
			imvo.setImageName(sysFileName + ".jpg");
			imvo.setImageDir(uploadDir);

			// 테이블에 정보 삽입
			if(fileService.insertImage(imvo) > 0 ) {
				System.out.println("테이블에 삽입 성공");
			} else {
				System.out.println("테이블에 삽입 실패");
			}
			
			// 이름에 추가한 인덱스 제거
			sysFileName = sysFileName.substring(0, sysFileName.length() -2);
		}
	}
	
	
	/**FileList를 넘겨야 합니다. > List<MultipartFile> fileList = request.getFiles("input 태그 name")
	 * 업로드할 파일의 풀 경로 > 
	 * String orgFilePath = request.getServletContext().getRealPath("/");
	 */	
	public void insertProductImage(List<MultipartFile> fileList1, List<MultipartFile> fileList2, String orgFilePath, ImageVO imvo) throws IllegalStateException, IOException {
		System.out.println("[ FileController ] : productImageInsert/post");

		// 업로드할 파일 기본 저장 위치
		String rootUploadDir = "C:" + File.separator + "Weatherwear";
		
		// 업로드할 파일 저장 위치
		String uploadDir = "https://hyeongabucket.s3.ap-northeast-2.amazonaws.com/product_image/";
		String folder = "product_image/";

		imvo.setImageDir(uploadDir);
		
		// 서버에 저장할 파일 이름
		String sysFileName = "";

		// 이름 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMddHHss");
		Calendar calendar = Calendar.getInstance();
		sysFileName = simpleDateFormat.format(calendar.getTime());
		
		System.err.println("[ FileController ] 대표 이미지 저장 시작");
		// 메인 이미지 저장
		imvo.setImageStatus("대표");
		uploadProductImage(fileList1, sysFileName, orgFilePath, folder, imvo);
		
		System.err.println("[ FileController ] 상세 이미지 저장 시작");
		// 상세 이미지 저장
		imvo.setImageStatus("상세");
		uploadProductImage(fileList2, sysFileName, orgFilePath, folder, imvo);
	}
	
	// 사진 업로드(상세)
	public void updateProductImage(List<MultipartFile> fileList, String orgFilePath, ImageVO imvo) throws IllegalStateException, IOException {
		System.out.println("[ FileController ] : updateProductImage/post");

		// 업로드할 파일 기본 저장 위치
		String rootUploadDir = "C:" + File.separator + "Weatherwear";
		
		// 업로드할 파일 저장 위치
		String uploadDir = "https://hyeongabucket.s3.ap-northeast-2.amazonaws.com/product_image/";
		String folder = "product_image/";

		imvo.setWho("product");
		imvo.setImageDir(uploadDir);
		
		// 서버에 저장할 파일 이름
		String sysFileName = "";

		// 이름 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMddHHss");
		Calendar calendar = Calendar.getInstance();
		sysFileName = simpleDateFormat.format(calendar.getTime());

		uploadProductImage(fileList, sysFileName, orgFilePath, folder, imvo);
	}
	
	// 상품 : 메인/상세 이미지 저장 호출
	public void uploadProductImage(List<MultipartFile> fileList, String sysFileName, String orgFilePath, String folder, ImageVO imvo) throws IllegalStateException, IOException {

		// 중복 방지
		for(int i=0; i<10; i++) {
			sysFileName += (char)((Math.random()*26)+97);
		}
		sysFileName += "_" ;
		
		// 리스트로 받아온 파일을 하나씩 저장
		for(MultipartFile file : fileList){
			System.out.println(file.getOriginalFilename());
			
			// 순서 정렬을 위한 인덱스 추가 (날짜 + 인덱스)
			sysFileName += fileList.indexOf(file);
			
			// 기본 이름
			// String orgFileName = file.getOriginalFilename();
			
			// 변경된 파일 이름으로 지정
			file.transferTo(new File(orgFilePath + File.separator + sysFileName + ".jpg"));
			
			// S3에 저장할 파일 생성
			File result = new File(orgFilePath + File.separator + sysFileName + ".jpg");

			// 업로드 위치 (S3 주소)
			awsS3.upload(result, folder + sysFileName + ".jpg");	
			
			imvo.setImageId(sysFileName);
			imvo.setImageName(sysFileName + ".jpg");
			
			// 테이블에 정보 삽입
			if(fileService.insertImage(imvo) > 0 ) {
				System.out.println("이미지 삽입 성공");
			} else {
				System.out.println("이미지 삽입 실패");
			}
			
			// 이름에 추가한 인덱스 제거
			sysFileName = sysFileName.substring(0, sysFileName.length() -1);
		}
	}
}

