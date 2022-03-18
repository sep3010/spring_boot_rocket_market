package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.OrderMapper;
import edu.kosmo.krm.mapper.ReviewMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinReviewVO;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	// 내가 쓴 후기 내역 가져오는 코드
	public List<JoinReviewVO> review_getList(Criteria criteria, MemberVO memberVo) {
		log.info("review_getList()...");
		return reviewMapper.getReviewList(criteria, memberVo);
	}

	@Override
	public int review_getTotal(MemberVO memberVO) {
		log.info("review_getTotal()...");
		return reviewMapper.getReviewTotalCount(memberVO);
	}




}
