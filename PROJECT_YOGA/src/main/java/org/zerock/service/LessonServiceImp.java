package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.CourseVO;
import org.zerock.domain.LessonVO;
import org.zerock.mapper.LessonMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LessonServiceImp implements LessonService{
	
	private LessonMapper mapper; 
	
	public List<CourseVO> getList(){
		return mapper.getList();
	}

	@Override
	public List<LessonVO> getLessonList(String userid) {
		log.info(mapper.getLessonList(userid));
		return mapper.getLessonList(userid);
	}

	@Override
	public int lessonInsert(String ccode, String userid) {
		
		return mapper.lessonInsert(ccode, userid);
	}

	@Override
	public List<LessonVO> getLessonCodeList(String ccode) {
		// TODO Auto-generated method stub
		return mapper.getLessonCodeList(ccode);
	}
	
}
