package edu.kosmo.krm.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {
	
	@GetMapping("/")
	public ModelAndView getHome(ModelAndView view) {
		log.info("getHome()..");
		view.setViewName("/home");
		return view;
	}
	

}
