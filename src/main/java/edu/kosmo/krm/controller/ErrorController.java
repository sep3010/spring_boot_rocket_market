package edu.kosmo.krm.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ErrorController {
	
	
	// get, post 모두 처리하기 위해 @RequestMapping 사용
    @RequestMapping("/error/404")
    public String error404(HttpServletRequest request, HttpServletResponse response) {
        log.info("error 404");
        log.info("=====request : " + request);
        return "error/404";
    }

    @RequestMapping("/error/500")
    public String errorPage500(HttpServletRequest request, HttpServletResponse response) {
        log.info("error 500");
        log.info("=====request : " + request);
        return "error/500";
    }
    
    @RequestMapping("/error/403")
    public String error403(HttpServletRequest request, HttpServletResponse response) {
        log.info("error 403");
        log.info("=====request : " + request);
        return "error/404";
    }

    @RequestMapping("/error/405")
    public String errorPage405(HttpServletRequest request, HttpServletResponse response) {
        log.info("error 405");
        log.info("=====request : " + request);
        return "error/405";
    }
    
    @RequestMapping("/error/400")
    public String errorPage400(HttpServletRequest request, HttpServletResponse response) {
        log.info("error 400");
        log.info("=====request : " + request);
        return "error/400";
    }
	

}
