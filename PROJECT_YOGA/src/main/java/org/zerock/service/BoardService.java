package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	// interface이므로 BoardServiceImpl에서 구현함. BoardServiceTests에서는 interface의 메서드를 호출하여 테스트함.
	// 게시글 등록 : register(BoardVO타입 >> 제목,내용,글쓴이)
	public void register(BoardVO board);
	
	// 해당게시글 읽기 : get(해당게시글 PK번호)
	public BoardVO get(Long bno);
	
	// 게시글 목록 읽어오기
	//public List<BoardVO> getList();
	
	// 게시글 목록 읽어오기(+페이지기능)
	public List<BoardVO> getList(Criteria cri);

	// 게시글 수정(BoardVO타입 >> 제목,내용,글쓴이) : 수정여부확인(true, false)
	public boolean modify(BoardVO board);
	
	// 게시글 삭제(해당게시글 PK번호) : 삭제여부확인(true, false)
	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);
	
	//첨부파일 등록
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public void setHit(Long hit);
}
