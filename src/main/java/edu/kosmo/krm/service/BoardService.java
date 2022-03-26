package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.joinVO.JoinInquiryBoardVO;
import edu.kosmo.krm.joinVO.JoinQuestionBoardVO;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.BoardVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ReplyVO;

//게시판 관리 서비스단
//2022-3-21 ~
//김지훈 오유빈 코드 작성

@Service
public interface BoardService {

	// ========== 공지사항 ==========
	
	// 공지사항 목록 조회 + 페이징
	public int getNoticeTotal();
 
	public List<BoardVO> getNoticeBoard(Criteria criteria);
	
	// 개별 공지사항 조회
	public BoardVO getNotice(int id);
	
	// 공지사항 작성
	public void postNotice(BoardVO boardVO);

	// 공지사항 삭제
	public void deleteNotice(int id);
	
	// 공지사항 수정
	public void modifyNotice(BoardVO boardVO);
	
	// ========== 문의사항 ==========

	// 문의사항 목록 조회 + 페이징
	public int getInquiryTotal();
	public List<JoinInquiryBoardVO> getInquiryBoard(Criteria criteria);
	
	// 개별 문의사항 조회
	public JoinQuestionBoardVO getInquiry(int id);
	
	// 문의사항 작성
	public void postInquiry(BoardVO boardVO);
	
	// 문의사항 삭제
	public void deleteInquiry(int id);
	// 작성자 회원번호조회
	public int getBoardWriter(int id);
	
	// 문의사항 답글 작성
	void insertReply(ReplyVO replyVO);
	
}
