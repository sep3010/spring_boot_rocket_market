package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.joinVO.JoinMemberDeliveryVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinOrderPaymentVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.OrderDetailVO;
import edu.kosmo.krm.vo.PaymentInfoVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.vo.SelectNumVO;
import edu.kosmo.krm.page.PageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberInfoService memberInfoService;

	@Autowired
	private ProductService productService;
	
	/*유빈*/
	//장바구니에 상품넣기
	@PostMapping("/user/inCart")
	public ResponseEntity<String> inCart(@RequestBody CartVO cartVO) {
		ResponseEntity<String> entity = null;
		log.info("productId : " + cartVO.getProduct_id());
		log.info("id : " + cartVO.getMember_id());
		log.info("quantity : " + cartVO.getQuantity());
		// {"product_id":"481","quantity":"3","member_id":"user"}

		try {
			orderService.insertCart(cartVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {	
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;	
	}
	
	//장바구니 페이지로 이동
	@GetMapping("/user/cart")
	public ModelAndView cart(ModelAndView view, Principal principal) {
		log.info(principal.getName() + "님의 장바구니입니다.");//아이디 username가져오기
		MemberVO memberVO = memberInfoService.getForCart(principal.getName());
		log.info("회원번호" + memberVO.getId());
		
		view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));

		view.setViewName("/user/cart");
		return view;
	}
	
	//장바구니 페이지에서 선택한 상품 삭제
	@DeleteMapping("/user/cart/{cart_id}")
	public ResponseEntity<String> deleteProductInCart(ModelAndView view, JoinCartProductListVO joinCartProductListVO) {
		
		ResponseEntity<String> entity = null;
		log.info("삭제할 상품의 장바구니 번호" + joinCartProductListVO.getCart_id());
		
		try {
			orderService.removeProduct(joinCartProductListVO.getCart_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;
	}
	
	//장바구니 페이지에서 선택한 상품들을 제외하고 나머지는 삭제
	@PostMapping("/order/exceptProduct")
	public ResponseEntity<String> exceptProduct(@RequestBody SelectNumVO selectNumVO, Principal principal) {

		log.info("exceptProduct()..");
		log.info(principal.getName() + "님의 장바구니입니다.");//아이디 username가져오기
		MemberVO memberVO = memberInfoService.getForCart(principal.getName());
		log.info("회원번호" + memberVO.getId());
	
		ResponseEntity<String> entity = null;
		
		try {
			
			//선택한 상품의 장바구니 번호 리스트
			String list="";
			
			for(String num : selectNumVO.getNumList()) {
				orderService.removeProductList(num, memberVO.getId());
			}
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;
	}
	
	
	//장바구니 페이지에서 선택한 상품들가지고 주문페이지로 이동
	@PostMapping("/order/orderPayment")
	public ModelAndView orderPayment(ModelAndView view, Principal principal) {

		log.info(principal.getName() + "님의 장바구니입니다.");//아이디 username가져오기
		MemberVO memberVO = memberInfoService.getForCart(principal.getName());
		log.info("회원번호" + memberVO.getId());
		
		view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));

		view.setViewName("/order/orderPayment");
		return view;
	}
	
	
	 
	// 주문 내역 리스트
	@GetMapping("/user/orderhistory")
	public ModelAndView orderhistory(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, Criteria criteria, ModelAndView view) {
		log.info("orderhistory()..");
		
		// List 불러 오는 함수
		List<JoinOrderHistoryVO> join = orderService.order_History_getList(criteria, memberCustomDetails.getMemberVO());
		log.info("orderhistory().. 갯수" + join.size());
		view.addObject("orderList", join); 
		log.info("================memberVO().." + memberCustomDetails.getMemberVO());

		int total = orderService.order_History_getTotal(memberCustomDetails.getMemberVO());
		log.info("=============total: " + total);
		view.addObject("pageMaker", new PageVO(criteria, total));
		log.info("criteria:" + criteria);
		log.info("total:" + total);
		
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
	public ResponseEntity<String> completePayment(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails,
								HttpServletRequest request, @RequestBody PaymentInfoVO paymentInfoVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		// MemberOrderVO (회원 주문)에 넣는 것
		orderService.insertOrderInfo(paymentInfoVO);

		// OrderDetailVO (주문 상세)에 넣는 것
		orderService.insertOrderDetailInfo(paymentInfoVO);
		
		// 쿠폰 포인트와 포인트 넣는 것
		memberInfoService.updatePoint(paymentInfoVO);
		entity = new ResponseEntity<String>("successPayment", HttpStatus.OK);

		// 결제 완료 페이지에 들어갈 세션 값 세팅
		String amount = paymentInfoVO.getAmount();
		String input_point = paymentInfoVO.getInput_point();
		int result_Point = paymentInfoVO.getResult_Point();
		String merchantid = paymentInfoVO.getMerchantid();
		String impuid = paymentInfoVO.getImpuid();
		
		session.setAttribute("amount", amount);
		session.setAttribute("input_point", input_point);
		session.setAttribute("result_Point", result_Point);
		session.setAttribute("merchantid", merchantid);
		session.setAttribute("impuid", impuid);
		
		
		return entity;
	
	}
	
	// 주문완료 페이지 (view)
	@GetMapping("/order/orderPaymentView")
	public ModelAndView orderPaymentView(ModelAndView view, PaymentInfoVO paymentInfoVO) {

		view.setViewName("/order/orderPaymentView");
		return view;
	}


}
