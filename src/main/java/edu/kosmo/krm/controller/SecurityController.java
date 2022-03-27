package edu.kosmo.krm.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.MemberService;
import edu.kosmo.krm.service.OrderHistoryService;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SecurityController {
	
	@Autowired
	private OrderHistoryService historyService;
	
	@Autowired
	private MemberInfoService memberInfoService;
	
	//user 폴더 뷰페이지 권한체크 위한 mapping
	@GetMapping("/user/userHome")
	public ModelAndView userHome(ModelAndView view, Principal principal) {
		log.info("userHome..");
		
		String username = principal.getName();
		log.info("username : " + username);
		
		MemberVO memberVO = memberInfoService.getUser(username);
		
		view.addObject("orderCount", historyService.getMemberOrderCount(memberVO.getId()));
		
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
