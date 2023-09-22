package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;

public interface BoardAttachMapper {	
	// 첨부파일 등록(Attach 정보 모두 넘겨주기)
	public void insert(BoardAttachVO vo);
	
	// delete(해당 첨부파일(uuid로 구분))
	public void delete(String uuid);
	
	// 해당 게시글에 대한 첨부파일 목록 찾기
	public List<BoardAttachVO> findBno(Long bno);
	
	// 해당 게시글의 첨부파일 삭제
	public void deleteAll(Long bno);
	
	// 오래된 파일 정리
	public List<BoardAttachVO> getOldFiles();
}
