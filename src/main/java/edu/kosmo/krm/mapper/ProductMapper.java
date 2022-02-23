package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.vo.ProductVO;

@Mapper
public interface ProductMapper {
	
	// 전체상품목록 가져오기
	@Select("SELECT * FROM product")
	public List<ProductVO> getProductList();
	
	// 할인상품목록 (할인율이 제일 큰 순서로 - 변경가능)
	@Select("SELECT * FROM product ORDER BY discount DESC")
	public List<ProductVO> getDiscountProductList();
	
	/* 신상품목록 (상품등록일 컬럼 필요..)
	@Select("")
	public ProductVO getNewProductList();
	*/
	
	// 베스트상품 목록
	
	
	
	
	// 상품 등록
	
	
	// 상품 정보 수정
	
	
	// 상품 삭제 
}
