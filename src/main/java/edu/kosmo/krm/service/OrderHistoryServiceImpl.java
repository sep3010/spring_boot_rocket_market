package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.OrderHistoryMapper;
import edu.kosmo.krm.mapper.OrderMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.OrderHistoryListVO;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {
	
	@Autowired
	OrderHistoryMapper orderHistoryMapper;
	
	@Override
	public List<MemberOrderVO> getMemberOrderHistory(Criteria criteria, MemberVO memberVO) {
		log.info("getMemberOrderHistory()");
		return orderHistoryMapper.getMemberOrderHistory(criteria, memberVO);
	}

	@Override
	public MemberOrderVO getMemberOrderDetail(long order_id, int user_id) {
		log.info("getMemberOrderDetail()");
		return orderHistoryMapper.getMemberOrderDetail(order_id, user_id);
	}





}
