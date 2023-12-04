package com.w2.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.w2.file.ImageVO;

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
	
	// 상품 삭제
	public void deleteProduct(ProductVO pro) {
		System.out.println("[ ProductDAO ] : deleteProduct");
		
		sqlSessionTemplate.delete("ProductDAO.deleteProduct", pro);
	}
	
	// 상품 조회(관리자)
	public ProductVO getProductAdmin(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getProduct");
		return (ProductVO)sqlSessionTemplate.selectOne("ProductDAO.getProduct", pro);
	}

	// 상품 조회(사용자)
	public ProductVO getProductClient(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getProduct");
		ProductVO result = (ProductVO)sqlSessionTemplate.selectOne("ProductDAO.getProduct", pro);
		sqlSessionTemplate.update("ProductDAO.upcountView", result);
		return result;
	}
	
	// 상품 옵션조회
	public ProductVO getOptionList(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getOptionList");

		pro.setOpColorList(sqlSessionTemplate.selectList("ProductDAO.getColorList", pro.getProId()));
		pro.setOpSizeList(sqlSessionTemplate.selectList("ProductDAO.getSizeList", pro.getProId()));
		pro.setStCntList(sqlSessionTemplate.selectList("ProductDAO.getCntList", pro.getProId()));
		
		System.err.println("[ ProductDAO ] : " + pro.toString());
		
		return pro;
	}

	// 상품 수 조회
	public int searchCount(ProductVO pro) {
		
		return sqlSessionTemplate.selectOne("ProductDAO.getProductCount", pro);
	}
	
	// 상품 목록 조회(사용자)
	public List<ProductVO> getProductListClient(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getProductListClient");

		return sqlSessionTemplate.selectList("ProductDAO.getProductListClient", pro);
	}
	
	// 상품 메인 이미지 목록 조회(사용자)
	public List<ImageVO> getProductMain(ProductVO pro){
		System.out.println("[ ProductDAO ] : getProductMain");

		return sqlSessionTemplate.selectList("ProductDAO.getProductMain", pro);
	}

	// 메인 이미지 목록 조회(사용자) > 페이징
	public List<ImageVO> getMainList(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getProductMain");
		return sqlSessionTemplate.selectList("ProductDAO.getMainList", pro);
	}
	
	// 상품 목록 조회(관리자)
	public List<ProductVO> getProductListAdmin(ProductVO pro) {
		System.out.println("[ ProductDAO ] : getProductListAdmin");
		
		return sqlSessionTemplate.selectList("ProductDAO.getProductListAdmin", pro);
	}
	
	// 메인 이미지 조회
	public ImageVO getMainImage(String imageBy) {
		return sqlSessionTemplate.selectOne("ImageVO.getMainImage", imageBy);
	}

	// 상세 이미지 조회
	public List<ImageVO> getDetailImage(String imageBy) {
		return sqlSessionTemplate.selectList("ImageVO.getDetailImage", imageBy);
	}

	// 이미지 삭제
	public void deleteImage(String ImageName) {
		sqlSessionTemplate.delete("ImageVO.deleteImage", ImageName);
		System.err.println("[ DAO ] : delete");
	}
	
	// 카테고리 조회
	public String getCategory(String proCate) {
		String result = sqlSessionTemplate.selectOne("ProductDAO.getCategory", proCate);
		System.err.println("[ DAO ] : getCategory > " + result);
		return result;
	}

	// 상위 조회수 TOP5
	public List<ProductVO> getBestProduct(ProductVO pro){
		return sqlSessionTemplate.selectList("ProductDAO.getBestProduct", pro);
	}
}
