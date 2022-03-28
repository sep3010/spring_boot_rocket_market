package edu.kosmo.krm.controllerTest;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;


@SpringBootTest
@AutoConfigureMockMvc
class BoardControllerTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	@Test
	public void getMappingtest() throws Exception {		
		
		// 문의 게시판
		mockMvc.perform(MockMvcRequestBuilders.get("/board/inquiryHome")
				.accept(MediaType.TEXT_HTML))
				.andExpect(MockMvcResultMatchers.status().isOk())
				.andDo(MockMvcResultHandlers.print());	
		
		// 공지사항 게시판
		mockMvc.perform(MockMvcRequestBuilders.get("/board/noticeHome")
				.accept(MediaType.TEXT_HTML))
				.andExpect(MockMvcResultMatchers.status().isOk())
				.andDo(MockMvcResultHandlers.print());
			
	}	
	
}
