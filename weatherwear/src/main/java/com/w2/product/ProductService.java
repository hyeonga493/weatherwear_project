package com.w2.product;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;

import com.w2.file.ImageVO;

public interface ProductService {
	 
	// 상품 등록
	int insertProduct(ProductVO pro);
	
	// 옵션 등록
	void insertOption(OptionVO opt);
	
	// 상품 수정
	int updateProduct(ProductVO pro);
	
	// 상품 삭제
	void deleteProduct(ProductVO pro);
	
	// 상세 조회(관리자)
	ProductVO getProductAdmin(ProductVO pro);

	// 상세 조회(사용자)
	ProductVO getProductClient(ProductVO pro);
	
	// 옵션 조회
	ProductVO getOptionList(ProductVO pro);
	
	// 목록 조회(관리자)
	List<ProductVO> getProductListAdmin(ProductVO pro);
	
	// 목록 조회(사용자)
	List<ProductVO> getProductListClient(ProductVO pro);

	// 메인 이미지 목록 조회
	List<ImageVO> getProductMain(ProductVO pro);
	
	// 매인 이미지 조회
	ImageVO getMainImage(String imageBy);

	// 상세 이미지 조회
	List<ImageVO> getDetailImage(String imageBy);

	// 이미지 삭제
	void deleteImage(String ImageName);

	// 카테고리 조회
	String getCategory(String proCate);
	
	// 대량 데이터 삽입
	void test() throws IOException, FileNotFoundException, ParseException ;
	

	// 상위 조회수 TOP5
	public List<ProductVO> getBestProduct(ProductVO pro);
}
