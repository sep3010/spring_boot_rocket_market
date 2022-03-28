package edu.kosmo.krm.controllerTest;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;



@SpringBootTest
@AutoConfigureMockMvc
class LoginControllerTest {
	
	@Autowired
	private MockMvc mockMvc;	
	
	@Test
	@WithMockUser(username = "admin", password = "admin")
	public void authAdminTest() throws Exception {		
		
		// 관리자 로그인 권한 테스트
		mockMvc.perform(get("/login")).andDo(print()).andExpect(status().isOk());
				
	}
	
	@Test
	@Transactional
	public void loginSuccess() throws Exception {	
		String username = "user";
		String password = "user";
		
		// 로그인 통과 테스트
		mockMvc.perform(get("/login").with(user(username).roles("USER")))
			.andDo(print()).andExpect(status().isOk());
				
	}	
	
	
}
