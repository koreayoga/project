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
	
	public MemberVO searchId(MemberVO vo) {
		log.info("search member ID-------------"+vo.getName()+" ["+vo.getEmail()+"]");	
		return mapper.searchId(vo);
	}
	
	public void resetPw1(MemberVO vo) {
		log.info("reset member PW Stage 1------------- ID_"+vo.getUserid());
		mapper.resetPw1(vo);
	}
	
	public void resetPw2(MemberVO vo) {
		log.info("reset member PW Stage 2------------- ID_"+vo.getUserid());
		mapper.resetPw2(vo);
	}
}
