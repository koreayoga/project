package org.zerock.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	
	public List<MemberVO> getListMem();
	public void insertMem (MemberVO member);
	public MemberVO getMem (String userid);
	public int deleteMem (String userid);
	public int updateMem (MemberVO vo);
	public int checkId (String userid);
	public int updateAdmin (MemberVO vo);
	

}
