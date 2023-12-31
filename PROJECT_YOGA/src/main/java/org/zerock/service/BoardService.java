package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	public void register(BoardVO board);
	public BoardVO get(Long bno);
	public List<BoardVO> getList(Criteria cri);

	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public void setHit(@Param("bno")Long bno, @Param("hit")Long hit);
}
