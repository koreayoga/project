package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CourseVO;
import org.zerock.domain.Criteria;

public interface CourseMapper {
	// 현재 리스트 읽어오기 : CourseVO 타입의 리스트 출력
	public List<CourseVO> getList();
	
	// read(해당게시글 PK번호) : 해당 게시글 읽기 
	public CourseVO read(String ccode);
	
	// update(CourseVO타입 >> 제목, 내용, 글쓴이) : 수정된 개수 확인
	public int update(CourseVO course);
	
	// 페이지 리스트 읽어오기 : n페이지 m개씩 
	public List<CourseVO> getListWithPaging(Criteria cri);
		
	// delete(해당게시글 PK번호) : 지워진 개수 확인(delete도 넣는 건가??)
	// public int delete(String ccode); 
		
	// 전체 게시글 수 카운트
	//public int getTotalCount(Criteria cri);
}
