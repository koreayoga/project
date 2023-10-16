package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface SearchService {
	public MemberVO searchId(MemberVO vo);	
	public void passwordUpdate(MemberVO vo);
}
