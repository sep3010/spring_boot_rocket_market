package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.krm.joinVO.JoinInquiryBoardVO;
import edu.kosmo.krm.mapper.BoardMapper;
import edu.kosmo.krm.mapper.MemberInfoMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.BoardVO;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

//게시판 관리 서비스단
//2022-3-21 ~
//김지훈 오유빈 코드 작성

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	// 공지사항 목록 조회 + 페이징
	@Override
	public int getNoticeTotal() {
		log.info("getNoticeTotal(in service)");
		
		return boardMapper.getNoticeTotalCount();
	}
	@Override
	public List<BoardVO> getNoticeBoard(Criteria criteria) {
		log.info("getNoticeBoard(in service)");
		
		return boardMapper.getNoticeBoardWithPaging(criteria);
	}
	
	// 개별 공지사항 조회
	@Override
	public BoardVO getNotice(int id) {
		log.info("getNotice(in service)");
		
		boardMapper.upHit(id);
		return boardMapper.getNotice(id);
	}
	
	// 공지사항 작성
	@Override
	public void postNotice(BoardVO boardVO) {
		log.info("postNotice(in controller)");
		
		boardMapper.postNotice(boardVO);
	}
	
	// 공지사항 삭제
	@Override
	public void deleteNotice(int id) {
		log.info("deleteNotice(in service)");
		
		boardMapper.deleteNotice(id);
	}
	
	// 공지사항 수정
	public void modifyNotice(BoardVO boardVO) {
		log.info("modifyNotice(in service)");
		
		boardMapper.modifyNotice(boardVO);
	}
	
	
	// ========== 문의사항 ==========
	
	// 문의사항 목록 조회 + 페이징
	@Override
	public int getInquiryTotal() {
		log.info("getInquiryTotal(in service)");
		
		return boardMapper.getInquiryTotalCount();
	}
	@Override
	public List<JoinInquiryBoardVO> getInquiryBoard(Criteria criteria) {
		log.info("getInquiryBoard(in service)");
		
		return boardMapper.getInquiryBoardWithPaging(criteria);
	}
	
	// 개별 문의사항 조회
	@Override
	public BoardVO getInquiry(int id) {
		log.info("getInquiry(in service)");
		
		boardMapper.upHit(id);
		return boardMapper.getInquiry(id);
	}
	
	// 문의사항 작성
	@Override
	public void postInquiry(BoardVO boardVO) {
		log.info("postInquiry(in controller)");
		
		boardMapper.postInquiry(boardVO);
	}
	
	// 문의사항 삭제
	@Override
	public void deleteInquiry(int id) {
		log.info("deleteInquiry(in service)");
		
		boardMapper.deleteInquiry(id);
	}
	// 게시글 작성자 회원번호
	@Override
	public int getBoardWriter(int id) {
		log.info("getBoardWriter()..");
		return boardMapper.getBoardWriterNum(id);
	}
		
	
}
