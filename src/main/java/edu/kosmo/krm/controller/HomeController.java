package edu.kosmo.krm.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.page.CriteriaP;
import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.MemberService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberInfoService memberInfoService;	
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public ModelAndView getHome(CriteriaP criteriaP, Principal principal,ModelAndView view, HttpSession session, @AuthenticationPrincipal MemberCustomDetails memberCustomDetails) {
		if(principal == null) {
			log.info("getHome()..");
			view.setViewName("/home");
					
			//할인상품목록 
			view.addObject("discountList", productService.getSaleProductList(criteriaP));
			//신상품목록
			view.addObject("newList", productService.getNewProductList(criteriaP));
			//베스트상품목록
			view.addObject("bestList", productService.getBestProductList(criteriaP));
			return view;
		}
		
		else {
			log.info("getHome()..");
			view.setViewName("/home");
					
			//할인상품목록 
			view.addObject("discountList", productService.getSaleProductList(criteriaP));
			//신상품목록
			view.addObject("newList", productService.getNewProductList(criteriaP));
			//베스트상품목록
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

			
			// 회원 이름 
			
			MemberVO memberVo = memberService.getMemeber(memberCustomDetails.getUsername());
			String userName = memberVo.getName();
			
			if (userName == null) {
				userName = "이름을 알수없는 고객";
				session.setAttribute("userName", userName);
			}	else {
				session.setAttribute("userName", userName);
			}
			
			
			
			return view;
		}
	}
	

}
