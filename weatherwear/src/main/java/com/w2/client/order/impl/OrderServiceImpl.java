package com.w2.client.order.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.w2.client.order.OrderDAO;
import com.w2.client.order.OrderService;
import com.w2.client.order.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<OrderVO> getOrderList(OrderVO orderVO) {
		System.err.println("[OrderServiceImpl] : getOrderList ");
		System.err.println("[clientId] : "+orderVO.getClientId());
		System.err.println("[orderVO.toString] : "+orderVO.toString());
		
		List<OrderVO> order = orderDAO.getOrderList(orderVO);
		System.err.println("[orderVO.toString] : "+order.toString());
		return order;
	}

//	@Override
//	public List<OrderVO> getOrderDetail(OrderVO orderVO) {
//		
//		System.err.println("[OrderServiceImpl] : getOrderDetail ");
//		System.err.println("[clientId] : "+orderVO.getClientId());
//		System.err.println("[odId] : "+orderVO.getOdid());
//		System.err.println("[orderVO.toString] : "+orderVO.toString());
//		
//		List<OrderVO> order = orderDAO.getOrderDetail(orderVO);
//		
//		return order;
//	}

	@Override //주문내역 상세 - 상태
	public OrderVO getOdStatus(OrderVO orderVO) {

		return orderDAO.getOdStatus(orderVO);
	}

	@Override //주문내역 상세 - 상품 정보
	public List<OrderVO> getOdInfo(OrderVO orderVO) {
		List<OrderVO> order = orderDAO.getOdInfo(orderVO);
		return order;
	}

	@Override //주문내역 상세 - 배송지 정보
	public OrderVO getAdress(OrderVO orderVO) {

		return orderDAO.getAdress(orderVO);
	}

	@Override //주문내역 상세 - 가격 정보
	public OrderVO getPrice(OrderVO orderVO) {

		return orderDAO.getPrice(orderVO);
	}

	////
	@Override
	public List<OrderVO> toOrder_get_AddList(OrderVO orderVO) {
		System.err.println("[OrderServiceImpl] : toOrder_get_AddList");
		System.err.println("[ orderVO ] : " + orderVO.toString());
		return orderDAO.toOrder_get_AddList(orderVO);
	}

	@Override
	public OrderVO toOrder_get_AddBase(OrderVO orderVO) {
		System.err.println("[OrderServiceImpl] : toOrder_get_AddBase");
		return orderDAO.toOrder_get_AddBase(orderVO);
	}

//	@Override
//	public void toOrder_add_address_update(OrderVO orderVO) {
//		orderDAO.toOrder_add_address_update(orderVO);
//	}
//
//	@Override
//	public void toOrder_add_address_insert(OrderVO orderVO) {
//		orderDAO.toOrder_add_address_insert(orderVO);
//	}

	@Override
	public OrderVO toOrder_get_client(OrderVO orderVO) {
		System.err.println("[OrderServiceImpl] : toOrder_get_client");
		return orderDAO.toOrder_get_client(orderVO);
	}
	
	@Override
	public Model toOrder_get_cart(OrderVO orderVO,Model model) {
		 OrderVO order = new OrderVO();
		    List<OrderVO> orderItemList = new ArrayList<>();

		    System.err.println("[OrderServiceImpl] : toOrder_get_cart");
		    System.err.println("[ orderVO ] : " + orderVO.toString());

		    for (int i = 0; i < orderVO.getCaIdList().size(); i++) {
		        System.err.println("caId" + (i + 1) + " : " + orderVO.getCaIdList().get(i));
		        orderVO.setCaId(orderVO.getCaIdList().get(i));

		        // orderDAO.toOrder_get_cart(orderVO)에서 반환되는 값이 OrderItem 또는 그와 유사한 클래스여야 합니다.
		        OrderVO orderItem = orderDAO.toOrder_get_cart(orderVO);
		        		        
		        orderItemList.add(orderItem);
		    }

		    // 모델에 리스트를 추가
		    model.addAttribute("toOrder_get_cart", orderItemList);

		    System.err.println("model.toString" + model.toString());
		    return model;
	}

	@Override
	public List<OrderVO> toOrder_get_couponList(OrderVO orderVO) {
		System.err.println("[OrderServiceImpl] : toOrder_get_couponList");
		System.err.println("[ orderVO ] : " + orderVO.toString());
		return orderDAO.toOrder_get_couponList(orderVO);
	}
	
	public OrderVO toOrder_get_Price(OrderVO orderVO) {
			System.err.println("[OrderServiceImpl] : toOrder_get_AddList");
			System.err.println("^^^^^^^^^^^orderVO.toString"+orderVO.toString());
			int sum = 0;
			for(int i=0; i<orderVO.getCaIdList().size(); i++) {
				orderVO.setCaId(orderVO.getCaIdList().get(i));
				System.err.println("^^^^^^^^^^orderVO.getCaId"+orderVO.getCaId());
				System.err.println("%%%%OrderVO.getOdTotal"+orderDAO.toOrder_get_Price(orderVO).getOdTotal());
				sum += orderDAO.toOrder_get_Price(orderVO).getOdTotal();
				//그냥 여기서 주문하기 관련 caId,caCnt 가져감
			}
			orderVO.setOdTotal(sum);
			System.err.println("^^^^^^^^^^^sum : "+sum);

			return orderVO;
		
	}
	
	
	public OrderVO toOrder_get_coupon_choose(OrderVO orderVO) {
		return orderDAO.toOrder_get_coupon_choose(orderVO);
		
	}
	public OrderVO toOrder_get_Point(OrderVO orderVO) {
		return orderDAO.toOrder_get_Point(orderVO);
		
	}
	

	/* 삭제
	@Override
	public OrderVO toOrder_get_deliPrice(OrderVO orderVO) {
		return orderDAO.toOrder_get_deliPrice(orderVO);
	}*/

//	@Override
//	public void toOrder_insert_into_orders(OrderVO orderVO) {
//		orderDAO.toOrder_insert_into_orders(orderVO);
//	}
//
//	@Override
//	public void toOrder_insert_into_orders_info(OrderVO orderVO) {
//		orderDAO.toOrder_insert_into_orders_info(orderVO);
//	}
//
//	@Override
//	public void toOrder_delete_usedcaId(OrderVO orderVO) {
//		orderDAO.toOrder_delete_usedcaId(orderVO);
//	}
//
//	@Override
//	public void toOrder_usedPoint(OrderVO orderVO) {
//		orderDAO.toOrder_usedPoint(orderVO);
//	}
//
//	@Override
//	public void toOrder_plusPoint(OrderVO orderVO) {
//		orderDAO.toOrder_plusPoint(orderVO);
//	}



	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override //주문하기 - 장바구니로부터
	public void orderFromCart(OrderVO orderVO) {
		System.err.println("[OrderServiceImpl] : orderFromCart");
//		orderDAO.toOrder_add_address_update(orderVO); //- 추가 배송지 관련이므로 일단 제외
//		orderDAO.toOrder_add_address_insert(orderVO); //- 추가 배송지 관련이므로 일단 제외
		orderDAO.toOrder_insert_into_orders(orderVO);
		System.err.println("##########3orderVO.toString"+orderVO.toString());
		for(int i=0; i<orderVO.getCaIdList().size(); i++) {
			System.err.println("caId"+(i+1)+" : "+orderVO.getCaIdList().get(i));
			orderVO.setCaId(orderVO.getCaIdList().get(i));
			System.err.println("$$$$$$$$$$$orderVO.toString"+orderVO.toString());
			orderDAO.toOrder_insert_into_orders_info(orderVO);
		}
		
		for(int i=0; i<orderVO.getCaIdList().size(); i++) {
			System.err.println("caId"+(i+1)+" : "+orderVO.getCaIdList().get(i));
			orderVO.setCaId(orderVO.getCaIdList().get(i));
			System.err.println("$$$$$$$$$$$orderVO.toString"+orderVO.toString());
			orderDAO.toOrder_delete_usedcaId(orderVO);
			System.err.println("주문한 카트 삭제");
		}
		
		orderDAO.toOrder_minus_cPoint(orderVO);
		orderDAO.toOrder_usedPoint(orderVO);
		orderDAO.toOrder_plusPoint(orderVO);
	}
	
	
	

	
	

}
