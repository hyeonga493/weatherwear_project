package com.w2.product.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 상품 등록 화면(관리자)
	@RequestMapping("/registerProduct.mdo")
	public String registerProduct(ProductVO pro) {
		logger.info("[admin] product register form");
		
		return "/admin/product/product_register";
	}
	
	// 상품 등록(관리자)
	@PostMapping("insertProduct.mdo")
	public String insertProduct(ProductVO pro) throws IOException {
		int result = productService.insertProduct(pro);
		
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
		
		model.addAttribute("product", pro);
		model.addAttribute("opColorList", pro.getOpColorList());
		model.addAttribute("opSizeList", pro.getOpSizeList());
		model.addAttribute("stCntList", pro.getStCntList());
	
		ModelAndView mv = new ModelAndView("admin/product/product_detail");
		mv.addObject("product", pro);
		mv.addObject("opColorList", pro.getOpColorList());
		mv.addObject("opSizeList", pro.getOpSizeList());
		mv.addObject("stCntList", pro.getStCntList());
		
		return mv;
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
	public String productInfo(ProductVO pro, OptionVO opt, Model model) {
		System.out.println("[ ClientController ] : product_info");
		
		model.addAttribute("product", productService.getProduct(pro));
//		model.addAttribute("optionList", productService.getOptionList(opt));
		
		return "client/product/product_info";
	}
	
}
