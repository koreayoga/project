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

	// 寃뚯떆湲� �닔�젙(BoardVO���엯 >> �젣紐�,�궡�슜,湲��벖�씠) : �닔�젙�뿬遺��솗�씤(true, false)
	public boolean modify(BoardVO board);
	
	// 寃뚯떆湲� �궘�젣(�빐�떦寃뚯떆湲� PK踰덊샇) : �궘�젣�뿬遺��솗�씤(true, false)
	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);
	
	//泥⑤��뙆�씪 �벑濡�
	public List<BoardAttachVO> getAttachList(Long bno);
	
	//議고쉶�닔
	public void setHit(@Param("bno")Long bno, @Param("hit")Long hit);
}
