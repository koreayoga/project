package org.zerock.controller;


import java.sql.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})

@Log4j
public class MemberControllerTests {

		@Setter(onMethod_ = {@Autowired})
		private WebApplicationContext ctx;
		private MockMvc mockMvc;
		
		
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
	log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/member/list"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
	}
	
	
	@Test
	public void testInsertMem() throws Exception {
	    java.sql.Date birthDate = java.sql.Date.valueOf("1990-05-15");

	    String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/insert")
	            .param("userid", "test10")
	            .param("userpw", "1234")
	            .param("name", "김씨")
	            .param("gender", "F")
	            .param("phone", "010123456")
	            .param("birth", birthDate.toString()) // Convert the Date to a string
	            .param("address", "서울시")
	            .param("email", "user@email.com")
	    ).andReturn().getModelAndView().getViewName();
	    log.info(resultPage);
	}


	@Test
	public void testGetMem() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/member/get")
				.param("userid","a123456"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	
	@Test
	public void testUpdateMem() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/update")
				.param("userid", "a123456")
				.param("userpw", "updatepw")
				.param("phone", "00000000")
				.param("address", "updateadd")
				.param("email", "update@email.com"))
				.andReturn().getModelAndView().getViewName();
		log.info("resultPage");
	}
	
	
	@Test
	public void testDeleteMem() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/delete")
				.param("userid", "test15"))
				.andReturn().getModelAndView().getViewName();
		log.info("resultPage");
	}

	
}
