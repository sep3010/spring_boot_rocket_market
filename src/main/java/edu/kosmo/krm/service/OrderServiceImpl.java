package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.OrderMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinWishProductListVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.WishListVO;
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
	
	/*유빈*/
	// 회원 장바구니 유무 확인
	@Override
	public int findCart(CartVO cartVO) {
		log.info("findCart()...");
		return ordermapper.findCart(cartVO);
	}
	// 새 장바구니 상품넣기
	@Override
	public void insertCart(CartVO cartVO) {
		log.info("insertCart()...");
		ordermapper.insertCart(cartVO);
	}
	@Override
	// 장바구니 상품내역 불러오기
	public List<JoinCartProductListVO> cartProductList(int member_id) {
		log.info("cartProductList()...");
		return ordermapper.getCartProductList(member_id);
	}
	@Override
	// 선택한 상품정보 삭제(장바구니)
	public void removeCartProduct(int cart_id) {
		log.info("removeProduct()...");
		ordermapper.removeProductInCart(cart_id);
	}
	@Override
	// 선택한 상품 삭제(반복문)
	public void removeProductList(String list, int member_id) {
		log.info("removeProductList()...");
		ordermapper.removeProductListInCart(list, member_id);
	}
	
	/*=============위시리스트=============*/
	// 위시리스트 내역 불러오기
	@Override
	public List<JoinWishProductListVO> wishProductList(int member_id) {
		log.info("wishProductList()...");
		return ordermapper.getWishProductList(member_id);
	}
	@Override
	// 위시리스트에 상품 넣기
	public void insertWishList(WishListVO wishListVO) {
		log.info("insertWishList()...");
		ordermapper.insertWishList(wishListVO);
	}
	@Override
	// 선택한 상품정보 삭제(위시리스트)
	public void removeWishProduct(int wishlist_id) {
		log.info("removeWishProduct()...");
		ordermapper.removeProductInWishList(wishlist_id);
	}

}
