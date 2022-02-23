package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.vo.ProductVO;

@Service
public interface ProductService {
	
	// 전체상품목록 가져오기
	public List<ProductVO> getProductList();
	
	// 할인상품목록 (할인율이 제일 큰 순서로 - 변경가능)
	public List<ProductVO> getDiscountProductList();


}
