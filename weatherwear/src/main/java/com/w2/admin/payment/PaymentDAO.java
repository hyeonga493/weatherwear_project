package com.w2.admin.payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<PaymentVO> getPaymentList(PaymentVO payment){
		return sqlSessionTemplate.selectList("PaymentDAO.getPaymentList", payment);
	}
	
}
