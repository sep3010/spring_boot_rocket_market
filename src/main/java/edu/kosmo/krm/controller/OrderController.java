package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.joinVO.JoinWishProductListVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
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
	public ModelAndView orderPayment(ModelAndView view, Principal principal) {

		log.info(principal.getName() + "님의 장바구니입니다.");//아이디 username가져오기
		MemberVO memberVO = memberInfoService.getForCart(principal.getName());
		log.info("회원번호" + memberVO.getId());
		
		view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));

		view.setViewName("/order/orderPayment");
		return view;
	}
	
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


}
