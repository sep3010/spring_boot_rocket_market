package edu.kosmo.krm.controller;

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
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.OrderHistoryListVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.page.PageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderHistoryService orderHistoryService;
	 
	// 주문 내역 리스트(회원 마이페이지)
	@GetMapping("/user/orderhistory")
	public ModelAndView orderhistory(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, Criteria criteria, ModelAndView view) {
		log.info("orderhistory()..");
		
		// List 불러 오는 함수
		// List<JoinOrderHistoryVO> join = orderService.order_History_getList(criteria, memberCustomDetails.getMemberVO());
		// List<OrderHistoryListVO> join = orderService.getMemberOrderHistory(criteria, memberCustomDetails.getMemberVO());
		List<MemberOrderVO> join = orderHistoryService.getMemberOrderHistory(criteria, memberCustomDetails.getMemberVO());
		log.info("orderhistory().. 갯수" + join.size());
		view.addObject("orderList", join); 
		view.addObject("count", join.size());
		log.info("================memberVO().." + memberCustomDetails.getMemberVO());

		int total = orderService.order_History_getTotal(memberCustomDetails.getMemberVO());
		log.info("=============total: " + total);
		view.addObject("pageMaker", new PageVO(criteria, total));
		log.info("criteria:" + criteria);
		log.info("total:" + total);
		
		view.setViewName("/user/orderhistory");
		return view;
	}
	
	// 주문 내역 리스트
	@GetMapping("/user/orderDetail/{order_id}")
	public ModelAndView orderDetail(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, 
			ModelAndView view, @RequestParam("order_id") long order_id) {
		log.info("orderDetail()..");
		MemberOrderVO orderDetail = orderHistoryService.getMemberOrderDetail(order_id, memberCustomDetails.getMemberVO().getId());
		log.info("================orderDetail : " + orderDetail);
		view.addObject("orderDetail", orderDetail);
		
		view.setViewName("/user/orderDetail");
		return view;
	}



	

}
