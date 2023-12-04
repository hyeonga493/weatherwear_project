package com.w2.product.impl;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.w2.file.ImageVO;
import com.w2.product.OptionVO;
import com.w2.product.ProductDAO;
import com.w2.product.ProductService;
import com.w2.product.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
 
	@Autowired
	private ProductDAO productDAO;
	
	// 상품 등록(관리자)
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
	
	// 상품 수정(관리자)
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
	
	// 상품 삭제(관리자)
	@Override
	public void deleteProduct(ProductVO pro) {
		productDAO.deleteProduct(pro);
	}
	
	// 상품 조회(관리자)
	@Override
	public ProductVO getProductAdmin(ProductVO pro) {
		return productDAO.getProductAdmin(pro);
	}
	
	// 상품 조회(사용자)
	@Override
	public ProductVO getProductClient(ProductVO pro) {
		return productDAO.getProductClient(pro);
	}
	
	// 옵션 조회
	@Override
	public ProductVO getOptionList(ProductVO pro) {
		return productDAO.getOptionList(pro);
	}
	
	// 상품 목록 조회(관리자)
	@Override
	public List<ProductVO> getProductListAdmin(ProductVO pro) {
		return productDAO.getProductListAdmin(pro);
	}
	
	// 상품 목록 조회(사용자)
	@Override
	public List<ProductVO> getProductListClient(ProductVO pro) {
		return productDAO.getProductListClient(pro);
	}

	// 메인 이미지 목록 조회(사용자)
	@Override
	public List<ImageVO> getProductMain(ProductVO pro) {
		return productDAO.getProductMain(pro);
	}

	// 메인 이미지 조회
	@Override
	public ImageVO getMainImage(String imageBy) {
		return productDAO.getMainImage(imageBy);
	}

	// 상세 이미지 조회
	@Override
	public List<ImageVO> getDetailImage(String imageBy) {
		return productDAO.getDetailImage(imageBy);
	}

	// 이미지 삭제
	@Override
	public void deleteImage(String ImageName) {
		productDAO.deleteImage(ImageName);
		System.err.println("[ Service ] : delete");
	}
	
	// 카테고리 조회(사용자)
	@Override
	public String getCategory(String proCate) {
		String result = productDAO.getCategory(proCate);
		System.err.println("[ Service ] : getCategory");
		
		return result;
	}
	
	// 대량 데이터 삽입
	@Override
	public void test() throws IOException, ParseException {
		JSONParser parser = new JSONParser();

		File folder = new File("H:\\TeamProject\\productInfo\\outer");
		
		File[] files = folder.listFiles();
		
	    for(File file : files) {
	    	
			// 경로에서 읽어오기
			Reader reader = new FileReader(file);
			
			// 배열 선언
			JSONArray getArray = (JSONArray) parser.parse(reader);
			JSONObject getObj = new JSONObject();
			
			List<String> opColorList = new ArrayList<String>();
			opColorList.add("블랙");
			opColorList.add("차콜");

			List<String> opSizeList = new ArrayList<String>();
			opSizeList.add("S");
			opSizeList.add("M");
			opSizeList.add("L");
			
			List<Integer> stCntList = new ArrayList<Integer>();
			for(int i=0; i<opColorList.size()*opSizeList.size(); i++) {
				stCntList.add(30);
			}
			
			Calendar cal = Calendar.getInstance();
			Date date = new Date();
			
			cal.set(Calendar.YEAR, 2023);
			
			
			if (getArray.size() > 0) {
				for (int i = 0; i < getArray.size(); i++) {
					getObj = (JSONObject) getArray.get(i);

					// 다르게 작업했음
					int cost = (int)((Math.random()*29)+30)*1000;
					
					cal.set(Calendar.MONTH, (int)(Math.random()*10)+1);
					cal.set(Calendar.DAY_OF_MONTH, (int)(Math.random()*30)+1);
					date = cal.getTime();
					java.sql.Date sqlDate = new java.sql.Date(date.getTime());
					
					ProductVO pro = new ProductVO();
					
					pro.setProId((String)getObj.get("proId"));
					pro.setProCate((String)getObj.get("proCate"));
					pro.setProName((String)getObj.get("proName"));
					pro.setProContent((String)getObj.get("proContent"));
					pro.setStCntList(stCntList);
					pro.setProPrimeCost(cost);
					pro.setProRegDate(sqlDate);
					pro.setProSell("Y");
					pro.setOpSizeList(opSizeList);
					pro.setOpColorList(opColorList);
					
					System.out.println("proId : " + pro.getProId());
					System.out.println("proCate : " + pro.getProCate());
					System.out.println("proName : " + pro.getProName());
					System.out.println("proContent : " + pro.getProContent());
					System.out.println("proSell : " + pro.getProSell());
					System.out.println("proRegDate : " + pro.getProRegDate());

					int result = productDAO.insertProduct(pro);
					
					if (result == 1) { // 상품 등록 성공
						result = productDAO.insertProductPrice(pro);
						if(result == 1) { // 가격 등록 성공
							OptionVO opt = new OptionVO();
							// stCntList 데이터 추출
							int su = 0;
							
							for(int color = 0; color < pro.getOpColorList().size(); color++) {
								for(int size = 0; size < pro.getOpSizeList().size(); size++) {
									opt.setProId(pro.getProId());
									opt.setOpColor(pro.getOpColorList().get(color));
									opt.setOpSize(pro.getOpSizeList().get(size));
									
									opt.setStCnt(pro.getStCntList().get(su));
									
									su++;
									//System.err.println(color + "/" + size + "_su : " + su);
									
									productDAO.insertOption(opt); // 옵션 등록
								}
							}
						} else {
							System.err.println("상품 등록 성공/가격 등록 실패");
						}
					}
				}	
			}
	    }
	}

	// 상위 조회수 TOP5
	@Override
	public List<ProductVO> getBestProduct(ProductVO pro){
		return productDAO.getBestProduct(pro);
	}
}
