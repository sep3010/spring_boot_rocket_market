package edu.kosmo.krm.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.page.CriteriaP;
import edu.kosmo.krm.service.MemberInfoService;
import edu.kosmo.krm.service.OrderService;
import edu.kosmo.krm.service.ProductService;
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
	
	@GetMapping("/")
	public ModelAndView getHome(CriteriaP criteriaP, Principal principal,ModelAndView view) {
		if(principal == null) {
			log.info("getHome()..");
			view.setViewName("/home");
					
			//할인상품목록 
			view.addObject("discountList", productService.getSaleProductList(criteriaP));
			//신상품목록
			view.addObject("newList", productService.getNewProductList(criteriaP));
			return view;
		}
		
		else {
			log.info("getHome()..");
			view.setViewName("/home");
					
			//할인상품목록 
			view.addObject("discountList", productService.getSaleProductList(criteriaP));
			//신상품목록
			view.addObject("newList", productService.getNewProductList(criteriaP));
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

			return view;
		}
	}
	

}
