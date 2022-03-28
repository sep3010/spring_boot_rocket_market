package edu.kosmo.krm.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.CouponService;
import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.MemberService;
import edu.kosmo.krm.service.OrderHistoryService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SecurityController {
	
	@Autowired
	private OrderHistoryService historyService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberInfoService memberInfoService;
	
	@Autowired
	private CouponService couponService;
	
	//user 폴더 뷰페이지 권한체크 위한 mapping
	@GetMapping("/user/userHome")
	public ModelAndView userHome(ModelAndView view, Principal principal) {
		log.info("userHome..");
		
		String username = principal.getName();
		log.info("username : " + username);
		
		MemberVO memberVO = memberInfoService.getUser(username);
		
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO member = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + member.getId());		
				view.addObject("cartProductList", orderService.cartProductList(member.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		view.addObject("orderCount", historyService.getMemberOrderCount(memberVO.getId()));
		view.addObject("couponCount", couponService.getMemberCouponCount(memberVO.getId()));
		
		view.setViewName("/user/userHome");
		return view;
	}

	//admin 폴더 뷰페이지 권한체크 위한 mapping 
	@GetMapping("/admin/adminHome")
	public ModelAndView adminHome(ModelAndView view) {
		log.info("adminHome..");

		view.setViewName("/admin/adminHome");
		return view;
	}


}
