package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testPageDTO() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		cri.setAmount(10);
		PageDTO p = new PageDTO(cri,150);
		log.info("------------"+p+"------------");
	}
	
	/*
	@Test // 현재의 리스트를 가져옴.
	public void testGetList() {
		mapper.getList();
	}
	*/
	
	/*
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		
		board.setTitle("8.5 제목");
		board.setContent("8.5 내용");
		board.setWriter("이요한");
		
		mapper.insert(board);
		log.info(board);
	}
	*/
	/*
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		
		board.setTitle("8.5 제목2");
		board.setContent("8.5 내용2");
		board.setWriter("이요한");
		
		mapper.insertSelectKey(board);
		log.info(board);
	}
	*/
	/*
	@Test
	public void testRead() {
		BoardVO board = new BoardVO();
		mapper.read(61L);
		log.info(board);
	}
	*/
	/*
	@Test
	public void testDelete() {
		int ct = mapper.delete(50L);		
		log.info("delete count : "+ct);
	}
	*/
	/*
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		
		board.setBno(62L);
		board.setTitle("새제목1");
		board.setContent("새내용1");
		board.setWriter("이요한");
		
		int ct = mapper.update(board);
		
		log.info("update count : "+ct);
	}
	*/
	/*
	@Test
	public void testPaging() {
		//방법1 생성자 Criteria(pageNum, amount) 사용
		//Criteria cri = new Criteria(3,20);

		//방법2 기본생성자 + setPageNum, setAmount 사용
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
	*/
	
	@Test
	  public void testSearch() {

	    Criteria cri = new Criteria(1,160);
	    cri.setKeyword("n");
	    cri.setType("CW");

	    List<BoardVO> list = mapper.getListWithPaging(cri);

	    int count = mapper.getTotalCount(cri);
	    
	    list.forEach(board -> log.info(board));
	    log.info(count);
	  }
	  
	
}
