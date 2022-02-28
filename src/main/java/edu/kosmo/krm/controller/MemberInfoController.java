package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.page.PageVO;
import edu.kosmo.krm.service.MemberInfoService;
import lombok.extern.slf4j.Slf4j;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;

// 회원 관리 컨트롤러(회원 정보 리스트, 회원 정보 조회, 회원 정보 수정, 회원 삭제)
// 2022-2-23 ~
// 양세윤 코드 작성

@Slf4j
@Controller
public class MemberInfoController {

	@Autowired
	private MemberInfoService memberInfoService;
    private AuthenticationManager authenticationManager;

	// 회원 정보 리스트 컨트롤러
	@GetMapping("/admin/memberList")
	public String memberList(Criteria criteria, Model model) {
		log.info("memberList()...");
		log.info("criteria: " + criteria);
		model.addAttribute("ListPaging", memberInfoService.getList(criteria));

		int total = memberInfoService.getTotal();
		log.info("total: " + total);
		PageVO pageVO = new PageVO(criteria, total);
		model.addAttribute("pageMaker", pageVO);
		log.info("pageVO : " + pageVO);
		return "/admin/memberList";
	}

	// 회원 정보 조회 (admin)
	@GetMapping("/admin/memberInfo_view")
	public String memberInfo_view(MemberVO memberVO, Model model) {
		log.info("memberInfo_view()...");
		log.info("memberVO: " + memberVO);

		int id = memberVO.getId();
		model.addAttribute("memberInfo_view", memberInfoService.get(id));

		return "/admin/memberInfo_view";
	}

	// 회원 정보 수정 페이지 (user)
	@RequestMapping(method = RequestMethod.GET, path = "/user/UserUpdateForm")
	public String UserUpdateForm(Authentication authentication, MemberVO memberVO, Principal principal, Model model) {

		String user_id = principal.getName();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		user_id = auth.getName();

		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		System.out.println(userDetails.getUsername());

		int id = memberVO.getId();

		System.out.println(principal);

		model.addAttribute("myPage_view", principal.getName());

		return "/user/UserUpdateForm";
	}

	// 회원 정보 수정 컨트롤러 (admin)
	@RequestMapping(method = RequestMethod.GET, path = "/admin/modify_admin")
	public String modify_admin(MemberVO memberVO) {
		log.info("modify_admin()...");
		memberInfoService.modify(memberVO);
		return "redirect:memberList";
	}

	// 회원 정보 수정 컨트롤러 (user)
	@PostMapping("/user/modify")
	public String modify(MemberVO memberVO, Principal principal) {
		log.info("====================================modify()...");
		memberInfoService.updateuser(memberVO);

//		// 세션 등록
//        Authentication authentication = authenticationManager.authenticate
//        		(new UsernamePasswordAuthenticationToken(memberVO.getUsername(), memberVO.getPassword()));
//        SecurityContextHolder.getContext().setAuthentication(authentication);

		return "/home";
	}

}
