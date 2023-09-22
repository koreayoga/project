package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	// +BoardMapper.xml(DB 쿼리문 처리) >> BoardMapperTest.java
	
	// 현재 리스트 읽어오기 : BoardVO 타입의 리스트 출력
	public List<BoardVO> getList();

	// 페이지 리스트 읽어오기 : n페이지 m개씩 
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 새로운 게시글 등록 insert/insertSelectKey(BoardVO타입 >> 제목, 내용, 글쓴이)
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	
	// read(해당게시글 PK번호) : 해당 게시글 읽기 
	public BoardVO read(Long bno);
		
	// delete(해당게시글 PK번호) : 지워진 개수 확인
	public int delete(Long bno);
	
	// update(BoardVO타입 >> 제목, 내용, 글쓴이) : 수정된 개수 확인
	public int update(BoardVO board); 

	// 전체 게시글 수 카운트
	public int getTotalCount(Criteria cri);

	//댓글 수 조정
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
