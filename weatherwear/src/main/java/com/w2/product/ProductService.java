package com.w2.product;

import java.util.List;
import java.util.Map;

import com.w2.file.ImageVO;

public interface ProductService {
	
	int insertProduct(ProductVO pro);
	
	void insertOption(OptionVO opt);
	
	int updateProduct(ProductVO pro);
	
	void deleteProduct(ProductVO pro);
	
	ProductVO getProduct(ProductVO pro);
	
	ProductVO getOptionList(ProductVO pro);
	
	List<ProductVO> getProductList(ProductVO pro);

	// 매인 이미지 조회
	ImageVO getMainImage(String imageBy);

	// 상세 이미지 조회
	List<ImageVO> getDetailImage(String imageBy);

	// 이미지 삭제
	void deleteImage(String ImageName);

	// 카테고리 조회
	String getCategory(String proCate);
}
