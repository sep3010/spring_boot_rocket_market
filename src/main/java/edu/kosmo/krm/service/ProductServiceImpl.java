package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.ProductMapper;
import edu.kosmo.krm.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	//전체상품목록 가져오기
	@Override
	public List<ProductVO> getProductList() {
		log.info("getProductList..");
		return productMapper.getProductList();
	}

	//할인상품목록 가져오기 (할인율이 제일 큰 순서로 - 변경가능)
	@Override
	public List<ProductVO> getDiscountProductList() {
		log.info("getDiscountProductList..");
		return productMapper.getDiscountProductList();
	}



}
