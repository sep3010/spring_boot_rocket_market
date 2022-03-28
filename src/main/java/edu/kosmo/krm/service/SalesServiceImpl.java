package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.SalesMapper;
import edu.kosmo.krm.vo.ProductSalesVO;
import edu.kosmo.krm.vo.SalesVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private SalesMapper salesMapper;

	@Override
	public List<ProductSalesVO> getPrdouctSalesList() {
		log.info("getPrdouctSalesList()..");
		return salesMapper.getProductSalesList();
	}
	
	// 일별 매출
	@Override
	public List<SalesVO> getDailySales(int year, int month) {
		log.info("getDailySales()..");
		return salesMapper.getDailySales(year, month);
	}
	
	// 월별 매출
	@Override
	public List<SalesVO> getMonthlySales(int year) {
		log.info("getMonthlySales()..");
		return salesMapper.getMonthlySales(year);
	}
	
	// 연별 매출
	@Override
	public List<SalesVO> getYearlySales() {
		log.info("getYearlySales()..");
		return salesMapper.getYearlySales();
	}
	
	

}
