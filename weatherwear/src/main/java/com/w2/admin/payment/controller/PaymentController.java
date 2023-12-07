package com.w2.admin.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.admin.payment.PaymentDAO;
import com.w2.admin.payment.PaymentService;
import com.w2.admin.payment.PaymentVO;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/paymentList.mdo")
	public String getPaymentList(PaymentVO payment, PaymentDAO dao, Model model) {

		model.addAttribute("paymentList", paymentService.getPaymentList(payment));
		System.err.println("[ Payment Controller ] : getPaymentList ============= " + model.toString());
		return "/admin/paymentList";
	}
}