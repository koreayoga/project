package org.zerock.controller;

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
@Log4j
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class BoardControllerTests {
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
/*
	@Test // 게시글 "등록" - post방식
	public void testRegister() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/register").param("title", "테스트 새글 제목")
						.param("content", "테스트 새글 내용").param("writer", "kevinyh"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
*/

	@Test // 게시글 하나만 "조회" - get방식
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
		.param("bno", "681"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
	}

/*
	@Test // 게시글 "수정" - post방식
	public void testModify() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
			.param("bno", "67")
			.param("title", "테스트 새글 제목4")
			.param("content", "테스트 새글 내용4")
			.param("writer", "kevinyh"))
			.andReturn()
			.getModelAndView()
			.getViewName();
		log.info(resultPage);
	}
*/
/*
	@Test // 게시글 "삭제" - post방식
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
			.param("bno", "67"))
			.andReturn()
			.getModelAndView()
			.getViewName();
		log.info(resultPage);
	}
*/
/*
    //리스트 구현
	@Test // get방식
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
*/
/*	
	//리스트에 페이지 기능 구현
	@Test // get방식
	public void testListPaging() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
									.param("pageNum","1")
									.param("amount","20"))				
						.andReturn()
						.getModelAndView()
				.getModelMap());
	}
	*/
}
