package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.CourseVO;
import org.zerock.mapper.LessonMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LessonServiceImp implements LessonService{
	
	private LessonMapper mapper; 
	
	public List<CourseVO> getList(){
		return mapper.getList();
	}
	
}
