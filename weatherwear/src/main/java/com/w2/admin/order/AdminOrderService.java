package com.w2.admin.order;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {
	public List<AdminOrderVO> getAdminOrderList(AdminOrderVO adminOrderVO)   throws Exception; //주문내역 조회
	public void updateAdminOrderStatus(AdminOrderVO adminOrderVO)  throws Exception;
	public List<AdminOrderVO> getAdminOrderListAll(AdminOrderVO adminOrderVO) throws Exception;
	
	}