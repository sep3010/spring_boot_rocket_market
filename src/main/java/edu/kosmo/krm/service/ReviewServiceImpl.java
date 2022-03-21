package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.mapper.OrderMapper;
import edu.kosmo.krm.mapper.ReviewMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinReviewBoardVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	// 내가 쓴 후기 내역 가져오는 코드
	public List<JoinReviewBoardVO> review_getList(Criteria criteria, MemberVO memberVo) {
		log.info("review_getList()...");
		return reviewMapper.getReviewList(criteria, memberVo);
	}

	@Override
	public int review_getTotal(MemberVO memberVO) {
		log.info("review_getTotal()...");
		return reviewMapper.getReviewTotalCount(memberVO);
	}

	@Override
	public void insertReview(JoinReviewBoardVO joinReviewVO, 
			OrderDetailBoardVO detailBoardVO, 
			MultipartFile[] files, String savePath) {
		log.info("insertReview()...");
		reviewMapper.insertReviewBoard(joinReviewVO, detailBoardVO);
		
	}




}
