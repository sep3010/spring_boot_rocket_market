package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinWishProductListVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.joinVO.JoinMemberDeliveryVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.CouponVO;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailVO;
import edu.kosmo.krm.vo.PaymentInfoVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.vo.WishListVO;

//주문 관리 매퍼
//2022-2-23 ~
//양세윤 코드 작성

@Mapper
public interface OrderMapper {

	/*유빈*/
	// 장바구니 상품넣기 ==================================================================
	@Select("SELECT NVL(MAX(id),0) AS id FROM cart WHERE member_id = #{member_id}")
	public int findCart(CartVO cartVO); //카트찾기

	@Insert("INSERT INTO cart VALUES (cart_SEQ.NEXTVAL, #{member_id}, #{product_id}, #{quantity})")
	public void insertCart(CartVO cartVO);

	@Select("SELECT * FROM cart WHERE member_id = #{member_id}")
	public List<CartVO> getCart(CartVO member_id); //카트찾기

	public List<JoinCartProductListVO> getCartProductList(int member_id);//장바구니 상품목록

	@Delete("DELETE FROM cart WHERE id = #{cart_id}")
	public void removeProductInCart(int cart_id);

	@Delete("DELETE FROM cart WHERE id IN(TO_NUMBER(#{list})) AND member_id = #{member_id}")
	public void removeProductListInCart(String list, int member_id);
	
	@Select("SELECT COUNT(*) FROM cart WHERE member_id = #{member_id}")
	public int GetCartCount(int member_id); // 장바구니에 담긴 상품 개수 가져오기

	@Select("SELECT * FROM cart WHERE member_id = #{member_id}")
	public List<CartVO> getCartInfo(int member_id); // 장바구니 가져오기
	
	// 위시리스트 ==================================================================
	
	public List<JoinWishProductListVO> getWishProductList(int member_id); //위시리스트 상품목록
	
	@Insert("INSERT INTO wishlist VALUES (wishlist_SEQ.NEXTVAL, #{member_id}, #{product_id})")
	public void insertWishList(WishListVO wishListVO); //위시리스트에 상품 넣기
	
	@Delete("DELETE FROM wishlist WHERE id = #{wishlist_id}")
	public void removeProductInWishList(int wishlist_id);//위시리스트 상품 삭제
	
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

	// 주문 등록 (memberOrderVO에 등록)
	public void insertOrderInfo(PaymentInfoVO paymentInfoVO);
	
	// 주문 상세 등록 (OrderDetailVO에 등록)
	public void insertOrderDetailInfo(OrderDetailVO orderDetailVO);

	// 주문 후 배송지 정보 등록
	public void insertDeliveryInfo(PaymentInfoVO paymentInfoVO);
	

}
