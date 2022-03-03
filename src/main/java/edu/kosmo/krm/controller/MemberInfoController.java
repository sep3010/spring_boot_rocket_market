package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
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
@RestController
public class MemberInfoController {

	@Autowired
	private MemberInfoService memberInfoService;
    private AuthenticationManager authenticationManager;

	// 회원 정보 리스트 컨트롤러
	@GetMapping("/admin/memberList")
	public ModelAndView memberList(Criteria criteria, ModelAndView view) {
		log.info("memberList()...");
		
		// 전체 회원 목록
		view.addObject("ListPaging", memberInfoService.getList(criteria));
		int total = memberInfoService.getTotal();
		
		view.addObject("pageMaker", new PageVO(criteria, total));
		
		view.setViewName("/admin/memberList");
		return view;
	}

	// 회원 정보 조회 (admin)
	@GetMapping("/admin/memberInfo_view")
	public ModelAndView memberInfo_view(MemberVO memberVO, ModelAndView view) {
		log.info("memberVO: " + memberVO);

		int id = memberVO.getId();
		view.addObject("memberInfo_view", memberInfoService.get(id));
		view.setViewName("/admin/memberInfo_view");
		return view;
	}

	// 회원 정보 수정 컨트롤러 (admin)
	@RequestMapping(method = RequestMethod.POST, path = "/admin/modify_admin")
	public ModelAndView modify_admin(ModelAndView view, MemberVO memberVO) {
		log.info("modify_admin()...");
		memberInfoService.modify(memberVO);
		view.setViewName("redirect:memberList");
		return view;
	}
	
	// 회원 정보 수정 페이지 (user) - VIEW
	@GetMapping("/user/UserUpdateForm")
	public ModelAndView UserUpdateForm(ModelAndView view, Authentication authentication, MemberVO memberVO, Principal principal) {

		String user_id = principal.getName();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		user_id = auth.getName();

		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		System.out.println(userDetails.getUsername());

		int id = memberVO.getId();

		System.out.println(principal);

		view.addObject("myPage_view", principal.getName());
		view.setViewName("/user/UserUpdateForm");
		return view;
	}
	
	// 회원 정보 수정 컨트롤러 (user)
	@RequestMapping(method=RequestMethod.POST, value = "/modify")
	public ResponseEntity<String> modify(HttpSession session, @RequestBody MemberVO memberVO) {
		log.info("modify()...");
			
		ResponseEntity<String> entity = null;
		
		try {
			memberInfoService.updateuser(memberVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			// 세션 등록
//	        Authentication authentication = authenticationManager.authenticate
//	        		(new UsernamePasswordAuthenticationToken(memberVO.getUsername(), memberVO.getPassword()));
//	        SecurityContextHolder.getContext().setAuthentication(authentication);
	        
			CustomUser userDetails = (CustomUser)userDetailsService.loadUserByUsername(memberVO.getId());
			
		    Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, secret, Collections
				    .singletonList(new SimpleGrantedAuthority(userDetails.getDto().getAuthoritiesDTO().getAuthority())));

		    // userDetails로 loadUserByUsername(user.getId()를 꺼내온다.
		    
		    SecurityContext securityContext = SecurityContextHolder.getContext();
		    securityContext.setAuthentication(authentication);
		    
		    HttpSession session = request.getSession(true);
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);

		    // SPRING_SECURITY_CONTEXT 이게 올라가서 
	        
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		


		return entity;
	}




}
