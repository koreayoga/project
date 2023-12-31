package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {
		
		@Setter(onMethod_ = {@Autowired})
		private MemberService service;

	@Test //媛앹껜二쇱엯�솗�씤
	public void testExist() {
	log.info(service);
	assertNotNull(service);
	}
	
	@Test
	public void testInsertMem() {
	MemberVO member = new MemberVO();
	member.setUserid("user10");
	member.setUserpw("1234");
	member.setName("김씨");
	member.setGender("F");
	member.setPhone("010123456");
	Date birthDate = java.sql.Date.valueOf("1990-05-15");
	member.setBirth(birthDate);
	member.setAddress("충북 청주");
	member.setEmail("user@email.com");
	service.insertMem(member);
	log.info("�깮�꽦�맂 硫ㅻ쾭................."+ member.getUserid());
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
		member.setAddress("up�꽌�슱");
		member.setEmail("update@email.com");	
		log.info("updateMember..............." + service.updateMem(member));
	}
	
	
	@Test
	public void testUpdateAdmin() {
		MemberVO member = service.getMem("a123456");
		if (member == null) {
			return;
		}
		member.setAuth(4);
		log.info("updateMemberADMIN..............." + service.updateAdmin(member));
	}
	


	@Test
	public void testDeleteAdmin() {

		log.info("updateMemberADMIN..............." + service.deleteAdmin("user20"));
	}
	

	@Test
	public void testCheckId() {
		log.info("IDcheck................." + service.checkId("user"));
	}

	 
	@Test
	public void testGetListMemPaging() {
	service.getListMemPaging(new Criteria(2,10)).forEach(member-> log.info(member));
	}
	 
	 
	

}
