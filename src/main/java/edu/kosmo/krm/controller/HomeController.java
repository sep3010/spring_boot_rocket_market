package edu.kosmo.krm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.ProductService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public ModelAndView getHome(ModelAndView view) {
		log.info("getHome()..");
		view.setViewName("/home");
				
		//할인상품목록 
		view.addObject("discountList", productService.getDiscountProductList());
		//신상품목록
		view.addObject("newList", productService.getNewProductList());
		
		return view;
	}
	

}
