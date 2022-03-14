package edu.kosmo.krm.service;
// 리뷰 관련 서비스

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinReviewWriteVO;
import edu.kosmo.krm.vo.MemberVO;

@Service
public interface ReviewService {
	
	// 내가 쓴 리뷰 내역 가져오는 코드
	public List<JoinReviewWriteVO> review_getList(Criteria criteria, MemberVO memberVo);
	public int review_getTotal(MemberVO memberVO);
}
