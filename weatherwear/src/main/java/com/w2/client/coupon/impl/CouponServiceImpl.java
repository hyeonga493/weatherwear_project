package com.w2.client.coupon.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.client.coupon.CouponDAO;
import com.w2.client.coupon.CouponService;
import com.w2.client.coupon.CouponVO;



@Service("couponService") 
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO dao;
	
	@Override
	public List<CouponVO> couponClientList(CouponVO coupon) {
		return dao.couponClientList(coupon);
	}
	
}
