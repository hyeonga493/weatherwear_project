package com.w2.admin.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOrderDAO {
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	
	

	public List<AdminOrderVO> getAdminOrderList(AdminOrderVO adminOrderVO) {//주문 내역 조회
		System.err.println("[ OrderDAO ] : 탄다");
		
		System.err.println("_________________be : " + adminOrderVO.getBeginDateU());
		System.err.println("_________________en : " + adminOrderVO.getEndDateU());
		
		
		
		
//		System.err.println("[dao][ orderVO ] : " + adminOrderVO.toString());
		System.err.println("[ tem ] : " + sqlsessionTemplate.selectList("AdminOrderDAO.getAdminOrderList", adminOrderVO));
//		ArrayList<AdminOrderVO> AdminOrderList = (ArrayList)sqlsessionTemplate.selectList("AdminOrderDAO.getAdminOrderList", map);
//		return AdminOrderList;
//		return sqlsessionTemplate.selectList("AdminOrderDAO.get", adminOrderVO);
		return sqlsessionTemplate.selectList("AdminOrderDAO.getAdminOrderList", adminOrderVO);
	}
	
	public void  updateAdminOrderStatus(Map odStatusMap) throws DataAccessException{
		System.err.println("[dao][ updateAdminOrderStatus ] : " + odStatusMap.toString());
		System.err.println("[ tem ] : " + sqlsessionTemplate.selectList("AdminOrderDAO.updateAdminOrderStatus",odStatusMap));
		sqlsessionTemplate.update("AdminOrderDAO.updateAdminOrderStatus",odStatusMap);
	}
	
}

