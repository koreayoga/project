package org.zerock.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberService {

	public List<MemberVO> getListMem();
	public void insertMem(MemberVO member);
	public MemberVO getMem(String userid);
	public boolean deleteMem(String userid);
	//public void quitMem(MemberVO vo);
	public int updateMem(MemberVO vo);
	public int checkId(String userid);
	public int updateAdmin(MemberVO vo);
	public int deleteAdmin(String userid);
}
