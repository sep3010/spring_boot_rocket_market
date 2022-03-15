package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.kosmo.krm.joinVO.JoinProductBoard;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductVO;


//상품상세페이지 후기 매퍼(상품번호, 회원 정보 조회, 정보 수정)
//2022-3-14 ~
//오유빈 코드 작성

@Mapper
public interface ProductBoardMapper {

	// 상품에 대한 후기 불러오기 (with 페이징)
	public List<JoinProductBoard> getProductBoardList(@Param("criteria") Criteria criteria, @Param("productVO") ProductVO productVO);
	public int getProductBoardTotalCount(ProductVO productVO);
	
}
