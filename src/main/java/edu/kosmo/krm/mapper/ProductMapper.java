package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductImageVO;
import edu.kosmo.krm.vo.ProductVO;

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
	
	// 할인상품목록 (할인율이 제일 큰 순서로 - 변경가능)=======================
	@Select("SELECT * FROM product ORDER BY discount DESC")
	public List<ProductVO> getDiscountProductList();
	
	//신상품목록 (상품번호 기준)=========================================
	@Select("SELECT * FROM product ORDER BY id DESC")
	public List<ProductVO> getNewProductList();
	
	// 베스트상품목록
	
	
	// 상품 등록(관리자)
	public void insertProduct(ProductVO productVO);
	
	// 상품 이름으로 상품 번호 가져오기
	@Select("SELECT id FROM product WHERE name = #{name}")
	public int getProductId(String name);
	
	// 상품 이미지 등록(관리자)
	public void insertProductImage(ProductImageVO imageVO);
	
	
	// 상품 정보 수정(관리자)
	
	
	// 상품 삭제 
	
}
