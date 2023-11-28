package com.w2.admin.coupon;

import java.util.List;

public interface CouponAdminService {

	List<CouponAdminVO> clientIdList(CouponAdminVO couponAdmin);
	
	List<CouponAdminVO> couponAdminList(CouponAdminVO couponAdmin);
	
	void couponInfoRegist(CouponAdminVO couponAdmin);

	void couponListRegist(CouponAdminVO couponAdmin);
	
	//관리자 쿠폰관리 페이지에서 쿠폰상태 시간 만료시 업데이트
	void updateCpStatus(CouponAdminVO couponAdmin);
	
}
