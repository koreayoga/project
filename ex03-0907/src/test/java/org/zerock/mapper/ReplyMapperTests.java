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
public class ReplyMapperTests {
	private Long[] bnoArr = {550L, 548L, 547L, 257L, 255L};
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	/*
	@Test
	public void testMapper() {		
		log.info("------------"+mapper+"------------");
	}
	*/
	/*
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 100).forEach(i->{
			ReplyVO reply = new ReplyVO();
					
			//reply.setBno(bnoArr[i%5]);
			reply.setBno(550L);
			reply.setReply("테스트 댓글"+i);
			reply.setReplyer("replyer"+i);
			
			mapper.insert(reply);
			log.info(reply+"------------------------");
		});
	}
	*/
	/*
	@Test
	public void testRead() {
		Long targetRno = 8L;
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}
	*/
	/*	
	@Test
	public void testDelete() {
		Long targetRno = 5L;
		int ct = mapper.delete(targetRno);
		log.info("delete count : "+ct);
	}
	*/
	/*
	@Test
	public void testUpdate() {
		Long targetRno = 6L;
		ReplyVO reply = mapper.read(targetRno);		
		reply.setReply("수정된 댓글");
		
		int ct = mapper.update(reply);
		
		log.info("update count : "+ct);
	}
	*/
	
	/*
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[4]);
		replies.forEach(reply -> log.info(reply));
	}
	*/
	/*
	@Test
	public void testReplyList() {
		Criteria cri = new Criteria(2,10);
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 550L);
		replies.forEach(reply -> log.info(reply));
	}
	*/
	
	@Test
	public void testCount() {
		int ct = mapper.getCountByBno(550L);
		log.info("Count------"+ct);
	}
	
}
