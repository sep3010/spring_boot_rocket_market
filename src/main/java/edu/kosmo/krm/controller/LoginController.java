package edu.kosmo.krm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.KakaoService;
import edu.kosmo.krm.service.MemberService;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private KakaoService kakaoService;
	
	//로그인페이지 이동
	@GetMapping("/loginForm")
	public ModelAndView loginForm(ModelAndView view) {
		log.info("loginForm()..");
		
		// 카카오 로그인을 위한 링크 저장
		view.addObject("kakaoLoginURL", kakaoService.getKakaoLoginURL());
		
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
	
	//회원가입전 회원가입 선택 페이지로 이동
	@GetMapping("/basicaddMemberForm")
	public ModelAndView basicaddMemberForm(ModelAndView view) {
		log.info("basicaddMemberForm()..");
		view.setViewName("/basicaddMemberForm");
		return view;
	}
	
	//회원가입페이지 아이디중복체크
	@PostMapping("/addMemberForm/idCheck")
    public Map<String, Object> idCheck(@RequestBody MemberVO memberVO) {
        log.info("idCheck 컨트롤러 도착 ㅋ" + memberVO);
        int count = 0;
        Map<String, Object> map = new HashMap<String, Object>();
 
        String username = memberVO.getUsername();
        count = memberService.idCheck(username);
        map.put("idCount", count);
 
        return map;
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
