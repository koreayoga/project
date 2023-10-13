package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public List<MemberVO> getListMem();
	public void insertMem(MemberVO member);
	public MemberVO getMem(String userid);
	public int deleteMem(String userid);
	public int updateMem(MemberVO vo);
	public int checkId(String userid);
	public int updateAdmin(MemberVO vo);
	public int deleteAdmin(String userid);
}
