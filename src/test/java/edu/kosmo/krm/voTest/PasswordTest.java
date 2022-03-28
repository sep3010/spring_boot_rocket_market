package edu.kosmo.krm.voTest;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class PasswordTest {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Transactional
	@Test
	public void passwordTest() {		
		// 비밀번호 암호화 테스트
		
		String password = "12345";
		String encoderPw = passwordEncoder.encode(password);
		log.info("encoderPw : " + encoderPw);
		
		boolean matchCheck = passwordEncoder.matches(password, encoderPw);
		log.info("matchCheck : " + matchCheck);
		
	}	
	

}
