package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.CourseVO;
import org.zerock.domain.LessonVO;

public interface LessonMapper {
	public List<CourseVO> getList();
	public List<LessonVO> getLessonList(String userid);
	public int lessonInsert(@Param("ccode") String ccode, @Param("userid")String userid);
	public List<LessonVO> getLessonCodeList(String ccode);
	public boolean deleteLesson(Long lnum);
}
