package com.w2.product;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 상품 등록 1(상품)
	public int insertProduct(ProductVO pro) {
		System.out.println("[ ProductDAO ] : insertProduct");
		
		return  sqlSessionTemplate.insert("ProductDAO.insertProduct", pro);
	}

	// 상품 등록 2(가격)
	public int insertProductPrice(ProductVO pro) {
		System.out.println("[ ProductDAO ] : insertProduct");
		
		return sqlSessionTemplate.insert("ProductDAO.insertProductPrice", pro);
	}

	// 상품 등록 3(옵션)
	public void insertOption(OptionVO opt) {
		System.err.println("[ ProductDAO ] : " + opt.toString());
		
		sqlSessionTemplate.insert("ProductDAO.insertOption", opt);
	}
	
	// 상품 수정 1(상품)
	public int updateProduct(ProductVO pro) {
		System.out.println("[ ProductDAO ] : updateProduct");
		
		return sqlSessionTemplate.update("ProductDAO.updateProduct", pro);
	}

	// 상품 수정 2(가격)
	public int updateProductPrice(ProductVO pro) {
		System.out.println("[ ProductDAO ] : updateProductPrice");
		
		return sqlSessionTemplate.update("ProductDAO.updateProductPrice", pro);
	}
	
	// 상품 수정 3(옵션 삭제) > 4(옵션 등록)
	public void deleteOption(String proId) {
		System.out.println("[ ProductDAO ] : updateOption");
		
		sqlSessionTemplate.update("ProductDAO.deleteOption", proId);
	}
	
	public void deleteProduct(ProductVO pro) {
		System.out.println("[ ProductDAO ] : deleteProduct");
		
		sqlSessionTemplate.delete("ProductDAO.deleteProduct", pro);
	}
	
	public ProductVO getProduct(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getProduct");
		
		return (ProductVO)sqlSessionTemplate.selectOne("ProductDAO.getProduct", pro);
	}
	
	public ProductVO getOptionList(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getOptionList");

		pro.setOpColorList(sqlSessionTemplate.selectList("ProductDAO.getColorList", pro.getProId()));
		pro.setOpSizeList(sqlSessionTemplate.selectList("ProductDAO.getSizeList", pro.getProId()));
		pro.setStCntList(sqlSessionTemplate.selectList("ProductDAO.getCntList", pro.getProId()));
		
		System.err.println("[ ProductDAO ] : " + pro.toString());
		
		return pro;
	}
	
	public int searchCount(ProductVO pro) {
		
		return sqlSessionTemplate.selectOne("ProductDAO.getProductCount", pro);
	}
	
	public List<ProductVO> getProductList(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getProductList");
		
		return sqlSessionTemplate.selectList("ProductDAO.getProductList", pro);
	}
	
}
