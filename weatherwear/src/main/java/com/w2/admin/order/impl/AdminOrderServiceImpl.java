package com.w2.admin.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.admin.order.AdminOrderDAO;
import com.w2.admin.order.AdminOrderService;
import com.w2.admin.order.AdminOrderVO;

import java.util.Map;

@Service
public class AdminOrderServiceImpl implements AdminOrderService{

	@Autowired
	private AdminOrderDAO adminOrderDAO;
	
	@Override
	public List<AdminOrderVO> getAdminOrderListAll(AdminOrderVO adminOrderVO) throws Exception {
		System.err.println("[OrderServiceImpl] : getAdminOrderListAll");
		System.err.println("---------------[ adminOrderVO ] : " + adminOrderVO.toString());
		return adminOrderDAO.getAdminOrderListAll(adminOrderVO);
	}

	
	@Override
	public List<AdminOrderVO> getAdminOrderList(AdminOrderVO adminOrderVO) throws Exception {
		System.err.println("[OrderServiceImpl] : getAdminOrderList");
		System.err.println("---------------[ adminOrderVO ] : " + adminOrderVO.toString());
//		System.err.println("adminOrderDAO.getAdminOrderList(map) : "+adminOrderDAO.getAdminOrderList(map));
		
//		List<AdminOrderVO> order = adminOrderDAO.getAdminOrderList(adminOrderVO);//cartDAO 내에서 sqltemplate 통해서 데이터 가져오기
		
//		System.err.println("[impl][ order ] : " + order.toString()); //sql에서 값 넘어옴을 확인
		
		return adminOrderDAO.getAdminOrderList(adminOrderVO);
	}


	@Override
	public void updateAdminOrderStatus(Map odStatusMap) throws Exception{
		System.err.println("[impl][ updateOrder ] : " + odStatusMap.toString());
		adminOrderDAO.updateAdminOrderStatus(odStatusMap);
	}
	
	

}
