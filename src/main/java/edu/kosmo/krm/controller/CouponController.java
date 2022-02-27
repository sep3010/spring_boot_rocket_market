package edu.kosmo.krm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.CouponService;
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


}
