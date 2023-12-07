package com.w2.admin.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOrderDAO {
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	public List<AdminOrderVO> getAdminOrderListAll(AdminOrderVO adminOrderVO) {//주문 내역 조회_날짜 지정 없이
		System.err.println("[ tem ] : " + sqlsessionTemplate.selectList("AdminOrderDAO.getAdminOrderListAll", adminOrderVO));

		return sqlsessionTemplate.selectList("AdminOrderDAO.getAdminOrderListAll", adminOrderVO);
	}

	public List<AdminOrderVO> getAdminOrderList(AdminOrderVO adminOrderVO) {//주문 내역 조회_날짜 지정
		System.err.println("[ OrderDAO ] : 탄다");
		
		System.err.println("_________________be : " + adminOrderVO.getBeginDateU());
		System.err.println("_________________en : " + adminOrderVO.getEndDateU());
		System.err.println("_______________________________"+adminOrderVO);
		
		System.err.println("[ tem ] : " + sqlsessionTemplate.selectList("AdminOrderDAO.getAdminOrderList", adminOrderVO));
		return sqlsessionTemplate.selectList("AdminOrderDAO.getAdminOrderList", adminOrderVO);
	}
	
	public void  updateAdminOrderStatus(AdminOrderVO adminOrderVO) throws DataAccessException{
		System.err.println("[dao][ updateAdminOrderStatus ] : " + adminOrderVO.toString());
		System.err.println("[ tem ] : " + sqlsessionTemplate.selectList("AdminOrderDAO.updateAdminOrderStatus",adminOrderVO));
		sqlsessionTemplate.update("AdminOrderDAO.updateAdminOrderStatus",adminOrderVO);
	}
	
	// 주문 수 조회 (사용)
	public int searchCount(AdminOrderVO adminOrderVO) {
	System.out.println("[ OrderDAO ] : searchCount");
	
	return	sqlsessionTemplate.selectOne("AdminOrderDAO.getAdminOrderCount", adminOrderVO);
	}
	
}

