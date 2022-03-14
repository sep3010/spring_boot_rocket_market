package edu.kosmo.krm.service;


import java.util.List;

import edu.kosmo.krm.joinVO.JoinProductBoard;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductVO;


public interface ProductBoardService {
	
	// 상품에 대한 후기글 목록
	public List<JoinProductBoard> getProductBoardList(Criteria criteria, ProductVO productVO);
	// 상품에 대한 후기글 개수
	public int getProductBoardTotal(ProductVO productVO);
}
