package edu.kosmo.krm.service;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductVO;

@Service
public interface ProductService {
	
	// 전체상품목록 가져오기=========================================
	public List<ProductVO> getProductList(Criteria criteria);
	public int getProductTotal(); //개수
	public void updateProductStock(ProductVO product); //재고량수정
	public ProductVO getProduct(int id); //상품한개 정보
	
	// 할인상품목록 (할인율이 제일 큰 순서로 - 변경가능)====================
	public List<ProductVO> getDiscountProductList();

	
	//신상품목록 (상품번호 기준)======================================
	public List<ProductVO> getNewProductList();

	
}
