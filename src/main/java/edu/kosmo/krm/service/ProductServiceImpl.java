package edu.kosmo.krm.service;


import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResourceLoader;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.mapper.ProductMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductImageVO;
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
	
	// 전체 상품 개수
	@Override
	public int getProductTotal() {
		log.info("getProductTotal..");
		return productMapper.getProductTotalCount();
	}
	
	// 상품 재고랑 수정
	@Override
	public void updateProductStock(ProductVO product) {
		log.info("updateProductStock..");
		productMapper.updateProductStock(product);
	}
	
	// 상품 하나의 내용 불러오기
	@Override
	public ProductVO getProduct(int id) {
		log.info("getProduct..");
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
	
	// 상품과 상품이미지 등록하기
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void insertProductAndImage(ProductVO productVO, Map<String, MultipartFile> files, String savePath) {
		log.info("insertProductAndImage..");
		// String savePath = "C:\\RocketMarket\\product-image";
		// String savePath = "C:\\Users\\samsung\\Documents\\workspace-sts-3.9.18.RELEASE\\spring_boot_rocket_market\\src\\main\\resources\\static\\product-image";
		
		productMapper.insertProduct(productVO);
		
		int product_id = productMapper.getProductId(productVO.getName());
		
		ProductImageVO productImageVO;
		/*상품 이미지 업로드하기(대표 이미지, 상품정보 이미지, 상품상세 이미지 순서대로)*/
		// entrySet 방식으로 반복문 돌리기	
		for(Map.Entry<String, MultipartFile> file : files.entrySet()) {
			productImageVO = new ProductImageVO();
			String information_type = file.getKey();			
			
			// 파일 이름
			String name = file.getValue().getOriginalFilename();
			
			// 파일 형태 (예시: image/jpeg)
			String extension = file.getValue().getContentType();
			
			
			File saveFile = new File(savePath, name);
			try {
				// 실제로 파일 저장하기
				file.getValue().transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
			productImageVO.setProduct_id(product_id);
			productImageVO.setName(name);
			productImageVO.setExtension(extension);
			productImageVO.setInformation_type(information_type);
			
			// 서버에서 저장된 이미지를 불러오기 위한 경로로 DB에 저장.
			String loadImagePath = "http://localhost:8282/resources/product-image/";
			productImageVO.setPath(loadImagePath);
			
			log.info("productImageVO : " + productImageVO);
			
			productMapper.insertProductImage(productImageVO);
			
		} // end for()
	
	}
	
	// 상품들의 메인이미지 목록 가져오기
	@Override
	public List<ProductImageVO> getProductMainImage() {
		log.info("getProductMainImage()..");
		return productMapper.getProductMainImage();
	}
	
	

}
