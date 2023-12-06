package com.w2.client.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

public interface OrderService {


	
	public List<OrderVO> getOrderList(OrderVO orderVO); // 주문 내역 목록 조회

//	public List<OrderVO> getOrderDetail(OrderVO orderVO);
	
	public OrderVO getOdStatus(OrderVO orderVO);

	public List<OrderVO> getOdInfo(OrderVO orderVO);

	public OrderVO getAdress(OrderVO orderVO);

	public OrderVO getPrice(OrderVO orderVO);
	
	////

	public void orderFromCart(OrderVO orderVO);
	
//	public void orderFromProduct(OrderVO orderVO);

	public List<OrderVO> toOrder_get_AddList(OrderVO orderVO);
	
	public List<OrderVO> toOrder_get_couponList(OrderVO orderVO);

	public OrderVO toOrder_get_AddBase(OrderVO orderVO);

//	public void toOrder_add_address_update(OrderVO orderVO);
//
//	public void toOrder_add_address_insert(OrderVO orderVO);

	public OrderVO toOrder_get_client(OrderVO orderVO);

	public Model toOrder_get_cart(OrderVO orderVO,Model model);
	
	public Model toOrder_get_product(OrderVO orderVO,Model model);
	
	public OrderVO toOrder_get_Price(OrderVO orderVO);
	
	public OrderVO toOrder_get_Price_product(OrderVO orderVO);

	public OrderVO toOrder_get_Point(OrderVO orderVO);

//	public OrderVO toOrder_get_deliPrice(OrderVO orderVO);//삭제

	public OrderVO toOrder_get_coupon_choose(OrderVO orderVO);

//	public void toOrder_insert_into_orders(OrderVO orderVO);
//
//	public void toOrder_insert_into_orders_info(OrderVO orderVO);
//
//	public void toOrder_delete_usedcaId(OrderVO orderVO);
//
//	public void toOrder_usedPoint(OrderVO orderVO);
//
//	public void toOrder_plusPoint(OrderVO orderVO); 
	
	public void insertPaymentInfo(PaymentVO vo) ;
	
	

}