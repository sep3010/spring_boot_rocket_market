package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.joinVO.JoinMemberDeliveryVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailVO;
import edu.kosmo.krm.vo.ProductVO;


public interface OrderService {
	
	// 주문 내역 가져오는 코드
	public List<JoinOrderHistoryVO> order_History_getList(Criteria criteria, MemberVO memberVo);
	public int order_History_getTotal(MemberVO memberVO);
	
	// 결제주문 페이지
	public List<JoinOrderPaymentVO> orderPayment_getList(MemberVO memberVO);
	
	// 쿠폰 목록 가져오기
	public List<JoinCoupon> getUserCouponList(MemberVO memberVO);
	
	// 상품 가져오기
	public List<ProductVO> getProductList(int product_id);
	
	// 회원 배송 정보 가져오기
	public List<JoinMemberDeliveryVO> getMemberDeliveryList(int member_id);
	
	// 주문 DB에 저장
	public void insertOrderInfo(MemberOrderVO memberOrderVO);
	
	// 주문상세 DB에 저장 (order_detail)
	public void insertOrderDetailInfo(OrderDetailVO orderDetailVO);	
	
//	// 주문한 상품의 개수를 가져오는 함수
//	public int getProudctQuantity(Long order_id);
}
