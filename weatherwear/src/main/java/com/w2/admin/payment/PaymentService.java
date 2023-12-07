package com.w2.admin.payment;

import java.util.List;

public interface PaymentService {

	List<PaymentVO> getPaymentList(PaymentVO payment);
	
}
