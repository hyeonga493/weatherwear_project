package com.w2.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	int insertProduct(ProductVO pro);
	
	void insertOption(OptionVO opt);
	
	int updateProduct(ProductVO pro);
	
	void deleteProduct(ProductVO pro);
	
	ProductVO getProduct(ProductVO pro);
	
	ProductVO getOptionList(ProductVO pro);
	
	List<ProductVO> getProductList(ProductVO pro);

}
