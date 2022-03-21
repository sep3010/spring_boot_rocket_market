package edu.kosmo.krm.controller;

import java.security.Principal;
import java.sql.Timestamp;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailVO;
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
		view.addObject("product", productService.getProduct(product_id));
		
		view.setViewName("/order/orderPaymentOne");
		return view;
	}
	
	@PostMapping("/completePayment")
	public @ResponseBody String completePayment(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails,
													HttpServletRequest request) {
		log.info("@@@@@@@@@@@@@ completePayment ");
		

		String impuid = request.getParameter("impuid");
		String merchantid = request.getParameter("merchantid");
		String memberid = request.getParameter("memberid");
		String amountS = request.getParameter("amount");
		String status = request.getParameter("status");
		String productid = request.getParameter("productid");
		
		int member_id = Integer.valueOf(memberid);
		Long merchant_id = Long.valueOf(merchantid);
		int amount = Integer.valueOf(amountS);
		int product_id = Integer.valueOf(productid);
		
		log.info(impuid);
		log.info("merchant_id" + merchant_id);
		log.info("member_id" + member_id);
		log.info("amount" + amount);
		log.info("status" + status);
		log.info("productid" + productid);
		

		
		// MemberOrderVO (회원 주문)에 넣는 것
		MemberOrderVO memberOrderVO = new MemberOrderVO();
		memberOrderVO.setMember_id(member_id); // 회원 번호
		memberOrderVO.setId(merchant_id); // 주문 번호
		memberOrderVO.setPayment_number(impuid); // 결제 번호
		memberOrderVO.setAmount(amount); // 총 금액

		orderService.insertOrderInfo(memberOrderVO);
		

		// OrderDetailVO (주문 상세)에 넣는 것
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setOrder_id(merchant_id);
		orderDetailVO.setProduct_id(product_id);
		
		orderService.insertOrderDetailInfo(orderDetailVO);
		
		// ajax에 "successPayment"를 보내기 위한 것
		JSONObject result = new JSONObject();
		result.put("successPayment", true);
		log.info("successPayment()...");
		return result.toString();
	
	}
	
	// 주문완료 페이지 (view)
	@GetMapping("/order/orderPaymentView")
	public ModelAndView orderPaymentView(ModelAndView view) {
		log.info("orderPaymentOne()...");
		
		view.setViewName("/order/orderPaymentView");
		return view;
	}

	// 쿠폰 적용
	@GetMapping("/apply")
	public @ResponseBody String apply() {
		log.info("apply()...");
		
		// ajax에 "SUCCESS"를 보내기 위한 것
		JSONObject result = new JSONObject();
		result.put("SUCCESS", true);
		log.info("SUCCESS()...");
		return result.toString();
	}
}
