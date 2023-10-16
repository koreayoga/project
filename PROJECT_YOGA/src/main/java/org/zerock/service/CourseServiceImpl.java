	package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CourseVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.CourseMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CourseServiceImpl implements CourseService {
	@Setter(onMethod_=@Autowired)
	private CourseMapper mapper;
	
	//리스트에 페이지기능 구현
	@Override
	public List<CourseVO> getList(){
		log.info("Course getList");
		return mapper.getList();
	}
	
	@Override // 해당게시글을 읽어야하므로 BoardMapper의 read()메서드 사용.
	public CourseVO get(String ccode) {
		log.info("get.........."+ccode);
		return mapper.read(ccode);
	}
	
	@Override
	public boolean modify(CourseVO course) {
		log.info("modify.........." + course);
		boolean modifyResult = mapper.update(course) == 1;
		
		return modifyResult;
	}
	
	@Override
	public List<MemberVO> teacher(){
		System.out.println("teacher");
		return mapper.teacher();
	}
	
	@Override
	public CourseVO getCourse(String userid) {
		System.out.println("course name------");
		return mapper.getCourse(userid);
	}
}
