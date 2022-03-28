package edu.kosmo.krm.voTest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class DBconnectionTest {
	
	private static final String driver = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	private static final String url = "jdbc:log4jdbc:oracle:thin:@146.56.137.240:1521/xe";
	private static final String user = "rocket_market";
	private static final String pw = "k0810";
	
	@Transactional
	@Test
	public void testConnection() throws ClassNotFoundException {
		// Driver 클래스 로드
		Class.forName(driver);
		
		// DB 연결 테스트
		try(Connection connection = DriverManager.getConnection(url, user, pw)) {
			log.info("DB connection Success : " + connection);
		} catch (Exception e) {
			log.info("DB connection Fail");
			e.printStackTrace();
		}
	}	
	

}
