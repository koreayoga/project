package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberService {

	public List<MemberVO> getListMem();
	public void insertMem(MemberVO vo);
	public MemberVO getMem(String userid);
	public int deleteMem(String userid);
	public int updateMem(MemberVO vo);
	public int checkId(String userid);
	public int updateAdmin(MemberVO vo);
	public int deleteAdmin(String userid);
	public List<MemberVO> getListMemPaging(Criteria cri);
	public int getTotal(Criteria cri);
	
}