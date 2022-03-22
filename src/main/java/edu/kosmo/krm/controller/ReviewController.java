package edu.kosmo.krm.controller;

// 리뷰 관리 컨트롤러 세윤

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.service.OrderHistoryService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.service.ReviewService;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinReviewBoardVO;
import edu.kosmo.krm.vo.BoardFileVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import edu.kosmo.krm.vo.OrderDetailVO;
import edu.kosmo.krm.vo.ProductImageVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.page.PageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrderHistoryService orderHistoryService;
	 
	// 리뷰 내역 리스트
	@GetMapping("/user/myReviewList")
	public ModelAndView orderhistory(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, Criteria criteria, ModelAndView view) {
		log.info("orderhistory()..");
		
		// List 불러 오는 함수
		List<JoinReviewBoardVO> join = reviewService.review_getList(criteria, memberCustomDetails.getMemberVO());
		log.info("review().. 갯수" + join.size());
		view.addObject("reviewList", join); 
		log.info("================memberVO().." + memberCustomDetails.getMemberVO());

		int total = reviewService.review_getTotal(memberCustomDetails.getMemberVO());
		log.info("=============total: " + total);
		view.addObject("pageMaker", new PageVO(criteria, total));
		log.info("criteria:" + criteria);
		log.info("total:" + total);
		
		Map<Integer, String> scoreOptions = new HashMap<>();
		scoreOptions.put(0, "☆☆☆☆☆");
		scoreOptions.put(1, "★☆☆☆☆");
		scoreOptions.put(2, "★★☆☆☆");
		scoreOptions.put(3, "★★★☆☆");
		scoreOptions.put(4, "★★★★☆");
		scoreOptions.put(5, "★★★★★");
		
		view.addObject("scoreOptions", scoreOptions);
		
		view.setViewName("/user/myReviewList");
		return view;
	}
	
	// 구매 후기 작성 페이지
	@PostMapping("/user/review_write")
	public ModelAndView review_write(ModelAndView view, 
			OrderDetailVO orderDetailVO, ProductVO productVO, ProductImageVO imageVO) {
		log.info("review_write()..");
		log.info("===========orderDetailVO : " + orderDetailVO);
		log.info("===========productVO : " + productVO);
		log.info("===========imageVO : " + imageVO);
		
		view.addObject("orderDetail", orderDetailVO);
		view.addObject("product", productVO);
		view.addObject("image", imageVO);
		
		view.setViewName("/user/review_write");
		
		return view;
	}
	
	
	/*@RequestParam("order_id") long order_id, 
			@RequestParam("order_detail_id") int order_detail_id*/
	// 구매 후기 작성 완료 
	@PostMapping("/user/insertReview")
	public ModelAndView insertReview(ModelAndView view, HttpServletRequest request, 
			MultipartFile[] reviewImages, JoinReviewBoardVO reviewBoardVO, 
			OrderDetailBoardVO detailBoardVO) {
		log.info("insertReview()...");
		log.info("==========reviewBoardVO : " + reviewBoardVO);
		log.info("============detailBoardVO : " + detailBoardVO);
		log.info("============reviewImages : " + reviewImages.toString());
		
		// 각 팀원들의 프로젝트 폴더 경로 설정(상대적 경로)을 위한 처리.
		String savePath = request.getSession().getServletContext()
							.getRealPath("/").concat("resources\\review-image");	
		
		log.info("savePath : " + savePath);
		
		reviewService.insertReview(reviewBoardVO, detailBoardVO, reviewImages, savePath);
		
		String arrivalURL = "redirect:/user/review_content/" + reviewService.getReviewBoardId(detailBoardVO.getOrder_detail_id());
		
		view.setViewName(arrivalURL);
		
		return view;
	}
	

	// 작성한 구매 후기 글 보기
	@GetMapping("/user/review_content/{boardId}")
	public ModelAndView getReview_content(ModelAndView view, @PathVariable("boardId") int boardId) {
		log.info("getReview_content()...");
		log.info("======boardId : " + boardId);
		
		JoinReviewBoardVO review = reviewService.getReview_content(boardId);
		log.info("=============review : " + review);
		
		view.addObject("review", review);
		
		int score = review.getScore();
		String starPoint ="";
		
		switch (score) {
		case 0:
			starPoint = "☆☆☆☆☆";
			break;
		case 1:
			starPoint = "★☆☆☆☆";
			break;
		case 2:
			starPoint = "★★☆☆☆";
			break;
		case 3:
			starPoint = "★★★☆☆";
			break;
		case 4:
			starPoint = "★★★★☆";
			break;
		case 5:
			starPoint = "★★★★★";
			break;	
			
		}	
		
		view.addObject("starPoint", starPoint);
		
		OrderDetailBoardVO detailBoardVO = review.getOrderDetailBoard();
		log.info("============detailBoardVO : " + detailBoardVO);
		/*
		int order_detail_id = detailBoardVO.getOrder_detail_id();
		log.info("============order_detail_id : " + order_detail_id);
		*/
		log.info("=============product : " 
				+ orderHistoryService.getProductAndImage(detailBoardVO));
		view.addObject("product", orderHistoryService.getProductAndImage(detailBoardVO));
		
		view.setViewName("/user/review_content");
		
		return view;
	}

	

}
