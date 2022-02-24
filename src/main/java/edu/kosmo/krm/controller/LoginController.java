package edu.kosmo.krm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.MemberService;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	//로그인페이지 이동
	@GetMapping("/loginForm")
	public ModelAndView loginForm(ModelAndView view) {
		log.info("loginForm()..");
		view.setViewName("/loginForm");
		return view;
	}

	//회원가입페이지 이동
	@GetMapping("/addMemberForm")
	public ModelAndView addMemberForm(ModelAndView view) {
		log.info("addMemberForm()..");
		view.setViewName("/addMemberForm");
		return view;
	}
	
	
	//회원가입완료 후 로그인페이지 이동
	@PostMapping("/addMember")
	public ModelAndView addMember(ModelAndView view, MemberVO memberVO) {
		log.info("addMember()..");
		memberService.addMember(memberVO);
		view.setViewName("redirect:/loginForm");
		return view;
	}

}
