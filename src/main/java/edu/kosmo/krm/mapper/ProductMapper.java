package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.page.CriteriaP;
import edu.kosmo.krm.vo.ProductImageVO;
import edu.kosmo.krm.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Mapper
public interface ProductMapper {
	
	// 전체상품목록 (관리자용, 페이징) & 상품 썸네일 이미지만 ====================================
	public List<ProductVO> getAdminProductList(Criteria criteria);
	
	@Select("select count(*) from product")
	public int getProductTotalCount(); //개수
	
	@Update("UPDATE product SET stock = #{stock} WHERE id = #{id}")
	public void updateProductStock(ProductVO product); //재고량 수정
	
	@Select("SELECT * FROM product WHERE id = #{id}") 
	public ProductVO getProduct(int id);//상품한개
	
	/*상품목록======================================================*/
	// 베스트상품목록 (판매수량이 많은 순)
	public List<ProductVO> getBestProductList(CriteriaP criteria);
	@Select("SELECT COUNT(*) FROM (SELECT product_id, SUM(quantity) AS quantity FROM product_sales GROUP BY product_id ORDER BY quantity DESC)")
	public int getBestProductTotalCount(); //개수
	
	// 할인상품목록 (할인율이 제일 큰 순서로)
	public List<ProductVO> getSaleProductList(CriteriaP criteria);
	@Select("SELECT COUNT(*) FROM product WHERE discount > 0")
	public int getSaleProductTotalCount(); //할인상품 개수
	
	// 신상품목록 (상품번호 기준)
	public List<ProductVO> getNewProductList(CriteriaP criteria);

	// 정기배송상품목록 (배송타입이 '정기'인 제품)
	public List<ProductVO> getSubscribeProductList(CriteriaP criteria);
	@Select("SELECT COUNT(*) FROM product WHERE delivery_type = '정기'")
	public int getSubscribeProductTotalCount(); //정기배송상품 개수
	
	// 상품카테고리별 목록 (상품종류마다 다름)
	public List<ProductVO> getCategoryProductList(CriteriaP criteria);
	@Select("SELECT COUNT(*) FROM product WHERE type = #{type}")
	public int getCategoryProductTotalCount(String type); //카테고리상품상품 개수
	
	
	// 상품 등록(관리자)
	public void insertProduct(ProductVO productVO);
	
	// 상품 이름으로 상품 번호 가져오기
	@Select("SELECT id FROM product WHERE name = #{name}")
	public int getProductId(String name);
	
	// 상품 이미지 등록(관리자)
	public void insertProductImage(ProductImageVO imageVO);
	
	
	// 상품 정보 수정(관리자)
	
	
	// 상품 삭제 
	
	
	/*상품상세======================================================*/
	// 상품 정보 + 상품이미지
	public List<ProductVO> getProductDetail(ProductVO productVO);
	
	
	
}
