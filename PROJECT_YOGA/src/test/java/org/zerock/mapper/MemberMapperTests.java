package org.zerock.mapper;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

		@Setter(onMethod_ = @Autowired)
		private MemberMapper mapper;


	@Test
	public void testGetListMem() {
	mapper.getListMem().forEach(member->log.info(member));
	}
	
	@Test
	public void testInsertMem() {
	    MemberVO member = new MemberVO();
	    member.setUserid("test20");
	    member.setUserpw("12345");
	    member.setName("諛뺤뵪");
	    member.setGender("F");
	    member.setPhone("02213456");
	    Date birthDate = java.sql.Date.valueOf("1990-05-15");
	    member.setBirth(birthDate);
	    member.setAddress("�꽌�슱");
	    member.setEmail("user01@email.com");  
	    mapper.insertMem(member);
	    log.info(member);
	}
	
	@Test
	public void testGetMem() {
	MemberVO member = mapper.getMem("a123456");
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

}