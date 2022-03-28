package edu.kosmo.krm.error;

import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

// 에러 페이지 커스터 마이징 
@Component
public class WebServerCustomizer implements WebServerFactoryCustomizer<ConfigurableWebServerFactory> {

	@Override
	public void customize(ConfigurableWebServerFactory factory) {
		
		ErrorPage errorPage404 = new ErrorPage(HttpStatus.NOT_FOUND, "/error/404");
        ErrorPage errorPage500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/500");
        ErrorPage errorPage403 = new ErrorPage(HttpStatus.FORBIDDEN, "/error/403");
        ErrorPage errorPage405 = new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED, "/error/405");
        ErrorPage errorPage400 = new ErrorPage(HttpStatus.BAD_REQUEST, "/error/400");

        ErrorPage errorPageEx = new ErrorPage(RuntimeException.class, "/error/500");

        factory.addErrorPages(errorPage404, errorPage500, errorPage403, errorPage400, errorPage405, errorPageEx);
		
	}

	

}
