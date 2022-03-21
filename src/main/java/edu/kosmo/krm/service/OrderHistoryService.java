package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.OrderHistoryListVO;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;

public interface OrderHistoryService {
	
	// 주문 내역 목록 가져오기
	List<MemberOrderVO> getMemberOrderHistory(Criteria criteria, MemberVO memberVO);
	
	// 주문 내역 상세 가져오기
	List<MemberOrderVO> getMemberOrderDetail(long order_id, int user_id);
}
