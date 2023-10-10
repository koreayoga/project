package org.zerock.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberVO;

public interface MemberService {

	public List<MemberVO> getListMem();
	public void insertMem(MemberVO member);
	public MemberVO getMem(String userid);
	public boolean deleteMem(String userid);
	public boolean updateMem(MemberVO member);
	public int checkId(String userid);
	public boolean updateAdmin(@RequestParam("userid") String userid, @RequestParam("auth") int auth);
}
