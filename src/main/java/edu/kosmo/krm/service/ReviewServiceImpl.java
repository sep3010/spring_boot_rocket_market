package edu.kosmo.krm.service;


import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.mapper.OrderHistoryMapper;
import edu.kosmo.krm.mapper.ReviewMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinReviewBoardVO;
import edu.kosmo.krm.vo.BoardFileVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import edu.kosmo.krm.vo.OrderDetailVO;
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
	@Transactional(rollbackFor = Exception.class)
	public void insertReview(JoinReviewBoardVO joinReviewVO, 
			OrderDetailBoardVO detailBoardVO, 
			MultipartFile[] files, String savePath) {
		log.info("insertReview()...");
		
		reviewMapper.insertReviewBoard(joinReviewVO, detailBoardVO);
		
		int boardId = reviewMapper.getReviewBoardId(detailBoardVO);
		log.info("boardId : " + boardId);
		
		if(files.length > 0) {		
			BoardFileVO boardFileVO = new BoardFileVO();
		
			for (MultipartFile file : files) {				
				// 파일 형태 (예시: image/jpeg)
				String extension = file.getContentType();
				
				// 기존 파일 이름
				String originalName = file.getOriginalFilename();				
				String uuid = UUID.randomUUID().toString().replace("-", "");
				
				// 기존에 저장된 파일과 중복된 이름으로 저장되는 것을 막기위한 처리
				String fileName = uuid + "_" + originalName;
				
				// 서버에서 저장된 이미지를 불러오기 위한 기본 경로
				String basePath = "http://localhost:8282/resources/review-image/";
				
				File saveFile = new File(savePath, fileName);
				try {
					file.transferTo(saveFile);
					log.info("후기 사진 저장 성공");					
					String imagePath = basePath + fileName; 
					
					boardFileVO.setBoard_id(boardId);
					boardFileVO.setName(fileName);
					boardFileVO.setExtension(extension);
					boardFileVO.setPath(imagePath);
					log.info("=========boardFileVO : " + boardFileVO);
					
					reviewMapper.insertReviewImages(boardFileVO);				
				} catch (Exception e) {
					log.info("후기 사진 저장 실패");
					e.printStackTrace();
				}
			} // end foreach		
		} // end if(files.length > 0)
	}

	@Override
	public JoinReviewBoardVO getReview_content(int boardId) {
		log.info("getReview_content()..");
		reviewMapper.updateReviewHit(boardId);
		
		return reviewMapper.getReviewContent(boardId);
	}

	@Override
	public int getReviewBoardId(OrderDetailBoardVO detailBoardVO) {
		log.info("getReviewBoardId()..");
		return reviewMapper.getReviewBoardId(detailBoardVO);
	}

	@Override
	public OrderDetailBoardVO checkReviewBoardId(OrderDetailVO orderDetailVO) {
		log.info("getReviewBoardId()..==========" + orderDetailVO);
		return reviewMapper.checkReviewBoardId(orderDetailVO);
	}




}
