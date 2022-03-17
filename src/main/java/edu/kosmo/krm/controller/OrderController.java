package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.vo.CartVO;
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
