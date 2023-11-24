package com.w2.product.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.product.ProductService;
import com.w2.product.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/registerProduct.mdo")
	public String registerProduct(ProductVO pro) {
		System.err.println("[ Controller ] : registerProduct/get");
		
		return "/admin/product/product_register";
	}
	
	@PostMapping("insertProduct.mdo")
	public String insertProduct(ProductVO pro) throws IOException {
		System.out.println("[ Controller ] : insertProduct");
		System.err.println("@@@ pro : " + pro.toString());
		
		int result = productService.insertProduct(pro);
		
		System.err.println("@@@@@ result : " + result);
		
		return "redirect:productList.mdo";
	}
	
	@RequestMapping(value = "/productList.mdo")
	public String productList(ProductVO pro, Model model) {
		model.addAttribute("productList", productService.getProductList(pro));
		
		return "/admin/product/product_list";
	}
	
	@RequestMapping(value = "/getProduct.mdo")
	public String getProduct(ProductVO pro, Model model) {
		model.addAttribute("product", productService.getProduct(pro));
		
		return "/admin/product/product_detail";
	}
	
	@RequestMapping(value = "/deleteProduct.mdo")
	public String deleteProduct(ProductVO pro) {
		productService.deleteProduct(pro);
		
		return "redirect:productList.mdo";
	}
	
	@RequestMapping(value = "/updateProduct.mdo")
	public String updateProduct(ProductVO pro) {
		productService.updateProduct(pro);
		
		return "redirect:productList.mdo";
	}
	
}
