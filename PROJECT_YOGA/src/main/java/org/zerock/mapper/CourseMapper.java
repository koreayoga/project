package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CourseVO;
import org.zerock.domain.MemberVO;

public interface CourseMapper {
	// 현재 리스트 읽어오기 : CourseVO 타입의 리스트 출력
	public List<CourseVO> getList();
	
	// read(해당게시글 PK번호) : 해당 게시글 읽기 
	public CourseVO read(String ccode);
	
	// update(CourseVO타입 >> 제목, 내용, 글쓴이) : 수정된 개수 확인
	public int update(CourseVO course);
	
	//강사 가져오기
	public List<MemberVO> teacher();
	
	//강의 이름 가져오기
	public CourseVO getCourse(String userid);	
}
