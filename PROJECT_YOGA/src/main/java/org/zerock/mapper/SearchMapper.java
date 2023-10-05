package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface SearchMapper {
	public MemberVO loginMember(MemberVO vo);
	public MemberVO searchId(MemberVO vo);
	public void resetPw1(MemberVO vo);	
	public void resetPw2(MemberVO vo);
}
