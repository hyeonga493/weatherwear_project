package com.w2.client.coupon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CouponVO> couponClientList(CouponVO coupon){
		return sqlSessionTemplate.selectList("CouponDAO.couponClientList", coupon);
	}
	
}
