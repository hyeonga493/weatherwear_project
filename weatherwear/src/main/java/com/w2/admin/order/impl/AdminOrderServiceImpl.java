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
		
		return adminOrderDAO.getAdminOrderList(adminOrderVO);
	}


	@Override
	public void updateAdminOrderStatus(AdminOrderVO adminOrderVO) throws Exception{
		System.err.println("[impl][ updateOrder ] : " + adminOrderVO.toString());
		
		if(adminOrderVO.getCheckList()!=null) {
			String[] check = (adminOrderVO.getCheckList().split(","));
			for(int i=0; i<check.length; i++) {
				
				adminOrderVO.setOdid(check[i]);
				System.err.println(adminOrderVO.getOdid());
				System.err.println(adminOrderVO.getOdStatus());
				adminOrderDAO.updateAdminOrderStatus(adminOrderVO);
			}
		}else if(adminOrderVO.getOdid()!=null) {
			System.err.println("odid: "+adminOrderVO.getOdid());
			System.err.println("odStatus: "+adminOrderVO.getOdStatus());
			adminOrderDAO.updateAdminOrderStatus(adminOrderVO);
		}
	}
	
}
