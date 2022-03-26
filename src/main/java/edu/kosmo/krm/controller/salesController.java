package edu.kosmo.krm.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@RestController
public class salesController {

	
	
	// 매출 관리 페이지
	@GetMapping("/admin/salesManagement")
	public ModelAndView salesManagement(ModelAndView view) {
		log.info("salesManagement()...");
		
		
		view.setViewName("/admin/salesManagement");
		return view;
	}

	
	


}
