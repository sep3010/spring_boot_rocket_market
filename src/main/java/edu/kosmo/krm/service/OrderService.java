package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinWishProductListVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.joinVO.JoinMemberDeliveryVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailVO;
import edu.kosmo.krm.vo.PaymentInfoVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.vo.WishListVO;

public interface OrderService {
	
	// 주문 내역 가져오는 코드
	public List<JoinOrderHistoryVO> order_History_getList(Criteria criteria, MemberVO memberVo);

	public int order_History_getTotal(MemberVO memberVO);

	/*유빈*/
	// 회원장바구니 유무확인
	public int findCart(CartVO cartVO);

	// 새장바구니 상품넣기
	public void insertCart(CartVO cartVO);

	// 장바구니 상품목록가져오기
	public List<JoinCartProductListVO> cartProductList(int member_id);

	// 장바구니 상품삭제
	public void removeProduct(int cart_id); //상품한개 삭제

	public void removeCartProduct(int cart_id); //상품한개 삭제
	
	public void removeProductList(String list, int member_id); //선택한상품을제외한 나머지 한개삭제(반복예정)
	// 위시리스트 상품목록가져오기
	public List<JoinWishProductListVO> wishProductList(int member_id);
	// 위시리스트에 상품넣기
	public void insertWishList(WishListVO wishListVO);
	// 위시리스트 상품삭제
	public void removeWishProduct(int wishlist_id);
	
	
	// 결제주문 페이지
	public List<JoinOrderPaymentVO> orderPayment_getList(MemberVO memberVO);
	
	// 쿠폰 목록 가져오기
	public List<JoinCoupon> getUserCouponList(MemberVO memberVO);
	
	// 상품 가져오기
	public List<ProductVO> getProductList(int product_id);
	
	// 회원 배송 정보 가져오기
	public List<JoinMemberDeliveryVO> getMemberDeliveryList(int member_id);
	
	// 주문 DB에 저장
	public void insertOrderInfo(PaymentInfoVO paymentInfoVO);
	
	// 주문상세 DB에 저장 (order_detail)
	public void insertOrderDetailInfo(PaymentInfoVO paymentInfoVO);	
	
//	// 주문한 상품의 개수를 가져오는 함수
//	public int getProudctQuantity(Long order_id);

}
