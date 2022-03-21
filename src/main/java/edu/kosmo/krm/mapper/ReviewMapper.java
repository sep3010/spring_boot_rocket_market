package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinReviewBoardVO;
import edu.kosmo.krm.vo.BoardFileVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import edu.kosmo.krm.vo.ProductVO;

// 리뷰 관리 매퍼

@Mapper
public interface ReviewMapper {

	// 내가 쓴 리뷰 조회
	List<JoinReviewBoardVO> getReviewList(@Param("criteria") Criteria criteria, 
			@Param("memberVO") MemberVO memberVO);
	
	int getReviewTotalCount(MemberVO memberVO);
	
	// 리뷰 작성
	void insertReviewBoard(@Param("joinReviewBoardVO") JoinReviewBoardVO joinReviewBoardVO, 
			@Param("detailBoardVO") OrderDetailBoardVO detailBoardVO);
	
	// 리뷰 사진 저장
	void insertReviewImages(BoardFileVO boardFileVO);
	
	
}
