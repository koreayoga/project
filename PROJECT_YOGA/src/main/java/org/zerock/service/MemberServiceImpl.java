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
public List<MemberVO> getListMem(){
	log.info("getMemberList......................");
	return mapper.getListMem();
}
	
@Override
public void insertMem(MemberVO member) {
	log.info("insertMember......................"+ member);
	mapper.insertMem(member);
}

@Override
public MemberVO getMem(String userid) {
	log.info("getMember......................"+ userid);
	return mapper.getMem(userid);
}

@Override
public boolean deleteMem(String userid) {
	log.info("deleteMember......................"+ userid);
	return mapper.deleteMem(userid) == 1;
}

@Override
public boolean updateMem(MemberVO member) {
	log.info("updateMember......................"+ member);
	return mapper.updateMem(member) == 1;
}

@Override
public int checkId(String userid) {
	log.info("USERIDUSER....................."+ userid);
	return mapper.checkId(userid);

}

}
