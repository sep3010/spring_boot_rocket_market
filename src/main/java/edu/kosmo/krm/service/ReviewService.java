package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinReviewBoardVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import edu.kosmo.krm.vo.OrderDetailVO;

public interface ReviewService {
	
	// 내가 쓴 후기 내역 가져오는 코드
	List<JoinReviewBoardVO> review_getList(Criteria criteria, MemberVO memberVo);
		
	int review_getTotal(MemberVO memberVO);

	void insertReview(JoinReviewBoardVO joinReviewVO, 
			OrderDetailBoardVO detailBoardVO, MultipartFile[] files, String savePath);
	
	JoinReviewBoardVO getReview_content(int boardId);
	
	int getReviewBoardId(OrderDetailBoardVO detailBoardVO);
	
	OrderDetailBoardVO checkReviewBoardId(OrderDetailVO orderDetailVO);
}
