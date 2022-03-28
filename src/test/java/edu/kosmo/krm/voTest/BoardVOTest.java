package edu.kosmo.krm.voTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.krm.service.BoardService;
import edu.kosmo.krm.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class BoardVOTest {
	
	@Autowired
	private BoardService boardService;
	
	@Transactional
	@Test
	public void test() {		
		BoardVO boardVO = new BoardVO();
		
		// 공지사항 작성 테스트
		boardVO.setBoard_category_id(1);
		boardVO.setMember_id(9); // 관리자 회원 번호
		boardVO.setTitle("알립니다");
		boardVO.setContent("택배사 파업으로 인해 배송이 지연 될 수 있으니 양해 부탁드립니다.");

		log.info("boardVO===" + boardVO);
		
		boardService.postNotice(boardVO);		
	}	
	
	@Test
	void contextLoads() {
		assertNotNull(boardService);
		log.info("BoardVO notice test");		
	}



}
