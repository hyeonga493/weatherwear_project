package com.w2.product.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.product.OptionVO;
import com.w2.product.ProductDAO;
import com.w2.product.ProductService;
import com.w2.product.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int insertProduct(ProductVO pro) {
		System.out.println("[ Impl ] : insertProduct");
		
		System.err.println(">>> pro : " + pro.toString());
		
		int result = productDAO.insertProduct(pro);
		
		OptionVO opt = new OptionVO();
		
		for(int color = 0; color < pro.getOpColorList().size(); color++) {
			for(int size = 0; size < pro.getOpSizeList().size(); size++) {
				opt.setProId(pro.getProId());
				opt.setOpColor(pro.getOpColorList().get(color));
				opt.setOpSize(pro.getOpSizeList().get(size));
				
				productDAO.insertOption(opt);
			}
		}
		
		System.err.println(">>>>> result : " + result );
		
		return result;
	}
	
	public void insertOption(OptionVO opt) {
		productDAO.insertOption(opt);
	}
	
	@Override
	public void updateProduct(ProductVO pro) {
		productDAO.updateProduct(pro);
	}
	
	@Override
	public void updateOption(OptionVO opt) {
		productDAO.updateOption(opt);
	}
	
	@Override
	public void deleteProduct(ProductVO pro) {
		productDAO.deleteProduct(pro);
	}
	
	@Override
	public ProductVO getProduct(ProductVO pro) {
		return productDAO.getProduct(pro);
	}
	
	@Override
	public List<OptionVO> getOptionList(OptionVO opt) {
		return productDAO.getOptionList(opt);
	}
	
	@Override
	public List<ProductVO> getProductList(ProductVO pro) {
		return productDAO.getProductList(pro);
	}

}
