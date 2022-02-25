package edu.kosmo.krm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.page.PageVO;
import edu.kosmo.krm.service.MemberInfoService;
import lombok.extern.slf4j.Slf4j;
import edu.kosmo.krm.vo.MemberVO;

// 회원 관리 컨트롤러(회원 정보 리스트, 회원 정보 조회, 회원 정보 수정, 회원 삭제)
// 2022-2-23 ~
// 양세윤 코드 작성

@Slf4j
@Controller
public class MemberInfoController {

	@Autowired
	private MemberInfoService memberInfoService;

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

	// 회원 정보 수정 컨트롤러
	@GetMapping("/admin/modify")
	public String modify(MemberVO memberVO) {
		log.info("modify()...");
		memberInfoService.modify(memberVO);
		return "redirect:memberList";
	}
}
