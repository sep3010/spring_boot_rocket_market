package edu.kosmo.krm.service;


import java.util.List;

import edu.kosmo.krm.vo.ProductSalesVO;
import edu.kosmo.krm.vo.SalesVO;

public interface SalesService {
	
	//상품별 판매 수량과 날짜 불러오기
	List<ProductSalesVO> getPrdouctSalesList();
	
	// 일별 매출
	List<SalesVO> getDailySales(int year, int month);
	
	// 월별 매출
	List<SalesVO> getMonthlySales(int year);
	
	// 연별 매출
	List<SalesVO> getYearlySales();
	
	
	

}
