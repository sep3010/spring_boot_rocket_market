package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.vo.MemberVO;

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
	
}
