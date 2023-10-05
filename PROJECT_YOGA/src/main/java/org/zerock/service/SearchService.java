package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface SearchService {
	public MemberVO searchId(MemberVO vo);
	public void resetPw1(MemberVO vo);
	public void resetPw2(MemberVO vo);	
}
