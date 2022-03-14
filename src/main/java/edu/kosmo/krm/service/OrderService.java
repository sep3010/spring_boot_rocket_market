package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.vo.MemberVO;


public interface OrderService {
	
	// 주문 내역 가져오는 코드
	public List<JoinOrderHistoryVO> order_History_getList(Criteria criteria, MemberVO memberVo);
	public int order_History_getTotal(MemberVO memberVO);
}
