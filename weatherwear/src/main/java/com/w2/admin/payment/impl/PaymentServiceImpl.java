package com.w2.admin.payment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.admin.payment.PaymentDAO;
import com.w2.admin.payment.PaymentService;
import com.w2.admin.payment.PaymentVO;

@Service("paymentService") 
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDAO dao;
	
	@Override
	public List<PaymentVO> getPaymentList(PaymentVO payment) {
		return dao.getPaymentList(payment);
	}

}