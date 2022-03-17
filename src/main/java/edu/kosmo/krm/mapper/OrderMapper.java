package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.joinVO.JoinMemberDeliveryVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.CouponVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;

//주문 관리 매퍼
//2022-2-23 ~
//양세윤 코드 작성

@Mapper
public interface OrderMapper {

	// 주문 내역 가져오는 코드 (with 페이징)
	List<JoinOrderHistoryVO> getOrderHistoryList(@Param("criteria") Criteria criteria, @Param("memberVO") MemberVO memberVO);
	int getOrderHistoryTotalCount(MemberVO memberVO);
	
	// 결제주문
	List<JoinOrderPaymentVO> getOrderPaymentList(@Param("memberVO") MemberVO memberVO);
	
	// 쿠폰 리스트 가져오는 함수
	public List<JoinCoupon> getUserCouponList(MemberVO memberVO);
	
	// 상품 가져오는 함수
	public List<ProductVO> getProductList(int product_id);
	
	// 회원 정보 가져오는 함수
	public List<JoinMemberDeliveryVO> getMemberDeliveryList(int member_id);

}
