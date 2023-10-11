package org.zerock.service;

import java.util.List;

import org.zerock.domain.CourseVO;

public interface CourseService {
	public List<CourseVO> getList();
	public CourseVO get(String ccode);
	public boolean modify(CourseVO course);
}
