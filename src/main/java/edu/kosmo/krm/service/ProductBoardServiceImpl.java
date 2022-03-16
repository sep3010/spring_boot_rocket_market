package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.joinVO.JoinProductBoard;
import edu.kosmo.krm.mapper.ProductBoardMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductBoardServiceImpl implements ProductBoardService {
	
	@Autowired
	private ProductBoardMapper productBoardMapper;
	
	//상품에 대한 후기글 목록==============================================
	@Override
	public List<JoinProductBoard> getProductBoardList(Criteria criteria, ProductVO product) {
		log.info("getProductBoardList()..");
		return productBoardMapper.getProductBoardList(criteria,product);
	}
	
	// 전체 상품 개수
	@Override
	public int getProductBoardTotal(ProductVO product) {
		log.info("getProductBoardTotal()..");
		return productBoardMapper.getProductBoardTotalCount(product);
	}
	


}
