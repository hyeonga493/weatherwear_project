package com.w2.client.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//주문내역 리스트 조회
	public List<OrderVO> getOrderList(OrderVO orderVO) {
		System.err.println("[OrderDAO] [getOrderList]");
		System.err.println("[OrderVO.toString] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectList("OrderDAO.getOrderList",orderVO));
		return sqlSessionTemplate.selectList("OrderDAO.getOrderList",orderVO);
	}

	//주문내역 상세 조회
//	public List<OrderVO> getOrderDetail(OrderVO orderVO) {
//		
//		System.err.println("[OrderDAO] [getOrderDetail]");
//		System.err.println("[OrderVO.toString] : "+orderVO.toString());
//		System.err.println("[tem] : "+sqlSessionTemplate.selectList("OrderDAO.getOrderDetail",orderVO));
//		return sqlSessionTemplate.selectList("OrderDAO.getOrderDetail",orderVO);
//	}

	
	public OrderVO getOdStatus(OrderVO orderVO) {
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.getOdStatus",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.getOdStatus",orderVO);
	}

	public List<OrderVO> getOdInfo(OrderVO orderVO) {
		System.err.println("[tem] : "+sqlSessionTemplate.selectList("OrderDAO.getOdInfo",orderVO));
		return sqlSessionTemplate.selectList("OrderDAO.getOdInfo",orderVO);
	}

	public OrderVO getAdress(OrderVO orderVO) {
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.getAdress",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.getAdress",orderVO);	}

	public OrderVO getPrice(OrderVO orderVO) {
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.getPrice",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.getPrice",orderVO);
	}

	///////
	public List<OrderVO> toOrder_get_AddList(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_get_AddList] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectList("OrderDAO.toOrder_get_AddList",orderVO));
		return sqlSessionTemplate.selectList("OrderDAO.toOrder_get_AddList",orderVO);
	}

	public OrderVO toOrder_get_AddBase(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_get_AddBase] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_AddBase",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_AddBase",orderVO);
	}

	public OrderVO toOrder_get_client(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_get_client] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_client",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_client",orderVO);
	}
	public OrderVO toOrder_get_Price(OrderVO orderVO) {
		System.err.println("연결확인 연결확인!!!!!!!!!!!![OrderDAO] [toOrder_get_Price] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_Price",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_Price",orderVO);
	}
	public OrderVO toOrder_get_Point(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_get_Point] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_Point",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_Point",orderVO);
	}
	
	/* 삭제*/
	public OrderVO toOrder_get_deliPrice(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_get_deliPrice] : "+orderVO.toString());
		orderVO.getClientId();
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_deliPrice",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_deliPrice",orderVO);
	}
	
	public OrderVO toOrder_get_coupon_choose(OrderVO orderVO) {
		return sqlSessionTemplate.selectOne("toOrder_get_coupon_choose", orderVO);
	}
	
	
//	public List<OrderVO> toOrder_get_cart(OrderVO orderVO) {
//		System.err.println("[OrderDAO] [toOrder_get_cart] : "+orderVO.toString());
//		System.err.println("[tem] : "+sqlSessionTemplate.selectList("OrderDAO.toOrder_get_cart",orderVO));
//		return sqlSessionTemplate.selectList("OrderDAO.toOrder_get_cart",orderVO);
//
//	}
	public OrderVO toOrder_get_cart(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_get_cart] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_cart",orderVO));
		return sqlSessionTemplate.selectOne("OrderDAO.toOrder_get_cart",orderVO);
		
	}

	public List<OrderVO> toOrder_get_couponList(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_get_cart] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.selectList("OrderDAO.toOrder_get_couponList",orderVO));
		return sqlSessionTemplate.selectList("OrderDAO.toOrder_get_couponList",orderVO);
		
	}


	public void toOrder_add_address_update(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_add_address_update] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.update("toOrder_add_address_update", orderVO));
		sqlSessionTemplate.update("toOrder_add_address_update", orderVO);
	}

	public void toOrder_add_address_insert(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_add_address_insert] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.insert("toOrder_add_address_insert", orderVO));
		sqlSessionTemplate.insert("toOrder_add_address_insert", orderVO);
		
	}

	public void toOrder_insert_into_orders(OrderVO orderVO) { //체크된 caId를 받아온다.

		System.err.println("[OrderDAO] [toOrder_insert_into_orders] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.insert("toOrder_insert_into_orders", orderVO));
		sqlSessionTemplate.insert("toOrder_insert_into_orders", orderVO);
		
	}

	public void toOrder_insert_into_orders_info(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_insert_into_orders_info] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.insert("toOrder_insert_into_orders_info", orderVO));
		sqlSessionTemplate.insert("toOrder_insert_into_orders_info", orderVO);
		
	}

	public void toOrder_delete_usedcaId(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_delete_usedcaId] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.delete("OrderDAO.toOrder_delete_usedcaId",orderVO));
		sqlSessionTemplate.delete("OrderDAO.toOrder_delete_usedcaId",orderVO);
	}

	public void toOrder_minus_cPoint(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_minus_cPoint] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.update("toOrder_minus_cPoint", orderVO));
		sqlSessionTemplate.update("toOrder_minus_cPoint", orderVO);
	}
	public void toOrder_usedPoint(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_usedPoint] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.update("toOrder_usedPoint", orderVO));
		sqlSessionTemplate.update("toOrder_usedPoint", orderVO);
	}

	public void toOrder_plusPoint(OrderVO orderVO) {
		System.err.println("[OrderDAO] [toOrder_plusPoint] : "+orderVO.toString());
		System.err.println("[tem] : "+sqlSessionTemplate.update("toOrder_plusPoint", orderVO));
		sqlSessionTemplate.update("toOrder_plusPoint", orderVO);
	}




	
	
	
}