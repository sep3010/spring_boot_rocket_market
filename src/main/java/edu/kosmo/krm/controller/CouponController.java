package edu.kosmo.krm.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.CouponService;
import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.OrderHistoryService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.vo.CouponVO;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

//용원 2022-02-27  22:00

@Slf4j
@RestController
public class CouponController {

	@Autowired
	private CouponService couponService;
	
	@Autowired
	private MemberInfoService memberInfoService;	
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderHistoryService orderHistoryService;

	// admin - 쿠폰목록페이지
	@GetMapping("/admin/couponManagement")
	public ModelAndView couponManagement(ModelAndView view) {
		log.info("couponManagement..");
		// 쿠폰목록
		view.addObject("couponList", couponService.getCouponList());
		view.setViewName("/admin/couponManagement");
		return view;
	}
	
	// admin - 쿠폰등록페이지로 이동
	@GetMapping("/admin/addCoupon")
	public ModelAndView addCoupon(ModelAndView view) {
		log.info("addCoupon..");

		view.setViewName("/admin/addCoupon");
		return view;
	}
	
	// admin - 쿠폰등록
	@PostMapping("/admin/insertCoupon")
	public ModelAndView insertCoupon(CouponVO couponVO, ModelAndView view) {
		log.info("insertCoupon..");

		couponService.insertCoupon(couponVO);
		view.setViewName("redirect:couponManagement");
		return view;
	}
	@GetMapping("/user/couponList/{member_id}")
	public ModelAndView couponList(@PathVariable int member_id, Principal principal, ModelAndView view) {
		log.info("couponList");
		log.info("member_id(in couponList) : " + member_id);
		
		view.addObject("couponCount", couponService.getMemberCouponCount(member_id));
		view.addObject("orderCount", orderHistoryService.getMemberOrderCount(member_id));

		view.addObject("coupon", couponService.getMemberCoupon(member_id));
		view.setViewName("/user/couponList");
		
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return view;
		
	}


}
