package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.OrderMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper ordermapper;

	// 주문 내역 가져오는 코드
	@Override
	public List<JoinOrderHistoryVO> order_History_getList(Criteria criteria, MemberVO memberVO) {
		log.info("order_History_getList()...");
		return ordermapper.getOrderHistoryList(criteria, memberVO);
	}
	
	@Override
	public int order_History_getTotal(MemberVO memberVO) {
		log.info("order_History_getTotal()...");
		return ordermapper.getOrderHistoryTotalCount(memberVO);
	}

	@Override
	public List<JoinOrderPaymentVO> orderPayment_getList(MemberVO memberVO) {
		log.info("orderPayment_getList()...");
		return ordermapper.getOrderPaymentList(memberVO);
	}

	@Override
	public List<JoinCoupon> getUserCouponList(MemberVO memberVO) {
		log.info("getUserCouponList()...");
		return ordermapper.getUserCouponList(memberVO);
	}

	@Override
	public List<ProductVO> getProductList(int product_id) {
		log.info("getProductList()...");
		return ordermapper.getProduct(product_id);
	}
	
	



}
