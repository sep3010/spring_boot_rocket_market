package edu.kosmo.krm.controller;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.service.SalesService;
import edu.kosmo.krm.vo.SalesVO;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@RestController
public class salesController {
	
	@Autowired
	private SalesService salesService;
	
	// 매출 관리 페이지
	@GetMapping("/admin/salesManagement")
	public ModelAndView salesManagement(ModelAndView view) {
		log.info("salesManagement()...");
				
		// 시스템 상 현재 날짜
		LocalDate now = LocalDate.now();
		
		// 현재 날짜에서 년도 추출
		int currentYear = now.getYear();
		log.info("currentYear : " + currentYear);
		view.addObject("currentYear", currentYear);
		
		List<SalesVO> sales;
		List<List<SalesVO>> daySales = new ArrayList<List<SalesVO>>();
		for(int i = (currentYear - 5); i <= currentYear; i++) {
			for(int j = 1; j <= 12; j++) {
				if(salesService.getDailySales(i, j).size() > 0) {
					log.info(i + "년" + j  +"월"+ "=====" + salesService.getDailySales(i, j));
					sales = salesService.getDailySales(i, j);
					for(int s = 0; s < sales.size(); s++) {
						sales.get(s).setSale_year(i);
						sales.get(s).setSale_month(j);
						
					}
					daySales.add(sales);
				}
				
			}
		}
		view.addObject("daySales", daySales);
		
		List<List<SalesVO>> monthSales = new ArrayList<List<SalesVO>>();
		for(int i = (currentYear - 5); i <= currentYear; i++) {	
			if(salesService.getMonthlySales(i).size() > 0) {
				log.info(i + "년" + "=====" + salesService.getMonthlySales(i));
				sales = salesService.getMonthlySales(i);
				for(int j = 0; j < sales.size(); j++) {
					sales.get(j).setSale_year(i);
				}
				monthSales.add(sales);
			}
	
		}
		view.addObject("monthSales", monthSales);
						
		log.info("==========yearSales : " + salesService.getYearlySales());
		view.addObject("yearSales", salesService.getYearlySales());
		
		
		view.setViewName("/admin/salesManagement");
		return view;
	}

	
	


}
