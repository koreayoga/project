package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.SearchMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor //각각 setter어노테이션 사용
public class SearchServiceImpl implements SearchService {	
	@Setter(onMethod_=@Autowired)
	private SearchMapper mapper;	
	
	@Override
	public MemberVO searchId(MemberVO vo) {
		log.info("search member ID-------------"+vo.getName()+" ["+vo.getEmail()+"]");	
		return mapper.searchId(vo);
	}
		
	@Override
	public int memberPwdCheck(MemberVO vo) {
	    return mapper.memberPwdCheck(vo);
	}
	 
	@Override
	public void passwordUpdate(MemberVO vo) {
	    mapper.passwordUpdate(vo);
	}
}
