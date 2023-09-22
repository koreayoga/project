package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	
	/*
	 * @Test public void testExist() { log.info("-------------------"+service);
	 * assertNotNull(service); }
	 */ 
	  
	/*
	 * @Test public void testRegister() { BoardVO board = new BoardVO();
	 * 
	 * board.setTitle("1st"); board.setContent("1st"); board.setWriter("kevin");
	 * 
	 * service.register(board); log.info("생성게시물의 번호 : "+ board.getBno()); }
	 */
	
	/* @Test public void testGet() { log.info(service.get(68L)); } */
	  
	  
	//리스트 구현 테스트
	/* @Test public void testGetList(){ service.getList(); } */
	
	//리스트에 페이지 기능 구현 테스트
	  @Test public void testGetList(){ service.getList(new Criteria(1,50)); }
	  
	/*
	 * @Test public void testModify() { BoardVO board = new BoardVO();
	 * 
	 * board.setBno(64L); board.setTitle("수정제목1"); board.setContent("수정내용1");
	 * board.setWriter("kevinyh");
	 * 
	 * service.modify(board); }
	 */
	 
	  
	/*
	 * @Test public void testRemove() { boolean ok = service.remove(66L);
	 * log.info("-----remove? : "+ok); }
	 */
}
