package edu.kosmo.krm.voTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class ProductVOTest {
	
	@Autowired
	private ProductService productService;
	
	@Transactional
	@Test
	public void test() {		
		List<ProductVO> productList = new ArrayList<ProductVO>();
		Criteria criteria = new Criteria();
		
		// 관리자 페이지 상품 목록 리스트 불러오기
		productList = productService.getAdminProductList(criteria);
		log.info("=====productList : " + productList);
	}	
	
	@Test
	void contextLoads() {
		assertNotNull(productService);
		log.info("ProductVO admin ProductList test");		
	}



}
