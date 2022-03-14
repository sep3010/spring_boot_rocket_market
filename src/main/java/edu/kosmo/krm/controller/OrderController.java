package edu.kosmo.krm.controller;

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
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.page.PageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	 
	// 주문 내역 리스트
	@GetMapping("/user/orderhistory")
	public ModelAndView orderhistory(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, Criteria criteria, ModelAndView view) {
		log.info("orderhistory()..");
		
		// List 불러 오는 함수
		List<JoinOrderHistoryVO> join = orderService.order_History_getList(criteria, memberCustomDetails.getMemberVO());
		view.addObject("orderList", join); 
		log.info("memberVO().." + memberCustomDetails.getMemberVO());
		
		int total = orderService.order_History_getTotal(memberCustomDetails.getMemberVO());
		view.addObject("pageMaker", new PageVO(criteria, total));
		
		view.setViewName("/user/orderhistory");
		return view;
	}
	
	// 주문 페이지
	@GetMapping("/order/orderpayment_view")
	public ModelAndView orderpayment_view(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, ModelAndView view) {
		log.info("payment_view()..");

		log.info("memberVO().." + memberCustomDetails.getMemberVO());
		
		List<JoinOrderPaymentVO> join = orderService.orderPayment_getList(memberCustomDetails.getMemberVO());
		view.addObject("orderpaymentList", join);
		view.setViewName("/order/orderpayment_view");
		return view;
	}



	

}
