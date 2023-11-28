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
		System.err.println(">>> op : " + pro.getOpColorList().size());
		System.err.println(">>> color : " + pro.getOpSizeList().size());
		
		int result = productDAO.insertProduct(pro);
		
		if (result == 1) { // 상품 등록 성공
			result = productDAO.insertProductPrice(pro);
			
			if(result == 1) { // 가격 등록 성공
				OptionVO opt = new OptionVO();
				
				// stCntList 데이터 추출
				int su = 0;
				
				for(int color = 0; color < pro.getOpColorList().size(); color++) {
					for(int size = 0; size < pro.getOpSizeList().size(); size++) {
						System.err.println(">>>>>> proId : " + pro.getProId());
						System.err.println(">>>>>> color : " + pro.getOpColorList().get(color));
						System.err.println(">>>>>> size : " + pro.getOpSizeList().get(size));
						System.err.println(">>>>>> cnt : " + pro.getStCntList().get(su));
						
						opt.setProId(pro.getProId());
						opt.setOpColor(pro.getOpColorList().get(color));
						opt.setOpSize(pro.getOpSizeList().get(size));
						
						opt.setStCnt(pro.getStCntList().get(su));
						
						su++;
						System.err.println(color + "/" + size + "_su : " + su);
						
						productDAO.insertOption(opt); // 옵션 등록
					}
				}
			} else {
				System.err.println("상품 등록 성공/가격 등록 실패");
			}
		} else {
			System.err.println("상품 등록 실패");
		}		
		return result;
	}
	
	public void insertOption(OptionVO opt) {
		productDAO.insertOption(opt);
	}
	
	@Override
	public int updateProduct(ProductVO pro) {
		
		int result = productDAO.updateProduct(pro);

		if (result == 1) { // 상품 수정 성공
			result = productDAO.updateProductPrice(pro);
			
			if(result == 1) { // 가격 수정 성공
				// 기존 옵션 삭제
				productDAO.deleteOption(pro.getProId());
				
				OptionVO opt = new OptionVO();
				
				// stCntList 데이터 추출
				int su = 0;
				
				for(int color = 0; color < pro.getOpColorList().size(); color++) {
					for(int size = 0; size < pro.getOpSizeList().size(); size++) {
						System.err.println(">>>>>> proId : " + pro.getProId());
						System.err.println(">>>>>> color : " + pro.getOpColorList().get(color));
						System.err.println(">>>>>> size : " + pro.getOpSizeList().get(size));
						System.err.println(">>>>>> cnt : " + pro.getStCntList().get(su));
						
						opt.setProId(pro.getProId());
						opt.setOpColor(pro.getOpColorList().get(color));
						opt.setOpSize(pro.getOpSizeList().get(size));
						
						opt.setStCnt(pro.getStCntList().get(su));
						
						su++;
						System.err.println(color + "/" + size + "_su : " + su);
						
						productDAO.insertOption(opt); // 옵션 수정
					}
				}
			} else {
				System.err.println("상품 수정 성공/가격 수정 실패");
			}
		} else {
			System.err.println("상품 수정 실패");
		}		
		return result;
	}
	
	@Override
	public void deleteProduct(ProductVO pro) {
		productDAO.deleteProduct(pro);
	}
	
	@Override
	public ProductVO getProduct(ProductVO pro) {
		return productDAO.getProduct(pro);
	}
	
	// 옵션 조회
	@Override
	public ProductVO getOptionList(ProductVO pro) {
		return productDAO.getOptionList(pro);
	}
	
	@Override
	public List<ProductVO> getProductList(ProductVO pro) {
		return productDAO.getProductList(pro);
	}

}
