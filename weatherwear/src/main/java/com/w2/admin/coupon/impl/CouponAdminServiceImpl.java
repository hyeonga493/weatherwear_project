package com.w2.admin.coupon.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.admin.coupon.CouponAdminDAO;
import com.w2.admin.coupon.CouponAdminService;
import com.w2.admin.coupon.CouponAdminVO;

@Service("couponAdminService") 
public class CouponAdminServiceImpl implements CouponAdminService {

	@Autowired
	private CouponAdminDAO dao;
	
	@Override
	public List<CouponAdminVO> couponAdminList(CouponAdminVO couponAdmin) {
		return dao.couponAdminList(couponAdmin);
	}

	@Override
	public List<CouponAdminVO> clientIdList(CouponAdminVO couponAdmin) {
		return dao.clientIdList(couponAdmin);
	}
	
	//쿠폰정보 등록로직
	@Override
	public void couponInfoRegist(CouponAdminVO couponAdmin) {
		dao.couponInfoRegist(couponAdmin);
	}
	
	//회원id와 쿠폰정보 등록
	@Override
	public void couponListRegist(CouponAdminVO couponAdmin) {
		dao.couponListRegist(couponAdmin);
	}
	
	@Override
	public void updateCpStatus(CouponAdminVO couponAdmin) {
		dao.updateCpStatus(couponAdmin);
	}

}
