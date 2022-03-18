package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nimbusds.jose.shaded.json.JSONObject;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.joinVO.JoinMemberDeliveryVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.page.PageVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService productService;
	
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
	
	// 주문 페이지 (view)
	@GetMapping("/order/orderPaymentOne")
	public ModelAndView orderPaymentOne(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, JoinOrderPaymentVO joinOrderPaymentVO, ModelAndView view) {
		log.info("orderPaymentOne()...");
		
		// 주문자 정보 가져오기
		List<JoinMemberDeliveryVO> deliveryInfo = orderService.getMemberDeliveryList(memberCustomDetails.getMemberVO().getId());
		view.addObject("memberDeliveryInfoList", deliveryInfo);
		
		// 쿠폰 가져오는 코드
		List<JoinCoupon> coupon = orderService.getUserCouponList(memberCustomDetails.getMemberVO());
		view.addObject("couponList", coupon);

		// 상품 가져오기
		int product_id = joinOrderPaymentVO.getProduct_id();
		view.addObject("productList", orderService.getProductList(product_id));
		log.info("================product_id: " + product_id);
		log.info("joinOrderPaymentVO:" + orderService.getProductList(product_id));
		view.addObject("product", productService.getProduct(product_id));
		log.info("@@@@@@@@@@@getProduct:" + productService.getProduct(product_id));

		view.setViewName("/order/orderPaymentOne");
		return view;
	}
	
	@PostMapping("/order/completePayment")
	public String completePayment() {
		log.info("orderPaymentOne()...");
		return "a";
	
	}	
	

}
