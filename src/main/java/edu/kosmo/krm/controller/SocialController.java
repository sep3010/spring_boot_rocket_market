package edu.kosmo.krm.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.kosmo.krm.service.KakaoService;
import edu.kosmo.krm.vo.KakaoAuth;
import edu.kosmo.krm.vo.KakaoProfile;
import lombok.extern.slf4j.Slf4j;


/*소은*/
@Slf4j
@Controller
public class SocialController {
	
	@Autowired
	KakaoService kakaoService;
	
	
	@GetMapping("/auth/kakao/callback")
	public String kakcoCallback(String code, String state, Model model, HttpSession session) {
		log.info("kakcoCallback()..");
		
		log.info("code : " + code);
		log.info("state : " + state);
		KakaoAuth kakaoAuth = kakaoService.getkakaoTokenInfo(code, state);
		log.info("kakaoAuth : " + kakaoAuth);
		
		KakaoProfile kakaoProfile = kakaoService.getKakaoProfile(kakaoAuth.getAccess_token());
		model.addAttribute("kakaoMember", kakaoProfile);
		
		session.setAttribute("access_token", kakaoAuth.getAccess_token());
			
		return "/home";
	}
	
	
}
