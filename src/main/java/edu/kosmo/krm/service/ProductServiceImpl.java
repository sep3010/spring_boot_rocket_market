package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.ProductMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	//전체상품목록====================================================
	@Override
	public List<ProductVO> getProductList(Criteria criteria) {
		log.info("getProductList..");
		return productMapper.getProductListWithPaging(criteria);
	}
	@Override
	public int getProductTotal() {
		log.info("getProductTotal..");
		return productMapper.getProductTotalCount();
	}
	@Override
	public void updateProductStock(ProductVO product) {
		log.info("updateProductStock..");
		productMapper.updateProductStock(product);
	}
	// 상품 하나의 내용 불러오기
	@Override
	public ProductVO getProduct(int id) {
		return productMapper.getProduct(id);
	}

	//할인상품목록(할인율이 제일 큰 순서로 - 변경가능)=========================
	@Override
	public List<ProductVO> getDiscountProductList() {
		log.info("getDiscountProductList..");
		return productMapper.getDiscountProductList();
	}

	//신상품목록 (상품번호 기준)=========================================
	@Override
	public List<ProductVO> getNewProductList(){
		log.info("getNewProductList..");
		return productMapper.getNewProductList();
	}

}
