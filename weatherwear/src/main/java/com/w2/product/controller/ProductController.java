package com.w2.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.w2.file.ImageVO;
import com.w2.file.controller.FileController;
import com.w2.paging.PagingService;
import com.w2.product.OptionVO;
import com.w2.product.ProductService;
import com.w2.product.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private PagingService pagingService;
	
	@Autowired
	private FileController fileController;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 상품 등록 화면(관리자)
	@RequestMapping("/registerProduct.mdo")
	public String registerProduct(ProductVO pro) {
		logger.info("[admin] product register form");
		
		return "/admin/product/product_register";
	}
	
	// 상품 등록(관리자)
	@PostMapping("/insertProduct.mdo")
	public String insertProduct(ProductVO pro, MultipartHttpServletRequest request) throws IOException {
		System.out.println("[ Controller ] : insertProduct");
		System.err.println("@@@ pro : " + pro.toString());

		List<MultipartFile> mainList = request.getFiles("main_img[]");
		System.err.println(">>mainList : " + mainList.toString());
		List<MultipartFile> detailList = request.getFiles("detail_img[]");
		System.err.println(">>detailList : " + detailList.toString());
		String oriFilePath = request.getServletContext().getRealPath("/");
		
		ImageVO productvo = new ImageVO();
		productvo.setImageBy(pro.getProId());
		productvo.setWho("product");
		System.err.println("[ Controller ] productvo : " + productvo.toString());
		
		fileController.insertProductImage(mainList, detailList, oriFilePath, productvo);
		System.err.println("[ Controller ] 이미지 삽입 성공");
		
		int result = productService.insertProduct(pro);
		
		System.err.println("[ Controller ] result : " + result);

		
		logger.info("[admin] product insert proc");
		logger.info("insert : " + pro.toString());
		logger.info("result : " + result);
		
		return "redirect:productList.mdo";
	}
	
	// 상품 목록 조회(관리자)
	@RequestMapping(value = "/productList.mdo")
	public String productList(@RequestParam(value = "page", required = false)Integer page, ProductVO pro, Model model) {
		if(pro.getSearchtype() == null) {
			pro.setSearchtype("");
		}
		if(pro.getKeyword() == null) {
			pro.setKeyword("");
		}
		
		List<ProductVO> productList = pagingService.productList(page, pro, model);
		
		model.addAttribute("productList", productList);
		
		return "/admin/product/product_list";
	}
	
	// 상품 상세 정보(관리자)
	@RequestMapping(value = "/getProduct.mdo")
	public ModelAndView getProduct(ProductVO pro, Model model, OptionVO opt) {
		
		opt.setProId(pro.getProId());
		
		pro = productService.getProduct(pro);
		
		// 옵션 정보 저장
		pro = productService.getOptionList(pro);
		System.err.println("pro : " + pro.toString());
		
		// 이미지 불러오기
		ImageVO mainvo = new ImageVO();
		mainvo.setImageBy(pro.getProId());
		
		mainvo = productService.getMainImage(mainvo.getImageBy());
		List<ImageVO> detailImageList = productService.getDetailImage(mainvo.getImageBy());
	
		model.addAttribute("product", pro);
		model.addAttribute("opColorList", pro.getOpColorList());
		model.addAttribute("opSizeList", pro.getOpSizeList());
		model.addAttribute("stCntList", pro.getStCntList());
		model.addAttribute("mainImage", mainvo);
		model.addAttribute("detailImageList", detailImageList);

		ModelAndView mv = new ModelAndView("admin/product/product_detail");
		mv.addObject("product", pro);
		mv.addObject("opColorList", pro.getOpColorList());
		mv.addObject("opSizeList", pro.getOpSizeList());
		mv.addObject("stCntList", pro.getStCntList());
		
		return mv;
	}
	
	// 상품 정보 수정(관리자)
	@PostMapping("/updateProduct.mdo")
	public String updateProduct(ProductVO pro, MultipartHttpServletRequest request, HttpServletRequest httpre) throws IllegalStateException, IOException {
		System.out.println("[ Controller ] : updateProduct");

		if(httpre.getParameter("deleteList")!= null) {
			System.err.println("상세 이미지 삭제한다.");
			System.err.println("삭제할 이미지 : " + httpre.getParameter("deleteList"));
			
			// 삭제할 이미지 리스트
			String[] deletelist = httpre.getParameter("deleteList").split(",");
			System.err.println(">>deletelist : " + deletelist);
			
			for(int i=0; i<deletelist.length; i++) {
				productService.deleteImage(deletelist[i]);
				System.err.println("삭제 : " + deletelist[i]);
			}
		}
		
		List<MultipartFile> mainList = request.getFiles("main_Changeimg[]");
		List<MultipartFile> detailList = request.getFiles("detail_Changeimg[]");
		String oriFilePath = request.getServletContext().getRealPath("/");
			
		for(MultipartFile main : mainList) {
			if(main.getOriginalFilename()== null &&  main.getOriginalFilename() == "" ) {
			    System.out.println("mainList 파일이 업로드되지 않았습니다.");
				System.err.println("추가 메인 이미지 없다");
				break;
			}
			
			System.err.println("main.name : " + main.getOriginalFilename());
			// 메인 이미지 새로 업로드 시 기존 이미지 삭제
			ImageVO mainvo = new ImageVO();
			mainvo.setImageBy(pro.getProId());
			mainvo.setWho("product");
			mainvo.setImageStatus("대표");
			mainvo = productService.getMainImage(mainvo.getImageBy());
			
			productService.deleteImage(mainvo.getImageName());
			System.err.println("기존 메인 이미지 삭제");
			
			fileController.updateProductImage(mainList, oriFilePath, mainvo);
			System.err.println("메인 이미지 수정");
		}

		for(MultipartFile detail : detailList) {
			if(detail.getOriginalFilename()== null &&  detail.getOriginalFilename() == "" ) {
			    System.out.println("detailList 파일이 업로드되지 않았습니다.");
				System.err.println("추가 상세 이미지 없다");
				break;
			}
			ImageVO detailvo = new ImageVO();
			detailvo.setImageBy(pro.getProId());
			detailvo.setWho("product");
			detailvo.setImageStatus("상세");
			
			fileController.updateProductImage(detailList, oriFilePath, detailvo);
			System.err.println("상세 이미지 수정");
			break;
		}
		
		int result = productService.updateProduct(pro);
		
		System.err.println("[ Controller ] result : " + result);
		
		return "redirect:productList.mdo";
	}
	
	// 상품 삭제(관리자)
	@RequestMapping(value = "/deleteProduct.mdo")
	public String deleteProduct(ProductVO pro) {
		productService.deleteProduct(pro);
		
		return "redirect:productList.mdo";
	}

	// 상품 정보 수정(관리자)
	@RequestMapping(value = "/updateProduct.mdo")
	public String updateProduct(ProductVO pro) {
		
		int result = productService.updateProduct(pro);
		
		return "redirect:productList.mdo";
	}
	
	// 상품 목록 조회(사용자)
	@RequestMapping("/productList.do")
	public String productNew(@RequestParam(value = "page", required = false)Integer page, ProductVO pro, Model model) {
		if(pro.getOrdertype() == null) {
			pro.setOrdertype("");
		}
		
		System.out.println("[ ClientController ] : product_list");
		
		List<ProductVO> productList = pagingService.productList(page, pro, model);
		
		model.addAttribute("productList", productList);
		
		return "client/product/product_list";
	}
	
	// 상품 상세 조회(사용자)
	@RequestMapping("/productInfo.do")
	public ModelAndView productInfo(ProductVO pro, OptionVO opt, Model model) {
		System.out.println("[ ClientController ] : product_info");
		

		opt.setProId(pro.getProId());
		
		pro = productService.getProduct(pro);
		
		// 옵션 정보 저장
		pro = productService.getOptionList(pro);
		System.err.println("pro : " + pro.toString());
		
		// 이미지 불러오기
		ImageVO mainvo = new ImageVO();
		mainvo.setImageBy(pro.getProId());
		
		System.err.println(">>>>>>> cate : " +productService.getCategory(pro.getProCate()));
		
		// 카테고리 불러오기
		String[] cate = productService.getCategory(pro.getProCate()).split(",");
		System.err.println(">>>>>>> cate : " +cate.toString());
		
		List<String> category = new ArrayList<String>();
		for(int i=0; i<cate.length; i++) {
			System.err.println(i + " : " +cate[i]);
			category.add(cate[i]);
		}
		
		mainvo = productService.getMainImage(mainvo.getImageBy());
		List<ImageVO> detailImageList = productService.getDetailImage(mainvo.getImageBy());
		
		model.addAttribute("product", pro);
		model.addAttribute("opColorList", pro.getOpColorList());
		model.addAttribute("opSizeList", pro.getOpSizeList());
		model.addAttribute("stCntList", pro.getStCntList());
		model.addAttribute("category", category);
		
		model.addAttribute("mainImage", mainvo);
		model.addAttribute("detailImageList", detailImageList);
		
		ModelAndView mv = new ModelAndView("client/product/product_info");
		mv.addObject("product", pro);
		mv.addObject("opColorList", pro.getOpColorList());
		mv.addObject("opSizeList", pro.getOpSizeList());
		mv.addObject("stCntList", pro.getStCntList());
		
		return mv;
	}
	
}
