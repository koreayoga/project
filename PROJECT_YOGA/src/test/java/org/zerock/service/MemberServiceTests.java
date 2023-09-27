package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class MemberServiceTests {
		
		@Setter(onMethod_ = {@Autowired})
		private MemberService service;

	@Test //객체주입확인
	public void testExist() {
	log.info(service);
	assertNotNull(service);
	}
	
	@Test
	public void testInsertMem() {
	MemberVO member = new MemberVO();
	member.setUserid("user05");
	member.setUserpw("1234");
	member.setName("김씨");
	member.setGender('F');
	member.setPhone("010123456");
	Date birthDate = java.sql.Date.valueOf("1990-05-15");
	member.setBirth(birthDate);
	member.setAddress("서울시");
	member.setEmail("user@email.com");
	service.insertMem(member);
	log.info("생성된 멤버................."+ member.getUserid());
	}

	@Test
	public void testGetListMem() {
	service.getListMem().forEach(member-> log.info(member));
	}
	

	@Test
	public void testDeleteMem() {
		log.info("deleteMember................." + service.deleteMem("user05"));
	}
	
	@Test
	public void testUpdateMem() {
		MemberVO member = service.getMem("user01");
		if (member == null) {
			return;
		}
		member.setUserpw("up1234");
		member.setPhone("up010000");
		member.setAddress("up서울");
		member.setEmail("update@email.com");	
		log.info("updateMember..............." + service.updateMem(member));
	}
	


}
