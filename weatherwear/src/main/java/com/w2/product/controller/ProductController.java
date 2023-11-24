package com.w2.product.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.product.OptionVO;
import com.w2.product.ProductService;
import com.w2.product.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	// 상품 등록 화면(관리자)
	@RequestMapping("/registerProduct.mdo")
	public String registerProduct(ProductVO pro) {
		System.err.println("[ Controller ] : registerProduct/get");
		
		return "/admin/product/product_register";
	}
	
	// 상품 등록(관리자)
	@PostMapping("insertProduct.mdo")
	public String insertProduct(ProductVO pro) throws IOException {
		System.out.println("[ Controller ] : insertProduct");
		System.err.println("@@@ pro : " + pro.toString());
		
		int result = productService.insertProduct(pro);
		
		System.err.println("@@@@@ result : " + result);
		
		return "redirect:productList.mdo";
	}
	
	// 상품 목록 조회(관리자)
	@RequestMapping(value = "/productList.mdo")
	public String productList(ProductVO pro, Model model) {
		model.addAttribute("productList", productService.getProductList(pro));
		
		return "/admin/product/product_list";
	}
	
	// 상품 상세 정보(관리자)
	@RequestMapping(value = "/getProduct.mdo")
	public String getProduct(ProductVO pro, Model model) {
		model.addAttribute("product", productService.getProduct(pro));
		
		return "/admin/product/product_detail";
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
		productService.updateProduct(pro);
		
		return "redirect:productList.mdo";
	}
	
	// 상품 목록 조회(사용자)
	@RequestMapping("/productList.do")
	public String productNew(ProductVO pro, Model model) {
		System.out.println("[ ClientController ] : product_list");
		
		model.addAttribute("productList", productService.getProductList(pro));
		
		return "client/product/product_list";
	}
	
	// 상품 상세 조회(사용자)
	@RequestMapping("/productInfo.do")
	public String productInfo(ProductVO pro, OptionVO opt, Model model) {
		System.out.println("[ ClientController ] : product_info");
		
		model.addAttribute("product", productService.getProduct(pro));
		model.addAttribute("optionList", productService.getOptionList(opt));
		
		return "client/product/product_info";
	}
	
}
