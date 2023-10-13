package org.zerock.service;

import java.util.List;

import org.zerock.domain.CourseVO;
import org.zerock.domain.MemberVO;

public interface CourseService {
	public List<CourseVO> getList();
	public CourseVO get(String ccode);
	public boolean modify(CourseVO course);
	public List<MemberVO> teacher();
	public CourseVO getCourse(String userid);
}
