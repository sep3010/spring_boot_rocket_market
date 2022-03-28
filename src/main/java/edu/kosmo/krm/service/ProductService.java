package edu.kosmo.krm.service;


import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.joinVO.JoinBestProductVO;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.page.CriteriaP;
import edu.kosmo.krm.vo.ProductVO;


public interface ProductService {
	
	// 전체상품목록 가져오기=========================================
	public List<ProductVO> getAdminProductList(Criteria criteria);

	public int getProductTotal(); //개수

	public void updateProductStock(ProductVO product); //재고량수정
	
	public ProductVO getProduct(int id); //상품한개 정보
	
	// 상품상세 정보 가져오기
	public ProductVO getProductContent(ProductVO productVO);
	
	/*유빈*/
	// 베스트상품목록 (후기가 존재하고, 후기점수가 높은 순)==============================
	public List<JoinBestProductVO> getBestProductList(CriteriaP criteria);

	public int getBestProductTotal(); //개수
	
	// 할인상품목록 (할인율이 제일 큰 순서로)============================
	public List<ProductVO> getSaleProductList(CriteriaP criteria);

	public int getSaleProductTotal(); //할인상품개수
	
	//신상품목록 (상품번호 기준)======================================
	public List<ProductVO> getNewProductList(CriteriaP criteria);
	
	//정기배송상품목록 (배송타입이 '정기')===============================
	public List<ProductVO> getSubscribeProductList(CriteriaP criteria);

	public int getSubscribeProductTotal(); //정기배송상품개수
	
	//카테고리 상품목록 (상품종류)=====================================
	public List<ProductVO> getCategoryProductList(CriteriaP criteria);

	public int getCategoryProductTotal(String type); //상품개수

	/*유빈*/
	// 상품상세 ==================================================
	public List<ProductVO> getProductInfo(ProductVO product); //상품상세내용 가져오기
	public List<ProductVO> getRecommendProduct(ProductVO productVO); //동일브랜드 상품목록추천	
	public JoinBestProductVO getProductScore(int id); //상품에 대한 후기점수
	
	
	// 상품과 상품이미지 등록하기======================================
	public void insertProductAndImage(ProductVO productVO, Map<String, MultipartFile> files, String savePath);
	
	// 상품과 상품이미지 수정하기
	void updateProductAndImage(ProductVO productVO,Map<String, MultipartFile> files, String savePath);

	
}
