package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinWishProductListVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.WishListVO;

@Service
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
	public void removeCartProduct(int cart_id); //상품한개 삭제
	public void removeProductList(String list, int member_id); //선택한상품을제외한 나머지 한개삭제(반복예정)
	// 위시리스트 상품목록가져오기
	public List<JoinWishProductListVO> wishProductList(int member_id);
	// 위시리스트에 상품넣기
	public void insertWishList(WishListVO wishListVO);
	// 위시리스트 상품삭제
	public void removeWishProduct(int wishlist_id);
	
}
