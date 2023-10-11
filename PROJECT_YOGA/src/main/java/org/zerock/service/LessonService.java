package org.zerock.service;

import java.util.List;

import org.zerock.domain.CourseVO;
import org.zerock.domain.LessonVO;

public interface LessonService {
	public List<CourseVO> getList();

	public List<LessonVO> getLessonList(String username);

	public int lessonInsert(String ccode, String userid);

	public List<LessonVO> getLessonCodeList(String ccode);

	public boolean deleteLesson(Long lnum);
}