package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface SearchMapper {	
	public MemberVO searchId(MemberVO vo);	
	public void passwordUpdate(MemberVO vo);
}
