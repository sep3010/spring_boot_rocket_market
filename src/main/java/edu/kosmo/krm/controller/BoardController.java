package edu.kosmo.krm.controller;

import java.security.Principal;
import java.util.Collections;
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
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import edu.kosmo.krm.page.CriteriaP;
import edu.kosmo.krm.page.PageVO;
import edu.kosmo.krm.security.MemberCustomDetailsService;
import edu.kosmo.krm.service.BoardService;
import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import edu.kosmo.krm.vo.BoardVO;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ReplyVO;


@Slf4j
@RestController
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberInfoService memberInfoService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	// ========== 공지사항 ============
	
	// 공지사항 목록 조회 + 페이징
	@GetMapping(path = "board/noticeHome")
	public ModelAndView noticeHome(Criteria criteria, ModelAndView view, Principal principal, CriteriaP criteriaP) {
		log.info("noticeHome(in controller)");
		log.info("=========BoardPaging : " + boardService.getNoticeBoard(criteria));

		view.addObject("BoardPaging", boardService.getNoticeBoard(criteria));
		int total = boardService.getNoticeTotal();
		
		view.addObject("bestList", productService.getBestProductList(criteriaP));
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}


		view.addObject("pageMaker", new PageVO(criteria, total));

		view.setViewName("/board/noticeHome");
	
		return view;
	}
	
	
	// 개별 공지사항 조회
	@GetMapping(path = "/board/notice_content_view/{id}")
	public ModelAndView notice_content_view(@PathVariable int id, ModelAndView view, Principal principal, CriteriaP criteriaP) {
		log.info("notice_content_view(in controller");
		log.info("========board_id : " + id);
		
		view.addObject("notice", boardService.getNotice(id));
		view.addObject("bestList", productService.getBestProductList(criteriaP));
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		view.setViewName("/board/notice_content_view");
		
		return view;
		
	}
	
	// 공지사항 작성페이지 호출
	@GetMapping(path = "/board/admin/notice_write_view")
	public ModelAndView notice_write_view(ModelAndView view, Principal principal, CriteriaP criteriaP) {
		log.info("notice_write_view(in controller)");
		
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		view.setViewName("/board/admin/notice_write_view");
		
		return view;
	}
	
	// 공지사항 작성
	@PostMapping(path = "/board/admin/notice_write")
	public ModelAndView notice_write(ModelAndView view, BoardVO boardVO) {
		log.info("notice_write(in controller)");
		
		boardService.postNotice(boardVO);
		
		view.setViewName("redirect:/board/noticeHome");
		
		return view;
	}
	
	// 공지사항 삭제
	@DeleteMapping("/board/admin/delete_notice/{id}")
	public ResponseEntity<String> delete_notice(@PathVariable int id) {
		log.info("delete_notice(in controller)");
		log.info("========id : " + id);
		
		ResponseEntity<String> entity = null;
		
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			boardService.deleteNotice(id);			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	// 공지사항 수정페이지 호출
	@GetMapping(path = "/board/admin/notice_modify_view/{id}")
	public ModelAndView notice_modify_view(@PathVariable int id, ModelAndView view, Principal principal, CriteriaP criteriaP) {
		log.info("notice_modify_view(in controller)");
		
		view.addObject("notice", boardService.getNotice(id));
		
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		view.setViewName("/board/admin/notice_modify_view");
		
		return view;
	}

	// 공지사항 수정
	@PostMapping(path = "/board/admin/modify_notice")
	public ModelAndView modify_notice(BoardVO boardVO, ModelAndView view) {
		log.info("modify_notice(in controller)");
		
		boardService.modifyNotice(boardVO);
		view.setViewName("redirect:/board/noticeHome");
		
		
		return view;
	}
	
	// ======================== 문의사항 =========================
	
	// 문의사항 목록 조회 + 페이징
	@GetMapping(path = "board/inquiryHome")
	public ModelAndView inquiryHome(Criteria criteria, ModelAndView view, Principal principal, CriteriaP criteriaP) {
		log.info("inquiryHome(in controller)");
		log.info("=========BoardPaging : " + boardService.getInquiryBoard(criteria));
		
		view.addObject("BoardPaging", boardService.getInquiryBoard(criteria));
		int total = boardService.getInquiryTotal();
		
		view.addObject("pageMaker", new PageVO(criteria, total));
		
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		view.setViewName("/board/inquiryHome");
		
		return view;
	}
	
	// 개별 문의사항 조회
	@GetMapping(path = "/board/user/inquiry_content_view/{id}")
	public ModelAndView inquiry_content_view(@PathVariable int id, MemberVO memberVO, ModelAndView view, Principal principal, CriteriaP criteriaP) {
		log.info("inquiry_content_view(in controller");
		log.info("========board_id : " + id);
		log.info("=========inquiry : " + boardService.getInquiry(id));
		
		//int writerID = boardService.getBoardWriter(id); //게시글의 작성자 회원번호
		//memberVO = memberInfoService.get(writerID); //작성자 회원번호로 회원정보조회
		//view.addObject("writer_name", memberVO.getNickname());
		
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO2 = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO2.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO2.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		view.addObject("inquiry", boardService.getInquiry(id));
		view.setViewName("/board/user/inquiry_content_view");
		
		return view;		
	}
	
	// 문의사항 작성페이지 호출
	@GetMapping(path = "/board/user/inquiry_write_view")
	public ModelAndView inquiry_write_view(ModelAndView view, Principal principal, CriteriaP criteriaP) {
		log.info("inquiry_write_view(in controller)");		
		view.setViewName("/board/user/inquiry_write_view");
		
		//사이드바 장바구니품목
		try {
			if(principal.getName() != null) {
				MemberVO memberVO2 = memberInfoService.getForCart(principal.getName());
				log.info("회원번호" + memberVO2.getId());		
				view.addObject("cartProductList", orderService.cartProductList(memberVO2.getId()));				
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return view;
	}
	
	// 문의사항 작성
	@PostMapping(path = "/board/user/inquiry_write")
	public ModelAndView inquiry_write(ModelAndView view, BoardVO boardVO) {
		log.info("inquiry_write(in controller)");
		
		boardService.postInquiry(boardVO);
		
		view.setViewName("redirect:/board/inquiryHome");
		
		return view;
	}
	
	// 문의사항 삭제
	@DeleteMapping("/board/admin/inquiry_notice/{id}")
	public ResponseEntity<String> delete_inquiry(@PathVariable int id) {
		log.info("delete_inquiry(in controller)");
		log.info("========id : " + id);
		
		ResponseEntity<String> entity = null;
		
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			boardService.deleteInquiry(id);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@PostMapping("/board/user/writeReply")
	public ModelAndView writeReply(ModelAndView view, ReplyVO replyVO) {
		log.info("writeReply()..");
		log.info("=========replyVO : " + replyVO);
		
		boardService.insertReply(replyVO);
		String url = "redirect:/board/user/inquiry_content_view/" + replyVO.getBoard_id();
		
		view.setViewName(url);
		return view;
	}
	
	
}
