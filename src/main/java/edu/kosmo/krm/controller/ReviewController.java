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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.service.ReviewService;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinReviewVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
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
	 
	// 리뷰 내역 리스트
	@GetMapping("/user/myReviewList")
	public ModelAndView orderhistory(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, Criteria criteria, ModelAndView view) {
		log.info("orderhistory()..");
		
		// List 불러 오는 함수
		List<JoinReviewVO> join = reviewService.review_getList(criteria, memberCustomDetails.getMemberVO());
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
	
	
	@PostMapping("/user/review_write")
	public ModelAndView review_write(ModelAndView view, 
			OrderDetailVO orderDetailVO, ProductVO productVO, ProductImageVO imageVO) {
		log.info("review_write()");
		log.info("===========orderDetailVO : " + orderDetailVO);
		log.info("===========productVO : " + productVO);
		log.info("===========imageVO : " + imageVO);
		
		view.addObject("orderDetail", orderDetailVO);
		view.addObject("product", productVO);
		view.addObject("image", imageVO);
		
		view.setViewName("/user/review_write");
		
		return view;
	}
	
	@PostMapping("/user/insertReview")
	public ModelAndView insertReview(ModelAndView view, 
			MultipartFile[] files) {
		log.info("insertReview()");
		
		
		view.setViewName("redirect:/user/orderhistory");
		
		return view;
	}
	



	

}
