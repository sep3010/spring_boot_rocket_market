package edu.kosmo.krm.service;


import java.util.List;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.DeliveryVO;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import edu.kosmo.krm.vo.ProductVO;

public interface OrderHistoryService {
	
	// 주문 내역 목록 가져오기
	List<MemberOrderVO> getMemberOrderHistory(Criteria criteria, MemberVO memberVO);
	
	// 주문 내역 상세 가져오기
	List<MemberOrderVO> getMemberOrderDetail(long order_id, int user_id);
	
	// 주문 상세번호에 해당하는 상품 이름과 썸네일 이미지 조회
	ProductVO getProductAndImage(OrderDetailBoardVO detailBoardVO);
	
	List<DeliveryVO> getDeliveryInfo(Long order_id); 
		
	
}
