package edu.kosmo.krm.controllerTest;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;



@SpringBootTest
@AutoConfigureMockMvc
class MemberControllerTest {
	
	@Autowired
	private MockMvc mockMvc;	
	
	@Test
	@WithMockUser(username = "carrotpay", password = "ww1235", authorities = "ROLE_USER")
	public void adminPageTest() throws Exception {		
		
		// 마이페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/user/userHome"))
			.andExpect(MockMvcResultMatchers.status().isOk());
		
		// 회원 마이페이지 회원 정보 수정 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/user/userUpdateForm"))
			.andExpect(MockMvcResultMatchers.status().isOk());
		
		// 회원 위시리스트 페이지
		mockMvc.perform(MockMvcRequestBuilders.get("/user/wishList"))
			.andExpect(MockMvcResultMatchers.status().isOk());
				
	}
	
	
}
