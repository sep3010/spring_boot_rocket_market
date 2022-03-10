package edu.kosmo.krm.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductImageVO;
import edu.kosmo.krm.vo.ProductVO;

@Service
public interface ProductService {
	
	// 전체상품목록 가져오기=========================================
	public List<ProductVO> getAdminProductList(Criteria criteria);
	public int getProductTotal(); //개수
	public void updateProductStock(ProductVO product); //재고량수정
	public ProductVO getProduct(int id); //상품한개 정보
	
	// 할인상품목록 (할인율이 제일 큰 순서로 - 변경가능)====================
	public List<ProductVO> getDiscountProductList();	
	
	//신상품목록 (상품번호 기준)======================================
	public List<ProductVO> getNewProductList();
	
	
	// 상품과 상품이미지 등록하기
	public void insertProductAndImage(ProductVO productVO, Map<String, MultipartFile> files, String savePath);
	

	
}
