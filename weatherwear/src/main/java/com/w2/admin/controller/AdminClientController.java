package com.w2.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.client.ClientService;
import com.w2.client.ClientVO;
import com.w2.product.ProductVO;

@Controller
public class AdminClientController {
	
	@Autowired
	private ClientService clientService;
	
	@RequestMapping("/updateClient.mdo")
	public String updateClient(ClientVO client, Model model, HttpServletRequest request) {
		System.out.println("[ Controller ] : updateClient");
		
		ClientVO result = clientService.getClientService(client);
		
		model.addAttribute("client", result);
		
		return "/admin/client_update";
	}
	
	@PostMapping("/do.do")
	public String dodo(ProductVO pro) {
		System.err.println("dodo");

		System.out.println("pro : "  + pro.toString());
		System.out.println("con : "  + pro.getProContent());
		
		return "redirect:/registerProduct.mdo";
	}
}
