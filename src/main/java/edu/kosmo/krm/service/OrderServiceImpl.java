package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.OrderMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistory;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper ordermapper;


	@Override
	public List<JoinOrderHistory> order_History_getList(Criteria criteria, MemberVO memberVO) {
		log.info("order_History_getList()...");
		return ordermapper.getOrderHistoryList(criteria, memberVO);
	}
	
	@Override
	public int order_History_getTotal(MemberVO memberVO) {
		log.info("order_History_getTotal()...");
		return ordermapper.getOrderHistoryTotalCount(memberVO);
	}


}
