package org.zerock.mapper;

import java.sql.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwencoder;
	
/*
	@Test
	public void testGetListMem() {
	mapper.getListMem().forEach(member->log.info(member));
	}
	*/
	@Test
	public void testInsertMem() {
	    MemberVO member = new MemberVO();
	    member.setUserid("dyrk2345");
	    String pw = "Aa1234@";	    
	    member.setUserpw(pwencoder.encode(pw));
	    member.setName("요가2");
	    member.setGender("F");
	    member.setPhone("02213456");
	    java.sql.Date birth = java.sql.Date.valueOf("1990-05-15");
	    member.setBirth(birth);
	    member.setAddress("요가숲");
	    member.setEmail("user01@email.com");  
	    mapper.insertMem(member);
	    log.info(member);
	}
	
	
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		List<MemberVO> list = mapper.getListMemPaging(cri);
		list.forEach(member -> log.info(member));
	}
	
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("2");
		cri.setType("A");
		List<MemberVO> list =  mapper.getListMemPaging(cri);
		list.forEach(member -> log.info(member));
	}
	/*
	@Test
	public void testGetMem() {
	MemberVO member = mapper.getMem("admin");
	log.info(member);
	}	
	
	@Test
	public void testDeleteMem() {
	log.info("deleteMember......................" + mapper.deleteMem("user"));
	}

	@Test
	public void testUpdateMem() {
	MemberVO member = new MemberVO();
	member.setUserid("user00");
	member.setUserpw("up1234");
	member.setPhone("up010000");
	member.setAddress("up�꽌�슱");
	member.setEmail("update@email.com");	
	
	int mem = mapper.updateMem(member);
	log.info("updateMember......................" + mem);
	}

	@Test
	public void testUpdateAdmin() {
	MemberVO member = new MemberVO();
	member.setUserid("user00");
	member.setAuth(4);
	
	int mem = mapper.updateAdmin(member);
	log.info("updateMember......................" + mem);
	}


	@Test
	public void testCheckId() {
		mapper.checkId("user");
		
		log.info("IDcheck....................."+ mapper.checkId("user"));
	}
	
	
	
//paging	
	
	@Test
	public void testPageDTO() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		cri.setAmount(10);
		PageDTO p = new PageDTO(cri,100);
		log.info("------------"+p+"------------");
	}
	
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		List<MemberVO> list = mapper.getListMemPaging(cri);
		list.forEach(member -> log.info(member));
	}
	
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("2");
		cri.setType("A");
		List<MemberVO> list =  mapper.getListMemPaging(cri);
		list.forEach(member -> log.info(member));
	}

		
		@Test
		public void testReadMem() {
			MemberVO member = mapper.read("admin");
			log.info(member);
		}
*/
}