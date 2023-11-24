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
	
	public int insertProduct(ProductVO pro) {
		System.out.println("[ DAO ] : insertProduct");
		
		System.err.println("___ pro : " + pro.toString());
		System.err.println("___ Clist : " + pro.getOpColorList());
		System.err.println("___ Slist : " + pro.getOpSizeList());
		
		pro.setOpClist(pro.getOpColorList().toString());
		pro.setOpSlist(pro.getOpSizeList().toString());
		
		System.err.println("___ Clist : " + pro.getOpColorList());
		System.err.println("___ Slist : " + pro.getOpSizeList());
		
		pro.setOpId(pro.getProId() + pro.getOpColor() + pro.getOpSize());
		
		int result = sqlSessionTemplate.insert("ProductDAO.insertProduct", pro);
		
		System.err.println("_____ result : " + result);
		
		return result;
	}
	
	public void insertOption(OptionVO opt) {
		opt.setOpId(opt.getProId() + opt.getOpColor() + opt.getOpSize());
		
		System.err.println(">>>>>>>>>>>>>>>>>>>>[DAO] : " + opt.toString());
		
		sqlSessionTemplate.insert("ProductDAO.insertOption", opt);
	}
	
	public void updateProduct(ProductVO pro) {
		pro.setOpId(pro.getProId() + pro.getOpColor() + pro.getOpSize());
		
		sqlSessionTemplate.update("ProductDAO.updateProduct", pro);
	}
	
	public void updateOption(OptionVO opt) {
		opt.setOpId(opt.getProId() + opt.getOpColor() + opt.getOpSize());
		
		sqlSessionTemplate.update("ProductDAO.updateOption", opt);
	}
	
	public void deleteProduct(ProductVO pro) {
		sqlSessionTemplate.delete("ProductDAO.deleteProduct", pro);
	}
	
	public ProductVO getProduct(ProductVO pro) {
		return (ProductVO)sqlSessionTemplate.selectOne("ProductDAO.getProduct", pro);
	}
	
	public List<OptionVO> getOptionList(OptionVO opt) {
		return sqlSessionTemplate.selectList("ProductDAO.getOptionList", opt);
	}
	
	public List<ProductVO> getProductList(ProductVO pro) {
		return sqlSessionTemplate.selectList("ProductDAO.getProductList", pro);
	}
	
}
