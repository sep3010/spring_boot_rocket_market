package edu.kosmo.krm.service;


import java.util.List;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinReviewVO;
import edu.kosmo.krm.vo.MemberVO;

public interface ReviewService {
	
	// 내가 쓴 후기 내역 가져오는 코드
	public List<JoinReviewVO> review_getList(Criteria criteria, MemberVO memberVo);
		
	public int review_getTotal(MemberVO memberVO);



}
