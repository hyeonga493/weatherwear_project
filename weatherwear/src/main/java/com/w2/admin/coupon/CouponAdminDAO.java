package com.w2.admin.coupon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.w2.admin.notice.NoticeBoardVO;


@Repository
public class CouponAdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CouponAdminVO> couponClientList(CouponAdminVO coupon){
		return sqlSessionTemplate.selectList("CouponAdminDAO.couponClientList", coupon);
	}
	
	public List<CouponAdminVO> couponAdminList(CouponAdminVO coupon){
		return sqlSessionTemplate.selectList("CouponAdminDAO.couponAdminList", coupon);
	}
	
	public List<CouponAdminVO> clientIdList(CouponAdminVO coupon){
		return sqlSessionTemplate.selectList("CouponAdminDAO.clientIdList", coupon);
	}
	
	public void couponInfoRegist(CouponAdminVO coupon) {
		sqlSessionTemplate.insert("CouponAdminDAO.couponInfoRegist", coupon);
	}
	
	public void couponListRegist(CouponAdminVO coupon) {
		sqlSessionTemplate.insert("CouponAdminDAO.couponListRegist", coupon);
	}
	
	public void updateCpStatus(CouponAdminVO coupon) {
		sqlSessionTemplate.update("CouponAdminDAO.updateCpStatus", coupon);
	}
	
}
