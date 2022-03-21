package edu.kosmo.krm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.CouponService;
import edu.kosmo.krm.vo.CouponVO;
import lombok.extern.slf4j.Slf4j;

//용원 2022-02-27  22:00

@Slf4j
@RestController
public class CouponController {

	@Autowired
	private CouponService couponService;

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


}
