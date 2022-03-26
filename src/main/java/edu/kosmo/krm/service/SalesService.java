package edu.kosmo.krm.service;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.SalesMapper;
import edu.kosmo.krm.vo.CouponVO;
import edu.kosmo.krm.vo.ProductSalesVO;

public interface SalesService {
	
	//상품별 판매 수량과 날짜 불러오기
	List<ProductSalesVO> getPrdouctSalesList();
	
	
	
	

}
