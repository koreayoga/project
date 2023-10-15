package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> getListMem() {
		log.info("getMemberList......................");
		return mapper.getListMem();
	}

	@Override
	public void insertMem(MemberVO member) {
		log.info("insertMember......................" + member);
		mapper.insertMem(member);
	}

	@Override
	public MemberVO getMem(String userid) {
		log.info("getMember......................" + userid);
		return mapper.read(userid);
	}

	@Override
	public int deleteMem(String userid) {
		log.info("deleteMember......................" + userid);
		return mapper.deleteMem(userid);
	}

	@Override
	public int updateMem(MemberVO vo) {
		log.info("updateMember......................" + vo);
		return mapper.updateMem(vo);
	}

	@Override
	public int checkId(String userid) {
		log.info("USERIDUSER....................." + userid);
		return mapper.checkId(userid);
	}

	@Override
	public int updateAdmin(MemberVO vo) {
		log.info("updateMember......................" + vo);
		return mapper.updateAdmin(vo);
	}
	
	@Override
	public int deleteAdmin(String userid) {
		log.info("updateMember......................" + userid);
		return mapper.deleteAdmin(userid);
	}
}