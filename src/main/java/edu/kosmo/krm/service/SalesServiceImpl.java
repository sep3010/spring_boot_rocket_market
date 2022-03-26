package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.SalesMapper;
import edu.kosmo.krm.vo.ProductSalesVO;
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
	
	

}
