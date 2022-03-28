package edu.kosmo.krm.voTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.krm.service.MemberService;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class MemberVOTest {
	
	@Autowired
	MemberService memberService;
	
	@Transactional
	@Test
	public void test() {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setUsername("carrotboy");
		memberVO =  memberService.getMemeber(memberVO.getUsername());
		log.info("회원 정보 가져오기===" + memberVO);	
	}
	
	
	@Test
	void contextLoads() {
		assertNotNull(memberService);
		log.info("MemberVO test");		
	}



}
