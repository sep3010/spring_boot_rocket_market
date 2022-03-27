package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import edu.kosmo.krm.joinVO.JoinWishProductListVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.vo.DeliveryVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.service.OrderHistoryService;
import edu.kosmo.krm.service.ReviewService;
import edu.kosmo.krm.joinVO.OrderHistoryListVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
import edu.kosmo.krm.vo.OrderDetailVO;
import edu.kosmo.krm.vo.PaymentInfoVO;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.vo.SelectNumVO;
import edu.kosmo.krm.vo.WishListVO;
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

	@Autowired
	private OrderHistoryService orderHistoryService;
	
	@Autowired
	private ReviewService reviewService;
	
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
			orderService.removeCartProduct(joinCartProductListVO.getCart_id());
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
	public ModelAndView orderPayment(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, ModelAndView view, Principal principal) {

		log.info(principal.getName() + "님의 장바구니입니다.");//아이디 username가져오기
		MemberVO memberVO = memberInfoService.getForCart(principal.getName());
		log.info("회원번호" + memberVO.getId());
		int cartCount = orderService.getCartCount(memberVO.getId());
		view.addObject("cartCount", cartCount);
		log.info("@@@@@@@@@@@" + cartCount);
		view.setViewName("/order/orderPayment");
		view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));
		
		// 쿠폰 가져오는 코드
		List<JoinCoupon> coupon = orderService.getUserCouponList(memberCustomDetails.getMemberVO());
		view.addObject("couponList", coupon);


		view.setViewName("/order/orderPayment");
		return view;
	}


	// 주문 내역 리스트(회원 마이페이지)
	//위시리스트 ==========================================================
	//위시리스트 페이지로 이동
	@GetMapping("/user/wishList")
	public ModelAndView wishList(ModelAndView view, Principal principal) {
		log.info(principal.getName() + "님의 장바구니입니다.");//아이디 username가져오기
		MemberVO memberVO = memberInfoService.getForCart(principal.getName());
		log.info("회원번호" + memberVO.getId());
		
		view.addObject("wishProductList", orderService.wishProductList(memberVO.getId()));

		view.setViewName("/user/wishList");
		return view;
	}
	
	//위시리스트에 상품넣기
	@PostMapping("/user/inWishList")
	public ResponseEntity<String> inWishList(@RequestBody WishListVO wishListVO) {
		ResponseEntity<String> entity = null;
		log.info("productId : " + wishListVO.getProduct_id());
		log.info("id : " + wishListVO.getMember_id());
		// {"product_id":"481","member_id":"user"}
		try {
			orderService.insertWishList(wishListVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {	
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
	
	//장바구니 페이지에서 선택한 상품 삭제
	@DeleteMapping("/user/wishList/{wishlist_id}")
	public ResponseEntity<String> deleteProductInWishList(ModelAndView view, JoinWishProductListVO joinWishProductListVO) {
		
		ResponseEntity<String> entity = null;
		log.info("삭제할 상품의 위시리스트 번호" + joinWishProductListVO.getWishlist_id());
		
		try {
			orderService.removeWishProduct(joinWishProductListVO.getWishlist_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;
	}
	
	
	/* =================주문내역========================*/
	// 주문 내역 리스트
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

	// 주문 상세 내역 리스트(마이페이지)
	@GetMapping("/user/orderDetail/{order_id}")
	public ModelAndView orderDetail(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails, 
			ModelAndView view, MemberOrderVO memberOrderVO) {
		log.info("orderDetail()..");
		log.info("memberOrderVO() : " + memberOrderVO);
		MemberOrderVO orderDetail = orderHistoryService.getMemberOrderDetail(memberOrderVO.getOrder_id(), memberCustomDetails.getMemberVO().getId());
		List<DeliveryVO> deliveryInfo = orderHistoryService.getDeliveryInfo(memberOrderVO.getOrder_id()); 
		
		view.addObject("orderDetail", orderDetail);
		view.addObject("deliveryInfo", deliveryInfo);
		log.info("-----------orderDetail : " + orderDetail);
		
		List<OrderDetailVO> orderDetailVOs = new ArrayList<OrderDetailVO>();
		
		List<OrderDetailBoardVO> boardIds = new ArrayList<OrderDetailBoardVO>();
		for(int i = 0; i < orderDetail.getOrderDetails().size(); i++) {
			orderDetailVOs.add(orderDetail.getOrderDetails().get(i));
			
			
			log.info("board_id : " + reviewService.checkReviewBoardId(orderDetailVOs.get(i)));
			boardIds.add(reviewService.checkReviewBoardId(orderDetailVOs.get(i)));
			
						
		}
		
		
		log.info("=================boardIds : " + boardIds);
		view.addObject("boardIds", boardIds);
		view.setViewName("/user/orderDetail");
		return view;
	}
	
	@PostMapping("/completePayment")
	public ResponseEntity<String> completePayment(@AuthenticationPrincipal MemberCustomDetails memberCustomDetails,
								HttpServletRequest request, @RequestBody PaymentInfoVO paymentInfoVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		// MemberOrderVO (회원 주문)에 넣는 것
		orderService.insertOrderInfo(paymentInfoVO);

		// OrderDetailVO (주문 상세)에 넣는 것
				
		String memberid = paymentInfoVO.getMember_id();
		int member_id = Integer.valueOf(memberid); 
		List<CartVO> cartProductCount = orderService.getCartInfo(member_id);
		log.info("카트에 담긴 상품 종류" + cartProductCount);
		
		// member_id로 카트 가져오는 코드
	    for (CartVO cart : cartProductCount) {
			String orderid = paymentInfoVO.getMerchantid();
			Long order_id = Long.valueOf(orderid); 
			OrderDetailVO orderDetailVO = new OrderDetailVO();
		
			log.info("cart" + cart.getProduct_id());

	    	CartVO cartVO = new CartVO();

	    	int product_id = cart.getProduct_id();
	    	int quantity = cart.getQuantity();
		    
	    	cartVO.setId(product_id);
	    	cartVO.setQuantity(quantity);
	    	
	    	orderDetailVO.setProduct_id(product_id);
	    	orderDetailVO.setQuantity(quantity);
			orderDetailVO.setOrder_id(order_id);
			
			orderService.insertOrderDetailInfo(orderDetailVO);
			orderService.deleteCart(member_id);
	    }
		
		
		// 쿠폰 포인트와 포인트 넣는 것
		memberInfoService.updatePoint(paymentInfoVO);
		
		// 배송 정보 입력하는 것
		orderService.insertDeliveryInfo(paymentInfoVO);
		
		entity = new ResponseEntity<String>("successPayment", HttpStatus.OK);
		
				// 결제 완료 페이지에 들어갈 세션 값 세팅
		String amount = paymentInfoVO.getAmount();
		String input_point = paymentInfoVO.getInput_point();
		int result_Point = paymentInfoVO.getResult_Point();
		String merchantid = paymentInfoVO.getMerchantid();
		String impuid = paymentInfoVO.getImpuid();
		String product_name = paymentInfoVO.getProduct_name();
		String delivery_number = paymentInfoVO.getDelivery_number();
		
		session.setAttribute("amount", amount);
		session.setAttribute("input_point", input_point);
		session.setAttribute("result_Point", result_Point);
		session.setAttribute("merchantid", merchantid);
		session.setAttribute("impuid", impuid);
		session.setAttribute("product_name", product_name);
		session.setAttribute("delivery_number", delivery_number);
		
		
		return entity;
	
	}
	
	// 주문완료 페이지 (view)
	@GetMapping("/order/orderPaymentView")
	public ModelAndView orderPaymentView(ModelAndView view, PaymentInfoVO paymentInfoVO) {

		view.setViewName("/order/orderPaymentView");
		return view;
	}




}
