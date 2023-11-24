package com.w2.product;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	int insertProduct(ProductVO pro);
	
	void insertOption(OptionVO opt);
	
	void updateProduct(ProductVO pro);
	
	void updateOption(OptionVO opt);
	
	void deleteProduct(ProductVO pro);
	
	ProductVO getProduct(ProductVO pro);
	
	List<OptionVO> getOptionList(OptionVO opt);
	
	List<ProductVO> getProductList(ProductVO pro);

}
