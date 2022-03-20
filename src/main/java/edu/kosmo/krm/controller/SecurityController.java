package edu.kosmo.krm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.MemberService;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SecurityController {
	
	//user 폴더 뷰페이지 권한체크 위한 mapping
	@GetMapping("/user/userHome")
	public ModelAndView userHome(ModelAndView view) {
		log.info("userHome..");
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
