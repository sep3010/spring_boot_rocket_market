package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinReviewBoardVO;
import edu.kosmo.krm.vo.BoardFileVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import edu.kosmo.krm.vo.OrderDetailVO;



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
	
	// 리뷰 사진 저장을 위한 리뷰글 아이디 값 가져오기
	int getReviewBoardId(OrderDetailBoardVO detailBoardVO);
	
	OrderDetailBoardVO checkReviewBoardId(OrderDetailVO orderDetailVO);
	
	// 후기글 내용 가져오기
	JoinReviewBoardVO getReviewContent(int boardId);
	
	// 후기글 조회시 조회수 증가
	@Update("UPDATE board SET hit = hit + 1 WHERE id = #{boardId}")
	void updateReviewHit(int boardId);
	
}
