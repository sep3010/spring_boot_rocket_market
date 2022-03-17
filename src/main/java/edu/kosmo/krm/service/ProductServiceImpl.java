package edu.kosmo.krm.service;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kosmo.krm.mapper.ProductMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.page.CriteriaP;
import edu.kosmo.krm.vo.ProductImageVO;
import edu.kosmo.krm.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	//전체상품목록====================================================
	@Override
	public List<ProductVO> getAdminProductList(Criteria criteria) {
		log.info("getProductList..");
		return productMapper.getAdminProductList(criteria);
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
	
	//베스트상품목록(판매수량이 많은 순)===================================
	@Override
	public List<ProductVO> getBestProductList(CriteriaP criteria) {
		log.info("getBestProductList..");
		return productMapper.getBestProductList(criteria);
	}
	@Override
	public int getBestProductTotal() {
		log.info("getBestProductTotal..");
		return productMapper.getBestProductTotalCount();
	}

	//할인상품목록(할인율이 제일 큰 순서로)=================================
	@Override
	public List<ProductVO> getSaleProductList(CriteriaP criteria) {
		log.info("getSaleProductList..");
		return productMapper.getSaleProductList(criteria);
	}
	@Override
	public int getSaleProductTotal() {
		log.info("getSaleProductTotal..");
		return productMapper.getSaleProductTotalCount();
	}

	//신상품목록 (상품번호 기준)=========================================
	@Override
	public List<ProductVO> getNewProductList(CriteriaP criteria){
		log.info("getNewProductList..");
		return productMapper.getNewProductList(criteria);
	}
	
	//정기배송상품목록 (배송타입이 '정기')==================================
	@Override
	public List<ProductVO> getSubscribeProductList(CriteriaP criteria) {
		log.info("getSubscribeProductList..");
		return productMapper.getSubscribeProductList(criteria);
	}
	@Override
	public int getSubscribeProductTotal() {
		log.info("getSubscribeProductTotal..");
		return productMapper.getSubscribeProductTotalCount();
	}
	//카테고리 상품목록 (상품종류)========================================
	@Override
	public List<ProductVO> getCategoryProductList(CriteriaP criteria) {
		log.info("getCategoryProductList.." + criteria.getEtype());
		return productMapper.getCategoryProductList(criteria);
	}
	@Override
	public int getCategoryProductTotal(String type) {
		log.info("getCategoryProductTotal..");
		return productMapper.getCategoryProductTotalCount(type);
	}

	// 상품과 상품이미지 등록하기
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void insertProductAndImage(ProductVO productVO, Map<String, MultipartFile> files, String savePath) {
		log.info("insertProductAndImage..");
		// 이 주소를 쓰면 절대 주소가 되어 다른 팀원들이 본인 컴퓨터로 서버를 돌려 파일을 저장하게 되면 경로가 다르기 때문에 오류가 발생할 거 같다.
		// 그래서 상대 주소로 설정 변경
		// String savePath = "C:\\Users\\samsung\\Documents\\workspace-sts-3.9.18.RELEASE\\spring_boot_rocket_market\\src\\main\\resources\\static\\product-image";
		
		productMapper.insertProduct(productVO);
		
		int product_id = productMapper.getProductId(productVO.getName());
		
		ProductImageVO productImageVO;
		/*상품 이미지 업로드하기(대표 이미지, 상품정보 이미지, 상품상세 이미지 순서대로)*/
		// entrySet 방식으로 반복문 돌리기
		// map.entrySet() 메소드는 해당 map의  key와 value를 가지는 Set 객체를 리턴
		// 따라서 해당 set 객체를 foreach문으로 돌려 map의 key와 value값을 모두 뽑아낼 수 있다.
		for(Map.Entry<String, MultipartFile> file : files.entrySet()) {
			productImageVO = new ProductImageVO();
			String information_type = file.getKey();			
			
			// 파일 이름
			String originalName = file.getValue().getOriginalFilename();
			
			// 혹시 파일 이름이 중복되면 기존에 있던 파일이 덮어쓰기 될 수 있기 때문에 
			// 그걸 방지하기 위해 UUID를 사용.
			// UUID는 랜덤으로 32개의 문자(4개의 하이픈으로 구성된 총 5개의 그룹)를 생성 
			// 예시: 550e8400-e29b-41d4-a716-446655440000
			// a~f까지의 알파벳 값들이 대문자인지 소문자인지는 중요하지 않다.(16진수)
			// 128비트의 값이다.
			String uuid = UUID.randomUUID().toString();
			
			String fileName = uuid + "_" + originalName;
			
			// 파일 형태 (예시: image/jpeg)
			String extension = file.getValue().getContentType();
			
			// 서버에서 저장된 이미지를 불러오기 위한 기본 경로
			String basePath = "http://localhost:8282/resources/product-image/";
						
			
			File saveFile = new File(savePath, fileName);
			try {
				// 실제로 파일 저장하기
				file.getValue().transferTo(saveFile);
				
				/* 메인 상품 이미지를 추가로 썸네일 버전 만들어 저장하기 */
				if(information_type == "main") {
					// 썸네일 파일 이름
					String thumbnailName = "s_" + fileName;
					
					// 썸네일을 저장하기 위한 File 객체 생성
					File thumbnailFile = new File(savePath, thumbnailName);
					
					// thumbnailaotr 라이브러리를 사용해 썸네일 만들기
					Thumbnails.of(saveFile)
							.size(100, 100)
							.toFile(thumbnailFile);
					
					// 저장한 썸네일 DB product_image 테이블에 저장하기
					productImageVO.setProduct_id(product_id);
					productImageVO.setName(thumbnailName);
					productImageVO.setExtension(extension);
					productImageVO.setInformation_type("thumbnail");
					
					String thumbnailPath = basePath + thumbnailName;
					productImageVO.setPath(thumbnailPath);
					log.info("thumbnailImageVO : " + productImageVO);
					productMapper.insertProductImage(productImageVO);
								
				} // if end
				
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			// ProductImageVO에 값 넣기
			productImageVO.setProduct_id(product_id);
			productImageVO.setName(fileName);
			productImageVO.setExtension(extension);
			productImageVO.setInformation_type(information_type);
			
			// 각 파일 별로 저장되는 폴더 경로에 + 파일 이름으로 경로를 DB에 저장해서 
			// view 페이지에서 해당 이이지를 편리하게 불러오기 위한 설정
			String loadImagePath = basePath + fileName;
			productImageVO.setPath(loadImagePath);
			
			log.info("productImageVO : " + productImageVO);
			
			productMapper.insertProductImage(productImageVO);
			
		} // end for()
	
	}

}
