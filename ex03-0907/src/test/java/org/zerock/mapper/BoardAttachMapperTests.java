package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardAttachMapperTests {
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper mapper;
	
	/*
	@Test
	public void testInsert() {
		BoardAttachVO vo = new BoardAttachVO();
		
		vo.setUuid("b8ff2f3e-1feb-4f0c-b2d5-b8389c8ecab3");
		vo.setUploadPath("C:\\upload\\2023\\08\\30");
		vo.setFileName("1");
		vo.setFileType(true);
		vo.setBno(561L);
		
		mapper.insert(vo);
		log.info(vo);
	}
	*/
	
	/*
	@Test
	public void testDelete() {
		log.info("delete file-------------------");
		mapper.delete("b8ff2f3e-1feb-4f0c-b2d5-b8389c8ecab3");		
	}
	*/
	
	
	@Test
	public void testFind() {		
		log.info(mapper.findBno(681L));
	}
	
}
