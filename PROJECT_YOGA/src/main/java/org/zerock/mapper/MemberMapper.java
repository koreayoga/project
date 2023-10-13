package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;
import org.zerock.domain.Mriteria;

public interface MemberMapper {
	public MemberVO read(String userid);
	
	public List<MemberVO> getListMem();
	public void insertMem (MemberVO member);
	public MemberVO getMem (String userid);
	public int deleteMem (String userid);
	public int updateMem (MemberVO vo);
	public int checkId (String userid);
	public int updateAdmin (MemberVO vo);	
	public int deleteAdmin (String userid);	
}
